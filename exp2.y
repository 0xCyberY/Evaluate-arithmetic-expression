%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
int yyparse();
%}
%token num
%left '+''-'
%left '*''/'
%%
input:exp {printf("%d\n",$$),exit(0);}
exp:exp'+'exp {$$=$1+$3;}
|exp'-'exp {$$=$1-$3;}
|exp'*'exp {$$=$1*$3;}
|exp'/'exp {if($3==0) {printf("Devision by zero erorr\n"),exit(0);}
else
$$=$1/$3;}
|'('exp')' {$$=$2;}
|num {$$=$1;}
%%
int yyerror()
{
printf("Erorr\n");
exit(0);
}
int main()
{
printf("Enter the expression\n");
yyparse();
}
