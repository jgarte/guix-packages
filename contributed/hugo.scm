;;; Copyright © 2020 Ryan Prior <rprior@protonmail.com>

(define-module (contributed hugo)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public go-github-com-kylelemons-godebug
  (package
    (name "go-github-com-kylelemons-godebug")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kylelemons/godebug")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0dkk3friykg8p6wgqryx6745ahhb9z1j740k7px9dac6v5xjp78c"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/kylelemons/godebug/diff"
       #:unpack-path "github.com/kylelemons/godebug"))
    (home-page "https://github.com/kylelemons/godebug")
    (synopsis "Pretty printer for Go values.")
    (description
     "This package will pretty print a compact representation of a Go data
structure.  It can also produce a much more verbose, one-item-per-line
representation suitable for computing diffs.")
    (license license:asl2.0)))

(define-public esbuild
  (package
    (name "esbuild")
    (version "0.8.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/evanw/esbuild")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0aaqyfnl4dncrpw8n2sqkkavx7ki7i2r9pdi82pp9syql3b5495y"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Remove prebuilt binaries
           (delete-file-recursively "npm")
           #t))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/evanw/esbuild/cmd/esbuild"
       #:unpack-path "github.com/evanw/esbuild"
       #:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? unpack-path #:allow-other-keys)
             (when tests?
               (with-directory-excursion (string-append "src/" unpack-path)
                 (invoke "make" "test-go")))
             #t)))))
    (inputs
     `(("golang.org/x/sys" ,go-golang-org-x-sys)))
    (native-inputs
     `(("github.com/kylelemons/godebug" ,go-github-com-kylelemons-godebug)))
    (home-page "https://github.com/evanw/esbuild")
    (synopsis "Bundler and minifier tool for JavaScript and TypeScript")
    (description
     "The esbuild tool provides a unified bundler, transpiler and
minifier.  It packages up JavaScript and TypeScript code, along with JSON
and other data, for distribution on the web.")
    (license license:expat)))

(define-public go-golang-org-x-xerrors
  (let ((commit "5ec99f83aff198f5fbd629d6c8d8eb38a04218ca")
        (revision "0"))
    (package
      (name "go-golang-org-x-xerrors")
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
      (home-page "https://godoc.org/golang.org/x/xerrors")
      (license license:bsd-3))))

(define-public go-github-com-frankban-quicktest
  (package
    (name "go-github-com-frankban-quicktest")
    (version "1.11.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/frankban/quicktest")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0b1b44b2hli2p969gqz30z8v9z6ahlklpqzi17nwk1lsjz9yv938"))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/frankban/quicktest"))
    (propagated-inputs
     `(("go-github-com-google-go-cmp-cmp" ,go-github-com-google-go-cmp-cmp)
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
       (modules '((guix build utils)))
       (snippet
        '(begin
           (delete-file-recursively "libsass_src")
           #t))))
    (build-system go-build-system)
    (arguments
     '(#:import-path "github.com/bep/golibsass/libsass"
       #:unpack-path "github.com/bep/golibsass"
       ;; The dev build tag modifies the build to link to system libsass
       ;; instead of including the bundled one (which we remove.)
       ;; https://github.com/bep/golibsass/blob/v0.7.0/internal/libsass/a__cgo_dev.go
       #:build-flags '("-tags" "dev")
       #:phases
       (modify-phases %standard-phases
         (add-before 'build 'generate-bindings
           ;; Generate bindings for system libsass, replacing the
           ;; pre-generated bindings.
           (lambda* (#:key inputs unpack-path #:allow-other-keys)
             (mkdir-p (string-append "src/" unpack-path "/internal/libsass"))
             (let ((libsass-src (string-append (assoc-ref inputs "libsass-src") "/src")))
               (substitute* (string-append "src/" unpack-path "/gen/main.go")
                 (("filepath.Join\\(rootDir, \"libsass_src\", \"src\"\\)")
                  (string-append "\"" libsass-src "\""))
                 (("../../libsass_src/src/")
                  libsass-src)))
             (invoke "go" "generate" (string-append unpack-path "/gen"))
             #t))
         (replace 'check
           (lambda* (#:key tests? import-path #:allow-other-keys)
             (if tests?
                 (invoke "go" "test" import-path "-tags" "dev"))
             #t)))))
    (propagated-inputs
     `(("libsass" ,libsass)))
    (native-inputs
     `(("go-github-com-frankban-quicktest" ,go-github-com-frankban-quicktest)
       ("libsass-src" ,(package-source libsass))))
    (home-page "https://github.com/bep/golibsass")
    (synopsis "Easy to use Go bindings for LibSass")
    (description
     "This package provides SCSS compiler support for Go applications.")
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
    (version "1.35.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/aws/aws-sdk-go")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1ky5lw2s2zpslnnqcs6hgsrwvwbxwgflb5jwf16dd4aga3vrg10c"))))
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
