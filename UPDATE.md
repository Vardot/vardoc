# Vardoc Update
General instructions on how to update Vardoc

# 1 - Read the release notes to know what had been changed.

For each stable release we will have some notes, and extra steps,
developers need to do to update the last release to the new release.


#  For Example:
* https://www.drupal.org/project/vardoc/releases/8.x-2.2
* https://www.drupal.org/project/vardoc/releases/8.x-2.1
* https://www.drupal.org/project/vardoc/releases/8.x-2.0

# 2 - Backups

* Backup your project database.
* Backup your project files.
* Test restore your backups, on a test restore site.

# 3 - Get the packaged files for the new version of Vardoc 8.2.x

* From Drupal website: https://www.drupal.org/project/vardoc
* With the composer using vardoc-project: https://packagist.org/packages/vardot/vardoc-project

# 4 - From your terminal, change directory to the root directory of your
#     project to do the update:

# For Example:

```
Given that you do have a project at the /var/www/html/projects/mysite folder
  And we do have our custom themes, features, custom modules in
   /var/www/html/projects/mysite/themes/custom/
   /var/www/html/projects/mysite/modules/custom/
   /var/www/html/projects/mysite/sites/default
so on ...
like contributed modules which we had theme added
while working on the project.

  And we opened a terminal console window
  And we changed directory to our project folder
  cd /var/www/html/projects/mysite in Linux

  When we delete all files and folders, except our changes on Vardoc.
  Then we will be left with only custom changes

  When we copy all Vardoc files
  And we make sure that we do not have any overridden files or folders
     only delete old ones and copy new folder of modules to the same place
```

# 5 - Set the right file permissions.
# 6 - Update composer packages. use "composer outdated"
# $ composer update

  Make sure that you do have modules in the right place.

# 7 - Import Vardoc Core Features and Bundles:

```
 Given that you are logged in with the "webmaster" user
   And the "Features" module is enabled
   And the "Features UI" module is enabled
  When you go to "admin/config/development/features"
  Then you should not see any changed features in the Vardoc core bundle.
  When you click on all "Changed"
  Then you will be able to see all changes
   And you will be able to import new changes if you need them
```

# 8 - Do your Drupal 8 database updates

* By the terminal "drush updb".
* By the web browser by going to "yousite.domain/update.php"

# 9 - Regression test the full site.

* Done :\)

--------------------------------------------------------------------------------

# Updating Vardoc 8.2.1 to Vardoc 8.2.2

## Step #1 Option #1 Vardoc 8.2.1 to Vardoc 8.2.2
## Copy and Paste 

* For example let us have mysite vardoc folder at:
  "/var/www/html/projects/mysite"

* Use the terminal command to change directory to:
```
 $ cd /var/www/html/projects/mysite
```

* Delete all old Drupal core folders and files
```
 $ rm -rf docroot/modules/contrib
 $ rm -rf docroot/themes/contrib
 $ rm -rf docroot/libraries
 $ rm -rf docroot/profiles/varbase
 $ rm -rf docroot/profiles/vardoc
```
* Copy all new Vardoc files and folders over the old one, you could do this
  from the GUI.
* Be sure that you have deleted all not customized files and folders.
* Be sure that you have all custom module or themes still site.
* Be sure that all new used modules and features are present.
* Change permissions and owner ship for all files and folders to work with
  Drupal standard.
```
sudo chmod 775 -R .;
sudo chown www-data:$USER -R .;
```
* At this point you will be ready to update the active config and database,
  which you can follow in [Step #2](#step-2-vardoc-820-to-vardoc-821).

## Step #1 Option #2 Vardoc 8.2.1 to Vardoc 8.2.2
## Composer Update
    The composer way of Vardoc's procedures to update the base code.
    only if you had build the vardoc site with the
    [vardoc-project](https://github.com/Vardot/vardoc-project/tree/8.x-2.x)
    template.

* For example let us have mysite vardoc folder at:
  "/var/www/html/projects/mysite"

* Use the terminal command to change directory to:
```
 $ cd /var/www/html/projects/mysite
```
* Be sure that the current "vardoc-project" composer.json file and files are
  the latest

* Delete old composer lock and the vendor folder
```
 $ rm composer.lock
 $ rm -rf vender
 $ rm -rf docroot/modules/contrib
 $ rm -rf docroot/themes/contrib
 $ rm -rf docroot/libraries
 $ rm -rf docroot/profiles/varbase
 $ rm -rf docroot/profiles/vardoc
```
* Remove the following from your Vardoc composer.json project file.
```
"drupal/votingapi_widgets": "1.x-dev#4aa50d00ad3928cd90eb1f922956b9f46ab18f2c",
```
as we started to use
```
 "drupal/votingapi_widgets": "^1.0-alpha5",
```
* Run the "composer require vardot/vardoc:8.2.2" command
```
composer require vardot/vardoc:8.2.2
```
* Wait for composer to finish work
* Be sure not see any issues in the terminal
* At the end of composer work make sure that you can see
  "Writing lock file" and "Generating autoload files" in the terminal
* if the composer finishes work with no errors
* Change permissions and owner ship for all files and folders to work with
  Drupal standard.
```
sudo chmod 775 -R .;
sudo chown www-data:$USER -R .;
```
* At this point you will be ready to update the active config and database,
  which you can follow in [Step #2](#step-2-vardoc-820-to-vardoc-821).

## Step #2 Vardoc 8.2.0 to Vardoc 8.2.1
## Update the active config and database

* For example let us have mysite vardoc folder at:
  "/var/www/html/projects/mysite"
* Make sure that all files are updated using (copy and past) or
  (composer require/update).
* Use the terminal command to change directory to:
```
 $ cd /var/www/html/projects/mysite/docroot
```
* Run the update by going to "/update.php" from the web browser.
* You will see the steps of updates to follow with next steps.
* In your web browser go to "/admin/config/development/features"
* Check all "Changed" features, or you could use the normal config sync
* Follow with each feature to import new changes if you need them.
* Do a regression testing for the site and functional testing to make sure
  that you do not have any change of behaviours in the site.
* At this point you will have the Vardoc site updated to the latest version.

--------------------------------------------------------------------------------

# Updating Vardoc 8.2.0 to Vardoc 8.2.1

## Step #1 Option #1 Vardoc 8.2.0 to Vardoc 8.2.1
## Copy and Paste 

* For example let us have mysite vardoc folder at:
  "/var/www/html/projects/mysite"

* Use the terminal command to change directory to:
```
 $ cd /var/www/html/projects/mysite
```

* Delete all old Drupal core folders and files
```
 $ rm -rf docroot/modules/contrib
 $ rm -rf docroot/themes/contrib
 $ rm -rf docroot/libraries
 $ rm -rf docroot/profiles/varbase
 $ rm -rf docroot/profiles/vardoc
 $ rm -rf docroot/core
```
* Copy all new Vardoc files and folders over the old one, you could do this
  from the GUI.
* Be sure that you have deleted all not customized files and folders.
* Be sure that you have all custom module or themes still site.
* Be sure that all new used modules and features are present.
* Change permissions and owner ship for all files and folders to work with
  Drupal standard.
```
sudo chmod 775 -R .;
sudo chown www-data:$USER -R .;
```
* At this point you will be ready to update the active config and database,
  which you can follow in [Step #2](#step-2-vardoc-820-to-vardoc-821).

## Step #1 Option #2 Vardoc 8.2.0 to Vardoc 8.2.1
## Composer Update
    The composer way of Vardoc's procedures to update the base code.
    only if you had build the vardoc site with the
    [vardoc-project](https://github.com/Vardot/vardoc-project/tree/8.x-2.x)
    template.

* For example let us have mysite vardoc folder at:
  "/var/www/html/projects/mysite"

* Use the terminal command to change directory to:
```
 $ cd /var/www/html/projects/mysite
```
* Be sure that the current "vardoc-project" composer.json file and files are
  the latest

* Delete old composer lock and the vendor folder
```
 $ rm composer.lock
 $ rm -rf vender
 $ rm -rf docroot/modules/contrib
 $ rm -rf docroot/themes/contrib
 $ rm -rf docroot/libraries
 $ rm -rf docroot/profiles/varbase
 $ rm -rf docroot/profiles/vardoc
 $ rm -rf docroot/core
```
* Run the "composer require vardot/vardoc:8.2.1" command
```
composer require vardot/vardoc:8.2.1
```
* Wait for composer to finish work
* Be sure not see any issues in the terminal
* At the end of composer work make sure that you can see
  "Writing lock file" and "Generating autoload files" in the terminal
* if the composer finishes work with no errors
* Change permissions and owner ship for all files and folders to work with
  Drupal standard.
```
sudo chmod 775 -R .;
sudo chown www-data:$USER -R .;
```
* At this point you will be ready to update the active config and database,
  which you can follow in [Step #2](#step-2-vardoc-820-to-vardoc-821).

## Step #2 Vardoc 8.2.0 to Vardoc 8.2.1
## Update the active config and database

* For example let us have mysite vardoc folder at:
  "/var/www/html/projects/mysite"
* Make sure that all files are updated using (copy and past) or
  (composer require/update).
* Use the terminal command to change directory to:
```
 $ cd /var/www/html/projects/mysite/docroot
```
* Run the update by going to "/update.php" from the web browser.
* You will see the steps of updates to follow with next steps.
* In your web browser go to "/admin/config/development/features"
* Check all "Changed" features, or you could use the normal config sync
* Follow with each feature to import new changes if you need them.
* Do a regression testing for the site and functional testing to make sure
  that you do not have any change of behaviours in the site.
* At this point you will have the Vardoc site updated to the latest version.


--------------------------------------------------------------------------------
# No upgrade path to update Vardoc 8.x-1.x to 8.x-2.x yet
You will need to manage a migration, or a hard update process.