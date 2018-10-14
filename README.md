# Martian Robots

Command and control a fleet of robots as they explore the strange rectangular surface of the red planet! Ray-guns not included.

## The Problem:

The surface of Mars can be modelled by a rectangular grid around which robots are able to
move according to instructions provided from Earth. You are to write a program that
determines each sequence of robot positions and reports the final position of the robot.

A robot position consists of a grid coordinate (a pair of integers: x-coordinate followed by
y-coordinate) and an orientation (N, S, E, W for north, south, east, and west).

A robot instruction is a string of the letters “L”, “R”, and “F” which represent, respectively, the
instructions:

- Left : the robot turns left 90 degrees and remains on the current grid point.
- Right : the robot turns right 90 degrees and remains on the current grid point.
- Forward : the robot moves forward one grid point in the direction of the current orientation and maintains the same orientation.

The direction North corresponds to the direction from grid point (x, y) to grid point (x, y+1).

There is also a possibility that additional command types may be required in the future and
provision should be made for this.

Since the grid is rectangular and bounded (...yes Mars is a strange planet), a robot that
moves “off” an edge of the grid is lost forever. However, lost robots leave a robot “scent” that
prohibits future robots from dropping off the world at the same grid point. The scent is left at
the last grid position the robot occupied before disappearing over the edge. An instruction to
move “off” the world from a grid point from which a robot has been previously lost is simply
ignored by the current robot.

## The Input

The first line of input is the upper-right coordinates of the rectangular world, the lower-left
coordinates are assumed to be 0, 0.

The remaining input consists of a sequence of robot positions and instructions (two lines per
robot). A position consists of two integers specifying the initial coordinates of the robot and
an orientation (N, S, E, W), all separated by whitespace on one line. A robot instruction is a
string of the letters “L”, “R”, and “F” on one line.

Each robot is processed sequentially, i.e., finishes executing the robot instructions before the
next robot begins execution.

The maximum value for any coordinate is 50.

All instruction strings will be less than 100 characters in length.

## The Output

For each robot position/instruction in the input, the output should indicate the final grid
position and orientation of the robot. If a robot falls off the edge of the grid the word “LOST”
should be printed after the position and orientation.

Sample Input:

```
5 3
1 1 E
RFRFRFRF
3 2 N
FRRFLLFFRRFLL
0 3 W
LLFFFLFLFL
```

Sample Output:

```
1 1 E
3 3 N LOST
2 3 S
```

## Approach

My first task is to go over the brief and extract any keywords that seem pertinent to the task at hand.

The reasons for this is two fold:

- First, by simplifying the brief down to it's most basic units of knowledge and their interactions, it allows me to form a clearer idea of what I'm actually building, hopefully helping me to avoid feature creep and a bloated piece of software.
- Second, once I have identified these basic units, I can begin experimenting with diagraming and spiking to improve my understanding of the task before I begin in earnest.

**Note** these keywords are not etched in stone nor exhaustive and can (should) be altered, pruned and added to as my knowledge of the system improves.

Identified Keywords:

```
Surface
Mars
Grid
Robot
Move
Earth
Sequence
Position
Coordinate
Orientation
Direction
Turn
North, East, South, West
Instruction, Command
Left, Right, Forward
Edge
Lost
Scent
Input
Maximum (coordinate) value
Output
World
```

With the keywords extracted the next step is to roughly categorize them, splitting the keywords into nouns, verbs and adjectives seems a good way to loosely identify keywords that may be objects, methods and properties respectively.

**Note** Some nouns seem to implicitly suggest an action so some liberties are taken in their interpretation. E.g. Instruction becomes Instruct.

| Nouns         |      Verbs       | Adjectives |
| ------------- | :--------------: | ---------: |
| Surface       |       Move       |       Lost |
| Mars          | Instruct/Command |            |
| Grid          |       Turn       |            |
| Robot         |                  |            |
| Earth         |                  |            |
| Sequence      |                  |            |
| Position      |                  |            |
| Coordinate    |                  |            |
| Direction     |                  |            |
| Edge          |                  |            |
| Scent         |                  |            |
| Input         |                  |            |
| Maximum Value |                  |            |
| Output        |                  |            |

Once catergorized I have enough to sketch out how such a system might look.

The process of plotting how the objects might interact without each other highlights a number of considerations:

- Surface and Mars seem to refer to the same thing and could be embodied in a single term. In this case I choose surface as it is less specific. Handy if I ever want to visit Venus!
- Grid at first seems to be the same as Surface but I believe it refers to a specific property of a surface.
- The purpose of this task is to land robots on the Surface so it follows that a Surface can contain Robots, but that they are their own discreet entity.
- Whilst not explicitly mentioned in the brief, in order to get a robot onto the Surface it must be landed, highlighting a new verb 'Land'. This tallies with the first instruction supplied to a robot as outlined in the brief.
- Robots can also be instructed to move and turn, These alter its Position and Orientation respectively.
- The brief mentiones that the instructions for the Robots come from Earth. Since I decided to refer to Mars as surface it would seem useful to use a less specific term for Earth, in this case I opted for Control. After all, I might be commanding the robots on Venus from my Mars base one day!
- Control's job seems to be processing input into instructions.
- Instructions can send a Robot off a Surface's Edge, this Robot will then become Lost.
- When a Robot is lost it leaves behind a Scent on the surface where it was last seen.
- A Surface can have many Scents.
- Scents mark the last position and orientation of a Robot before it was lost.
- A scent prohibits a Robot from moving in the same direction as the robot that left it behind.
- A Surface can contain many Robots, it also seems responsible that control should know about it's active robots too.
- Limits are imposed in terms of Maximum (coordinate) Value (50) and a Maximum instruction string length (100).
- The Coordinates all refer to the surface so it seems sensible that the Maximum (coordinate) Value should reside there.
- Instructions are processed by Control so the Maximum Instruction Length should be there.
- The last piece is the Output which updates the user as to the current Robot statuses. It would be tempting to let Control handle this but this seems like an extra responsibility. Instead I believe Control should have a renderer which handles the rendering of output.
- For the sake of simplicity I'll render things to to STDOUT for this exercise since the brief explicity states that UI isn't the focus of this exercise.

![Rough Domain Model](/ReadmeImages/Diagram.jpg)

Going through this pricess helps me move the nouns, verbs and adjectives into potential Objects, Methods and Attributes:

| Objects  |            Methods            |                               Attributes |
| -------- | :---------------------------: | ---------------------------------------: |
| Surface  |                               | Grid, Edge, Max Coordinate Value, Robots |
| Robot    | Move, Turn, Land, Leave Scent |              Orientation, Position, Lost |
| Control  |           Instruct            | Max Instruction Length, Renderer, Robots |
| Renderer |            Render             |                                          |
| Scent    |       Prohibit Movement       |                    Orientation, Position |

**Note** Again, these are not a concrete rules, rather a jumping off point.

With my Domain roughly modeled I can start looking at producing the actual code. This may seem like a long winded way to get to this point but I find that it makes all the actual implementation that much more straight forward.

The development of this program will be test driven, starting with the smallest discreet units and expanding from there.

Before I start this process however there is one outstanding issue. Based on my research and experience around modelling coordiantes and grids in a program I will likely need to use a 2D array or Matrix. This is not something I am hugely experienced with so my first port of call is to just spend a few minutes in IRB spiking a single grid to improve my understanding of how this might work in practice.

## Notes

All the relevant positions of active entities are stored in their respective robots and scents. The surface doesn't seem to have any responsibility for providing coordinates for entities locating on it.

This suggests to me two possibilities:

- I don't need to update the surface constantly, I only need to populate it when it is being rendered to the user.

- My distribution of responsibilities is off and I could move that responsibility into the surface.
