#!/usr/bin/env scheme-script
;; -*- mode: scheme; coding: utf-8 -*- !#
;; Copyright (c) 2026 
;; SPDX-License-Identifier: MIT
#!r6rs

(import (rnrs (6)) (makeboot))

; Definitions
(define (show-help)
  (display "Usage: makeboot scheme|petite bootfile_name sources_or_objects...")
  (newline))

(define (any list-of-bools)
  (cond
    ([not (list? list-of-bools)]
     (raise (condition (make-error) (make-message-condition (format "~s is not a list" list-of-bools)))))
    ([null? list-of-bools] #f)
    ([car list-of-bools] #t)
    (else (any (cdr list-of-bools)))))

(suppress-greeting #t)

; Procedure
(scheme-start
 (lambda args
  (when (or)
        (<= (length args) 3)
        (any
          (map (lambda (x) (or (string=? x "-h") (string=? x "--help"))) args))
    (show-help (car args))
    (exit))

  (let* ([type (car args)]
         [name (cadr args)]
         [sources (cddr args)])
   (guard (x (else (show-help) (raise-continuable x)))
    (cond
      ([string=? type "petite"]
       (make-petite-boot name sources))
      ([string=? type "scheme"]
       (make-scheme-boot name sources))
      (else
        (show-help)
        (display (format "Invalid type ~s - supply either \"petite\" or \"scheme\"" type))
        (newline)
        (exit 1)))))))