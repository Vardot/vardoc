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

projects[votingapi][type] = module
projects[votingapi][version] = 3.0-alpha2

projects[votingapi_widgets][type] = module
projects[votingapi_widgets][download][url] = https://git.drupal.org/project/votingapi_widgets.git
projects[votingapi_widgets][download][revision] = 97133ddc9798a912eababe63e1a86deff3e5d9c9
projects[votingapi_widgets][download][branch] = 1.x-dev
;; Issue #2905948: Strict Warning for $stringTranslation.
projects[votingapi_widgets][patch][] = https://www.drupal.org/files/issues/strict-warning-stringtranslation-2905948-2.patch

projects[flag][type] = module
projects[flag][version] = 4.0-alpha2

projects[sharethis][type] = module
projects[sharethis][version] = 2.0-beta3

projects[varbase][type] = profile
projects[varbase][subdir] = ""
projects[varbase][version] = "4.14"

projects[faq][type] = module
projects[faq][download][url] = https://git.drupal.org/project/faq.git
projects[faq][download][revision] = 2bdc0f0fd3fa1941bf7d3579a498e6f40ca9c69a
projects[faq][download][branch] = 1.x-dev
;; Issue #2932028: Unable to place FAQ Categories block.
projects[faq][patch][] = https://www.drupal.org/files/issues/unable-to-add-faq-block-2932028-8.patch

projects[varbase_faqs][type] = module
projects[varbase_faqs][download][url] = git://git.drupal.org/project/varbase_faqs.git
projects[varbase_faqs][download][branch] = 4.x-dev

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
