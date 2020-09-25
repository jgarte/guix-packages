;;; Copyright © 2020 Ryan Prior <rprior@protonmail.com>

(define-module (testing hugo)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
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

(define-public go-github-com-puerkitobio-purell
  (package
    (name "go-github-com-puerkitobio-purell")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PuerkitoBio/purell")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0c525frsxmalrn55hzzsxy17ng8avkd40ga0wxfw9haxsdjgqdqy"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/PuerkitoBio/purell"))
    (propagated-inputs
     `(("go-github-com-puerkitobio-urlesc" ,go-github-com-puerkitobio-urlesc)
       ("go-golang-org-x-net" ,go-golang-org-x-net)
       ("go-golang-org-x-text" ,go-golang-org-x-text)))
    (home-page "https://github.com/PuerkitoBio/purell")
    (synopsis "Normalizes URLs")
    (description
     "Purell is a tiny Go library to normalize URLs.  It returns a pure URL; a
Pure-ell.  Based on the Wikipedia article for URLs and RFC 3986.")
    (license license:expat)))

(define-public go-github-com-armon-go-radix
  (package
    (name "go-github-com-armon-go-radix")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/armon/go-radix")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1m1k0jz9gjfrk4m7hjm7p03qmviamfgxwm2ghakqxw3hdds8v503"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/armon/go-radix"))
    (home-page "https://github.com/armon/go-radix")
    (synopsis "Package that implements a radix tree")
    (description
     "This package provides a single radix tree implementation optimized for
sparse nodes.")
    (license license:expat)))

(define-public go-github-com-go-sql-driver-mysql
  (package
    (name "go-github-com-go-sql-driver-mysql")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/go-sql-driver/mysql")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "11x0m9yf3kdnf6981182r824psgxwfaqhn3x3in4yiidp0w0hk3v"))))
    (build-system go-build-system)
    (arguments
     '(#:tests? #f ;; tests require a network connection
       #:import-path "github.com/go-sql-driver/mysql"))
    (home-page "https://github.com/go-sql-driver/mysql")
    (synopsis "MySQL driver for golang")
    (description
     "This is a pure Go implementaton of the MySQL API, compatible with
golang's database/sql package.")
    (license license:mpl2.0)))

(define-public go-github-com-jmespath-go-jmespath
  (package
    (name "go-github-com-jmespath-go-jmespath")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jmespath/go-jmespath")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "18zyr9nlywmwp3wpzcjxrgq9s9d2mmc6zg6xhsna00m663nkyc3n"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/jmespath/go-jmespath"))
    (native-inputs
     `(("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
       ("go-github-com-pmezard-go-difflib" ,go-github-com-pmezard-go-difflib)
       ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)))
    (home-page "https://github.com/jmespath/go-jmespath")
    (synopsis "Golang implementation of JMESPath")
    (description
     "This package implements JMESPath, a query language for JSON.  It
transforms one JSON document into another through a JMESPath expression.")
    (license license:asl2.0)))

(define-public go-github-com-aws-sdk
  (package
    (name "go-github-com-aws-sdk")
    (version "1.34.27")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aws/aws-sdk-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1pfy76xy60hqcrgkg407gpxk0rmv0njdlzbpmvp2gzglnfm1rk5w"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/aws/aws-sdk-go/aws"
       #:unpack-path "github.com/aws/aws-sdk-go"))
    (propagated-inputs
     `(("go-github-com-go-sql-driver-mysql" ,go-github-com-go-sql-driver-mysql)
       ("go-github-com-jmespath-go-jmespath" ,go-github-com-jmespath-go-jmespath)
       ("go-github-com-pkg-errors" ,go-github-com-pkg-errors)
       ("go-golang-org-x-net" ,go-golang-org-x-net)))
    (home-page "https://github.com/aws/aws-sdk-go")
    (synopsis "Library to access Amazon Web Services (AWS)")
    (description
     "This is the official AWS SDK for the Go programming language.")
    (license license:asl2.0)))

(define-public go-github-com-bep-debounce
  (package
    (name "go-github-com-bep-debounce")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bep/debounce")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1vxa9cz2z0cmjixz3gjfp18fzliy9d2q7q6cz0zqs7yqbpjn5f55"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/bep/debounce"))
    (home-page "https://github.com/bep/debounce")
    (synopsis "Debouncer written in Go")
    (description
     "This package removes high-frequency signals from an input, limiting the
timeframe on which it will change.")
    (license license:expat)))

(define-public go-github-com-bep-gitmap
  (package
    (name "go-github-com-bep-gitmap")
    (version "1.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bep/gitmap")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0hvynpflvbn6g1vgrv37njn8005qxdq8l1289ymr37a2p5c1jncm"))))
    (build-system go-build-system)
    (arguments
     '(#:tests? #f ;; tests require the .git directory
       #:import-path "github.com/bep/gitmap"))
    (native-inputs
     `(("git" ,git)))
    (home-page "https://github.com/bep/gitmap")
    (synopsis "Creates a map from filenames to info objects in a Git repo.")
    (description
     "Gitmap provides a fairly fast method to create a map from all the
filenames to info objects for a given revision of a Git repo.")
    (license license:expat)))

(define-public go-golang.org-x-xerrors
  (let ((commit "5ec99f83aff198f5fbd629d6c8d8eb38a04218ca")
        (revision "0"))
    (package
      (name "go-golang.org-x-xerrors")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://go.googlesource.com/xerrors")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "1dbzc3gmf2haazpv7cgmv97rq40g2xzwbglc17vas8dwhgwgwrzb"))))
      (build-system go-build-system)
      (arguments
       '(#:import-path "golang.org/x/xerrors"))
      (synopsis "Go 1.13 error values")
      (description
       "This package holds the transition packages for the new Go 1.13 error values.")
      (home-page "https://godoc.org/golang.org/xerrors")
      (license license:bsd-3))))

(define-public go-github-com-google-go-cmp-cmp-0.5.2
  (package
    (inherit go-github-com-google-go-cmp-cmp)
    (name "go-github-com-google-go-cmp-cmp")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/google/go-cmp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0qchy411jm9q2l9mf7x3ry2ycaqp9xdhf2nx14qrpzcxfigv2705"))))
    (propagated-inputs
     `(("go-golang.org-x-xerrors" ,go-golang.org-x-xerrors)))))

(define-public go-github-com-evanw-esbuild
  (package
    (name "go-github-com-evanw-esbuild")
    (version "0.7.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/evanw/esbuild")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "126q9s21d7569cv3whik19p23xs6zf5lv56pqmz9bw87lw2bvrjp"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/evanw/esbuild/cmd/esbuild"
       #:unpack-path "github.com/evanw/esbuild"))
    (propagated-inputs
     `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/evanw/esbuild")
    (synopsis "An extremely fast JavaScript bundler and minifier.")
    (description
     "This is a JavaScript bundler and minifier.  It packages up JavaScript
and TypeScript code for distribution on the web.")
    (license license:expat)))

(define-public go-github-com-fortytw2-leaktest
  (package
    (name "go-github-com-fortytw2-leaktest")
    (version "d73c753520d9250e8f091d70d468a99c71f8bceb")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fortytw2/leaktest")
             (commit version)))
       (file-name (git-file-name name "master"))
       (sha256
        (base32
         "15aqrdfz9gf7k571f6l5dfjy3apjxaxrpj60rqv9bfz2sqw8inlf"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/fortytw2/leaktest"))
    (home-page "https://github.com/fortytw2/leaktest")
    (synopsis "Goroutine leak detector.")
    (description
     "This package takes a snapshot of running goroutines at the start of a
test, and at the end—compares the two et voilà.")
    (license license:expat)))

(define-public go-github-com-frankban-quicktest
  (package
    (name "go-github-com-frankban-quicktest")
    (version "1.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/frankban/quicktest")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0fbxrd6xgxq2r6v4cv6qrlpkhpdaxqb28hnw1hjf4lvcv4kibj6x"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/frankban/quicktest"))
    (propagated-inputs
     `(("go-github-com-google-go-cmp-cmp" ,go-github-com-google-go-cmp-cmp-0.5.2)
       ("go-github-com-kr-pretty" ,go-github-com-kr-pretty)))
    (home-page "https://github.com/frankban/quicktest")
    (synopsis "Quick helpers for testing Go applications")
    (description
     "Package quicktest provides a collection of Go helpers for writing
tests.")
    (license license:expat)))

(define-public go-github-com-bep-golibsass
  (package
    (name "go-github-com-bep-golibsass")
    (version "0.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bep/golibsass")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0xk3m2ynbydzx87dz573ihwc4ryq0r545vz937szz175ivgfrhh3"))
       (snippet
        '(begin
           ((@ (guix build utils) delete-file-recursively) "libsass_src")
           #t))))
    (build-system go-build-system)
    (arguments
     '(#:build-flags '("-tags" "dev")
       #:import-path "github.com/bep/golibsass/libsass"
       #:unpack-path "github.com/bep/golibsass"
       #:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key import-path #:allow-other-keys)
             (invoke "go" "test" import-path "-tags" "dev"))))))
    (propagated-inputs
     `(("libsass" ,libsass)))
    (native-inputs
     `(("go-github-com-frankban-quicktest" ,go-github-com-frankban-quicktest)))
    (home-page "https://github.com/bep/golibsass")
    (synopsis "Easy to use Go bindings for LibSass")
    (description
     "This package provides SCSS compiler support for Go applications.")
    (license license:expat)))


(define-public go-github-com-bep-tmc
  (package
    (name "go-github-com-bep-tmc")
    (version "0.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bep/tmc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1jn3j7mh77a5bbwh3hx3r0blzbdj2fvk5wvcfa8fr45qp2zlpbhx"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/bep/tmc"))
    (propagated-inputs
     `(("go-github-com-bep-debounce" ,go-github-com-bep-debounce)
       ("go-github-com-frankban-quicktest" ,go-github-com-frankban-quicktest)
       ("go-github-com-google-go-cmp-cmp" ,go-github-com-google-go-cmp-cmp-0.5.2)
       ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)))
    (home-page "https://github.com/bep/tmc")
    (synopsis "Debouncer written in Go")
    (description
     "This package removes high-frequency signals from an input, limiting the
timeframe on which it will change.")
    (license license:expat)))

(define-public go-github-com-disintegration-gift
  (package
    (name "go-github-com-disintegration-gift")
    (version "1.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/disintegration/gift")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0zdki6ydqgxl7lg23f4885w8ij34sdg8xv7b7yp6c7ffi2ikk07f"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/disintegration/gift"))
    (home-page "https://github.com/disintegration/gift")
    (synopsis "Go image filtering toolkit")
    (description
     "This package provides a set of useful image processing filters.")
    (license license:expat)))

(define-public go-github-com-dustin-go-humanize
  (package
    (name "go-github-com-dustin-go-humanize")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dustin/go-humanize")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1kqf1kavdyvjk7f8kx62pnm7fbypn9z1vbf8v2qdh3y7z7a0cbl3"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/dustin/go-humanize"))
    (home-page "https://github.com/dustin/go-humanize")
    (synopsis "Formatters for units to human friendly sizes")
    (description
     "This package provides functions for helping humanize times and sizes, like “7 hours ago.”")
    (license license:expat)))

(define-public go-github-com-ghodss-yaml
  (package
    (name "go-github-com-ghodss-yaml")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghodss/yaml")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0skwmimpy7hlh7pva2slpcplnm912rp3igs98xnqmn859kwa5v8g"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/ghodss/yaml"))
    (propagated-inputs
     `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)))
    (home-page "https://github.com/ghodss/yaml")
    (synopsis "Marshal and unmarshal YAML in Golang.")
    (description
     "This package converts YAML to JSON using go-yaml and then uses
json.Marshal and json.Unmarshal to convert to or from the struct.")
    (license license:expat)))

(define-public go-github-com-getkin-kin-openapi
  (package
    (name "go-github-com-getkin-kin-openapi")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/getkin/kin-openapi")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "01bqrxf40s2pvcf55szi719g9nwz4yh6c01kr0v581jl249jk1am"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/getkin/kin-openapi/openapi3"
       #:unpack-path "github.com/getkin/kin-openapi"))
    (propagated-inputs
     `(("go-github-com-ghodss-yaml" ,go-github-com-ghodss-yaml)
       ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)
       ("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)))
    (home-page "https://github.com/getkin/kin-openapi")
    (synopsis "OpenAPI 3.0 implementation for Go.")
    (description
     "This package handles OpenAPI files.  It targets the latest OpenAPI
version (currently 3), but the project contains support for older OpenAPI
versions too.")
    (license license:expat)))

(define-public go-github-com-gorilla-websocket
  (package
    (name "go-github-com-gorilla-websocket")
    (version "1.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gorilla/websocket")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0mkm9w6kjkrlzab5wh8p4qxkc0icqawjbvr01d2nk6ykylrln40s"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/gorilla/websocket"))
    (home-page "https://github.com/gorilla/websocket")
    (synopsis "A fast, well-tested and widely used WebSocket implementation for Go")
    (description
     "The Gorilla WebSocket package provides a complete and tested
implementation of the WebSocket protocol.")
    (license license:expat)))

(define-public go-github-com-kyokomi-emoji
  (package
    (name "go-github-com-kyokomi-emoji")
    (version "2.2.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kyokomi/emoji")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0abjjslfip135595v085z1c8pns0lgmm4scqdwxx3nxy4njwqmph"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/kyokomi/emoji"))
    (home-page "https://github.com/kyokomi/emoji")
    (synopsis "Emoji terminal output for golang")
    (description
     "The emoji package provides methods for interpolating emoji into strings
and character sequences.")
    (license license:expat)))

(define-public go-github-com-magefile-mage
  (package
    (name "go-github-com-magefile-mage")
    (version "1.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/magefile/mage")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0c77xgz2bz4j9sh9v7f49iqyamc4lvvldcmn6v50hk98s9193gbf"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/magefile/mage"))
    (home-page "https://magefile.org/")
    (synopsis "Build tool and task runner like make/rake using Go")
    (description
     "Mage is a make-like build tool using Go.  You write plain-old go
functions, and Mage automatically uses them as Makefile-like runnable
targets.")
    (license license:asl2.0)))

(define-public go-github-com-joho-godotenv
  (package
    (name "go-github-com-joho-godotenv")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/joho/godotenv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0ri8if0pc3x6jg4c3i8wr58xyfpxkwmcjk3rp8gb398a1aa3gpjm"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/joho/godotenv"))
    (home-page "https://github.com/joho/godotenv")
    (synopsis "Loads environment variables from a file.")
    (description
     "Dotenv load variables from a .env file when the environment is
bootstrapped.")
    (license license:expat)))

(define-public go-github-com-gobuffalo-envy
  (package
    (name "go-github-com-gobuffalo-envy")
    (version "1.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gobuffalo/envy")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "119lb8i5pzbfwddmrfmjjai9m5np4p485bqxhb82jzsxavzc88m7"))))
    (build-system go-build-system)
    (arguments
     '(#:tests? #f ;; TODO tests require mutable filesystem
       #:import-path "github.com/gobuffalo/envy"))
    (propagated-inputs
     `(("go-github-com-davecgh-go-spew" ,go-github-com-davecgh-go-spew)
       ("go-github-com-joho-godotenv" ,go-github-com-joho-godotenv)
       ("go-github-com-rogpeppe-go-internal" ,go-github-com-rogpeppe-go-internal)
       ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)))
    (home-page "https://github.com/gobuffalo/envy")
    (synopsis "Makes working with environment variables in Go trivial.")
    (description
     "Envy provides convenience methods for working with environment
variables.")
    (license license:expat)))

(define-public go-github-com-markbates-inflect
  (package
    (name "go-github-com-markbates-inflect")
    (version "1.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/markbates/inflect")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0pd50b8q6bib84yab14csd6nc08hfdapzbh1nnw6qrmc1zxi7r7m"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/markbates/inflect"))
    (propagated-inputs
     `(("go-github-com-gobuffalo-envy" ,go-github-com-gobuffalo-envy)
       ("go-github-com-stretchr-testify" ,go-github-com-stretchr-testify)))
    (home-page "https://github.com/markbates/inflect")
    (synopsis "An inflection engine for golang")
    (description
     "The inflect package transforms text into different styles,
capitalizations, spacing, and so on.")
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
    (native-inputs
     `(("go-github-com-burntsushi-locker" ,go-github-com-burntsushi-locker)
       ("go-github-com-burntsushi-toml" ,go-github-com-burntsushi-toml)
       ("go-github-com-puerkitobio-purell" ,go-github-com-puerkitobio-purell)
       ("go-github-com-alecthomas-chroma" ,go-github-com-alecthomas-chroma)
       ("go-github-com-armon-go-radix" ,go-github-com-armon-go-radix)
       ("go-github-com-aws-sdk" ,go-github-com-aws-sdk)
       ("go-github-com-bep-debounce" ,go-github-com-bep-debounce)
       ("go-github-com-bep-gitmap" ,go-github-com-bep-gitmap)
       ("go-github-com-bep-tmc" ,go-github-com-bep-tmc)
       ("go-github-com-disintegration-gift" ,go-github-com-disintegration-gift)
       ("go-github-com-dustin-go-humanize" ,go-github-com-dustin-go-humanize)
       ("go-github-com-fsnotify-fsnotify" ,go-github-com-fsnotify-fsnotify)
       ("go-github-com-gobwas-glob" ,go-github-com-gobwas-glob)
       ("go-github-com-gorilla-websocket" ,go-github-com-gorilla-websocket)
       ("go-github-com-kyokomi-emoji" ,go-github-com-kyokomi-emoji)
       ("go-github-com-magefile-mage" ,go-github-com-magefile-mage)
       ("go-github-com-markbates-inflect" ,go-github-com-markbates-inflect)
       ("go-github-com-mattn-go-isatty" ,go-github-com-mattn-go-isatty)
       ;; miekg/mmark
       ;; mitchellh/hashstructure
       ("go-github-com-mitchellh-mapstructure" ,go-github-com-mitchellh-mapstructure)
       ;; muesli/smartcrop
       ))
    ;; There are a bunch of dependencies; see hugo-deps.org
    ;; TODO figure out which deps are already packaged
    ;; TODO package more go deps as necessary
    (home-page "https://gohugo.io/")
    (synopsis "Fast static site generator")
    (description "Hugo takes a directory with content and templates and renders
them into a full HTML website.")
    (license license:asl2.0)))
