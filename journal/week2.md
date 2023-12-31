# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

## Bundler

Bundler is a package manager for ruby
It is the primary way to install ruby packages (known as gems) for ruby

### Install Gems

Need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Need to run the 'bundle install' command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be create to lock down the gem versions used in this project.

### Executing ruby scripts in the context of bundler

Use `bundle exec` to tell future ruby scripts to use the gems installed. This is the way to set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

It's great for mock or development servers or for very simple projects

You can create a web-server ina single file

https://sinatrarb.com/

## Terratowns Mock Server

### Running the web server

Run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for the server is stored in the `server.rb` file.

## CRUD

Terraform Provider resources utilize CRUD

CRUD stands for Create, Read Update, and Delete
