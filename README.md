# README

### Welcome to SitterSetter

Check out the demo here: [Demo Me](https://secret-everglades-72811.herokuapp.com/)

SitterSetter is the ultimate babysitting scheduling app. Think, WAG! but for babies instead of dogs.

There are two models: Parent & Sitter with their own scoped views using Devise. Every user is built a new calendar upon registration.

Parents can:
* Authorize babysitters to see their babysitting openings
* Create open gigs for any of their sitters to claim w/ optional instructions
* Request specific sitters for specific times which only turn into gigs on the calendar upon the sitter accepting the request
* Remove babysitters to no longer see their babysitting openings

Sitters can:
* See all open gigs from all parents that authorize them
* Remove parents they no longer want to babysit for
* Claim/Drop any open babysitting gigs
* Accept specific Requests
