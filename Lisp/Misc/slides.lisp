;; slides.lisp

(defun hello-world () (print (list 'Hello 'World)))

;;   L0
;;  / \
;; 7   L1
;;    / \
;;  42   NIL
(cons 7 (cons 42 NIL))

;; quote
;; Escape Lisp evaluation
(list (quote a) (quote b) (quote c))
(list 'a 'b 'c)

;; eval

;; List summation
(defun summation (l)
  (if (null l) 0
      (+ (first l) (rest l))))

