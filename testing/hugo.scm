;;; Copyright © 2020 Ryan Prior <rprior@protonmail.com>

(define-module (testing hugo)
  #:use-module (gnu packages golang)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public go-github-com-puerkitobio-urlesc
  (package
    (name "go-github-com-puerkitobio-urlesc")
    (version "de5bf2ad457846296e2031421a34e2568e304e35")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PuerkitoBio/urlesc")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0n0srpqwbaan1wrhh2b7ysz543pjs1xw2rghvqyffg9l0g8kzgcw"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/PuerkitoBio/urlesc"))
    (home-page "https://github.com/PuerkitoBio/urlesc")
    (synopsis "Implements query escaping as per RFC 3986")
    (description
     "This package escapes queries as per RFC 3986.  It contains some parts of
the net/url package, modified so as to allow some reserved characters
incorrectly escaped by net/url.")
    (license license:expat)))

(define-public hugo
  (package
    (name "hugo")
    (version "0.69.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gohugoio/hugo.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0wx13c3nck7zm1j6rhyksgsp1cv6mlmkwhkyijv153d117g7aslz"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/gohugoio/hugo"))
    ;; There are a bunch of dependencies; see hugo-deps.org
    ;; TODO figure out which deps are already packaged
    ;; TODO package more go deps as necessary
    (home-page "https://gohugo.io/")
    (synopsis "Fast static site generator")
    (description "Hugo takes a directory with content and templates and renders
them into a full HTML website.")
    (license license:asl2.0)))

hugo
