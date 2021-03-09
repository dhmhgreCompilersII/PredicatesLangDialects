lexer grammar LexDialectsLexer;

@lexer::members {
	public static bool java5 = false;
}

LB: '{';
RB: '}';
COMMA : ',';
ENUM :  {java5}? 'enum';
SEMI : ';';
ASSIGN : '=';

ID : [a-zA-Z][a-zA-Z0-9]*;
INT : [0-9]+;

// Unfortunately against all rules . matched even the \n
// that's why it must be supplemented with ? non-greedy operator
COMMENTS : '//'.*?('\r'?'\n'|EOF) ->skip;

WS	: [ \t\n\r]+ -> skip
	;
