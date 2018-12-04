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

;;; fn generator (closure binder)
(defun adder-fn-gen (x)
  (lambda (y) (+ x y)))

(defvar adder-fn-42 (adder-fn-gen 42))

;;; let
(defun foo-let (x y)
  (let ((a (* x x))
	(b (+ 1 (* y y))))
    (+ a b)))
    
;;; compose
(defun compose-apply (f g &rest args)
  (let ((val-f (apply f args)))
    (funcall g val-f)))

(defun compose (f g)
  (lambda (&rest args)
    (funcall g (apply f args))))

;;; filter
(defun filter (predicate lst)
  (cond ((null lst) nil)
	((funcall predicate (first lst))
	 (cons (first lst) (filter predicate (rest lst))))
	(T (filter predicate (rest lst)))))

;;; accumulate
(defun accumulate (transform default lst)
  (if (null lst)
      default
      (funcall transform (first lst)
	       (accumulate transform default (rest lst)))))
;;; iota
(defun iota (n)
  (if (<= n 0)
      nil
      (cons n (iota (- n 1)))))

;;; optionals & default
(defun fact-tro (n &optional (acc 1))
  (if (= n 0)
      acc
      (fact-tro (- n 1) (* n acc))))
