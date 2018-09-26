# Database interface for the BioPocket project

This is a Web application which allows users not only to easily create, read, update and delete (CRUD application) data, but also to quickly search a keyword and other parameters into data contents. Markdown ([Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) - [Documentation](https://daringfireball.net/projects/markdown/syntax)) can be used in some text fields.

***

The actual database of this project is composed by these tables ([model](/lib/assets/mcd.pdf)):

* Action
* Theme
* Type
* Category
* Cost
* Unit
* Task
* Constraint
* Link
* Picture
* Period
* ActionsAction
* TasksTask
* Species
* SpeciesAction

***

In order to use this Web application, users can only sign in. As a result, the actual database also contains this table: 

* User

And the authentication management through session. 
