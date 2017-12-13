/* Author: Rajendra Bhagroo, Chirs Guevarra */

 
/*
----------------------------------------------------------------------------------
README
----------------------------------------------------------------------------------

If Prolog Is Installed Or Prolog IDE Used, See Sample Input And Run Program

----------------------------------------------------------------------------------

TABLE
|---------------------------------------------|
| NDFA    States   |   a   |   b  |  Epsilon  |
|---------------------------------------------|
|	   1       |  2,3  |  []  |    []     |
|	   2       |  []   |  5   |    []     |
|	   3       |  4    |  []  |    []     |
|	   4       |  []   |  5   |    []     |
|	   5       |  []   |  []  |    1      |
|---------------------------------------------|

Initial State  : 1
Accepting State: 1

----------------------------------------------------------------------------------

To Use On Linux Based Systems

1. Open Terminal [Ctrl + Alt + T]
2. Run Command   [sudo apt-get install swi-prolog] 
3. Change Directory [cd] To Directory Of Prolog Program [PrologProgram.pl] 
4. Run Command   [prolog] To Launch Prolog CLI
5. Run command   [consult('PrologProgram.pl').] To Connect To Your KnowledgeBase

----------------------------------------------------------------------------------

SAMPLE INPUT: 

?- parse([a,b,[]]).

s1  [a,b,[]]
s2  [b,[]]
s5  [[]]
s1  []

true .

---------------------------------------------------------------------------------- 

SAMPLE INPUT: 

?- parse([a,b,[]]).

s1  [a,b,[]]
s2  [b,[]]
s5  [[]]
s1  []

true .

---------------------------------------------------------------------------------- 

SAMPLE INPUT:

?- parse([a,a,a]).

s1  [a,a,a]
s1  [a,a,a]
s3  [a,a]

false.



*/



/* 
Program Parses Through Non-Deterministic Finite Automata [NFA or NDFA]
States Are [1,2,3,4,5,[]]
Inputs Are [a,b,Epsilon]
'lambda' Represents Epsilon Input
*/

parse(L) :- start(S), 
            trans(S,L).

trans(X,[A|B]) :- 
      move(X,Y,A),   /*  X ---A---> Y */
      write(X),
      write('  '),
      write([A|B]),
      nl,
      trans(Y,B).  
	  
trans(X,[]) :- 
      final(X),
      write(X),
      write('  '),
      write([]), nl.  

trans(X,[A|B]) :- 
      lambda(X,Y,A),   /*  X ---A---> Y */
      write(X),
      write('  '),
      write([A|B]),
      nl,
      trans(Y,B). 

	  
move(s1,s2,a).
move(s1,s3,a).
move(s2,s5,b).
move(s3,s4,a).
move(s4,s5,b).
lambda(s5,s1,[]).
start(s1).

final(s1).
