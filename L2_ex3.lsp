;;3. Return the number of levels of a tree of type (1).
;;parg_stang(l1,...,ln, nrNod,nrChild){ (),n=0
                                    ;;  (),nrNod=nrChild
                                    ;; l1 U l2 U parg_stang(l3,..ln,nrNod+1,nrChild+l2)}
(defun parg_stang (l nrNod nrChild)
  (cond
    ((null l) nil)
    ((= nrNod (+ 1 nrChild)) nil) 
    (t (cons (car l) (cons (cadr l) (parg_stang (cddr l) (+ 1 nrNod) (+ (cadr l) nrChild))))))
)

;;parg_drept(l1,..,ln,nrNod,nrChild){(),n=0
                                    ;;l,nrNod=nrChild+1
                                    ;;parg_drept(l3,..,ln,nrNod+1,nrChild+l2)
(defun parg_drept (l nrNod nrChild)
  (cond
    ((null l) nil)
    ((= nrNod (+ 1 nrChild)) l) 
    (t  (parg_drept (cddr l) (+ 1 nrNod) (+ (cadr l) nrChild))))
)
;;my_max(a,b){a if a>b
;;            b, otherwise}
(defun my_max(a b)
    (cond
        ((> a b) a)
        (t b)
     )
)
;;height_tree(t1,...,tn,level){level, n==0
                        ;;max(height_tree(parg_stang(t3,..,tn),level+1),height_tree(parg_drept(t3,..,tn),level+1)),otherwise }

(defun height_tree(tree level)
    (cond
        ((null tree) level)
        (t (my_max (height_tree (parg_drept (cddr tree) 0 0) (+ 1 level)) (height_tree (parg_stang (cddr tree) 0 0) (+ 1 level))))
        )
)
    
(print (height_tree '(A 2 B 0 C 2 D 0 E 0) -1))
