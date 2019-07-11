;; Let's try it the recursive way
(defun cartesian-product (l)
  "Takes a list of lists and returns a list of all possible combinations of the elements in each list"
  (cond ((null l) nil)
        ((null (cdr l)) (car l))
        ((not (null (cdr l)))
         (dolist (x (car l) value)
           (dolist (y (cdr l) value)
             (setq value (append x y)))))))


(setq x `((1 2 3) (4 5 6) (7 8 9)))
(setq y `((1 2 3) (4 5 6)))

(cartesian-product y)
(cartesian-product x)



;; what do we want to do?

;; We want to define a string as a template
(setvar template "$vara, $varb" "The template")

;; Set the options list here:
(defvar options `(("$vara" . ("Y" "N"))
                  ("$varb" . ("enabled" "disabled" "suspended"))))

options

;; now we want to search through the template for a list of keywords that we will then replace

;; (s-replace-all replacements s)

;; We need a function that will take a data structure and convert it to a cons list
;; containing "keys" and "values" to be used by the s-replace-all function
;; A cons list
;; (("" . "")
;;  ("" . ""))

;; The car of each cons in the list will be a string.
;; This string represents a key or substring to be replaced in our template.
;; The cdr of each cons in the list will be a list of strings.
;; This list contains the possible values that the key could have


(setq lexical-binding t)                ; set the buffer local variable

(defun list-iterator (value-list)
  "Takes a list of values and creates an \"iterator\" function
Each time this function is called, it will return the next item in the list it was initially provided.
It return nil once there is nothing left to iterate through."
  (let ((head (car value-list)))
    (lambda ()
      (setq head (car value-list))
      (setq value-list (cdr value-list))
      head)))

;; tests
;; (setq k (list-iterator `(a b c d e)))
;; (funcall k)


(defun cons-key-to-iterator (key value-list)
  "This conses a key and an iterator created by calling list-iterator on list"
  (cons key (list-iterator value-list)))

;; tests
;; (cons-key-to-iterator "a" `(a b c d 0))
;; (setq k (cons-key-to-iterator "a" `(a b c d 0)))
;; (setq key (car (cons-key-to-iterator "a" `(a b c d 0))))
;; (funcall k)
;; (equal (cons 'a 'b)
;;        '(a . b)) ;; => t
;; (cons `(a . b) `((c . d)))
;; (let ((a `("a" . "b")))
;;   (append a `("c" . "d") `()))

(defun generate-iterators (options)
  "generates a cons list where the car of each cons is a key and the cdr is an iterator function generated using the list-iterator function"
  (let ((options (cdr options))
        (key (car (car options)))
        (value-list (cdr (car options))))
    (unless (not options)
      (append
       `(,(cons-key-to-iterator key value-list))
       (generate-iterators (cdr options))))))

;; tests
(setq k (generate-iterators options))
(car k)
(car (cdr k))
(funcall k "$vara")
;; (generate-iterators options)



;; (car options)
;; (cdr options)
;; (car (cdr options))
(defun return-key-iterator (options)
  "When called, this will generate a function mapping the list iterator to the key or something."
  (let* ((iterators (generate-iterators options))
         (list-key (car (car iterators)))
         (iterator (cdr (car iterators))))
    (lambda (key)
      ""
      (funcall (cdr (assoc key iterators))))))


;; (setq the-func (return-key-iterator options))
;; (funcall the-func "$vara")
;; (funcall the-func "$varb")


(defun get-next-value-pair-by-key (key-iterator key)
  "Calls the key-iterator function with key as argument.
Returns a key value pair or nil"
  (let ((value (funcall key-iterator key)))
    (if value
        (cons key value))))


;; This is how we do it....doot doot
(let ((the-func (return-key-iterator options)))
  (print (get-next-value-pair-by-key the-func "$vara"))
  (print (get-next-value-pair-by-key the-func "$vara"))
  (print (get-next-value-pair-by-key the-func "$vara"))
  (print (get-next-value-pair-by-key the-func "$varb"))
  (print (get-next-value-pair-by-key the-func "$varb"))
  (print (get-next-value-pair-by-key the-func "$varb"))
  (print (get-next-value-pair-by-key the-func "$varb"))
  (print (get-next-value-pair-by-key the-func "$varb")))


;; reset an iterator
(defun get-new-iterator-by-key (key options)
  (lambda () ((assoc key options)
  

(defun give-me-the-replacement-lists (options)
  "returns a list of alists to be used by s-replace-all"
  ;; (s-replace-all replacements s)
  ())

;; We need a function that will call the key iterator and pair the returned value with the key.

;; So call each key's iterator if any of the values returned are nil, don't add them to the alist.
;; If they are non-nil add them to the alist.
(defun mix (x)
  ""
  )
