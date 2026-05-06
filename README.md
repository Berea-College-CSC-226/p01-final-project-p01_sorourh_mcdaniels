# CSC226 Final Project

## Instructions

❗️Exclamation Marks ❗️indicate action items; you should remove these emoji as you complete/update the items which 
  they accompany. (This means that your final README should have no ❗️in it!)

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
  - Create a CRC card for each class that your project will implement.
  - See this link for a sample CRC card and a template to use for your own cards (you will have to make a copy to edit):
    [CRC Card Example](https://docs.google.com/document/d/1JE_3Qmytk_JGztRqkPXWACJwciPH61VCx3idIlBCVFY/edit?usp=sharing)
  - Tables in markdown are not easy, so we suggest saving your CRC card as an image and including the image(s) in the 
    README. You can do this by saving an image in the repository and linking to it. See the sample CRC card below - 
    and REPLACE it with your own:
  
### Player CRC Card

| Class name: Player (self, texture)                                                                                                                                                                                                                                                                        |  |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                     | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that holds the object’s sprite <br>`self.wallet`   \# instance variable that holds the value of the amount of Coins                                                                                                                                                  | Composes with PyGame <br/>Collaborates with Coin |
| **Class Methods:**                                                                                                                                                                                                                                                                                        | **Class Collaborations (other classes):** |
| `__init__()`: Creates a Player object that can move around the world and collect coins <br/>`__str__()`: Makes the str() function work with the Player <br/>`movement()`: Moves the Player across the tilemap per tile <br/>`attack()`: Depletes `attack_power()` from current battling bad\_NPC’s health | Composes with PyGame <br/>Collaborates with Coin |
| **Class Variables:**                                                                                                                                                                                                                                                                                      | **Class Collaborations (other classes):** |
| `attack_power`: A variable that holds a set amount of damage that will be dealt to a bad\_NPC’s health upon a hit <br/>`health`: Variable that holds an integer amount; is depleted from when bad\_NPC attacks                                                                                                |  |

### NPC CRC Card

| Class name: NPC (self, texture, is\_random \= False, is\_key \= False, key\_dialogue \= None, region \= None)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |                                                |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------|
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | **Class Collaborations (other classes):**      |
| `self.texture`			\# instance variable that sets the object’s sprite to the sprite parameter <br>`self.is_random = False` 	\# instance Boolean that declares whether the NPC will remain stationary or move randomly within their region <br>`self.is_key = False`		\# instance Boolean that declares whether the NPC is a key NPC (unique dialogue/action; boss or important person) or a default NPC (draws dialogue randomly from a set list) <br>`self.key_dialogue = None`	\# optional (only for those meant to be key NPC’s); instance variable that is set to the `key_dialogue` parameter to be unique for every instance of a key NPC object <br>`self.region = None`		\# optional (only for NPC’s that do not remain stationary); instance variable that is set to the region parameter that declares where the NPC will idly walk around at    | Composes with pygame <br/>Composes with Player |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **Class Collaborations (other classes):**      |
| `__init__()`:  Creates an NPC object that interacts with the player and may move idly; can be Key or not (provides unique dialogue); can be stationary or not (has an associated region in which to wander) <br/>`__str__()`: Makes the str() function work with the NPCs movement(): If the current NPC has an associated region, have them move per tile within the boundaries of it; else, have them stay still                                                                                                                                                                                                                                                                                                                                                                                                                                      | Composes with pygame  <br/>Composes with Player     |
| **Class Variables:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | **Class Collaborations (other classes):**      |
| `default_dialogue`: List of pre-determined dialogue options for NPC’s to display upon interaction if` is_key` returns False                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                                |

### Bad NPC CRC Card

| Class name: bad\_NPC (self, texture)                                                                                                                                                                                                                                                                                                                                                                                                                                                    |  |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that sets the object’s sprite to the sprite parameter                                                                                                                                                                                                                                                                                                                                                                                              | Inherits from NPC  |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | **Class Collaborations (other classes):** |
| `__init__()`:  Creates an NPC object with the additions of `health` and `attack_power` <br/>`__str__()`: Makes the str() function work with the badNPC <br/>`attack()`: Depletes `attack_power` from Player’s health <br/>`initiate_battle():` (like `interaction()`)If the current NPC is a key NPC, display their unique dialogue; else, draw randomly from `default_dialogue`; loop `attack()` back and forth between Player and bad\_NPC; if bad\_NPC health reaches 0,` collect()` | Inherits from NPC <br/>Collaborates with Coin |
| **Class Variables:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | **Class Collaborations (other classes):** |
| `attack_power`: A variable that holds a set amount of damage that will be dealt to the Player’s health upon a hit health: Variable that holds an integer amount; is depleted from when bad\_NPC attacks                                                                                                                                                                                                                                                                                 |  |

### Good NPC CRC Card

| Class name: good\_NPC (self)                                                                                                                                                                                                                                                                                                                      |  |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                             | **Class Collaborations (other classes):** |
| `self.texture`		\# instance variable that sets the object’s sprite to the sprite parameter <br/>`self.has_interacted`	\# instance Boolean that declares whether the Player has interacted with the good\_NPC before                                                                                                                               | Inherits from NPC  |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                | **Class Collaborations (other classes):** |
| `__init__()`:  Creates an NPC object with the additions of `health` and `attack_power` <br/>`__str__():` Makes the str() function work with the good NPC <br/>`interaction()`: Sets `has_interacted` to True and calls `collect()`; if the current NPC is a key NPC, display their unique dialogue; else, draw randomly from `default_dialogue `  | Inherits from NPC <br/>Collaborates with Coin |
| **Class Variables:**                                                                                                                                                                                                                                                                                                                              | **Class Collaborations (other classes):** |
|                                                                                                                                                                                                                                                                                                                                                   |  |

### Environment CRC Card

| Class name: Environment (self)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |  |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that sets the object’s sprite to the sprite parameter                                                                                                                                                                                                                                                                                                                                                                                                                             | Collaborates with PyGame <br/>Collaborates with Player <br/>Collaborates with NPC  |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | **Class Collaborations (other classes):** |
| `__init__()`: Sets up the current environment in which the player will explore<br/> `__str__():` Makes the str() function work with the Environment <br/>`setup_start_menu()`: Sets up the start screen, where the user can start or exit the game. <br/>`setup_pause()`: Sets up the pause/menu screen, in which the user can continue/exit the game <br/>`setup_spawn()`: Set up the spawn point for the player <br/>`setup_town()`: Set up the environment, Town <br/>`setup_shop()`: Set up the environment, Shop  | Collaborates with PyGame <br/>Collaborates with Player <br/>Collaborates with NPC  |
| **Class Variables:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | **Class Collaborations (other classes):** |
| `environment_name`: A list containing the different environments                                                                                                                                                                                                                                                                                                                                                                                                                                                       |  |

### Obstacle CRC Card

| Class name: Obstacle (self, texture, is\_interactable \= False)                                                                                                                                                                                                                                                             |  |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                       | **Class Collaborations (other classes):** |
| `self.texture`		\# instance variable that sets the object’s sprite to the sprite parameter <br/>`self.is_interactable`	\# instance Boolean that declares whether the object will present the option to interact or not <br/>`self.dialogue`		\# instance variable that holds what the Obstacle says upon `interaction()`    | Collaborates with PyGame <br/>Collaborates with Player <br/>Collaborates with good\_NPC <br/>Collaborates with bad\_NPC   |
| **Class Methods:**                                                                                                                                                                                                                                                                                                          | **Class Collaborations (other classes):** |
| `__init__()`: Sets up the different attributes of the obstacle being created <br/>`__str__()`: Makes the str() function work with the different obstacles <br/>`interaction()`: If `is_interactable` is True, allows player the option to view dialogue from the Obstacle                                                           | Collaborates with PyGame <br/>Collaborates with Player <br/>Collaborates with good\_NPC <br/>Collaborates with bad\_NPC |
| **Class Variables:**                                                                                                                                                                                                                                                                                                        | **Class Collaborations (other classes):** |
|                                                                                                                                                                                                                                                                                                                             |  |

### Coin CRC Card

| Class name: Coin (self)                                                                                                                                                                                                      |  |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                        | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that sets the object’s sprite to the sprite parameter <br/>`self.amount`	\# the current amount of coins                                                                                 | Collaborates with PyGame <br/>Collaborates with Environment <br/>Collaborates with Player  |
| **Class Methods:**                                                                                                                                                                                                           | **Class Collaborations (other classes):** |
| `__init__()`: Creates the currency that will be used inside of the game <br/>`__str__()`: Makes the str() function work with the Coin <br/>`collect()`: Randomly adds to the amount of Coins to the player's wallet attribute.   | Collaborates with PyGame <br/>Collaborates with Environment <br/>Collaborates with Player |
| **Class Variables:**                                                                                                                                                                                                         | **Class Collaborations (other classes):** |
|                                                                                                                                                                                                                              |  |

### Shop CRC Card

| Class name: Shop (self)                                                                                                                                                                                         |  |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                           | **Class Collaborations (other classes):** |
| `self.texture`  \# instance variable that sets the object’s sprite to the sprite parameter                                                                                                                      | Inherits from Environment  <br/>Collaborates with PyGame <br/>Collaborates with Coin <br/>Collaborates with Player  |
| **Class Methods:**                                                                                                                                                                                              | **Class Collaborations (other classes):** |
| `__init__()`: sets up the shop menu <br/>`__str__()`: Makes the str() function work with the shop <br/>`buy()`: Helps the Player buy collectibles from the shop <br/>`sell()`: Helps the Player sell collectibles from the shop | Inherits from Environment <br/>Collaborates with PyGame <br/>Collaborates with Coin <br/>Collaborates with Player |
| **Class Variables:**                                                                                                                                                                                            | **Class Collaborations (other classes):** |
|                                                                                                                                                                                                                 |  |

### Game CRC Card

| Class name: Game (self)                                                                                                                                                                                                                                                                                                                                                                                                   |  |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                     | **Class Collaborations (other classes):** |
| `self.size`		\# initializes the screen size  <br/>`self.running` 	\# initializes whether or not the game is running <br/>`self.screen` 	\#initializes the screen by using `pygame.display` <br/>`self.environment`	\# initializes the environment by using the Environment class <br/>`self.clock` 	\# initializes a clock object that keeps track of time <br/>`self.player`	\# initializes the player object            | Collaborates with PyGame <br/>Collaborates with Player <br/>Collaborates with good\_NPC <br/>Collaborates with bad\_NPC <br/>Collaborates with Shop <br/>Collaborates with Environment <br/>Collaborates with Obstacle  |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                        | **Class Collaborations (other classes):** |
| `__init__()`: Sets up all the necessary information to build the game canvas and logic <br/>`__str__()`: Makes the str() function work with the Game <br/>`run()`: Runs the game itself with the collaboration of all the aforementioned classes.                                                                                                                                                                         | Collaborates with PyGame <br/>Collaborates with Player <br/>Collaborates with good\_NPC <br/>Collaborates with bad\_NPC <br/>Collaborates with Shop <br/>Collaborates with Environment <br/>Collaborates with Obstacle |
| **Class Variables:**                                                                                                                                                                                                                                                                                                                                                                                                      | **Class Collaborations (other classes):** |
|                                                                                                                                                                                                                                                                                                                                                                                                                           |  |


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

### ❗Errors and Constraints

❗Every program has bugs or features that had to be scrapped for time. These bugs should be tracked in the issue queue. 
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
    Partner 2: **Replace this with your reflection
```

---