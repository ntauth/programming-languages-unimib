;;;; slides.lisp

(defun hello-world () (print (list 'Hello 'World)))

;;   L0
;;  / \
;; 7   L1
;;    / \
;;  42   NIL
(cons 7 (cons 42 NIL))

;;; quote
;;; Escape Lisp evaluation
(list (quote a) (quote b) (quote c))
(list 'a 'b 'c)

;; eval

;;; List summation
(defun summation (l)
  (if (null l) 0
      (+ (first l) (rest l))))

;;; cons-end-
(defun cons-end- (el lst)
  (if (null (cdr lst))
      (progn (cond ((null (car lst))
		    (list el))
		   (T (cons (car lst) (list el)))))
      (cons (car lst) (cons-end- el (rest lst)))))

;;; but-last
(defun but-last (lst)
  (cond ((atom (cdr lst)) nil)
	((null lst) nil)
	(T (append (list (first lst)) (but-last (rest lst)))))) 

;;; invert
(defun invert (lst)
  (cond ((atom lst) lst)
	((null lst) nil)
	(T (cons-end- (first lst)
		      (invert (rest lst))))))
	    
;;; circulate
(defun circulate (lst &key direction)
  (cond ((atom lst) lst)
	((null lst) nil)
	((eq direction :left)
	 (append (rest lst) (list (first lst))))
	((eq direction :right)
	 (cons (car (last lst)) (but-last lst)))
	(T lst)))

;;; apply*
(defun apply* (fn &rest args)
  (funcall fn args))

;;; mapcar*
(defun mapcar* (transform lst)
  (if (null lst) nil
      (cons (funcall transform (car lst))
	    (mapcar* transform (rest lst)))))

;;; @todo bind
(defun bind (fn &rest args) nil)
  
