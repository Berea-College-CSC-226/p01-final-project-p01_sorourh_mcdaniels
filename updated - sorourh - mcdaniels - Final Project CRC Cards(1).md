# World & Animals (Node2D) CRC Card

| Instance name: World (Node2D) world.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| N/A | Collaborates with CharacterBody2D Collaborates with CollisionShape2D Collaborates with Camera2D Collaborates with AnimatedSprite2D Collaborates with Area2D Collaborated with TileMapLayer |
| **Class Methods:**  |  |
| initialization Creates a Node2D object that holds all relative classes & files for processing |  |

## 

## Player & Animals (CharacterBody2D) CRC Card

| Instance name: Player (CharacterBody2D) player.tscn player.gd Instance name: Animals (CharacterBody2D) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that holds the object’s sprite within AnimatedSprite2D self.layer    \# instance variable that holds the object’s position on the main physics 2D layers self.mask     \# instance variable that holds the layers in which the object will look to collide with \*more built-in attributes that we don’t edit upon instantiation | Each: Inherits from CharacterBody2D Collaborates with CollisionShape2D Collaborates with Camera2D Collaborated with AnimatedSprite2D Animals Instances: Collaborates with Area2D |
| **Class Methods:**  |  |
| initialization Creates a CharacterBody2D object that offers a physic body to be controlled by the user Player Instance (player.gd): \_process(): It gets called every frame, handles input reading, velocity, animation updates, and checks if the player has collected all animals to trigger the win condition  \_physics\_process(\_delta): It creates the movement of the player and handle collisions SetDirection(): It checks if the cardinal direction changes based on the input , returns true if there is a change in direction, otherwise, returns false SetState(): It checks whether the state has changed or not Returns true if there is a change in state, otherwise, returns false UpdateAnimation(): It gets the animation scene name necessary based on the state and direction  AnimDirection(): Returns the direction of the player to help load the correct animation scene add\_to\_party(anima: Node2D): When the player hits the Area2D of an animal, add to the party. The first animal added to the party array follows the player, otherwise, the new animal follows the animal that joined right before it. Animal Instance ([animal.gd](http://animal.gd)): \_ready(): It gets called once when the node enters the scene tree It connects the Area2D signal and plays the default idle animation before the animal gets picked up \_physics\_process(): It gets called every physics frame, moves the animal toward its follow target It skips all logic if the animal is IDLE or no target gets assigned start\_following(): It gets called by the player node to get animal into party It sets the follow target to either the player or the animal ahead \_update\_cardinal(): It updates which cardinal direction (up, down, left, right) the animal is moving toward \_anim\_direction(): It return the animal direction, to build the correct animation \_play\_anim(new\_state: String): It gets the animations of the player and plays it \_on\_body\_entered(body: Node): It gets triggered when any body enters the animal's Area2D Only reacts if the animal is still idle and the body that entered is the player  |  |

### CollisionShape2D CRC Card

| Class name: CollisionShape2D player.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.shape  \# instance variable that defines the body shape and size of the associated CharacterBody2D \*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D Collaborates with Area2D |
| **Class Methods:**  |  |
| initialization Creates a CollisionBody2D object that provides the associated CharacterBody2D a physical body to collide other classes with |  |

### Camera2D CRC Card

| Class name: Camera2D player.tscn |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.example  \# instance variable that … \*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D |
| **Class Methods:**  |  |
| initialization Creates a Camera2D object that forces the screen to follow the associated CharacterBody2D |  |

### AnimatedSprite2D CRC Card

| Class name: AnimatedSprite2D player.tscn player.gd |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that holds the object’s sprite within AnimatedSprite2D \*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D |
| **Class Methods:**  |  |
| initialization Creates an AnimatedSprite2D object that carries multiple textures as animation frames |  |

### Area2D CRC Card

| Class name: Area2D |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.example  \# instance variable that … \*more built-in attributes that we don’t edit upon instantiation | Collaborates with CharacterBody2D Collaborates with CollisionShape2D |
| **Class Methods:**  |  |
| initialization Creates an Area2D object, acting as an area that keeps track of collidables that enter its space |  |

## Grass & Path & Bounds & Objects (TileMapLayer) CRC Card

| Instance name: Grass & Path & Bounds & Objects (TileMapLayer) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| Each: self.layer    \# instance variable that holds the object’s position on the main physics 2D layers self.mask     \# instance variable that holds the layers in which the object will look to collide with Self.tileset  \# instance variable that holds the sprite(s) reference(s) for tile painting Path & Bounds: Self.terrain \# instance variable that holds a series of terrain sets to be used to paint the current tileset with a unique identity (assists with autotiling to differentiate specific parts of a single tile) Bounds & Objects: self.layer    \# instance variable that holds the object’s position on the main physics 2D layers \*more built-in attributes that we don’t edit upon instantiation | Collaborates with World Bounds & Objects: Collaborates with Player |
| **Class Methods:**  |  |
| initialization Creates a TileMapLayer object that uses a tileset within a grid-based system to provide layout to a 2D scene |  |

### 

## Main Menu CRC Card

| Class name: MainMenu |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.panel \#added the video to autoplay, expand and loop throughout the screen self.texture \# changed it to nearest to decrease the blurriness  self.start \# a button to restart the game self.exit \# a button to quit the game  self.fontcolor \# change the font color self.fontcolor\_focus \# change the font when the button is focused on self.fontcolor\_hover \#change the font when the button is hovered upon by the user self.style\_hover \# changed the style when hovered upon the button self.style\_normal \# change the style of the button self.style\_hover \# changed the style of the button when hovered self.style\_focus  \# changed the style of the button when focused on self.title \# adds the title of the game as a label self.objective \# adds the objective of the game as a label | Collaborates with Control Collaborates with Buttons  Collaborates with Label Collaborates with Panel Collaborates with VideoStream |
| **Class Methods:**  |  |
| \_on\_start\_pressed(): When the start button is pressed, go to the world scene where the actual gameplay is \_on\_exit\_pressed(): When the exit button is pressed, quit the program  |  |

### 

## Winning Screen CRC Card

| Class name: WinMenu |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.panel \#added the video to autoplay, expand and loop throughout the screen self.texture \# changed it to nearest to decrease the blurriness  self.restart \# a button to restart the game self.exit \# a button to quit the game  self.fontcolor \# change the font color self.fontcolor\_focus \# change the font when the button is focused on self.fontcolor\_hover \#change the font when the button is hovered upon by the user self.style\_hover \# changed the style when hovered upon the button self.style\_normal \# change the style of the button self.style\_hover \# changed the style of the button when hovered self.style\_focus  \# changed the style of the button when focused on self.win \# adds the winning label | Collaborates with Control Collaborates with Buttons  Collaborates with Label Collaborates with Panel Collaborates with VideoStream |
| **Class Methods:**  |  |
| \_on\_restart\_pressed(): When the restart button is pressed, go to the main menu scene. \_on\_exit\_pressed(): When the exit button is pressed, quit the program  |  |

