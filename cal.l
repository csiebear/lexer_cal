%{
void yyerror();
%}

digit [0-9]
int_const {digit}+
%%
{int_const}	{	printf("INTEGER_CONST %s ",yytext);	}
"+"		{	printf(" PLUS ");	}
"*"		{	printf(" MULT ");	}
"-"		{	printf(" MINUS ");	}
"/"		{	printf(" DIVIDE ");	}
[ \t]*		{}//ignore the \t and blank
[\n]		{	yylineno++;	}//the variable (line number)++

.		{	fprintf(stderr,"lexer");
			yyerror();
			exit(1);
		}

%%
main(){
	yylex();
	return 0;
}

void yyerror(){
	extern int yylineno;
	extern char *yytext;
	fprintf(stderr,"Error:at symbol \"%s\" on line %d\n",yytext,yylineno);
}
