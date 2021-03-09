lexer grammar DialectsLex;


LB: '{';
RB: '}';
COMMA : ',';
ENUM : 'enum';
SEMI : ';';
ASSIGN : '=';

ID : [a-zA-Z][a-zA-Z0-9]*;
INT : [0-9]+;

// Unfortunately an against all rules . matched even the \n
// that's why in must be supplemented with ? non-greedy operator
COMMENTS : '//'.*?'\r'?'\n' ->skip;

WS	: [ \t\n\r]+ -> skip
	;
