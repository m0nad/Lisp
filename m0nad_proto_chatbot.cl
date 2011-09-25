;prototipo de um chat bot
;m0nad /at/ email.com
;
;
;

(setf *random-state* (make-random-state t))
(setf lista '(
 	("td bom" "tudo bom" "ola" "cole" "falae" "blz" "de boa") 
	("falou" "abracos" "tchau" "adeus" "ate" "bye" "ate mais" "beijos" "bjs" )
 	("aff" "sim" "nao" "nao sei")))
(setf saidas (cadr lista))
(setf olas (cdar lista))
(setf rand (caddr lista))

(defun monadbot()

  (loop
    (princ ">")
    (setf input (read-line))
    (cond 
       ((match-list saidas input)	 (exit (puts (rnd-elt saidas))))
       ((match-list olas input)    	 (puts (rnd-elt olas)));
       (t (puts (rnd-elt rand))))))

(defun match-list (lista input)
  (if (null lista)
    nil
    (if (string-equal (first lista) input)
      t
      (match-list (rest lista) input))))

(defun puts (str)
  (format t str)
  (format t "~%"))

(defun rnd-elt(lista)
  (nth (random (length lista)) lista))
(monadbot)
