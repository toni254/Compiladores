package com.upds.compilador.analisis;

import java_cup.runtime.Symbol;
import com.upds.compilador.model.Tokens;
import java.util.ArrayList;



%%

%{
    //Código de usuario
    public ArrayList<Tokens> listTokens = new ArrayList<Tokens>();
    String cadena= "";
%}

%cup
%class scanner
%public
%line
%char
%column
%full
%state CADENA


//simbolos

PAR_A   = "("
PAR_C   = ")"
LLAV_A  = "{"
LLAV_C  = "}" 
COMA    = ","
PYCOMA  = ";"
ASIGNA  = "="

//palabras reservadas

INT         = "int"
CHAR        = "char"
PUB         = "public"
PRI         = "private"
VOI         = "void"
PRINT       = "print"
BOOL        = "bool"
BREAK       = "breack"
CASE        = "case"
CHAR        = "char"
CONST       = "const"
CONTINUE    = "continue"
DEFAULT     = "default"
DO          = "do"
DOUBLE      = "double"
ELSE        = "else"
FALSE       = "false"
FLOAT       = "float"
FOR         = "for"
IF          = "if"
INT         = "int"
NAMESPACE   = "namespace"
RETURN      = "return"
STATIC      = "static"
SWITCH      = "switch"
TRUE        = "true"
USING       = "using"
VOID        = "void"
WHILE       = "while"
CIN>>       = "cin>>"
COUT<<      = "cout"
INCLUDE     = "#include"

//comparadores
MENOR    = "<"
MEOEQ    = "<="
MAYOR    = ">"
MAOEQ    = ">="
NEGEQ    = "!="
EQUAL    = "=="
NEGAR    = "!"
ANDLG    = "&&"
ORLG     = "||"

//operadores
ASIG    = "="
SUM     = "+"
RES     = "-"
MUL     = "*"
DIV     = "/"
MOD     = "%"
INC     = "++"
DEC     = "--"

//expresiones

ENTERO  = [0-9]+   
ID      = [A-Za-zñÑ][_0-9A-Za-zñÑ]*

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%

<YYINITIAL> {INT}           { return new Symbol(sym.INT, yyline, yycolumn,"entero");}
<YYINITIAL> {CHAR}          { return new Symbol(sym.CHAR, yyline, yycolumn,"caracter");}
<YYINITIAL> {PUB}           { return new Symbol(sym.PUB, yyline, yycolumn,"publico");}
<YYINITIAL> {PRI}           { return new Symbol(sym.PRI, yyline, yycolumn,"privado");}
<YYINITIAL> {VOI}           { return new Symbol(sym.VOI, yyline, yycolumn,yytext());}
<YYINITIAL> {PRINT}         { return new Symbol(sym.PRINT, yyline, yycolumn,yytext());}

//VARIABLES RESERVADAS
<YYINITIAL> {BOOL}           {return new Symbol(sym.BOOL, yyline, yycolumn,yytext());}
<YYINITIAL> {BREAK}          {return new Symbol(sym.BREAK, yyline, yycolumn,yytext());}
<YYINITIAL> {CASE}           {return new Symbol(sym.CASE, yyline, yycolumn,yytext());}
<YYINITIAL> {CHAR}           {return new Symbol(sym.CHAR, yyline, yycolumn,yytext());}
<YYINITIAL> {CONST}          {return new Symbol(sym.CONST, yyline, yycolumn,yytext());}
<YYINITIAL> {CONTINUE}       {return new Symbol(sym.CONTINUE, yyline, yycolumn,yytext());}
<YYINITIAL> {DEFAULT}        {return new Symbol(sym.DEFAULT, yyline, yycolumn,yytext());}
<YYINITIAL> {DO}             {return new Symbol(sym.DO, yyline, yycolumn,yytext());}
<YYINITIAL> {DOUBLE}         {return new Symbol(sym.DOUBLE, yyline, yycolumn,yytext());}
<YYINITIAL> {ELSE}           {return new Symbol(sym.ELSE, yyline, yycolumn,yytext());}
<YYINITIAL> {FALSE}          {return new Symbol(sym.FALSE, yyline, yycolumn,yytext());}
<YYINITIAL> {FLOAT}          {return new Symbol(sym.FLOAT, yyline, yycolumn,yytext());}
<YYINITIAL> {FOR}            {return new Symbol(sym.FOR, yyline, yycolumn,yytext());}
<YYINITIAL> {IF}             {return new Symbol(sym.IF, yyline, yycolumn,yytext());}
<YYINITIAL> {INT}            {return new Symbol(sym.INT, yyline, yycolumn,yytext());}
<YYINITIAL> {NAMESPACE}      {return new Symbol(sym.NAMESPACE, yyline, yycolumn,yytext());}
<YYINITIAL> {RETURN}         {return new Symbol(sym.RETURN, yyline, yycolumn,yytext());}
<YYINITIAL> {STATIC}         {return new Symbol(sym.STATIC, yyline, yycolumn,yytext());}
<YYINITIAL> {SWITCH}         {return new Symbol(sym.SWTICH, yyline, yycolumn,yytext());}
<YYINITIAL> {TRUE}           {return new Symbol(sym.TRUE, yyline, yycolumn,yytext());}
<YYINITIAL> {USING}          {return new Symbol(sym.USING, yyline, yycolumn,yytext());}
<YYINITIAL> {VOID}           {return new Symbol(sym.VOID, yyline, yycolumn,yytext());}
<YYINITIAL> {WHILE}          {return new Symbol(sym.WHILE, yyline, yycolumn,yytext());}
<YYINITIAL> {CIN>>}          {return new Symbol(sym.CIN>>, yyline, yycolumn,yytext());}
<YYINITIAL> {COUT<<}         {return new Symbol(sym.COUT<<, yyline, yycolumn,yytext());}

//OPERADORES DE COMPARACION
<YYINITIAL> {MENOR}    {return new Symbol(sym.MENOR, yyline, yycolumn,yytext());}
<YYINITIAL> {MEOQE}    {return new Symbol(sym.MEOQE, yyline, yycolumn,yytext());}
<YYINITIAL> {MAYOR}    {return new Symbol(sym.MAYOR, yyline, yycolumn,yytext());}
<YYINITIAL> {MAOEQ}    {return new Symbol(sym.MAOEQ, yyline, yycolumn,yytext());}
<YYINITIAL> {NEGEQ}    {return new Symbol(sym.NEGEQ, yyline, yycolumn,yytext());}
<YYINITIAL> {EQUAL}    {return new Symbol(sym.EQUAL, yyline, yycolumn,yytext());}
<YYINITIAL> {NEGAR}    {return new Symbol(sym.NEGAR, yyline, yycolumn,yytext());}
<YYINITIAL> {ANDLG}    {return new Symbol(sym.ANDLG, yyline, yycolumn,yytext());}
<YYINITIAL> {ORLG}     {return new Symbol(sym.ORLG, yyline, yycolumn,yytext());}


//OTROS OPERADORES
<YYINITIAL> {ASIG}   {return new Symbol(sym.ASIG, yyline, yycolumn,yytext());}
<YYINITIAL> {SUM}    {return new Symbol(sym.SUM, yyline, yycolumn,yytext());}
<YYINITIAL> {RES}    {return new Symbol(sym.RES, yyline, yycolumn,yytext());}
<YYINITIAL> {MUL}    {return new Symbol(sym.MUL, yyline, yycolumn,yytext());}
<YYINITIAL> {DIV}    {return new Symbol(sym.DIV, yyline, yycolumn,yytext());}
<YYINITIAL> {MOD}    {return new Symbol(sym.MOD, yyline, yycolumn,yytext());}
<YYINITIAL> {INC}    {return new Symbol(sym.INC, yyline, yycolumn,yytext());}
<YYINITIAL> {DEC}    {return new Symbol(sym.DEC, yyline, yycolumn,yytext());}

//SIMBOLOS
<YYINITIAL> {PAR_A}     {return new Symbol(sym.PAR_A, yyline, yycolumn,yytext());}
<YYINITIAL> {PAR_C}     {return new Symbol(sym.PAR_C, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_A}    {return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_C}    {return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());}
<YYINITIAL> {COMA}      {return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
<YYINITIAL> {PYCOMA}    {return new Symbol(sym.PYCOMA, yyline, yycolumn,yytext());}
<YYINITIAL> {ASIGNA}    {return new Symbol(sym.ASIGNA, yyline, yycolumn,yytext());}

//ESPRESIONES
<YYINITIAL> {ENTERO}    { return new Symbol(sym.ENTERO, yyline, yycolumn,yytext());}
<YYINITIAL> {ID}        {return new Symbol(sym.ID, yyline, yycolumn,yytext());}
<YYINITIAL> [\"]        { yybegin(CADENA); cadena+="\""; }
<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}


<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
}

<CADENA> {
        [\"] { String tmp=cadena+"\""; cadena=""; yybegin(YYINITIAL);  return new Symbol(sym.CADENA, yychar,yyline,tmp); }
        [\n] {String tmp=cadena; cadena="";  
                System.out.println("Se esperaba cierre de cadena (\")."); 
                yybegin(YYINITIAL);
            }
        [^\"] { cadena+=yytext();}
}