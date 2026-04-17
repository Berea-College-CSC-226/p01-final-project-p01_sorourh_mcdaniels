## Player CRC Card

| Class name: Player (self, texture) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that holds the object’s sprite <br>self.wallet   \# instance variable that holds the value of the amount of Coins | Composes with PyGame Collaborates with Coin |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_(): Creates a Player object that can move around the world and collect coins \_\_str\_\_(): Makes the str() function work with the Player movement(): Moves the Player across the tilemap per tile attack(): Depletes attack\_power() from current battling bad\_NPC’s health | Composes with PyGame Collaborates with Coin |
| **Class Variables:**  | **Class Collaborations (other classes):** |
| attack\_power: A variable that holds a set amount of damage that will be dealt to a bad\_NPC’s health upon a hit health: Variable that holds an integer amount; is depleted from when bad\_NPC attacks  |  |

## NPC CRC Card

| Class name: NPC (self, texture, is\_random \= False, is\_key \= False, key\_dialogue \= None, region \= None)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |  |
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| :---- |
| **Class Attributes:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | **Class Collaborations (other classes):** |
| self.texture			\# instance variable that sets the object’s sprite to the sprite parameter <br>self.is\_random \= False 	\# instance Boolean that declares whether the NPC will remain stationary or move randomly within their region <br>self.is\_key \= False		\# instance Boolean that declares whether the NPC is a key NPC (unique dialogue/action; boss or important person) or a default NPC (draws dialogue randomly from a set list) <br>self.key\_dialogue \= None	\# optional (only for those meant to be key NPC’s); instance variable that is set to the key\_dialogue parameter to be unique for every instance of a key NPC object <br>self.region \= None		\# optional (only for NPC’s that do not remain stationary); instance variable that is set to the region parameter that declares where the NPC will idly walk around at | Composes with pygame Composes with Player  |
| **Class Methods:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | **Class Collaborations (other classes):** |
| \_\_init\_\_():  Creates an NPC object that interacts with the player and may move idly; can be Key or not (provides unique dialogue); can be stationary or not (has an associated region in which to wander) \_\_str\_\_(): Makes the str() function work with the NPCs movement(): If the current NPC has an associated region, have them move per tile within the boundaries of it; else, have them stay still                                                                                                                                                                                                                                                                                                                                                                                                                                 | Composes with pygame  Composes with Player |
| **Class Variables:**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | **Class Collaborations (other classes):** |
| default\_dialogue: List of pre-determined dialogue options for NPC’s to display upon interaction if is\_key returns False                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |  |

## Bad NPC CRC Card

| Class name: bad\_NPC (self, texture) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that sets the object’s sprite to the sprite parameter | Inherits from NPC  |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_():  Creates an NPC object with the additions of health and attack\_power \_\_str\_\_(): Makes the str() function work with the badNPC attack(): Depletes attack\_power from Player’s health initiate\_battle(): (like interaction())If the current NPC is a key NPC, display their unique dialogue; else, draw randomly from default\_dialogue; loop attack() back and forth between Player and bad\_NPC; if bad\_NPC health reaches 0, collect() | Inherits from NPC Collaborates with Coin |
| **Class Variables:**  | **Class Collaborations (other classes):** |
| attack\_power: A variable that holds a set amount of damage that will be dealt to the Player’s health upon a hit health: Variable that holds an integer amount; is depleted from when bad\_NPC attacks |  |

## Good NPC CRC Card

| Class name: good\_NPC (self) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture		\# instance variable that sets the object’s sprite to the sprite parameter self.has\_interacted	\# instance Boolean that declares whether the Player has interacted with the good\_NPC before | Inherits from NPC  |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_():  Creates an NPC object with the additions of health and attack\_power \_\_str\_\_(): Makes the str() function work with the good NPC interaction(): Sets has\_interacted to True and calls collect(); if the current NPC is a key NPC, display their unique dialogue; else, draw randomly from default\_dialogue | Inherits from NPC Collaborates with Coin |
| **Class Variables:**  | **Class Collaborations (other classes):** |
|  |  |

## Environment CRC Card

| Class name: Environment (self) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that sets the object’s sprite to the sprite parameter  | Collaborates with PyGame Collaborates with Player Collaborates with NPC  |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_(): Sets up the current environment in which the player will explore \_\_str\_\_(): Makes the str() function work with the Environment setup\_start\_menu(): Sets up the start screen, where the user can start or exit the game. setup\_pause(): Sets up the pause/menu screen, in which the user can continue/exit the game setup\_spawn(): Set up the spawn point for the player setup\_town(): Set up the environment, Town setup\_shop(): Set up the environment, Shop | Collaborates with PyGame Collaborates with Player Collaborates with NPC  |
| **Class Variables:**  | **Class Collaborations (other classes):** |
| environment\_name: A list containing the different environments   |  |

## Obstacle CRC Card

| Class name: Obstacle (self, texture, is\_interactable \= False) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture		\# instance variable that sets the object’s sprite to the sprite parameter self.is\_interactable	\# instance Boolean that declares whether the object will present the option to interact or not self.dialogue		\# instance variable that holds what the Obstacle says upon interaction()  | Collaborates with PyGame Collaborates with Player Collaborates with good\_NPC Collaborates with bad\_NPC   |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_(): Sets up the different attributes of the obstacle being created \_\_str\_\_(): Makes the str() function work with the different obstacles interaction(): If is\_interactable is True, allows player the option to view dialogue from the Obstacle | Collaborates with PyGame Collaborates with Player Collaborates with good\_NPC Collaborates with bad\_NPC |
| **Class Variables:**  | **Class Collaborations (other classes):** |
|  |  |

## Coin CRC Card

| Class name: Coin (self) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that sets the object’s sprite to the sprite parameter self.amount	\# the current amount of coins    | Collaborates with PyGame Collaborates with Environment Collaborates with Player  |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_(): Creates the currency that will be used inside of the game \_\_str\_\_(): Makes the str() function work with the Coin collect(): Randomly adds to the amount of Coins to the player's wallet attribute.   | Collaborates with PyGame Collaborates with Environment Collaborates with Player |
| **Class Variables:**  | **Class Collaborations (other classes):** |
|  |  |

## Shop CRC Card

| Class name: Shop (self) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.texture  \# instance variable that sets the object’s sprite to the sprite parameter     | Inherits from Environment  Collaborates with PyGame Collaborates with Coin Collaborates with Player  |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_(): sets up the shop menu \_\_str\_\_(): Makes the str() function work with the shop buy(): Helps the Player buy collectibles from the shop sell(): Helps the Player sell collectibles from the shop | Inherits from Environment Collaborates with PyGame Collaborates with Coin Collaborates with Player |
| **Class Variables:**  | **Class Collaborations (other classes):** |
|  |  |

## Game CRC Card

| Class name: Game (self) |  |
| :---- | :---- |
| **Class Attributes:**  | **Class Collaborations (other classes):** |
| self.size		\# initializes the screen size  self.running 	\# initializes whether or not the game is running self.screen 	\#initializes the screen by using pygame.display self.environment	\# initializes the environment by using the Environment class self.clock 	\# initializes a clock object that keeps track of time self.player	\# initializes the player object     | Collaborates with PyGame Collaborates with Player Collaborates with good\_NPC Collaborates with bad\_NPC Collaborates with Shop Collaborates with Environment Collaborates with Obstacle  |
| **Class Methods:**  | **Class Collaborations (other classes):** |
| \_\_init\_\_(): Sets up all the necessary information to build the game canvas and logic \_\_str\_\_(): Makes the str() function work with the Game run(): Runs the game itself with the collaboration of all the aforementioned classes.  | Collaborates with PyGame Collaborates with Player Collaborates with good\_NPC Collaborates with bad\_NPC Collaborates with Shop Collaborates with Environment Collaborates with Obstacle |
| **Class Variables:**  | **Class Collaborations (other classes):** |
|  |  |

