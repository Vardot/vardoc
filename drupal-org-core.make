api = 2
core = 8.x

; Drupal Core
projects[drupal][type] = "core"
projects[drupal][version] = "8.8.2"
;; Issue #2869592: Disabled update module shouldn't produce a status report warning
projects[drupal][patch][] = https://www.drupal.org/files/issues/2869592-remove-update-warning-7.patch
;; Issue #2815221: Add quickedit to the latest-revision route
projects[drupal][patch][] = https://www.drupal.org/files/issues/2019-11-27/2815221-125.patch
;; Issue #1356276: Allow profiles to define a base/parent profile and load them in the correct order
projects[drupal][patch][] = https://www.drupal.org/files/issues/2019-11-05/1356276-531-8.8.x-4.patch
;; Issue #2914389: Allow profiles to exclude dependencies of their parent
projects[drupal][patch][] = https://www.drupal.org/files/issues/2018-07-09/2914389-8-do-not-test.patch
;; Issue #2893892: Fixed Warning Invalid argument supplied for foreach() in Drupal
projects[drupal][patch][] = https://www.drupal.org/files/issues/2018-12-10/core--getDerivatives-Invalid-argument-foreach--2893892-11-d8.patch
;; Issue #3044656: Add a helper method to strip subdirectories from URL paths
projects[drupal][patch][] = https://www.drupal.org/files/issues/2019-03-31/3044656-2.patch
;; Issue #2646744: Drupal Core Url does not accept root-relative (file) URLs, making it impossible to let LinkGenerator create root-relative file URL links
projects[drupal][patch][] = https://www.drupal.org/files/issues/2018-12-15/2646744-34.patch
;; Issue #3101231: Fix multilingual site's layout edit context issue with TypeError: Argument 1 passed to UrlHelper::buildQuery() must be of the type array, null given
projects[drupal][patch][] = https://www.drupal.org/files/issues/2019-12-19/3101231-19.patch
;; Issue #2996114: Fix Argument 2 passed to Drupal jsonapi Routing closure must be an instance of ResourceType, NULL given
projects[drupal][patch][] = https://www.drupal.org/files/issues/2019-12-03/2996114-99.patch
