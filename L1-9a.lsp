;a) Write a function that merges two sorted linear lists and keeps double values.
;merge-sorted-double(list1 list2)={list1 ,if list2 null
;				list2, if list1 null
;				l1 U merge-sorted-double(l2,..ln list2), if l1<=l2
;				l2 U merge-sorted-double(list1 l2..ln) if l2<l1	}



(defun merge-sorted-double (list1 list2)
  (cond
    ((null list1) list2)
    ((null list2) list1)
  
    ((<= (car list1) (car list2))
     (cons (car list1) (merge-sorted-double (cdr list1) list2)))
    (t
     (cons (car list2) (merge-sorted-double list1 (cdr list2))))))

;; Example usage:
(print (merge-sorted-double '(1 2 3 5) '(2 3 4 6))) ; Output: (1 2 3 4 5 6)
