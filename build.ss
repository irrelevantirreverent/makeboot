#!/usr/bin/env scheme-script
(import (rnrs (6)) (makeboot))
(compile-file "makeboot.sls")
(compile-file "bin/makeboot.sps")
(rename-file "bin/makeboot.so" "makeboot-bin.so")
(make-scheme-boot "makeboot.boot" (list "makeboot.so" "makeboot-bin.so"))