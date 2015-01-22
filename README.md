# ga-wdi-class7-hw
![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Week 2 Class 7 Jan 21 Wed: Rails: homework, Cars web app

## Objective
Follow the steps below to create a webapp containing 10 cars with random years between 1900-2014.


## Steps
* Install rails
  ``` $ gem install rails ```
* Start postgres
  ``` $ lunchy start postgres ```
* create the cars_app & change to the new cars_app directory
  ``` $ rails new cars_app --database=postgresql ```
  $ cd cars_app/ ```
* Open the project in Sublime
  ``` $ subl . ```
* Start postgres
  ``` $ pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start ```
* Start the rails server
  ``` $ rails server ```
  Note: if you browse to http://localhost:3000/cars at this point, you should expect to see an error referrring to the fact that there isn’t yet a database.
* stop the rails server: COMMAND + C
* Create the database with rake
  ``` $ rake db:create ```
* Restart the rails server:
  ``` $ rails server ```
  Note: if you browse to http://localhost:3000/cars you should expect see a Routing Error: No route matches [GET] “/cars"
$ edit the routes.db file, add the code:
     ``` get ‘cars’, to: ’cars#index' ```
* add a cars controller:
    - create a cars_controller.rb file in the controllers dir
    - add the class CarsController & the index method:
     ```
     class CarsController < ApplicationController
        #GET /cars
        #This is the index action. This will be invoked to view all the cars.
        def index
            end
        end
      ```

* Reload http://localhost:3000/cars in your browser
Note: you can expect to see a Template is missing error. OK - continue on ...
* create a cars folder in the app/views/ dir
  - in the cars dir, create the view in the cars dir:
     - index.html.erb
     - add some test text, like: ``` Hello! ```

* Reload http://localhost:3000/cars in your browser
Note: you should expect to see your test text on the web page: Hello!

* Populate the db with some cars
  - stop the rails server: COMMAND + C
  - create a rails migration for cars. make, model & year will be table fields in our database.
     ```rails generate migration CreateCars make model year:integer```
     (the default is string, so you can skip specifying string with make & model)
  - expected Terminal output:
      ``` invoke  active_record
      create    db/migrate/xxxxxxxxxxxxxxx_create_cars.rb ```
     - this creates a migrate dir in the db dir, containing the  …create_cars.rb file with the table & columns that will be created when you run the next command.

* Run rake migrations
  ``` $ rake db:migrate ```

* Note: you can skip this step for now:
     ``` $ psql —database cars_app_development ```

* Now create the model:
  - create a car.rb file in app/models/
     Note: car.rb is intentionally singular b/c it is a rails convention
  - add the following code:
     ```class Song < ActiveRecord::Base
     end ```

* now create some cars in the db
  - in the db/seeds.db file, add the following code so that random years of vehicles are created between the year 1900 and 2014 for 10 cars:
     ``` 1.upto(10) do |num|
       Car.create(make: "Make_#{num}", model: "Model_#{num}", year: rand(1900..2014))
     end ```

  - Run rake to populate the database with the resulting data from the seeds.db file
    ``` $ rake db:seed ```

* Update the controller
  - In cars_controller.rb remove your Hello! content add the following code:
       ``` def index
         @cars = Car.all #list all objects created from the class
       end ```

* Update the view
  - In index.html.erb in app/views/cars
```
<h2>Cars</h2>
  <table border = 1>
   <% @cars.each do |cars| %>
    <tr>
      <td><%= cars.make %></td>
      <td><%= cars.model %></td>
      <td><%= cars.year %></td>
    </tr>
    <% end %>
</table>
```

* Start the rails server
  ``` $ rails server ```

* Reload http://localhost:3000/cars in your browser
Note: you should expect to see the 10 cars displayed on the web page
