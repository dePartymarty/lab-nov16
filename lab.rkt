;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname lab) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;block-exp := number
;
;                 := (number symbol block-exp)
;
;                  := (symbol block-exp block-exp)
;
;                  := symbol

;1. Block 8 numbers

(define grammar '((a 1 2) (b 3 4) (c 5 6) (d 7 8)))

;2. Function

(define count-block-exp
  (lambda (block-exp)
    (cond
      ((null? block-exp) 0)
      ((number? (car block-exp)) (+ (car (cdr block-exp)) (count-block-exp (car (cddr block-exp))))))
      (else (+ (count-block-exp (cadr block-exp)) (count-block-exp (car (cddr block-exp)))))))

;3.
(define collect-symbols
  (lambda (block-exp)
    (cond
      ((null? block-exp) '())
      ((number? (car block-exp)) (cons (car (cdr block-exp)) (collect-symbols (car (cddr block-exp))))))
      (else (append (collect-symbols (cadr block-exp)) (collect-symbols (car (cddr block-exp)))))))

;3.
(count-block-exp grammar)
(collect-symbols grammar)