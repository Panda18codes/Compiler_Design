%{
#include <stdio.h>
%}
WORD [a-zA-Z]+
TAG "<"{WORD}">"

%%
{TAG} { printf("TAG: %s\n", yytext); }
\n {}
. {}
%%

int yywrap() { 
    return 1; 
}

int main() {
  yyin = fopen("Pra-7.html", "r");
  if (yyin == NULL) {
    fprintf(stderr, "Error opening files\n");
    return 1;
  }
  yylex();
  fclose(yyin);

  /* 
    {TAG} {
        flag = true;
    }
    {CLOSE_TAG} {
            if(flag == true){
                flag = false;
            }
        }

  */
  return 0;
}