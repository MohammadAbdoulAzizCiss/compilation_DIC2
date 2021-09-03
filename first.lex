%{
    #include<stdio.h>
    #define SYMBOLE_VIRG 1
    #define SYMBOLE_PTN_VIRG 2
    #define SYMBOLE_OPEN_PARENTH 3
    #define SYMBOLE_CLOSE_PARENTH 4
    #define SYMBOLE_OPEN_BRACE 5
    #define SYMBOLE_CLOSE_BRACE 6
    #define SYMBOLE_OPEN_BRACKET 7
    #define SYMBOLE_CLOSE_BRACKET 8
    #define OPERATEUR_PLUS 9
    #define OPERATEUR_MOINS 10
    #define OPERATEUR_DIVISER 11
    #define OPERATEUR_MULTIPLIER 12
    #define OPERATEUR_ET 13
    #define OPERATEUR_OU 14
    #define OPERATEUR_NON 15
    #define OPERATEUR_AFFECTATION 16
    #define OPERATEUR_INF 17
    #define OPERATEUR_SUP 18
    #define INSTRUCTION_WHILE 19
    #define INSTRUCTION_CONTROLE_SI 20
    #define INSTRUCTION_CONTROLE_ALORS 21
    #define INSTRUCTION_CONTROLE_SINON 22
    #define INSTRUCTION_CONTROLE_RETOUR 23
    #define TYPE_ENTIER 24
    #define TYPE_ENTIER_TABLEAU 25
    #define DECLARATION_FONCTION 26
    #define FONCTION_SPECIALE_LIRE 27
    #define FONCTION_SPECIALE_ECRIRE 28
    #define NOM_VARIABLE 29
    #define NOMBRE 30
    #define MAIN_FUNCTION 31
    
    int errors = 0;
%}

vide        [\t \n]+
symbole     [\{\}\,\;()]
operateur_arithmetique [/-*+]
nombre      [0-9]+
lettre      [A-Za-z]
variable    {lettre}*(_?[0-9]*{lettre}*)?
declaration int
declaration_tableau int\[{nombre}\]

%%
{vide} {}
{nombre} {printf("NOMBRE : %s\n",yytext);}
"," {printf("symbole virgule \n");return SYMBOLE_VIRG ;}
";" {printf("symbole fin intruction  \n");return  SYMBOLE_PTN_VIRG;}
"(" {printf("symbole parenthese ouvrante \n");return  SYMBOLE_OPEN_PARENTH;}
")" {printf("symbole parenthese fermante \n");return SYMBOLE_CLOSE_PARENTH;}
"[" {printf("symbole crochet ouvrant\n");return SYMBOLE_OPEN_BRACE;}
"]" {printf("symbole crochet fermant\n");return SYMBOLE_CLOSE_BRACE;}
"{" {printf("symbole accolade ouvrante\n");return SYMBOLE_OPEN_BRACKET;}
"}" {printf("symbole accolade fermante\n");return SYMBOLE_CLOSE_BRACE;}
"+" {printf("operateur plus \n");return OPERATEUR_PLUS;}
"-" {printf("operateur moins \n");return OPERATEUR_MOINS;} 
"/" {printf("operateur division \n");return OPERATEUR_DIVISER;}
"*" {printf("operateur multiplication \n");return OPERATEUR_MULTIPLIER;}
"&" {printf("operateur et \n");return OPERATEUR_ET;}
"|" {printf("operateur ou \n");return OPERATEUR_OU;}
"!" {printf("operateur non \n");return OPERATEUR_NON;}
"=" {printf("operateur affectation \n");return OPERATEUR_AFFECTATION;}
"<" {printf("operateur inf \n");return OPERATEUR_INF;}
">" {printf("operateur sup \n");return OPERATEUR_SUP;}
WHILE {printf("instruction while \n");return INSTRUCTION_WHILE;}
SI {printf("instruction si \n");return INSTRUCTION_CONTROLE_SI;} 
ALORS  {printf("instruction alors\n");return INSTRUCTION_CONTROLE_ALORS;}
SINON {printf("instruction sinon\n");return INSTRUCTION_CONTROLE_SINON;} 
RETOUR {printf("instruction retour \n");return INSTRUCTION_CONTROLE_RETOUR;}
INT {printf("type identificateur entier\n");return TYPE_ENTIER;}
MAIN {printf("fonction main\n");return MAIN_FUNCTION;}
{declaration_tableau} {printf("type identificateur tableau  \n");return TYPE_ENTIER_TABLEAU;}
{variable} {printf("variable : %s\n",yytext);}
"lire()" {printf("fonction speciale lire \n");return FONCTION_SPECIALE_LIRE;}
"ecrire("{vide}?{variable}{vide}?")" {printf("fonction speciale ecrire \n");return FONCTION_SPECIALE_ECRIRE;}
%%
int yywrap(){
        printf("fin de fichiers, %d erreurs",errors);
        return 1;
}