;; -*- mode: scheme; coding: utf-8 -*-
;; Copyright (c) 2026 
;; SPDX-License-Identifier: MIT
#!r6rs

(library (makeboot)
  (export hello make-boot-maker make-petite-boot make-scheme-boot)
  (import (scheme))

 (define (hello whom)
   (string-append "Hello " whom "!"))

 (define (make-boot-maker boot-files)
  (lambda sources
   (let ([name (car sources)]
         [sources (cadr sources)])
        (apply make-boot-file (append (list name boot-files) sources)))))

 (define make-petite-boot (make-boot-maker (list "petite")))
 (define make-scheme-boot (make-boot-maker (list "scheme" "petite"))))