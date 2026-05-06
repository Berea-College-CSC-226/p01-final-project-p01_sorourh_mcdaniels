# CSC226 Final Project

## Instructions

Exclamation Marks indicate action items; you should remove these emoji as you complete/update the items which 
  they accompany. (This means that your final README should have no in it!)

**Author(s)**: Habiba Sorour & Skylar McDaniel

**Google Doc Link**: [Google Doc Link](https://docs.google.com/document/d/1EIfkGvfVddGJb7MGmApVjCTVhcUEOpGGCw5_mlvLRsE/edit?usp=sharing)

---

## Milestone 1: Setup, Planning, Design

**Title**: Sunfire Mountain

**Purpose**: It is a farm-based RPG in which the player's goal is to collect the animals that escaped their fence.

**Source Assignment(s)**:
  - Teamwork 1/4 (class-based linear rpg)
  - Teamwork 9 (class introduction)
  - Teamwork 11 (legend of tuna)
  - Teamwork 12 (GUI)
  - Homework 10 (ciphers)
  - Homework 11 (final project design)

**CRC Card(s)**:
  # World & Animals (Node2D) CRC Card

| Instance name: World (Node2D) world.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| N/A | Collaborates with CharacterBody2D <br/>Collaborates with CollisionShape2D <br/>Collaborates with Camera2D <br/>Collaborates with AnimatedSprite2D <br/>Collaborates with Area2D <br/>Collaborated with TileMapLayer |
| **Class Methods:**  |  |
|  **Initialization:** <br/>Creates a Node2D object that holds all relative classes & files for processing |  |

## 

## Player & Animals (CharacterBody2D) CRC Card

| Instance name: Player (CharacterBody2D) player.tscn player.gd Instance name: Animals (CharacterBody2D)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |  |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that holds the object’s sprite within AnimatedSprite2D <br/>`self.layer`    \# instance variable that holds the object’s position on the main physics 2D layers <br/>`self.mask`     \# instance variable that holds the layers in which the object will look to collide with <br/>\*more built-in attributes that we don’t edit upon instantiation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Each: <br/>Inherits from CharacterBody2D <br/>Collaborates with CollisionShape2D <br/>Collaborates with Camera2D <br/>Collaborated with AnimatedSprite2D <br/>Animals Instances: Collaborates with Area2D |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |  |
| **Initialization:** <br/>Creates a CharacterBody2D object that offers a physic body to be controlled by the user <br/>**Player Instance (player.gd):** <br/>`_process()`: It gets called every frame, handles input reading, velocity, animation updates, and checks if the player has collected all animals to trigger the win condition  <br/>`_physics_process(_delta)`: It creates the movement of the player and handle collisions <br/>`SetDirection()`: It checks if the cardinal direction changes based on the input , returns true if there is a change in direction, otherwise, returns false <br/>`SetState()`: It checks whether the state has changed or not ,returns true if there is a change in state, otherwise, returns false <br/>`UpdateAnimation()`: It gets the animation scene name necessary based on the state and direction  <br/>`AnimDirection()`: Returns the direction of the player to help load the correct animation scene <br/>`add_to_party(anima: Node2D)`: When the player hits the Area2D of an animal, add to the party. The first animal added to the party array follows the player, otherwise, the new animal follows the animal that joined right before it. <br/>**Animal Instance (animal.gd)**: <br/>`_ready()`: It gets called once when the node enters the scene tree. It connects the Area2D signal and plays the default idle animation before the animal gets picked up <br/>`_physics_process()`: It gets called every physics frame, moves the animal toward its follow target. It skips all logic if the animal is IDLE or no target gets assigned <br/>`start_following()`: It gets called by the player node to get animal into party It sets the follow target to either the player or the animal ahead <br/>`_update_cardinal():` It updates which cardinal direction (up, down, left, right) the animal is moving toward <br/>`_anim_direction()`: It return the animal direction, to build the correct animation <br/>`_play_anim(new_state: String)`: It gets the animations of the player and plays it <br/>`_on_body_entered(body: Node)`: It gets triggered when any body enters the animal's Area2D Only reacts if the animal is still idle and the body that entered is the player |  |

### CollisionShape2D CRC Card

| Class name: CollisionShape2D player.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| `self.shape`  \# instance variable that defines the body shape and size of the associated CharacterBody2D <br/>\*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D <br/>Collaborates with Area2D |
| **Class Methods:**  |  |
| **initialization** <br/>Creates a CollisionBody2D object that provides the associated CharacterBody2D a physical body to collide other classes with |  |

### Camera2D CRC Card

| Class name: Camera2D player.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| `self.example`  \# instance variable that … <br/>\*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D |
| **Class Methods:**  |  |
|  **Initialization:** <br/>Creates a Camera2D object that forces the screen to follow the associated CharacterBody2D |  |

### AnimatedSprite2D CRC Card

| Class name: AnimatedSprite2D player.tscn player.gd |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that holds the object’s sprite within AnimatedSprite2D <br/>\*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D |
| **Class Methods:**  |  |
|  **Initialization:** <br/>Creates an AnimatedSprite2D object that carries multiple textures as animation frames |  |

### Area2D CRC Card

| Class name: Area2D |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
|` self.example`  \# instance variable that … <br/>\*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D <br/>Collaborates with CollisionShape2D |
| **Class Methods:**  |  |
|  **Initialization:** <br/>Creates an Area2D object, acting as an area that keeps track of collidables that enter its space |  |

## Grass & Path & Bounds & Objects (TileMapLayer) CRC Card

| Instance name: Grass & Path & Bounds & Objects (TileMapLayer)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |  |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | **Class Collaborations (other classes):** |
| **Each**: <br/>`self.layer`    \# instance variable that holds the object’s position on the main physics 2D layers <br/>`self.mask`     \# instance variable that holds the layers in which the object will look to collide with <br/>`self.tileset`  \# instance variable that holds the sprite(s) reference(s) <br/>**for tile painting Path & Bounds**:<br/>`self.terrain` \# instance variable that holds a series of terrain sets to be used to paint the current tileset with a unique identity (assists with autotiling to differentiate specific parts of a single tile) <br/>**Bounds & Objects**: <br/>`self.layer`    \# instance variable that holds the object’s position on the main physics 2D layers <br/>\*more built-in attributes that we don’t edit upon instantiation | Collaborates with World Bounds & Objects: <br/>Collaborates with Player |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |  |
| **Initialization:** Creates a TileMapLayer object that uses a tileset within a grid-based system to provide layout to a 2D scene                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |  |

### 

## Main Menu CRC Card

| Class name: MainMenu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |  |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | **Class Collaborations (other classes):** |
| `self.panel` \#added the video to autoplay, expand and loop throughout the screen <br/>`self.texture` \# changed it to nearest to decrease the blurriness  <br/>`self.start` \# a button to restart the game <br/>`self.exit` \# a button to quit the game  <br/>`self.fontcolor_normal` \# change the font color normally. <br/>`self.fontcolor_focus` \# change the font when the button is focused on <br/>`self.fontcolor_hover` \#change the font when the button is hovered upon by the user <br/>`self.style_hover` \# changed the style when hovered upon the button <br/>`self.style_normal` \# change the style of the button <br/>`self.style_hover` \# changed the style of the button when hovered <br/>`self.style_focus`  \# changed the style of the button when focused on <br/>`self.title` \# adds the title of the game as a label <br/>`self.objective` \# adds the objective of the game as a label     | Collaborates with Control <br/>Collaborates with Buttons  <br/>Collaborates with Label <br/>Collaborates with Panel <br/>Collaborates with VideoStream |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |  |
| **Initialization:** <br/> Creates a Main Menu screen to help the user start the game whenever they are ready or exit the game if they change their mind <br/>`_on_start_pressed()`: When the start button is pressed, go to the world scene where the actual gameplay is <br/>`_on\_exit_pressed()`: When the exit button is pressed, quit the program                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |  |

### 

## Winning Screen CRC Card

| Class name: WinMenu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |  |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | **Class Collaborations (other classes):** |
| `self.panel` \#added the video to autoplay, expand and loop throughout the screen <br/>`self.texture` \# changed it to nearest to decrease the blurriness  <br/>`self.restart` \# a button to restart the game <br/>`self.exit` \# a button to quit the game  <br/>`self.fontcolor_normal` \# change the font color normally. <br/>`self.fontcolor_focus` \# change the font when the button is focused on <br/>`self.fontcolor_hover` \#change the font when the button is hovered upon by the user <br/>`self.style_hover` \# changed the style when hovered upon the button <br/>`self.style_normal` \# change the style of the button <br/>`self.style_hover` \# changed the style of the button when hovered <br/>`self.style_focus`  \# changed the style of the button when focused on <br/> `self.win` \# adds the winning label | Collaborates with Control <br/>Collaborates with Buttons  <br/>Collaborates with Label <br/>Collaborates with Panel <br/>Collaborates with VideoStream |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |  |
| **Initialization:** <br/> Creates a Winning Menu screen to let the user know that they won the game <br/>`_on_restart_pressed()`: When the start button is pressed, go to the Main Menu scene to restart <br/>`_on\_exit_pressed()`: When the exit button is pressed, quit the program                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |  |



**Branches**: This project will **require** effective use of git. 

Each partner should create a branch at the beginning of the project, and stay on this branch (or branches of their 
branch) as they work. When you need to bring each others branches together, do so by merging each other's branches 
into your own, following the process we've discussed in previous assignments, then re-branching out from the merged code.  

```
    Branch 1 starting name: mcdaniels_1 & sorourh_1
    Branch 2 starting name: mcdaniels_2 & sorourh_2
```

### References 
Sprites:
https://emanuelledev.itch.io/farm-rpg

Test Suites: 
https://gut.readthedocs.io/en/v9.6.0/
*Claude Code 

TileMap:
autotiling assistance =  https://youtu.be/LrsfgDyOAJs?si=A0AetnxyslXc5iyc
spritesheet editing = (paintdotnet) https://www.getpaint.net/index.html

Character Animations:
https://youtu.be/QPeycNt29tY?si=5frQH34MKu_43NLg 
https://youtu.be/rKQrp2U11Ag?si=xJddWZjqW3ncz-_z

Font:
https://www.1001fonts.com/pixel-game-font.html 

Main Menu and Winning Menu: 
https://www.youtube.com/watch?v=zHYkcJyE52g

*Claude Code was used for this part because godot doesn't have a native test suite like python does. It mainly uses play testers to test the game. 
To try to emulate Python, we had to install the GUT plugin, an addon for godot, to try to test the different functionalities of the scripts. 
The way in which the test suites must be made is repetitive and roundabout, thus we deemed Claude a tool to eliminate that time.

---

## Milestone 2: Code Setup and Issue Queue

Most importantly, keep your issue queue up to date, and focus on your code. 🙃

Reflect on what you’ve done so far. How’s it going? Are you feeling behind/ahead? What are you worried about? 
What has surprised you so far? Describe your general feelings. Be honest with yourself; this section is for you, not me.

```
    The project is going well so far. We started collecting the different sprites and images needed for the project and started the
    issue queue for all of our classes. We are feeling pretty OK so far. We did some of the research before so that it would be easy
    to implement. We realize we have a lot of coding and a lot of trial and error to work on, but we are optimistic that it will turn 
    out fine and that it will be OK. We are excited to start working on this project as this is something we both are very interesed in.
```

---

## Milestone 3: Virtual Check-In

Indicate what percentage of the project you have left to complete and how confident you feel. 

**Completion Percentage**: `30%`

️**Confidence**: Describe how confident you feel about completing this project, and why. Then, describe some 
  strategies you can employ to increase the likelihood that you'll be successful in completing this project 
  before the deadline.

```
    We feel that we can complete the project with a 70% confidence rate. This is due to the fact that we are using another software to write
    the code instead of using PyCharm and Python as it aids with the implementation of a better GUI for what we are trying to do. This added 
    a layer of difficulty that we are aware of, but we are ready to tackle the challenge. Furthermore, both of us had a very busy past couple of weeks 
    to work on the project, so that lagged us behind a little, however we are committed to finishing it this weekend. 
    Some stratigies we can imploy: instead of always having to work at the same time on the project and meeting up, we can distrubute the tasks 
    such that each person can work on their own whenever they are free instead of only relying on meeting time; furthermore, trying to find shortcuts to 
    implement the ideas that we have to add the functionalities that we want instead of going the hard route. 
```

---

## Milestone 4: Final Code, Presentation, Demo

### User Instructions

    After the user hits play in Godot (since we are using another programming langauge), the user will be prompted with a Menu Screen that displays the name
    of our game, the objective and two buttons. Start and Exit. The Exit button ends the program, and the user has to click run again. The Start button runs 
    the game, where they player has to collect all of the animals. The user can use the arrow keys or the WASD keyboard input to move the player input around 
    the screen. The animals are collected when the user "touches" them and then they follow the player around the map. To win, you have to collect all 10 animals, 
    after which you will get a winning menu that prompts the user with two buttons: whether to restart and go back to the main menu, or exit and quit the game.

    "Find all 10 animals! Use the arrow keys or WASD input to move. To 'collect' an animal, simply walk into it!"

### Errors and Constraints

Every program has bugs or features that had to be scrapped for time. These bugs should be tracked in the issue queue. 
You should already have a few items in here from the prior weeks. Create a new issue for any undocumented errors and 
deficiencies that remain in your code. Bugs found that aren't acknowledged in the queue will be penalized.

### ❗Reflection

❗Each partner should write three to four well-written paragraphs address the following (at a minimum):
- Why did you select the project that you did?
- How closely did your final project reflect your initial design?
- What did you learn from this process?
- What was the hardest part of the final project?
- What would you do differently next time, knowing what you know now?
- How well did you work with your partner? What made it go well? What made it challenging?

```
    Partner 1: **Replace this with your reflection
```

```
    Skylar McDaniel:
    My reasons for wanting to follow through on this particular project, Sunfire Mountain, lie in how I admire game development (and really any application development). I love being able to bring a program together in EVERY aspect: tiles, scripts, GUI, etc.
    Our final project reflected our initial design by probably... 15%. It had the basic cute-pixel design we hoped for, however none of the gameplay is similar. Our initial design was also more meant for linear programming, but we ended up using Godot which is far more object-oriented.
    Much was learned. For me, I was able to apply GitHub to a more hands-on scene that forced me to learn the REAL pros and cons and not just what I was told (hands-on is the only way you'll every really understand why you do something). I also learned how to 
```

---

### Requirement Fulfillments | Uniquity of Godot

*Because working with Godot and GDScript is unique and different to PyCharm and Python, we have decided to write how we fulfill the requirements here to note some differences.*

- The only chapter not obviously covered within our project was Chapter 12: Dictionaries. While a direct dictionary is not used, we used a similar form via enumerate based on our animation frames and their states. Maps are keyed to integers (IDLE, RUNNING, JUMPING). For example: state 0 = IDLE; state 1 = FOLLOWING.

- "Your project *must* use either the Turtle library, Pygame, or the Tkinter module..." With permission from Dr. Heggen, it was stated that we "do not have to use" any of these and fulfill the GUI-based requirements as well as library references and Pygame items via Godot itself with built-in functions (e.g. our Main Menu class acts as a GUI and Godot itself is similar to Pygame)

- Godot does not natively use test suites nor does it cleanly offer the grounds to create one (for example, in Pycharm--we were able to make a function that took only a line of code to for each test, however in Godot--we create a new function for each). This is because Godot, like other game engines, understands that games are unpredictable and test-building is extensive and time-consuming and the constant tweaks made within projects makes them even harder to maintain. We worked hard to find a plug-in for test suites and understand the concepts within it, however the work would've been unnecessarily long and we wanted to focus on the project itself.

### Repositories:

We initially worked with the following repository:
___
*There was not much physical progress as we spent many hours simply getting GitHub and Godot to be friendly with each other. Thus, our milestones are less physical and more centered on the fact that after milestone 3--we got commits and pushes to work seamlessly after all of our hardwork. Additionally, this resulted in our issue queue and README lacking for a while, however we heavily used each when we got into the actual flow of work.*

However, once it was clear that working on this repository was not recommended--we switched our data back to the following repository:
___

THANK YOU, DR. HEGGEN!
The liberties we were allowed and the creativity we could use made this project VERY FUN to work with and VERY CHALLENGING. It was the step each of us needed to really push ourselves and understand specific concepts we've wanted to learn on a deeper, more practical level. This has been the highlight of the semester for us both.
