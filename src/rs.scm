(import (chicken process-context)
        (bind)
        (shell))

(define args (command-line-arguments))
(define (set-temp x)
       (string-append
         (string-append "redshift -x 1>/dev/null; redshift -O "
                        (number->string (* (string->number (car args)) x))) " 1>/dev/null"))

(if (equal? '() args)
    (run ("redshift -x 1>/dev/null"))
    (if (> (string->number (car args)) 9)
        (execute (cons (set-temp 100) '()))
        (execute (cons (set-temp 1000) '()))))


; vim: set ft=scheme:
