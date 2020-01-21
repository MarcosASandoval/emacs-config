;; Let's try it the recursive way
(defun cartesian-product (l)
  "Takes a list of lists and returns a list of all possible combinations of the elements in each list"

  (cond ((null l) nil)
        ((not (cdr l))
         (let ((value '()))
           (dolist (element (car l) value)
                    (setq value (cons (list element)
                                      value)))))
        ((listp (car l))
         (let ((value '())
               (final '()))
           (dolist (e (car l) final)
             (dolist (g (cartesian-product (cdr l)) value)
               (setq final (cons (setq value (cons e g))
                                 final))))))))
             
;; at this point we need to reset value after 
(defun filter-combinations (combination-list exclusion-list)
  "This will remove any sets in the combination list that have any of the exclusion list sets as a subset"
  (let (final)
    (dolist (c combination-list final)
      (setq final
            (if (let (value)
                  (dolist (e exclusion-list value)
                    (setq value
                          (or value (cl-subsetp e c)))))
                final
              (cons c final))))))


(defun is-object-in-list? (object l)
  (or (member object l)
      (memq object l)
      (memql object l)
      (member-ignore-case object l)))

(progn
  (prin1 '("x\n" 1 2 3 "\n"))
  (prin1 "y")
  (prin1 "z"))

;; (let ((x '((a b c)
;;            (x y z)))
;;       (y '((c z)
;;            (a d))))
;;   (cartesian-product x))

;; (let ((x '((a b c)
;;            (x y z)))
;;       (y '((c z)
;;            (a d))))
;;   (filter-combinations (cartesian-product x)
;;                        y))

;; (dolist (e (cartesian-product '((a b c) (d e) (f g h))) value)
;;   (setq value 'nil)
;;   (print e))
;; )
