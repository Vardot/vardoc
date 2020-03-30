core = 8.x
api = 2

defaults[projects][subdir] = contrib

;;;;;;;;;;;;;;;;;;;;;
;; Contrib modules
;;;;;;;;;;;;;;;;;;;;;

projects[fontawesome][type] = module
projects[fontawesome][version] = 1.4

projects[menu_item_visibility][type] = module
projects[menu_item_visibility][version] = 1.x-dev

projects[votingapi][type] = module
projects[votingapi][version] = 3.0-beta1

projects[votingapi_widgets][type] = module
projects[votingapi_widgets][version] = 1.0-alpha5

projects[flag][type] = module
projects[flag][version] = 4.0-beta1

projects[sharethis][type] = module
projects[sharethis][version] = 2.0-beta3

projects[faq][type] = module
projects[faq][version] = 1.0-alpha1

projects[varbase_faqs][type] = module
projects[varbase_faqs][version] = 6.6

projects[varbase][type] = profile
projects[varbase][subdir] = ""
projects[varbase][version] = "8.4"

;;;;;;;;;;;;;;;;;;;;;
;; Libraries
;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; #TEMP solution for libraries as Drupal core will not discover
;; libraries from the base parent profile at the installation step.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

libraries[dropzone][download][type] = get
libraries[dropzone][download][url] = "https://github.com/enyo/dropzone/archive/v4.3.0.tar.gz"
libraries[dropzone][destination] = "libraries"

libraries[blazy][download][type] = get
libraries[blazy][download][url] = "https://github.com/dinbror/blazy/archive/1.8.2.tar.gz"
libraries[blazy][destination] = "libraries"

libraries[slick][download][type] = get
libraries[slick][download][url] = "https://github.com/kenwheeler/slick/archive/v1.8.1.tar.gz"
libraries[slick][destination] = "libraries"

libraries[ace][directory_name] = "ace"
libraries[ace][download][type] = "get"
libraries[ace][download][url] = "http://github.com/ajaxorg/ace-builds/archive/v1.4.4.tar.gz"
libraries[ace][destination] = "libraries"

libraries[jquery-bar-rating][download][type] = "get"
libraries[jquery-bar-rating][download][url] = "https://github.com/antennaio/jquery-bar-rating/archive/v1.2.2.tar.gz"
libraries[jquery-bar-rating][destination] = "libraries"
