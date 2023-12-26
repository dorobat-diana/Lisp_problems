;b) Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.
;replaceall(L1 E L2)
;	{ (),if l null
;	L2 U replaceall(l2,..,ln E L2), if E=l1
;	l1 U replaceall(l2,..,ln E L2), if E!=l1
;	replaceall(l1 E L2) U replaceall(l2,..ln E L2), if l1= list}

(defun replaceall (l e l2)
    (cond
      ((null l) nil)
      ((listp (car l)) (cons (replaceall (car l) e l2) (replaceall (cdr l) e l2)))
      ((equal (car l) e) (append l2 (replaceall (cdr l) e l2)))
      (t (cons (car l) (replaceall (cdr l) e l2)))
    )
)
(print (replaceall '(1 2 (5 6 3) 3 4 3 5 3) 3 '(1 2 3)))
