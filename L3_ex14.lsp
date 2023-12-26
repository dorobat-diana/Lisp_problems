;14. Write a function that returns the number of atoms in a list, at any level.
;count-atoms(l1,...,ln){0, list is null
            ;1, element is an atom
            ;count-atoms(l1)+count-atoms(l2)+...+count-atoms(ln), otherwise}
(defun count-atoms (lst)
  (cond
    ((null lst) 0) ; If the list is empty, return 0
    ((atom lst) 1) ; If the element is an atom, return 1
    (t (apply #'+ (mapcar #'count-atoms lst))))) ;count atoms in the every element of the list 

(print (count-atoms '(a 2 3 (3 () (3 4) ))))))