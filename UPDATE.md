Visit https://docs.varbase.vardot.com/updating-varbase for an up-to-date and
 further detailed documentation process.

# Updating a Varbase Site

## Before You Update

Updating Varbase is best done through Composer. We will assume that you have
 [installed Varbase the recommended way](../getting-started/installing-varbase.md) through the Composer-based project template [varbase-project](https://github.com/Vardot/varbase-project) by running the command: `composer create-project Vardot/varbase-project:^8.6 YOUR_PROJECT --no-dev --no-interaction`

This will create the Varbase project directory that will look like this:
 `/path/to/YOUR_PROJECT` with the Drupal 8 codebase installed via Varbase
 installation profile in `/path/to/YOUR_PROJECT/docroot`.


## The Update Process

There are two main update processes we will cover. 1\) Automated process
 using a tool we've developed to ease the update process for Varbase called
 [varbase-updater](https://github.com/Vardot/varbase-updater). 2\) Manual
 process if you wish to take matters into your own hands.

### OPTION 1: Automated Process — Using Varbase Updater

If you previously used our Composer-based project template to install
 Varbase [varbase-project](https://github.com/Vardot/varbase-project), 
complete the following steps to update your codebase’s installed version
 of Varbase:

1. From a command prompt window, navigate to your project:
 `cd /path/to/YOUR_PROJECT`  
2. If you're using Varbase 8.6.2 or older, install
 [varbase-updater](https://github.com/Vardot/varbase-updater) through
 Composer. `composer require vardot/varbase-updater`   
 If you're using Varbase 8.6.3 or newer, skip this step;
 [varbase-updater](https://github.com/Vardot/varbase-updater)
 comes pre-installed with your Varbase project. 
3. Run the Varbase update tool. `./bin/update-varbase.sh`  
4. Follow the wizard. 

   _Curious?_ [_Learn more_ ](understanding-varbase-updater-package.md)_about what's going on in the Varbase Updater wizard._

5. Buy yourself a drink! You're done. 
6. After the update finishes and you get a success message, navigate to
 _http://my.varbase-site.local/admin/config/development/update-helper_
 \(where my.varbase-site.local is the URL for your website\) to learn about
 the new changes and updates introduced in your Varbase site.


At the end of the update process, two log files are useful to troubleshoot
 your update:

* `varbase_update_error.log`: a log of all errors that occurred during the
 update process.
* `varbase_failed_patches.log`: a log of all patches that failed to apply
 during the update process.



### OPTION 2: Manual Process — Do it Yourself

1. From a command prompt window, navigate to your project:
  `cd /path/to/YOUR_PROJECT`  
2. Edit your _composer.json_ file to be ready for updates. You have two choices.
   1. **The hard way:** Edit your _composer.json_ to include
 all the new updates made in
 [varbase-project](https://github.com/Vardot/varbase-project/blob/8.7.x/composer.json).
 This includes the new components required and its versions
 _"require"_, _"repositories"_, _"extra"_, and any other important config.
 You can use a diff tool such as [Meld](http://meldmerge.org/) or
 [DiffMerge](https://sourcegear.com/diffmerge/) to help you diff between
 your old _composer.json_ and the new one from
 [varbase-project](https://github.com/Vardot/varbase-project/blob/8.7.x/composer.json). 
   2. **The easy way:** 
      1. If you're using Varbase 8.6.2 or older, install
 [varbase-updater](https://github.com/Vardot/varbase-updater) through Composer.
 `composer require vardot/varbase-updater`  
 If you're using Varbase 8.6.3 or newer, skip this step;
 [varbase-updater](https://github.com/Vardot/varbase-updater)
 comes pre-installed with your Varbase project. 
      2. Then run:
 `composer varbase-refactor-composer composer.new.json docroot`
  where _docroot_ is your Drupal project codebase. 
      3. Move your new Composer file _composer.new.json_ in place of
 the old one. `mv composer.json composer.json.b; \ mv composer.new.json composer.json` 
3. Back up your code and database 
4. Execute Composer update to download updates to modules and libraries.
 `composer update`  
5. Run your database updates. `drush updatedb`  or by navigating
 to _http://my.varbase-site.local/update.php_ 
\(where _my.varbase-site.local_ is the URL for your website\) and
 follow the on-screen instructions. 
6. After the update finishes and you get a success message, navigate
 to _http://my.varbase-site.local/admin/config/development/update-helper_ 
\(where _my.varbase-site.local_ is the URL for your website\) to learn
 about the new changes and updates introduced in your Varbase site.
