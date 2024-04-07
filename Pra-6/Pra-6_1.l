%{
#include <stdio.h>
int total_chars = 0;
int total_words = 0;
int total_lines = 0;
%}

%%
\n { 
    total_lines++;
}
[a-zA-Z]* {
    total_words++;
    total_chars += yyleng;
}
[ ,.] {}
%%

int yywrap() {
    total_lines++;
    return 1;
}

int main() {
  yyin = fopen("Pra-6.txt", "r");
  if (yyin == NULL) {
    fprintf(stderr, "Error opening files\n");
    return 1;
  }
  yylex();
  fclose(yyin);
  printf("Total Characters: %d\n", total_chars);
  printf("No. Of Words: %d\n", total_words);
  printf("No. Of Lines: %d\n", total_lines);
  return 0;
}