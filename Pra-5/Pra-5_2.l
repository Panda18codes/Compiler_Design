%{
#include <stdio.h>
%}

start \/\*
end \*\/

%%

\/\/(.*) { 
    ECHO;
    printf("\n");
}

{start}.*{end} { 
    ECHO;
    printf("\n");
}

\n {}

. {}
%%

int yywrap() {
  return 1;  // Signal EOF (End Of File)
}

int main() {
  yyin = fopen("sample.c", "r");
  if (yyin == NULL) {
    fprintf(stderr, "Error opening files\n");
    return 1;
  }
  yylex();
  fclose(yyin);
  return 0;
}