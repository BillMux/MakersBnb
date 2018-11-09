# MakersBnB

This is an AirBnB clone made by William, Muge, Ryan, Alfie

This app can allow the user to create accounts, log in and out. A user can list spaces and check lists of available spaces. They can use a js calendar to select available dates and thus book their trip. They have a list of upcoming trips on their profile as well as any spaces they have up for rental.

## Setup

Fork this repo

Run ```bundle```

Setup two postgres Databases called ```MakersBnBDatabase_test``` and ```MakersBnBDatabase```

Run the server ```ruby app.rb``` in the terminal

Log onto ```localhost:4567/``` to get started!

## User Stories
`````
As a user
So I can be a host or a guest
I would like to be able to sign up

As a user
So I can utilize the site
I would like to log in

As a host
So that I can rent my property
I would like to be able to list my place

As a guest
So that I can rent a property
I would like to see a list of available properties

As a guest
So that I can hire a place
I can request to stay at listed property

As a host
So that I attract guests to my property
I would like to add a description of my listing

As a host
So I can rent multiple properties
I would like to be able to list multiple properties

As a host
So that I can keep track of who’s staying at my property
I would like to offer a range of dates of availability

As a guest
So that I do not select an already booked property
I would like the site to not allow me to book
`````

## Tech

- Ruby backend
  - DataMapper
  - Sinatra
- JS frontend
  - JQuery
- Testing
  - RSpec
  - Capybara
  - SimpleCov

## Devs
- Bill Muxworthy - https://github.com/BillMux
- Ryan Clark - https://github.com/RyanWolfen7
- Alfie Freeman - https://github.com/runticle
- Muge Haslici - https://github.com/MugeHasilci
