api = 2
core = 8.x
includes[] = drupal-org-core.make

projects[varbase][type] = profile
projects[varbase][download][type] = git
projects[varbase][download][branch] = 8.x-4.x

projects[vardoc][type] = "profile"
projects[vardoc][download][type] = "copy"
projects[vardoc][download][url] = "/var/www/html/vardoc"

includes[] = drupal-org.make
