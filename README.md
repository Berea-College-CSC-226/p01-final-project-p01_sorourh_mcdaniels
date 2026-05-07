# CSC226 Final Project

## Instructions

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
### World & Animals (Node2D) CRC Card

| Instance name: World (Node2D) world.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| N/A | Collaborates with CharacterBody2D <br/>Collaborates with CollisionShape2D <br/>Collaborates with Camera2D <br/>Collaborates with AnimatedSprite2D <br/>Collaborates with Area2D <br/>Collaborated with TileMapLayer |
| **Class Methods:**  |  |
|  **Initialization:** <br/>Creates a Node2D object that holds all relative classes & files for processing |  |

 

### Player & Animals (CharacterBody2D) CRC Card

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



**Branch Formats**: 
```
    Branch 1 starting name: mcdaniels_1 & sorourh_1
    Branch 2 starting name: mcdaniels_2 & sorourh_2
    ...
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

```
    The project is going well so far. We started collecting the different sprites and images needed for the project and started the
    issue queue for all of our classes. We are feeling pretty OK so far. We did some of the research before so that it would be easy
    to implement. We realize we have a lot of coding and a lot of trial and error to work on, but we are optimistic that it will turn 
    out fine and that it will be OK. We are excited to start working on this project as this is something we both are very interesed in.
```

---

## Milestone 3: Virtual Check-In

**Completion Percentage**: `30%`

️**Confidence**:

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

### Reflection

Each partner should write three to four well-written paragraphs address the following (at a minimum):
- Why did you select the project that you did?
- How closely did your final project reflect your initial design?
- What did you learn from this process?
- What was the hardest part of the final project?
- What would you do differently next time, knowing what you know now?
- How well did you work with your partner? What made it go well? What made it challenging?

```
    Habiba Sorour:
    Me and Skylar bonded over liking video games since the moement we met in our first Computer Science class last semester. We both like RPG style games so when we had the opportunity to build our own game, we were super excited. Our initial idea stayed consistent
    but the execution of it was completely different. We wanted to add a story element to it, with dialogue and different scenes and NPCs but we settled on a "collect 'em" all style of game with the animals. I learned a lot through this process--I was able to learn a bit of GODOT and,
    how to do animations of sprites, and moving them around is something I have always wanted to do. GODOT's interface was easy to navigate and with some more practice, I think I will be able to build better games in the future. Moreover, using GITHUB to collaborate was a great expereince, getting to
    have my teammates work on my device automatically after they are done with it. The hardest part would be actually learning the interface and adding all of our codes and tiles together; we faced a lot of problems with GITHUB at first as uploading the project on  an established repo was a problem at first, but we fixed it. Furthermore, We had some merge conflicts
    whenever we wanted to merge our branches together, because the smallest change in the map can have an impact. If I had more time, I would try to utlize a lot of the built-in functions in GODOT that can add amazing features to the game that I was not aware off, to add more flare to the 
    project. Furthermore, I would organize the different Nodes into their own scenes for easier access without the presence of all the animals all at once. I worked great with Skylar! I really enjoy working with her. We both have similar interests and ambitions. We both like to try our very best and push ourselves 
    to beyond our limits. The most challenging part was ultimately time conflicts and nothing the other person could have prevented due to how busy this time of the semester is. Otherwise, working with skylar has been such a breeze and honestly incredibly fun.
    
```

```
    Skylar McDaniel:
    My reasons for wanting to follow through on this particular project, Sunfire Mountain, lie in how I admire game development (and really any application development). I love being able to bring a program together in EVERY aspect: tiles, scripts, GUI, etc. Habiba reflected my interests with her own of admiration for games, and we mutually (and immediately, without hesitation from either party) came to the conclusion of working on a small rpg.
    Our final project reflected our initial design by probably... 15%. It had the basic cute-pixel design we hoped for, however none of the gameplay is similar. Our initial design was also more meant for linear programming, but we ended up using Godot which is far more object-oriented.
    Much was learned. For me, I was able to apply GitHub to a more hands-on scene that forced me to learn the REAL pros and cons and not just what I was told (hands-on is the only way you'll every really understand why you do something). I was forced to see how merge conflicts really work (and how manual fixing them is) as well as how to piece together everything I know. Sure, I understand how code works. Sure, I get the gist of CharacterBody2D and tilemaps and other similar classes. But actually connecting each part of a program is much more complex and intertwined than one images when first jumping into a project. This is the piece of the process I truly needed to touch-up on, and this final provided me just the chance to do so (although I want to do more).
    By far, the hardest part of working on our unique project was: getting GitHub to like us... To be able to get in a flow of work, we needed to be able update to the same repository with a mutual understanding of how the process would move. After failed attempts at using a GitHub plug-in for Godot as well as a separate repository, we settled on GitHub Desktop and the class' repo to finally get the process flowing. Additionally, simply knowing how to do stuff within Godot was a bit difficult. While it was a simple interface and for the most part easy-to-learn, it was difficult to know what our options for solving a problem were.
    Next time: I'd use a different tilesheet--one with both more elements to use as well as sprites made by my partner and I. I'd also make the map larger, more complex, and more entertaining. The game would include a lot more elements, as if I knew what I knew now--Habiba and I could've gotten to work so much quicker and pumped out so much more. Coins, NPCs, battles, etc. I'd also optimize the auto-tiliing used for the paths and grass as they aren't 100% foolproof. With more time, the CollisionShape2D objects would need re-shaped to be less awkward to modern-day users and the Main Menu would have more elements (e.g. instructions). With my current knowledge, and its thus succeeded allowance of extra time, I'd absolutely create a UI for during the game that would keep track of how many animals have been collected/more there are to collect and what NPCs you've talked to or battled. Essentially, what I'd do differently is give myself more time to implement the things I want by getting GitHub deal with faster (although we did it as quick as we could figure it out).
    Absolutely NOTHING about Habiba's work ethic, personality, or level of intelligence prevented us from working well together. I feel that Habiba and I are very similar people in how we think, prioritize, adapt, and enact, save for the fact the Habiba is on a level I'll never reach. Working with her was an enjoyment I'd choose to have every day. The only challenging part came from the fact that I had various events occurring that made it hard for me to work at specific times and she had academic duties to attend to, as well as sickness, that made it difficult for her to work. But these challenges didn't come from Habiba rather unforseeable circumstances.
    This project was GREAT and I'd choose to do it in my free time with the same partner ANY DAY. Liberal final projects are my favorite as I'm offered the chance to pursue, at my own pace and choose my own level, that which I am passionate about.
    THANKS HABIBA.
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
*There was not much physical progress as we spent many hours simply getting GitHub and Godot to be friendly with each other. Thus, our milestones are less physical and more centered on the fact that after milestone 3--we got commits and pushes to work seamlessly after all of our hardwork.*

*Additionally, this resulted in our issue queue and README lacking for a while, however we heavily used each when we got into the actual flow of work.*
https://github.com/sorourh05/csc226-project

However, once it was clear that working on this repository was not recommended--we switched our data back to this repository: 
https://github.com/Berea-College-CSC-226/p01-final-project-p01_sorourh_mcdaniels 

___

THANK YOU, DR. HEGGEN!
The liberties we were allowed and the creativity we could use made this project VERY FUN to work with and VERY CHALLENGING. It was the step each of us needed to really push ourselves and understand specific concepts we've wanted to learn on a deeper, more practical level. This has been the highlight of the semester for us both.
