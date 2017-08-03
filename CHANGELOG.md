## 8.1.0-beta2
* Issue #2897770: Added Travis-ci Integration to have
                  automated functional testing.
* Issue #2899488: Applied the patch, which allow distribution to be installed
                  in other than profiles/varbase
* Issue #2899498: Vardoc 8.1.0-beta2 : Updated [CHANGELOG.md, UPDATE.md] files
                  and filtered the code for Drupal 8 Coding Standard

## 8.1.0-beta1
* Initial commit
* Added git ignore file
* Skipped select language step
* Removed unneeded varbase features like vmi and landing page
* Removed varbase_carousels and varbase_heroslider_media depencies
* Changed Profile description
* Added make files for the profile
* Added search API contrib module
* Changed assets path
* Removed home page feature config
* Added Vardoc theme
* Fixed theme info file extension
* Renamed some vardoctheme files
* Added vardoc_book and vardoc_search
* Have Theme settings (Vardoc as default theme)
* Made Vardoc book and Vardoc search default dependency
* Reconfigured vardoc book and search features
* Added book dependency to vardoc book
* Added Vardoctheme to the enabled themes
* Added Vardoc theme regions and blocks config
* Fixed glyphicons fonts path
* Added Top content region to Vardoctheme
* Changed theme config to include Top content region
* Added search placeholder
* Added Vardoc logos
* Stripped html tags from search result
* Fixed font icons include path
* Added google auth
* Added exposed filter title
* Changed User permissions.
* Amended search results title
* Added comments to book app
* Changed exposed filter title
* Added search_api and fontawesome to composer.
* Added the use of CDN version of FontAwesome.
* Added side menu for book.
* Have Only admins to create users
* Updated the theme
* Have Search visibility on home page only
* Updated Profile theme
* Have Book feature latest updates
* Updated home page variants
* Added No results behavior view book
* Updated vardoc theme
* Added menu item visibilty to composer
* Changed menu visibility version
* Added Vardoc demo with demo content
* Updated default content to alpha6
* Updated Vardoc with latest theme. Fix multilingual issue
* Changed demo content structure
* Added demo menu content
* Made default_content dependency for vardoc_home
* Fixed related articles
* Changed contact to bg image
* Fixed search button exposed filter margin
* Added FB link, change contact link
* Added facebook link demo content
* Changed recent articles weight sort
* UAT changes on book and theme
* Recreated Vardoc page to execlude yoast
* Removed varbase_page depency
* Removed dummy content and yoast
* Changed book content type title and add category simplexml config
* Removed search API from composer and update better normlizers
* Added the right list of make files
* Issue #2897904: Theme enhancements, import media content and add h1 format
* Issue #2898451: Vardoc Search is requiring Core "Search" module - while
                  it should only use Search API
* Issue #2897602: Have a working drupal.org project build as we had it for
                  the composer
* Issue #2898577: Amend the demo content
* Issue #2898543: Handle book module values in demo content
* Issue #2898443: Fix basic page Real-time SEO settings (YOAST)
* Issue #2898442: Add demo featured articles to featured articles entityqueue
* Issue #2897748: When installing via Simpletest, fatal error appeared.
* Issue #2897620: Have a TEMP solution for libraries as Drupal core will not
                  discover, libraries from the base parent profile at the
                  installation step
* Issue #2897617: Updated [Better Normalizers] module
                  form 8.1.0-beta2 to 8.1.0-beta3
* Issue #2897612: Updated the README.md file to have more info about Vardoc.