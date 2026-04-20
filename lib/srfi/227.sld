;; R7RS small implementation of lambda-optional, assuming an optimized
;; case-lambda, by Daphne Preston-Kendal.

(define-library (srfi 227)
  (import (scheme base)
          (scheme case-lambda))

  (export (rename lambda-optional opt-lambda)
          (rename lambda-optional* opt*-lambda)
          let-optionals
          let-optionals*
          (rename define-optional define-optionals)
          (rename define-optional* define-optionals*))
  (include "lambda-optional.scm")

  (begin
    (define-syntax let-optionals
      (syntax-rules ()
        ((_ expr opt-formals body1 ... body2)
         (apply (lambda-optional opt-formals body1 ... body2) expr))))
    (define-syntax let-optionals*
      (syntax-rules ()
        ((_ expr opt-formals body1 ... body2)
         (apply (lambda-optional* opt-formals body1 ... body2) expr))))))
