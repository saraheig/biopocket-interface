# Database interface for the BioPocket project

This is a Web application which allows users not only to easily create, read, update and delete (CRUD application) data, but also to quickly search a keyword and other parameters into data contents. Markdown ([Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) - [Documentation](https://daringfireball.net/projects/markdown/syntax)) can be used in some text fields.

- [Images management](#images-management)
- [Database structure](#database-structure)


## Images management

Images are stored on [Amazon](https://github.com/MediaComem/biopocket/blob/master/IMAGES-WORKFLOW.md#sauvegarde-des-images-sur-amazon) with this [convention](https://github.com/MediaComem/biopocket/blob/master/IMAGES-WORKFLOW.md#convention-de-nommage).

In the database interface, **image syntax** looks like this:

`![Name of the image](https://s3-eu-west-1.amazonaws.com/biopocket-data/images/imageName.jpg "parameters")`

### Parameters related to images

Each image must have **two parameters**.

The **first parameter** indicates the position of the image related to the mobile screen. The value of this parameter must be one of these keywords:

- `main` if the image is in the top left corner of the mobile screen
- `full` if the image is at the bottom of the mobile screen (over the entire width of the mobile screen)
- `right` if the image is in the right corner of the mobile screen

Example of a main image and a full image:
![Example of a main image and a full image](https://xd.adobe.com/view/02e504e9-d676-434c-9205-334d69113c9a/screen/e21c5c13-a304-4b4d-a978-d60a00fb9a4d/Details-tache)

The **second parameter** indicates the approximate position of the object (bird, tree, plant ...) related to the image itself. It must be composed by **two letters**.

* The first letter indicates the **horizontal position** of the object related to the image itself. Only one of these three possibilities must be used by image: 
..-`l` if the object is on the left side of the image
..-`c` if the object is at the center of the image
..-`r` if the object is on the right side of the image

* The second letter indicates the **vertical position** of the object related to the image itself. Only one of these three possibilities must be used by image: 
..-`t` if the object is at the top of the image
..-`c` if the object is at the center of the image
..-`b` if the object is at the bottom of the image

**Example**: `![Name of the image](https://s3-eu-west-1.amazonaws.com/biopocket-data/images/imageName.jpg "full ct")`


## Database structure

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
* Period
* ActionsAction
* TasksTask
* Species
* SpeciesAction

In order to use this Web application, users can only sign in. As a result, the actual database also contains this table: 

* User

And the authentication management through session. 
