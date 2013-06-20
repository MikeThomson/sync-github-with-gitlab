# Sync Github Account with Gitlab Group

I needed the ability to automatically sync projects created in my personal group on a private gitlab install with my public github account. This is a quick and dirty bash script and some brief notes on how to set it up again.

## Requirements

* inotify & incrontab - http://inotify.aiken.cz/
* jsawk - https://github.com/micha/jsawk

## Instructions

* Put the shell script somewhere on your server
* Add your github information to the config file
* Add your gitlab servers SSH key to github.
* Edit your incron user table by putting in 'incrontab -e' in the cli. Eg. /path/to/repository/folder IN_CREATE /path/to/sync-github-with-gitlab.sh $@$#