lexer grammar LangDialectsNPLexer;

@lexer::members {
	public static bool java5 = false;
}

tokens { ENUM }

LB: '{';
RB: '}';
COMMA : ',';
//ENUM :  {java5}? 'enum';  removed as an explicit token definition
SEMI : ';';
ASSIGN : '=';

ID : [a-zA-Z][a-zA-Z0-9]* {
	if ( java5 && Text == "enum") { Type = ENUM; }
};
INT : [0-9]+;

// Unfortunately against all rules . matched even the \n
// that's why it must be supplemented with ? non-greedy operator
COMMENTS : '//'.*?('\r'?'\n'|EOF) ->skip;

WS	: [ \t\n\r]+ -> skip
	;