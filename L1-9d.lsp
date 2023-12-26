;d) Write a function to return the greatest common divisor of all numbers in a linear list.
;gcd(a b){
;	b, is a=0
;	gcd(b%a a), otherwise}
;gcd_list(l n g){
;	g ,if l is null
;	gcd_list(l2,..,ln n l1), if first elem
;	gcd_list(l2,..ln n gcd(l1 g)), otherwise
(defun gcd (a b)
  (if (= a 0) b (gcd (mod b a) a)))

(defun gcd_list(l n g)
  (cond 
    ((null l) g)
    ((= n (length l)) (gcd_list (cdr l) n (car l)))
    (t (gcd_list (cdr l) n (gcd (car l) g)))
  )
)
(print (gcd_list '(4 2 8) 3 1))
