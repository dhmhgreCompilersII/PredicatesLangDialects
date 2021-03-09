parser grammar LexDialectsParser;

options { tokenVocab = LexDialectsLexer; }

compileUnit
	:	( stat | enumDecl )+
	;

stat : ID ASSIGN expr SEMI ;

expr :   ID 
	   | INT
	   ;

enumDecl : ENUM name=ID LB ID (COMMA ID)* RB;


