core = 8.x
api = 2

defaults[projects][subdir] = contrib

;;;;;;;;;;;;;;;;;;;;;
;; Contrib modules
;;;;;;;;;;;;;;;;;;;;;

projects[social_api][type] = module
projects[social_api][version] = 1.0-beta2

projects[social_auth][type] = module
projects[social_auth][version] = 1.0-beta4

projects[social_auth_google][type] = module
projects[social_auth_google][version] = 1.0-beta2

projects[fontawesome][type] = module
projects[fontawesome][version] = 1.2

projects[default_content][type] = module
projects[default_content][version] = 1.0-alpha6

projects[better_normalizers][type] = module
projects[better_normalizers][version] = 1.0-beta3

projects[menu_item_visibility][type] = module
projects[menu_item_visibility][version] = 1.x-dev

projects[varbase][type] = profile
projects[varbase][destination] = ../../profiles
projects[varbase][version] = "4.05"

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
libraries[slick][download][url] = "https://github.com/kenwheeler/slick/archive/1.6.0.tar.gz"
libraries[slick][destination] = "libraries"

libraries[ace][directory_name] = "ace"
libraries[ace][download][type] = "get"
libraries[ace][download][url] = "http://github.com/ajaxorg/ace-builds/archive/v1.2.6.tar.gz"
libraries[ace][destination] = "libraries"
