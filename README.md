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

### To access apis:
1. http://localhost:3000/books/index -> Create a REST API using RoR MVC and write a method to return a sorted list of these by
Publisher, Author (last, first), then title.
2. http://localhost:3000/books/soted_books -> Write another API method to return a sorted list by Author (last, first) then title.
3. http://localhost:3000/books/total-price -> Write an API method to return the total price of all books in the database.

### Citations
Above #1 and #2 apis will return both citations MLA style and chicago style also,
1. MLA style citation -> citation
2. Chicago Manual of Style -> chicago_style_citation

### If you have a large list of these in memory and want to save the entire list to the database, with only one call to the DB server.
Addee active record import in seed.rb to insert large data in one query to database
