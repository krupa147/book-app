# README

### Prequisites:
* Ruby Version  2.6.2
* Postgres 14

### Setting up

#### Bundle
Install gems with
```bash
bundle
```

#### Configuration
Copy the content of `config/database-sample.yml` and add it to `config/database.yml`. Update username and password with your postgres username and password in `config/database.yml`.

Add master.key file to `config/master.key`. Ask repository author for master.key
#### Database Creation & Migration
Run below command to create the database,
```azure
rails db:create 
```

Run below command to migrate the database,
```azure
rails db:migrate
```

Seed the database with below command,
```azure
rails db:seed
```

### How to run on localhost

Use below command to run rails server
```azure
rails s
```

