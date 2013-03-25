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


List of tests for the different features groupsed into scenarios
================================================================

A person visits the website
- A person can use the registration form.
- A registration form should be able to accept input.
- A person can use the login form.
- A login form should be able to accpet input.

A person enters data into the registration form.
- A "registration" process should be prepared.
- A "registration" form should be able to accept input.
- The person must supply a valid email address during the registration process.
- The email address supplied by a person during registration must not already be in use.
- The email address must be hashed for verification at a later stage.
- The person must provide a valid screen name during the registration process.
- The screen name must be at least one character in length.
- The screen name must not already be in use by another person.
- The person must supply a password which is a minimum of four characters in length.

A person enters incorrect information into the registration form.
- A person has not entered an email address.
- A person has not entered a screen name.
- A person has entered an email address which is already in use.
- A person has entered a screen name which is already in use.
- A person has not entered a password.
- A person has entered a password which is less than four characters in length.

A person enters correct information into the registration form.
- A person has entered a valid email address.
- A person has entered a valid screen name.
- A person has entered a password which has at least four characters.
- A person has clicked the "complete my registration" button.

A person verifies their registration with bookface.
- A person has clicked the registration hyperlink in the confirmation email that was sent to them within the 48 hour time limit.
- A person's account is activated.
- A person is redirected to another page after their account is activated.

A person does not verify their registration with bookface.
- A person does not click the registration hyperlink in the confirmation email that was sent to them within 48 hours time limit.
- Unverified registration records are removed after a 48 hour period.

A person clicks the registration hyperlink in the confirmation email after the 48 hour time limit.
- A person's registration record is removed.
- A person is redirected to a different page.

A person clicks the registration hyperlink in the confirmation email after confirming their registration with bookface.
- A person's registration record is checked.
- A person is redirected to a different page.

A person visits the bookface after confirming their registration.
- A person can use the login form.
- A person can use the registration form.

A person uses the login form.
- A person can enter their screen name or email address in the text entry field.
- A person can enter their password into the text entry field.

A person enters incorrect credentials into the login form.
- A person enters a non valid email address, screen name and or password.

A person has forgot their password and clicks the "I've forgotten my password" hyperlink.
- The person is redirected to a different page.
- The person is prompted to enter the email address used for their unique registration.

A person has forgot their screen name and clicks the "I've forgotten my screen name" hyperlink.
- The person is redirected to a different page.
- The person is prompted to enter the email address used for their unique registration.

A person views their bookface account overview web page.
- There are four option groups: my account, my authors, my books, my favourites. Which will facilitate user requirements.
- The user should be able to view the "my account" options.
- The user should be able to view the "my authors" options.
- The user should be able to view the "my books" options.
- The user should be able to view the "my favourites" options.
- The user should be able to log out of their account.

A person views their bookface account settings (which is the my account option) web page.
- A peron should be able to change the details of their user.
- A person should be able to change the email address registered with the bookface to another unique email address.
- A person should be able to change their screen name to another unique screen name.
- A person should receive an email detailing the change in the registered account email address.
- A person should receive an email detailing the change in the registered account screen name.

A person views their bookface account favourite books (which is the my favourites) web page.
- The person should be presented with a list of their favourite books.
- The listing should be in chronological order (newest entry at the start of the listing).
- The list can be presented in reverse chronological order (oldest entry at the start of the listing).
- The list can be presented in alphanumerical order (lower numerical values followed by alphabetical values [0-10 A-Z]).
- The list can be presented in alphanumerical order (alphabetical values followed by numerical values [Z-A 10-0]).
- A person can enter a search term and view the result(s).
- A person can toggle their choice upon a book (it is a favourite/it is not a favourite).

A person views their bookface account authors (which is the authors) web page.
- The person shold be presented with a list of the authors.
- The listing should be in chronological order (newest entry at the start of the listing).
- The list can be presented in reverse chronological order (oldest entry at the start of the listing).
- The list can be presented in alphanumerical order (lower numerical values followed by alphabetical values [0-10 A-Z]).
- The list can be presented in alphanumerical order (alphabetical values followed by numerical values [Z-A 10-0]).
- A person can enter a search term and view the result(s).
- A person can create an entry detailing the name of an author which does not already exist.
- A person can update an entry detailing the name of an author which does not have any references associated with it (other people have selected this author to be a favourite).
- A person can remove an entry detailing the name of an author which does not have any references associated with it (other people have selected this author to be a favourite).
- A person who enters the name of an author which is already contained within the database simply references the previously created record.
- A person can only remove an author when all references are removed first.

A person views their bookface account book (which is the my books) lising web page.
- The person should be presented with a list of their favourite books.
- The listing should be in chronological order (newest entry at the satrt of the listing).
- The list can be presented in reverse chronological order (oldest entry at the start of the listing).
- The list can be presented in alphanumerical order (lower numerical values followed by alphabetical values [0-10 A-Z]).
- The list can be presented in alphanumerical order (alphabetical values followed by numerical values [Z-A 10-0]).
- A person can enter a search term and view the result(s).

A person views other users who have listed a book as also being their favourite.
- All users who have listed a book as being their favourite can be presented in an ordered list.


Bookface Database Domain
========================
The database will store information pertaining to the use of bookface and the preferences of the people who use it.
The Domain Entities outlines the different database domain entities which are present within the product scenario description.
- The use of Spring Roo requires the additional attribute of "version" applicable to the Spring environment versioning.

Domain Entities
===============
Person
- Version [bigint,not null]
- Identifier [bigint,not null,auto increment,PK]
- Screen name [varchar 255,not null]
- Email address [varchar 255, not null]
- Password [varchar 255, not null]

User
- Version [bigint,not null]
- Identifier [bigint,not null,auto increment, PK]
- Person.Identifier [bigint, not null,index "user_person" :- Person.PK update/delete cascade]

Author
- Version [bigint,not null]
- Identifier [bigint,not null,auto increment, PK]
- Name [varchar 255, not null]

Book
- Version [bigint,not null]
- Identifier [bigint,not null,auto increment, PK]
- Author.Identifier [bigint, not null, index "book_author" :- Author.PK update cascade/delete nothing]
- Title [varchar 255, not null]

Comments
- Version [bigint, not null]
- Identifier [bigint, not null, auto increment, PK]
- User.Identifier [bigint, not null, index "comment_user" :- User.PK update/delete cascade]
- Book.Identifier [bigint, not null, index "comment_book" :- Book.PK update/delete cascade]
- Description [smalltext, not null]

Favourites
- Version [bigint, not null]
- Identifier [bigint, not null, auto increment, PK]
- User.Identifier [bigint, not null, index "favourites_user" :- User.PK update/delete cascade]
- Book.Identifier [bigint, not null, index "favourites_book" :- Book.PK update/delete cascade]

Constraints
===========
Person
- The 'is' relationship with User is mandatory, the relationship is total. A Person represents a User.

User
- The 'is' relationship with Person is mandatory, the relationship is total. A User is a Person.
- The 'has' relationship with Favourites is optional, the relationship is partial. A User may not list a Book as a favourite.

Author
- The 'authored' relationship with Book is mandatory, the relationship is total. A Book must have an Author.

Book
- The 'authored' relationship with Author is mandatory, the relationship is total. A Book must have an Author.

Comments
- The 'created' relationship with User is mandatory, the relationship is total. A Comment is created by a User.
- The 'has' relationship with Book is optional, the relationship is partial. A Book may not have any Comments.

Favourites
- The 'is' relationship with User is optional, the relationship is partial. A User may not have any Favourites.
- The  'listed as' relationship with Book is manadatory, the relationship is total. A Favourite can not exist if it is not associated with a Book which is listed.
