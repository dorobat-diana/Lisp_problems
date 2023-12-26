;c) Write a function to determines the sum of two numbers in list representation, and returns the 
;corresponding decimal number, without transforming the representation of the number from list to 
;number.
;decimal(l1 l2 s){
;	(s/10)%10 , if l1 null and l2 null
;	decimal((),l2,s+l11) , if l1 has one element
;	decimal(l1,(),s+l21) ,if l2 has one element
;	decimal(l21,l2,s+l11*10), if l1 has 2 elem
;	decimal(l1,l22,s+l21*10), if l2 has 2 elem
;	decimal(l12,..,l1n,l22,..l2n), otherwise}
(defun decimal (l1 l2 s)
  (cond
    ((and (null l1) (null l2)) (mod (floor (/ s 10)) 10))
    ((equal (length l1) 1) (decimal (cdr l1) l2 (+ s (car l1))))
    ((equal (length l2) 1) (decimal l1 (cdr l2) (+ s (car l2))))
    ((equal (length l1) 2) (decimal (cdr l1) l2 (+ s (* 10 (car l1)))))
    ((equal (length l2) 2) (decimal l1 (cdr l2) (+ s (* 10 (car l2)))))
    (t (decimal (cdr l1) (cdr l2) s))))
(print(decimal '(5 9) '(8 3) 0))
(print (decimal '(1 2 3 9) '(1 5 7) 0))
