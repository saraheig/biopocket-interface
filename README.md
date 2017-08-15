# BioRails

This is a Web application which allows users not only to easily create, read, update and delete (CRUD application) data, but also to quickly search a keyword and other parameters into data contents.

The actual database of this project is composed by these tables: 

* Work
* Topic
* Category

A work belongs to exactly one topic and one category, whereas a topic and a category could both have several works. 

In order to use this Web application, users must first of all sign up and sign in. As a result, the actual database also contains this table: 

* User

And the authentication management through session. 
