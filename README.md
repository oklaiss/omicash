== README

### System Setup

* Ruby version: This application was developed with Ruby 2.1.1 and is only guaranteed to function correctly with that version of Ruby. 

* You must have Ruby and Rails installed locally to run this application. See this resource for assistance [link](http://installrails.com/)

* You must also have PostgreSQL installed for database functionality. See here for Mac [link](http://postgresapp.com/) and here for PC [link](http://www.postgresql.org/download/windows/)

* Once these dependencies are installed, you will need create the development database on your local PostgreSQL server. Follow the directions from the source you used to download PostgreSQL to open a PG console, and enter the command **`CREATE_DATABASE omicash_development;`**

### Dependency Installation

* The following code will downoad OmiCash, install the depencies (Ruby Gems) and update your database with the Omicash DB structure.

```
cd /tmp
git clone https://github.com/m3thod/omicash.git
cd omicash
bundle install
bundle exec rake db:migrate
```

### Services

* You will need to set up the job queue so that OmiCash will send notifications on a preset basis. To do this, navigate to the root directory of the app `/omicash` and run the command **`whenever --update-crontab`**. This will update the cronfile with the OmiCash scheduler from `/config/schedule.rb`.

* You should see the printout `[write] crontab file updated`. You can check the status of your cronfile by typing the command `crontab -l`.

### Running the Application

* To run OmiCash locally, start the Rails Server by navigating to the root directory of the application and running the command **`rails server`**. This will start a local Rails server.

* Direct your browser to `localhost:3000` and you should see the OmiCash home page. From here you can create an account and begin sending notifications. 

