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
- A "registration" process should be prepared.
- A "registration" form should be able to accept input.

A person enters data into the registration form.
- A "registration" process should be prepared.
- A "registration" form should be able to accept input.
- The person must supply a valid email address during the registration process.
- The email address supplied by a person during registration must not already be in use.
- The email address must be hashed for verification at a later stage.
- The person must provide a valid screen name during the registration process.
- The screen name must be at least one character in length.
- The screen name must not already be in use by another person.

A person enters incorrect information into the registration form.
- A person has entered no email address.
- A person has entered no screen name.
- A person has entered an email address which is already in use.
- A person has entered a screen name which is already in use.

A person enters correct information into the registration form.
- A person has entered a valid email address.
- A person has entered a valid screen name.
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

A person views their bookface account overview web page.

A person views their bookface account settings web page.

A person views their bookface account favourite books web page.

A person views their bookface account authors web page.

A person views their bookface account book lising web page.
