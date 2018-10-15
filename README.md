# Database interface for the BioPocket project

This is a Web application which allows users not only to easily create, read, update and delete (CRUD application) data, but also to quickly search a keyword and other parameters into data contents. Markdown ([Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) - [Documentation](https://daringfireball.net/projects/markdown/syntax)) can be used in some text fields.

* [Images management](#images-management)

    * [First parameter](#first-parameter)
    * [Second parameter](#second-parameter)

* [Database structure](#database-structure)


## Images management

Images are stored on [Amazon](https://github.com/MediaComem/biopocket/blob/master/IMAGES-WORKFLOW.md#sauvegarde-des-images-sur-amazon) with this [convention](https://github.com/MediaComem/biopocket/blob/master/IMAGES-WORKFLOW.md#convention-de-nommage).

**Attention** : In the application, there are two main categories of images.
- **Main images**: Each theme and each action has one main image. The main image must be named with the code of the theme or action and the keyword "main" (`CODE-main.jpg`) and **the image must not be indicated in the database interface**.
- **Secondary images**: Each theme and each task could have several secondary images. These secondary images must be named with the code of the theme or task and a name (`CODE-name.jpg`). Moreover, **the image must be indicated in the database interface in one of the fields related to a description**.

In the database interface, **image syntax** looks like this:

`![Parameters](CODE-name.jpg)`

**Example**:
`![full ct](F5-habitat.jpg)`
This is an example of a secondary image related to the theme F5.

In the database interface, each secondary image must have **two parameters** (see below). These two parameters are indicated in the brackets.


### First parameter

The first parameter indicates **the position of the image related to the mobile screen**. The value of this parameter must be one of these keywords:

- `left` if the image is in the left corner of the mobile screen
- `right` if the image is in the right corner of the mobile screen
- `full` if the image is over the entire width of the mobile screen

**Example of a left image and a full image**:

![Example of a left image and a full image](/lib/assets/example-left-full-images.png)


### Second parameter

The second parameter indicates **the approximate position of the object (bird, tree, plant ...) related to the image itself**. It must be composed by **two letters**.

* The first letter indicates the **horizontal position** of the object related to the image itself. Only one of these four possibilities must be used by image:

    * `l` if the object is on the left side of the image
    * `c` if the object is at the center of the image
    * `r` if the object is on the right side of the image
    * `a` if the object is over the entire width

* The second letter indicates the **vertical position** of the object related to the image itself. Only one of these four possibilities must be used by image:

    * `t` if the object is at the top of the image
    * `c` if the object is at the center of the image
    * `b` if the object is at the bottom of the image
    * `a` if the object is over the entire high


## Database structure

The actual database of this project is composed by these tables ([model](/lib/assets/mcd.pdf)):

* Action: All actions a user can undertake

    * ActionsAction: Links between the actions
    * Cost: Costs related to each action
    * Species: Species affected by each action
    * SpeciesAction: Links between actions and species
    * Unit: Time units related to the actions

* Theme: Groups of actions

* Type: Types of actions

* Task: All tasks of each action

    * TasksTask: Links between the tasks
    * Category: Time categories
    * Constraint: Constraints related to each task
    * Link: Web links related to each task
    * Period: Periods related to each task

In order to use this Web application, users can only sign in. As a result, the actual database also contains this table: 

* User

And the authentication management through session. 
