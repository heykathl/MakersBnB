# MakersBnB

## Installation
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

## How to Use
1. Run the command `rackup` 
2. Open an browser with `localhost:` with the 4-digit host number

## User Stories
```
As a user, 
So that I can list my space, 
I would like register an account (LANDLORD)
```
```
As a registered user, 
So that I can rent out my space, 
I would like to list it on the website (LANDLORD)
```
```
As a registered user, 
So I can manage my portfolio, 
I would like to be able to list multiple spaces (LANDLORD)
```
```
As a registered user, 
So that I can provide details about my space I would like to name my space, 
Provide a short description and price per night (LANDLORD)
```
```
As a registered user, 
So that tenants can book my space, 
I need to display the available dates of my space (LANDLORD)
```
```
As registered user, 
So that I can book a space for one night, 
I need the landlord to see my booking request (LANDLORD/TENANT)
```
```
As a registered user, 
So that a tenant can book my space, 
I would like to review the booking request (LANDLORD)
```
```
As a registered user, 
To avoid my space being double booked, 
I would like the availability of my space to be updated when it's booked (LANDLORD)
```
```
As a registered user, 
When a booking is confirmed, 
I need my space to become unavailable to other users (TENANT)
```
## MVP
  - registration
  - new spaces
  - list spaces
  - request spaces
  - confirm spaces

## Tests
There are a series of tests which can be run with the following (from the directory):
```
rspec
```
To run tests from specific class files, this can be done by:
```
rspec spec/<filename>.rb
```

## Approach to the challenge
#### Monday 21st March
1. Domain modelled our controller and discussed routes and view pages

  ![Screenshot 2022-03-22 at 12 31 37](https://user-images.githubusercontent.com/74867241/159483336-718e1ed8-30e8-4f57-9a60-a63def1b940b.png)

2. Allocated the following tasks:
* Controller and databases - Kenny and Jasmine
* User class in the model to registration - Anusha
* Rendering view files and research on implementing calendars - Harry and Kathleen

#### Tuesday 22nd March
3. Domain modelled our model(logic) and discussed databases

  ![Screenshot 2022-03-22 at 12 40 34](https://user-images.githubusercontent.com/74867241/159484130-ad903d6d-eb36-4bd0-af4e-f54f5ba8f248.png)
  
  ![Screenshot 2022-03-22 at 12 47 01](https://user-images.githubusercontent.com/74867241/159485263-694667c1-40c7-4442-8c24-059f45102754.png)

4. Completed basic view pages
* Homepage

  <img width="495" alt="Screenshot 2022-03-22 at 12 37 09" src="https://user-images.githubusercontent.com/74867241/159483789-bb32eae0-a92d-48f3-8162-bd13330721f6.png">

* Login page
  
  <img width="458" alt="Screenshot 2022-03-22 at 12 38 32" src="https://user-images.githubusercontent.com/74867241/159483820-a8e8b3c0-b6a4-4627-bc29-bca9bc93d649.png">

* View all available spaces
  
  <img width="476" alt="Screenshot 2022-03-22 at 12 37 54" src="https://user-images.githubusercontent.com/74867241/159483844-a1924f8c-e816-4923-ad17-6230b99d2869.png">

* List a new space
  
  <img width="675" alt="Screenshot 2022-03-22 at 12 38 03" src="https://user-images.githubusercontent.com/74867241/159483854-38cf7377-1196-4c56-841a-078eb11b068e.png">

#### Wednesday 23rd March
5. Allocated the following tasks:
* Connecting the User and Spaces models to the controller and view - Kenny and Jasmine
* Implementation of the calendar - Anusha
* Complete the Request model and linking it to the controller and view - Harry and Kathleen

#### Thursday 24th March
6. Integrated the model with the controller whilst ensuring all tests still passed.

#### Friday 25th March
7. Integration of the request model and controller
8. Implemented CSS

<img width="966" alt="Screenshot 2022-03-25 at 18 48 09" src="https://user-images.githubusercontent.com/74867241/160183147-53011479-4916-40d3-a94e-117a28522a74.png"> 
