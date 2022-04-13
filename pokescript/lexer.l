%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
stop    printf("Stop command received\n");
start   printf("Start command received\n"); 

[0-9]+ {
  yylval = strdup(yytext);
  return NUMBER;
}
[a-zA-Z]+ {
  yylval = strdup(yytext);
  return WORD;
}
[\n\t ]+ { /* do nothing */ }
%%