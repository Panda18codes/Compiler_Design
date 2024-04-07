%{
#include <stdio.h>
%}

DIGIT   [0-9]
WORD    [a-zA-Z]+
SPACE   [ \t\n]

%%
{DIGIT}+    { printf("Number: %s\n", yytext);}
[a-zA-Z]    { printf("Character: %s\n", yytext);}
{WORD}      { printf("Word: %s\n", yytext);}
{SPACE}     ; /* Ignore whitespace */
.           { printf("Other: %s\n", yytext);}
%%

int yywrap(){
    return 1;
}

int main() {
    printf("Enter String: ");
    yylex();
    return 0;
}
