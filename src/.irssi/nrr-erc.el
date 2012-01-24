;;;;;;;;;;;;
;;; ERC
;;;;;;
(defmacro nrr-erc-connect (command server port nick)
  "Create interactive command `command', for connecting to an IRC server. The
      command uses interactive mode if passed an argument."
  (fset command
        `(lambda (arg)
           (interactive "p")
           (if (not (= 1 arg))
               (call-interactively 'erc)
             (erc :server ,server :port ,port :nick ,nick)))))

(defmacro nrr-erc-autojoin (&rest args)
  `(add-hook 'erc-after-connect
             '(lambda (server nick)
                (cond
                 ,@(mapcar (lambda (servers+channels)
                             (let ((servers (car servers+channels))
                                   (channels (cdr servers+channels)))
                               `((member erc-session-server ',servers)
                                 (mapc 'erc-join-channel ',channels))))
                           args)))))

;; (defmacro nrr-erc-nickserv-identify (&rest args)
;;   `(add-hook 'erc-after-connect
;;              '(lambda (server nick)
;;                 (cond
;;                  ,@(mapcar (lambda (servers+credentials)
;;                              (let ((servers (car servers+credentials))
;;                                    (credentials (cdr servers+credentials)))
;;                                `((member erc-session-server ',servers)
;;                                  (nrr-erc-do-nickserv-identify ',credentials))))
;;                            args)))))

;; (defun nrr-erc-do-nickserv-identify (credentials)
;;   )

(autoload 'erc "erc" "" t)

(setq erc-user-full-name "Nathaniel R. Reindl")
(setq erc-email-userid "nrr")

(nrr-erc-connect erc-freenode "irc.freenode.org" 6667 "nrr")
(nrr-erc-connect erc-perl "irc.perl.org" 6667 "nrr")
(nrr-erc-connect erc-darkmyst "irc.darkmyst.org" 6667 "nrr")
(nrr-erc-connect erc-furnet "irc.furnet.org" 6667 "nrr")
(nrr-erc-connect erc-synirc "irc.synirc.net" 6667 "nrr")
(nrr-erc-connect erc-anthrochat "irc.anthrochat.net" 6667 "nrr")
;;(nrr-erc-connect erc-furocity "irc.furocity.com" 6667 "nrr")
;;(nrr-erc-connect erc-threetides "irc.threetides.org" 6667 "nrr")
(nrr-erc-connect erc-espernet "irc.esper.net" 6667 "nrr")
(nrr-erc-connect erc-vgmix "irc.vgmix.com" 6667 "nrr")
(nrr-erc-connect erc-xtil "irc.xtil.net" 6667 "nrr")
(nrr-erc-connect erc-intelminer "irc.intelminer.com" 9999 "nrr")
;;(nrr-erc-connect erc-distrust "irc.distrust.us" 6667 "nrr")
;;(nrr-erc-connect erc-skaia "irc.skaia.net" 6667 "confusedTopologist")

(nrr-erc-autojoin
 (("irc.freenode.org")
  "#atlassian"
  "#keryx"
  "#perl-cats"
  "#concatenative"
  ;; "#math"
  ;; "#not-math"
;  "#perl"
;  "#rails"
  "#renraku"
;  "#ruby"
  "#jenkins"
  "#stackoverflow"
;  "#startups"
)
 (("irc.perl.org")
  "#perl"
  "#moose"
  "#toolchain"
  "#cpantesters-discussion"
  "#distzilla"
  "#ubic"
  "#catalyst"
  "#dbix-class")
; (("irc.distrust.us")
;  "#fchan")
 (("irc.furnet.org")
  "#bobchannel"
  "#fsr"
;  "#lobby"
  "#furaffinity-dev"
  "#otters")
 (("irc.synirc.net")
  "#ocs"
;  "#holegan"
)
 (("irc.darkmyst.org")
  "#e621")
 (("irc.anthrochat.net")
  "#hackerfurs"
  "#furry"
;  "#artspots"
  "#dirtyanimals"
  "#fchan")
; (("irc.furocity.com")
;  "#furocity")
; (("irc.threetides.org")
;  "###")
 (("irc.esper.net")
  "#mod_shrine"
  "#crashpadcafe"
  "#furry"
  "#vivisector")
 (("irc.xtil.net")
  "#blacksoda")
 (("irc.vgmix.com")
  "#magfest"
  "#vgmix"
  "#vgmixdev")
 (("irc.intelminer.com")
  "#intelminer"))
; (("irc.skaia.net")
;  "#radio"))

(provide 'nrr-erc)
