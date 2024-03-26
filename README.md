# Grant's Hockey Manager

Hello! Welcome to my hockey manager web application. This is a very simple web application that allows you to search through different hockey teams and their players, add to them, or delete them - whatever you want to do! It's practically the wild west out here.

## Requirements

Make sure you have the correct requirements below:

- `Ruby 3.2.2`

Check your current ruby version in the terminal with the command `ruby -v`

- `Rails 7.1.3.2`

Check your current rails version in the terminal with the command `rails -v`

## Database Design / Schema

[Link to DB Designer Hockey Manager Schema](https://erd.dbdesigner.net/designer/schema/1710787738-mod-2-p1-schema)

My database consists of two tables - one for teams, and one for players - that are linked together. 

- The teams table includes the name of the team, the number of season wins (as of 3/26/24), and if the team is eligible for the 2024 playoffs.

- The players table includes the name of the player, the player's jersey number, as well as if the player has won a Stanley Cup at any point in their career.

## Instructions

### 1. Fork and Clone the Repository:

After forking:

```
$ git clone [paste SSH code]
$ git remote -v
```

### 2. Navigate into the Repository

Install gems and create a new database with seed data.

```
$ cd hockey_manager

$ bundle install
$ rails db:{drop,create,migrate,seed}
```

### 3. Run the Rails Server

```
$ rails server
```

### 4. Run the Test Suite

```
$ bundle exec rspec spec/models
$ bundle exec rspec spec/features

$ bundle exec rspec spec
```

### 5. Mess Around!

Have fun messing with teams and players, creating some and deleting others - enjoy! 

If you ever want to reset the information in the database, quit the server using `ctrl + c` and run:

```
$ rails db:{drop,create,migrate,seed}
```