parser grammar DialectsPar;

options { tokenVocab = DialectsLex; }

@parser::members{
	public static bool java5=false;
}

compileUnit
	:	( stat | {java5}? enumDecl )+
	;

stat : id ASSIGN expr SEMI ;

expr :   id 
	   | INT
	   ;

enumDecl : ENUM name=id LB id (COMMA id)* RB;

id : ID
   | {!java5}? ENUM
	 ;