bookface
========

The "bookface" web application which let's people share their favourite books and authors.


Product description
===================



Scenario
========

You have been asked to develop Bookface, a social networking site for people who love reading, and always have their face in a book. The site will allow avid readers to comment on their favourite books, and to read the comments made by others on their favourite books, and other books by their favourite authors.

- Users must register before they can submit comments on a book. 
- Users should choose a screen name and they should supply an email address.
- The site should list authors together with their books.
- Comments are made on books, not on authors. 
- Users can add authors if they are not already there, and they can add books to authors.
- Your program should list the favourite books of a user and be able to see other members of the site who listed those books as being among their favourite books.
        
        
You should use either JEE or Spring to assist you in implementing this work (yes, Play and Spring Roo are allowed). You may carry this coursework out in groups (up to four members inclusive).

Evaluation
==========

Your work will be assessed on its:

- Function: does it work as expected?
- Implementation: is the code well-structured?
- Robustness: is the code secure, and well-tested?
- Maintainability: is the code well-documented?


List of tests for the different features grouped into scenarios
================================================================

A person must provide a screen name and email address before they can view any other web pages.
- The person must supply a valid email address during the registration process.
- The email address supplied by a person during registration must not already be in use.
- The person must provide a valid screen name during the registration process.
- The screen name must be at least one character in length.
- The screen name must not already be in use by another person.

A person enters incorrect information into the registration form.
- A person has not entered an email address.
- A person has not entered a screen name.
- A person has entered an email address which is already in use.
- A person has entered a screen name which is already in use.

A person enters correct information into the registration form.
- A person has entered a valid email address.
- A person has entered a valid screen name.

A person uses the login form.
- A person must enter their screen name and email address.

A person enters incorrect credentials into the login form.
- A person enters a non valid email address and screen name.

A person has forgot their password and or screen name.
- The person is redirected to a different page.
- The person is prompted to enter the email address used for their unique registration.

A person who has logged can do the following at all times:
- View the authors page.
- View the books page.
- View the favourites page.
- Log out of the web application.

When a person is on the authors page:
- They should see a list of all authors (if there are any) and each author should have a sub listing of books (if there are any).
- They should be able to add an author (but only if the author doesn't already exist, so a check for this must be in place).
- They should be able to click a book title which is a sub listed item of an author. They should be redirected to the books detail page.
- They should be able to click a link which will redirect them to a page where they can add a book.

When a person is on the books detail page:
- They should be able to see all comments (if any exist) and create a comment.

When a person is on the create a book page:
- The author name and (when testing id) should already be displayed on the screen.
- They should be able to provide a title for the book.


---------------
SCENARIOS TO BE ADDED FOR THE FAVOURITES USER JOURNIES TOMORROW.......
---------------


Bookface Database Domain
========================
The database will store information pertaining to the use of bookface and the preferences of the people who use it.
The Domain Entities outlines the different database domain entities which are present within the product scenario description.
- The use of Spring Roo requires the additional attribute of "version" applicable to the Spring environment versioning.

Domain Entities
===============
person
- version [bigint, null]
- identifier [bigint, not null, auto increment, PK]
- screen_name [varchar 255,not null]
- email_address [varchar 255, not null]
- password [varchar 255, not null]

author
- version [bigint, null]
- identifier [bigint, not null, auto increment, PK]
- name [varchar 255, not null]

book
- version [bigint, null]
- identifier [bigint, not null, auto increment, PK]
- author [bigint, not null, index book_author_idx, FK book_author references author.identifier update no action/delete no action]
- title [varchar 255, not null]

comments
- version [bigint, null]
- identifier [bigint, not null, auto increment, PK]
- book [bigint, not null, index comments_book_idx, FK comments_book references book.identifier update no action/delete no action]
- person [bigint, not null, index comments_person_idx, FK comments_person references person.identifier update no action/delete no action]
- description [text, not null]

favourites
- version [bigint, null]
- identifier [bigint, not null, auto increment, PK]
- book [bigint, not null, index favourites_book_idx references book.identifier update no action/delete no action]
- person [bigint, not null, index favourites_user_idx references person.identifier update no action/delete no action]


Constraints
===========
person
- The 'created' relationship with comment is optional, the relationship is partial. A person may not create comments.
- The 'has' relationship with favourite is optional, the relationship is partial. A person may not have favourites.

author
- The 'authors' relationship with book is mandatory, the relationship is total. A book must have an author.

book
- The 'authors' relationship with author is mandatory, the relationship is total. A book must have an author.

comments
- The 'created' relationship with person is mandatory, the relationship is total. A comment must be creatd by a person.
- The 'has' relationship with book is optional, the relationship is partial. The may be no comments on a book.

favourites
- The 'is' relationship with person is mandatory, the relationship is total. A favourite must be selected by a person.
- The 'listed as' relationship with Book is mandatory, the relationship is total. A favourite must have a book associated with it.
