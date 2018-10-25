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
%ignorecase

//simbolos

PAR_A   = "("
PAR_C   = ")"
LLAV_A  = "{"
LLAV_C  = "}" 
COMA    = ","
PYCOMA  = ";"
ASIGNA  = "="

//palabras reservadas

INT     = "int"
CHAR    = "char"
PUB      = "public"
PRI      = "private"
VOI      = "void"
PRINT    = "print"

//Operadradores aritmeticos

//expresiones

ENTERO  = [0-9]+   
ID      = [A-Za-zñÑ][_0-9A-Za-zñÑ]*

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%

<YYINITIAL> {INT}      { listTokens.add(new Tokens(sym.INT, "INT", yyline, yycolumn, yytext())); return new Symbol(sym.INT, yyline, yycolumn,"entero");}
<YYINITIAL> {CHAR}     { listTokens.add(new Tokens(sym.CHAR, "CHAR", yyline, yycolumn, yytext()));return new Symbol(sym.CHAR, yyline, yycolumn,"caracter");}
<YYINITIAL> {PUB}       { listTokens.add(new Tokens(sym.PUB, "PUB", yyline, yycolumn, yytext())); return new Symbol(sym.PUB, yyline, yycolumn,"publico");}
<YYINITIAL> {PRI}       { listTokens.add(new Tokens(sym.PRI, "PRI", yyline, yycolumn, yytext())); return new Symbol(sym.PRI, yyline, yycolumn,"privado");}
<YYINITIAL> {VOI}       { listTokens.add(new Tokens(sym.VOI, "VOID", yyline, yycolumn, yytext())); return new Symbol(sym.VOI, yyline, yycolumn,yytext());}
<YYINITIAL> {PRINT}     { listTokens.add(new Tokens(sym.PRINT, "PRINT", yyline, yycolumn, yytext())); return new Symbol(sym.PRINT, yyline, yycolumn,yytext());}


<YYINITIAL> {PAR_A}     {listTokens.add(new Tokens(sym.PAR_A, "PAR_A", yyline, yycolumn, yytext())); return new Symbol(sym.PAR_A, yyline, yycolumn,yytext());}
<YYINITIAL> {PAR_C}     {listTokens.add(new Tokens(sym.PAR_C, "PAR_c", yyline, yycolumn, yytext())); return new Symbol(sym.PAR_C, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_A}    {listTokens.add(new Tokens(sym.LLAV_A, "LLAV_A", yyline, yycolumn, yytext())); return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_C}    {listTokens.add(new Tokens(sym.LLAV_C, "LLAV_C", yyline, yycolumn, yytext())); return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());}
<YYINITIAL> {COMA}      {listTokens.add(new Tokens(sym.COMA, "COMA", yyline, yycolumn, yytext())); return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
<YYINITIAL> {PYCOMA}    {listTokens.add(new Tokens(sym.PYCOMA, "PYCOMA", yyline, yycolumn, yytext())); return new Symbol(sym.PYCOMA, yyline, yycolumn,yytext());}
<YYINITIAL> {ASIGNA}    {listTokens.add(new Tokens(sym.ASIGNA, "ASIGNA", yyline, yycolumn, yytext())); return new Symbol(sym.ASIGNA, yyline, yycolumn,yytext());}


<YYINITIAL> {ENTERO}    {listTokens.add(new Tokens(sym.ENTERO, "ENTERO", yyline, yycolumn, yytext())); return new Symbol(sym.ENTERO, yyline, yycolumn,yytext());}
<YYINITIAL> {ID}        {listTokens.add(new Tokens(sym.ID, "ID", yyline, yycolumn, yytext())); return new Symbol(sym.ID, yyline, yycolumn,yytext());}
<YYINITIAL> [\"]        { yybegin(CADENA); cadena+="\""; }
<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}


<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
        listTokens.add(new Tokens(300, "ERROR", yyline, yycolumn, yytext()));
}

<CADENA> {
        [\"] { String tmp=cadena+"\""; cadena=""; yybegin(YYINITIAL);  listTokens.add(new Tokens(sym.CADENA, "CADENA", yyline, yycolumn, tmp)); return new Symbol(sym.CADENA, yychar,yyline,tmp); }
        [\n] {String tmp=cadena; cadena="";  
                System.out.println("Se esperaba cierre de cadena (\")."); 
                yybegin(YYINITIAL);
            }
        [^\"] { cadena+=yytext();}
}