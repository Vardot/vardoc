# 4.0.7

### Highlighted important changes since Vardoc 4.0.6:
* Issue [#3303762](http://drupal.org/i/3303762):
                Fixed moving the hook update for `node_type` to `entity_bundle:node`
                for Pathauto's patterns in the active configs to cover each
                 content type's module in addition to the Vardoc profile

---------------------------------------------------------------------------------


# 4.0.6

### Highlighted important changes since Vardoc 4.0.5:
* Issue [#3301892](http://drupal.org/i/3301892):
                 Changed `node_type` to `entity_bundle:node` for default
                 pathauto pattern configs for all Vardoc content types
* Issue [#3301908](http://drupal.org/i/3301908):
                 Fixed Drupal coding standards and Practices in `yml`, `PHP`,
                 and `CSS` code
* Issue [#3301450](http://drupal.org/i/3301450)
                 by [vacho](https://www.drupal.org/u/vacho)
                : Have `drupal-scaffold` locations `web-root` as `docroot`
                 to fix composer `web-root` folder in projects
* Issue [#3302440](http://drupal.org/i/3302440):
                 Dropped support for Composer `~1.0` in the Vardoc profile
                 and only support Composer `~2.0` and later versions

---------------------------------------------------------------------------------

# 4.0.5

### Highlighted important changes since Vardoc 4.0.4:
* Issue [#3290900](http://drupal.org/i/3290900):
                 Update the Allow profiles to define a base/parent
                 profile patch to work with Drupal 9.4.*
* Issue [#3256885](http://drupal.org/i/3256885):
                 Switched Vardoc default Automated Functional Testing users
                 creation to use drush user:create and drush user:role:add
                 and use the default manual testing user names and emails
* Issue [#3270492](http://drupal.org/i/3270492):
                 Have a default template for merge requests and
                 issues for the Vardoc profile project in Gitlab

---------------------------------------------------------------------------------

# 4.0.4

### Highlighted important changes since Vardoc 4.0.3:
* Issue [#3268512](http://drupal.org/i/3268512):
                 Updated Varbase profile to 9.0.5 and Drupal to 9.3.7

---------------------------------------------------------------------------------

# 4.0.3

### Highlighted important changes since Vardoc 4.0.2:

* Issue [#3258410](http://drupal.org/i/3258410):
                 Updated Varbase profile from ~8.8.0 to ~9.0.0 on
                 the Vardoc 4.0.x branch to work with Drupal ~9
* Issue [#3258797](http://drupal.org/i/3258797):
                 Updated the patch to Allow profiles to
                 define a base/parent profile to
                 1356276-667-subprofile-support-9.3.x.patch
                 to work with Drupal 9.3.x

---------------------------------------------------------------------------------

# 4.0.2

### Highlighted important changes since Vardoc 4.0.1:
* Issue [#3211942](http://drupal.org/i/3211942):
                 Allowed Vardoc to work with Composer ~2.0
* Issue [#3212481](http://drupal.org/i/3212481):
                 Switched to Varbase Social Single Sign-On module and removed the 
                Vardoc Google Authentication module
* Issue [#3256885](http://drupal.org/i/3256885):
                 Switched Vardoc default Automated Functional Testing users creation
                 to use drush user:create and drush user:role:add and use the default
                 manual testing user names and emails

### Added since Vardoc 4.0.1:
* Issue [#3256732](http://drupal.org/i/3256732):
                 Added composer allow-plugins to composer.json for
                 Vardoc and Vardoc Project template

### Changed since Vardoc 4.0.1:
* Issue [#3178726](http://drupal.org/i/3178726)
                 by Joachim Namyslo: Remove patch from display suite
                 issue 2975313 to no longer prevent updates
* Issue [#3211952](http://drupal.org/i/3211952):
                 Removed _core and uuid from all configs
* Issue [#3212940](http://drupal.org/i/3212940):
                 Switched to npm-asset/jquery-bar-rating from the custom 
                repository antennaio/jquery-bar-rating

### Updates since Vardoc 4.0.1:
* Issue [#3178725](http://drupal.org/i/3178725)
                 by Joachim Namyslo
                : Incremented font awesome to ~2.0

### Fixes since Vardoc 4.0.1:
* Issue [#3212070](http://drupal.org/i/3212070):
                 Fixed Vardoc Features modules structure of configs and info
* Issue [#3212067](http://drupal.org/i/3212067):
                 Fixed renamed the Tools custom Vardoc feature module machine
                 name to vardoc_tools ( Vardoc Tools )
* Issue [#3213025](http://drupal.org/i/3213025):
                 Fixed to Mark all updates by the update helper checklist
                 as successful on install
* Issue [#3214212](http://drupal.org/i/3214212):
                 Fixed JQuery SumoSelect Warning: constant(): Couldn't find constant CSS_PLUGINS in Library Discovery Parser

---------------------------------------------------------------------------------

# 4.0.1

* Issue [#3161518](http://drupal.org/node/3161518)
        by [Omar Alahmed](https://www.drupal.org/u/omar-alahmed)
        : Remove drush make files

---------------------------------------------------------------------------------

# 4.0.0

* Issue [#3161044](http://drupal.org/node/3161044):
         Updated Vardoc to the latest Varbase and Bootstrap 4 versions with
         extra functionality A new major release contains many features and
          updates include:
* Editorial workflow and content moderation gives the authenticated users
 the ability to add content contribution.
* A new simple, clean design, Bootstrap 4 with Argon UI kit, theme keeps
 the focus on your product and knowledge base.
* Professional backend user experience using Vartheme Calro theme.
* A new auto complete search with ready modern style.
* Collapsing book navigation tree displays the book pages in smart and organized way.
* A new content type called Tools to facilitate reaching your company
 tools and applications.
* Managing and displaying the book pages documents and attachments
 in very structured way.
* Ready printable book pages without the need to add any styling code.
* A new related book pages block to ease finding the content with similar topics.
* Enhance the user profile page structure and style.

---------------------------------------------------------------------------------

# 8.2.6

### Highlighted important changes since Vardoc 8.2.5:

* Issue [#3123308](http://drupal.org/node/3123308):
                  Updated [Varbase profile] from 8.8.3 to 8.8.4 ( ~8.8.0 )
* Issue [#3123307](http://drupal.org/node/3123307):
                  Drupal 9 readiness for [Vardoc distribution] installation
                  profile with Drupal coding standard and practice
* Issue [#3121627](http://drupal.org/node/3121627)
                  by Neslee Canil Pinto
                 : Replaced deprecated method file_scan_directory
* Issue [#3119880](http://drupal.org/node/3119880):
                  Vardoc 8.2.6 : Updated [CHANGELOG.md, README.md,
                  drupal-org.make] files and filtered the code for
                  Drupal 8 Coding Standard
* Issue [#3113175](http://drupal.org/node/3113175):
                  Drupal 9 Readiness for [Varbase FAQs] with Drupal
                  coding standard and practice
* Issue [#3102163](http://drupal.org/node/3102163)
                  by YousefAnbar
                 : Changed FAQ Cache tags based on node_list tag

--------------------------------------------------------------------------------

# 8.2.5

### Highlighted important changes since Vardoc 8.2.4:
* Issue [#3112296](http://drupal.org/node/3112296):
                  Updated [Varbase profile] from 8.8.2 to 8.8.3 ( ~8.8.0 )
* Issue [#3111150](http://drupal.org/node/3111150):
                  Updated [Varbase profile] from 8.8.1 to 8.8.2 ( ~8.8.0 )
* Issue [#3110702](http://drupal.org/node/3110702)
                  by [metalbote](https://www.drupal.org/u/metalbote)
                 : Changed web-root logic as drupal-root should
                  not be hard-coded in the composer Script handler
* Issue [#3111614](http://drupal.org/node/3111614):
                  Vardoc 8.2.5 : Update [CHANGELOG.md, README.md,
                  drupal-org.make] files and filter the code for Drupal
                  8 Coding Standard

--------------------------------------------------------------------------------

# 8.2.4

### Highlighted important changes since Vardoc 8.2.3:
* Issue [#3108911](http://drupal.org/node/3108911):
                  Updated [Varbase profile]
                  from 8.7.4 ( ~8.7.0 ) to 8.8.1 ( ~8.8.0 )

--------------------------------------------------------------------------------

# 8.2.3

### Highlighted important changes since Vardoc 8.2.2:
* Issue [#3012838](http://drupal.org/node/3012838):
                  Updated [Varbase profile] to 8.7.4
* Issue [#3107228](http://drupal.org/node/3107228):
                  Styled Vardoc Installation steps and copyrights for
                  stable releases
* Issue [#3091934](http://drupal.org/node/3091934):
                  Bumped up package.json potential security vulnerability
                  in dependencies
* Issue [#3108790](http://drupal.org/node/3108790):
                  Updated [Vardoc Theme] to use the latest Vartheme BS3 with
                  (Bootstrap 3 LESS) changes and Bootstrap 3.4.1

--------------------------------------------------------------------------------

# 8.2.2

### Highlighted important changes since Vardoc 8.2.1:
* Issue [#3012837](http://drupal.org/node/3012837):
                 Updated [Varbase core] from 8.5.3 to 8.5.4
* Issue [#3014560](http://drupal.org/node/3014560):
                 Updated [Votingapi Widgets] module
                 from 1.x-dev 4aa50d00 to ^1.0-alpha5

--------------------------------------------------------------------------------

# 8.2.1

### Highlighted important changes since Vardoc 8.2.0:
* Issue  [#3011288](http://drupal.org/node/3011288):
                   Updated [Varbase core] from 8.5.2 to 8.5.3
* Issue  [#3007665](http://drupal.org/node/3007665):
                   Updated [Varbase core] profile from 8.5.1 to 8.5.2 - But we
                   had some issues on the parent profile order of load, which
                   was fixed in Varbase 8.5.3
* Issue  [#3001840](http://drupal.org/node/3001840):
                   Updated [Varbase core] profile from 8.5.0 to 8.5.1 - But we
                   had some issues on the parent profile order of load, which
                   was fixed in Varbase 8.5.3
* Issue  [#3003280](http://drupal.org/node/3003280):
                   Changed [Vardoc] profile info.yml to project:module syntax
                   standard not to have a broken installation of sub profiles.
* Issue  [#3003280](http://drupal.org/node/3003280):
                   Fixed an issue with the Drupal.org packaged zip file when
                   we get Varbase by [Drush dl varbase-8][zip] required Modules
                   not found.
* Issue  [#3011262](http://drupal.org/node/3011262):
                   Updated [Voting API] module from 3.0-alpha7 to ^3.0-beta1

--------------------------------------------------------------------------------

# 8.2.0

### Highlighted important changes since Vardoc 8.1.x:
* Issue [#2987276](http://drupal.org/node/2987276):
                  Start a new branch for [Vardoc] version: 8.x-2.x-dev and
                  extra branch-alias with dev-8.x-2.x to 8.2.x-dev to use
                  Varbase 8.x-5.x and media in Drupal core.
* Issue [#3000061](http://drupal.org/node/3000061):
                  Update [Varbase core] from 8.5.0-alpha5 to 8.5.0 stable and
                  fixed the automated functional tests.
* Issue [#2991872](http://drupal.org/node/2991872)
              by [bhanuprakashnani](https://www.drupal.org/u/bhanuprakashnani),
              [thomasfowles](https://www.drupal.org/u/thomasfowles):
                  Fix non-https fonts in vardoc_theme.
* Issue [#2995492](http://drupal.org/node/2995492):
                  Remove [Vartheme Material Design] themes and related module.
