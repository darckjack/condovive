# README

This is the project of the condovive test.

To run it you have to clone the repo:

```
$ git clone https://github.com/darckjack/condovive.git
```

Enter it, edit the database information and run the following:

```
$ bundle install

$ bin/rake db:create

$ bin/rake db:migrate

$ bin/rails db:seed

$ bin/rails server
```

The credentials for login are:
    
    email: admin@admin.com
    password: secret