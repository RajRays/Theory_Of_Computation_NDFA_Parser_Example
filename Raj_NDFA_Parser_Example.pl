/* Author: Rajendra Bhagroo */

 
/*
----------------------------------------------------------------------------------
README
----------------------------------------------------------------------------------

If Prolog Is Installed Or Prolog IDE Used, See Sample Input And Run Program

----------------------------------------------------------------------------------

TABLE
|------------------------------------------|
| NDFA     States     a     b   |  Epsilon |
|------------------------------------------|
|	   0       |  0,1  |  0   |    2   |
|	   1       |  []   |  2   |    []  |
|	   2       |  []   |  []  |    []  |
|------------------------------------------|

Initial State  : 0
Accepting State: 2

----------------------------------------------------------------------------------

To Use On Linux Based Systems

1. Open Terminal [Ctrl + Alt + T]
2. Run Command   [sudo apt-get install swi-prolog] 
3. Change Directory [cd] To Directory Of Prolog Program [PrologProgram.pl] 
4. Run Command   [prolog] To Launch Prolog CLI
5. Run command   [consult('PrologProgram.pl').] To Connect To Your KnowledgeBase

----------------------------------------------------------------------------------

SAMPLE INPUT: 

?- accept([a,a,a,b]).

0  [a,a,a,b]
0  [a,a,b]
0  [a,b]
0  [b]
0  [a,b]
1  [b]
2  []
Input Accepted

true .

---------------------------------------------------------------------------------- 

SAMPLE INPUT: 

?- accept([]).

[]
Input Accepted

true .

---------------------------------------------------------------------------------- 

SAMPLE INPUT:

?- accept([b,b,a,a]).

0  [b,b,a,a]
0  [b,a,a]
0  [a,a]
0  [a]
0  [a]
0  [a,a]

false.

*/



/* 
Program Parses Through Non-Deterministic Finite Automata [NFA or NDFA]
States Are [0,1,2]
Inputs Are [a,b,Epsilon]
'lambda' Represents Epsilon Input
*/

initial(0).
final(2). 					 /* Accepting State */

move(0,a,0).
move(0,a,1).
move(0,b,0).
move(1,b,2).
lambda(0,2).


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
    

accept([]) :-  lambda(0,2),			/* Handles Epsilon Input For Null String */
               write([]),
               nl,
               write("Input Accepted"),
               nl.


accept(X) :- initial(S), 			/* Use Procedure To Handle Input Strings, SEE SAMPLE INPUTS AT TOP */
             transition(S,X).
