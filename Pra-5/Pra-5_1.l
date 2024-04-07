%{
#include <stdio.h>
int total_lines = 0;
%}

%%
\n { 
    ECHO;
    total_lines++;
}
. { 
    ECHO;
}
%%

int yywrap() {
  return 1;
}

int main() {
  yyin = fopen("Pra-5.txt", "r");
  if (yyin == NULL) {
    fprintf(stderr, "Error opening files\n");
    return 1;
  }
  yylex();
  fclose(yyin);
  printf("\nNo. Of Lines: %d\n", total_lines);
  return 0;
}