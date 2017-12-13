/* Author: Rajendra Bhagroo */

 
/*
----------------------------------------------------------------------------------
README
----------------------------------------------------------------------------------

If Prolog Is Installed Or Prolog IDE Used, See Sample Input And Run Program

----------------------------------------------------------------------------------

TABLE
|---------------------------------|
| NDFA     States     a    |   b  |
|---------------------------------|
|	   1       |  2,3  |  4   |      
|	   2       |  []   |  4   |      
|	   3       |  4    |  3   |
|	   4	   |  []   |  []  |
|---------------------------------|

Initial State  : 1
Accepting State: 4

----------------------------------------------------------------------------------

To Use On Linux Based Systems

1. Open Terminal [Ctrl + Alt + T]
2. Run Command   [sudo apt-get install swi-prolog] 
3. Change Directory [cd] To Directory Of Prolog Program [PrologProgram.pl] 
4. Run Command   [prolog] To Launch Prolog CLI
5. Run command   [consult('PrologProgram.pl').] To Connect To Your KnowledgeBase

----------------------------------------------------------------------------------

SAMPLE INPUT: 

?- accept([a,b,a]).

1  [a,b,a]
2  [b,a]
4  [a]
1  [a,b,a]
3  [b,a]
3  [a]
4  []

Input Accepted

true .

---------------------------------------------------------------------------------- 

SAMPLE INPUT: 

?- accept([a,a,b]).

1  [a,a,b]
2  [a,b]
1  [a,a,b]
3  [a,b]
4  [b]

false.

*/



/* 
Program Parses Through Non-Deterministic Finite Automata [NFA or NDFA]
States Are [1,2,3,4,[]] Where [] Is Null String
Inputs Are [a,b]
*/


initial(1).
final(4). 					 /* Accepting State */

move(1,a,2).
move(1,a,3).
move(1,b,4).

move(2,a,[]).
move(2,b,4).

move(3,a,4).
move(3,b,3).

move(4,a,[]).
move(4,b,[]).


transition(X,[A|B]) :- move(X,A,Y),      	/* State 'X' -> Apply Input 'A' -> State 'Y'*/
                       write(X),
                       write('  '),
                       write([A|B]),
                       nl,
                       transition(Y,B).  


transition(X,[]) :- final(X),           	/* Runs When Final Letter In String Is Currently Within Accepting State */
                    write(X),
                    write('  '),
                    write([]),
                    nl,
     	            write("Input Accepted"),
                    nl.
     

accept(X) :- initial(S), 			/* Use Procedure To Handle Input Strings, SEE SAMPLE INPUTS AT TOP */
             transition(S,X).
