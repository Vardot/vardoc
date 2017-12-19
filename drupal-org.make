core = 8.x
api = 2

defaults[projects][subdir] = contrib

;;;;;;;;;;;;;;;;;;;;;
;; Contrib modules
;;;;;;;;;;;;;;;;;;;;;

projects[social_api][type] = module
projects[social_api][version] = 1.1

projects[social_auth][type] = module
projects[social_auth][version] = 1.0

projects[social_auth_google][type] = module
projects[social_auth_google][version] = 1.0

projects[fontawesome][type] = module
projects[fontawesome][version] = 1.3

projects[better_normalizers][type] = module
projects[better_normalizers][version] = 1.0-beta3

projects[menu_item_visibility][type] = module
projects[menu_item_visibility][download][url] = https://git.drupal.org/project/menu_item_visibility.git
projects[menu_item_visibility][download][revision] = 7806c36b68bdc1ac3582e3a034b94126cd3d1d32
projects[menu_item_visibility][download][branch] = 1.x-dev

projects[varbase][type] = profile
projects[varbase][subdir] = ""
projects[varbase][version] = "4.13"
projects[varbase][patch][] = https://www.drupal.org/files/issues/2931502-7.patch

projects[login_destination][type] = module
projects[login_destination][download][url] = https://git.drupal.org/project/login_destination.git
projects[login_destination][download][revision] = 944d78fbf01853244d8e01f63b41dc37d5f99e50
projects[login_destination][download][branch] = 8.x-1.x
;; Issue #2931356: Fixes Route Error.
projects[login_destination][patch][] = https://www.drupal.org/files/issues/2931356-5.patch

projects[search_api][type] = module
projects[search_api][version] = 1.5
;; Issue #2931562: Fixed the Notice: Undefined index: total When we enable the module in the installation step.
projects[search_api][patch][] = https://www.drupal.org/files/issues/2931562-3.patch

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
