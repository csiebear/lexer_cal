lexer_cal:lex.yy.c
	gcc lex.yy.c -ll
lex.yy.c:cal.l
	flex cal.l
