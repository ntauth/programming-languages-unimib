;;; lab.lisp
(defun fact (n)
  (if (= n 0)
      1
    (* n (fact (- n 1)))))

(defun fact-tco (n)
  (fact-tco-impl n 1))

(defun fact-tco-impl (n aux)
  (if (= n 0)
      aux
    (fact-tco-impl (- n 1) (* n aux))))

(defun summation (lst)
  (if (null lst)
      0
    (+ (first lst) (summation (rest lst)))))

(defun list-length- (lst)
  (if (null lst)
      0
    (+ 1 (list-length- (rest lst)))))

(defun list-length-tco (lst)
  (list-length-tco-impl lst 0))

(defun list-length-tco-impl (lst aux)
  (if (null lst)
      aux
    (list-length-tco-impl (rest lst) (first lst))))

(defun double-list (lst)
  (let ((hhead (unless (null lst) (* 2 (first lst))))
        (tail (unless (null lst) (cdr lst))))
    (if (null lst)
      nil
    (cons hhead (double-list tail)))))

(defun filter-positive (lst)
  (cond ((null lst) nil)
        ((>= (first lst) 0) (cons (first lst)
                                  (filter-positive (rest lst))))
        ((< (first lst) 0) (filter-positive (rest lst)))))

(defun filter (lst pred)
  (cond ((null lst) nil)
        (((null (funcall pred lst)) nil) (cons (first lst)
                                        (filter (rest lst) pred)))
        (((null (funcall pred lst)) t) (filter (rest lst) pred))))
 
