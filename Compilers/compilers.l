%{
	#include "y.tab.h"
	#include <string.h>
	#pragma GCC diagnostic push
	#pragma GCC diagnostic ignored "-Wint-conversion"
%}
%%

("if")										{return If;}
("then")									{return Then;}
("else")									{return Else;}
("switch")									{return Switch;}
("case")									{return Case;}
(":")										{return Colon;}
("repeat")									{return Repeat;}
("until")									{return Until;}
("return")									{return Return;}
("start")									{return Start;}


("for")										{return For;}
("break")									{return Break;}
("default")								    {return Default;}
("while")									{return While;}
("int"|"char"|"string"|"float"|"bool"|"void") {yylval = strdup(yytext); return Keyword;}
("const")									{return Constant;}
("true"|"false")							{yylval = strdup(yytext); return Bool;}

("(")										{return OpenBracket;}
(")")										{return CloseBracket;}


("{")										{return OpenCurlyBrace;}
("}")										{return CloseCurlyBrace;}

("=")										{return Assignment;}
("zero")									{return Zero;}
[a-zA-Z_][a-zA-Z0-9_]*						{yylval = strdup(yytext); return Identifier;}		

(\".*\") 									{yylval = strdup(yytext); return String;}
[0-9]+\.[0-9]+								{yylval = atof(yytext); return Float;}
[0-9]+										{yylval = atoi(yytext); return Integer;}

(";")										{return Delimiter;}

(",")										{return Comma;}

("\+"|"-")									{yylval = strdup(yytext); return AddSub;}
("\*"|"/")									{yylval = strdup(yytext); return MulDiv;}
("/"\*(\n|[^\*"/"])*\*"/")											
("//".*)															

("=="|"!="|">"|"<"|">="|"<=")				{yylval = strdup(yytext); return Comparison;}
("&&"|"\|\|")								{yylval = strdup(yytext); return LogicOp;}

[ \t\n]+
%%

int yywrap(void){
	return 1;
}