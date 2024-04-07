%{
#include <stdio.h>
#include <string.h>
%}

DIGIT   [0-9]
LETTER  [a-zA-Z]
ID      {LETTER}({LETTER}|{DIGIT})*
NUMBER  {DIGIT}+(\.{DIGIT}+)?
PREPROSESSOR "#"{ID}
FILE    "<"{ID}"."{LETTER}">"
SPACE   [ \t\n]
KEYWORD "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"

%%
{KEYWORD}                           { printf("Keyword: %s\n", yytext); }
{ID}                                { printf("Identifier: %s\n", yytext); }
{NUMBER}                            { printf("Number: %s\n", yytext); }
{PREPROSESSOR}                      { printf("Preprosessor: %s\n", yytext); } 
{FILE}                              { printf("File: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="                 { printf("Operator: %s\n", yytext); }
"=="|">"|"<"|">="|"<="|"!="         { printf("Relational operator: %s\n", yytext); }
{SPACE}                             ;
.                                   ;

%%

int yywrap(){
    return 1;
}

int main() {
    yyin = fopen("Hello.c", "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error opening files\n");
    return 1;
  }    
    yylex();
    return 0;
}
