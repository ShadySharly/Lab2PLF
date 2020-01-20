%{

    # include <string.h>
    # include <stdio.h>
    # include <stdlib.h>
    FILE* outputFile;
    

%}

%%

"letter" { fprintf (outputFile, "LETTER\n"); }
"digit" { fprintf (outputFile, "DIGIT\n"); }
"." { fprintf (outputFile, ".\n"); }
"E" { fprintf (outputFile, "E\n"); }
"+" { fprintf (outputFile, "+\n"); }
"-" { fprintf (outputFile, "-\n"); }
"NIL" { fprintf (outputFile, "NIL\n"); }
"'" { fprintf (outputFile, "'\n"); }
"character" { fprintf (outputFile, "CHARACTER\n"); }
"(" { fprintf (outputFile, "(\n"); }
")" { fprintf (outputFile, ")\n"); }
"," { fprintf (outputFile, ",\n"); }
".." { fprintf (outputFile, "..\n"); }
"↑" { fprintf (outputFile, "↑\n"); }
"PACKED" { fprintf (outputFile, "PACKED\n"); }
"ARRAY" { fprintf (outputFile, "ARRAY\n"); }
"[" { fprintf (outputFile, "[\n"); }
"]" { fprintf (outputFile, "]\n"); }
"OF" { fprintf (outputFile, "OF\n"); }
"FILE" { fprintf (outputFile, "FILE\n"); }
"SET" { fprintf (outputFile, "SET\n"); }
"RECORD" { fprintf (outputFile, "RECORD\n"); }
"END" { fprintf (outputFile, "END\n"); }
";" { fprintf (outputFile, ";\n"); }
":" { fprintf (outputFile, ":\n"); }
"CASE" { fprintf (outputFile, "CASE\n"); }
"NOT" { fprintf (outputFile, "NOT\n"); }
"*" { fprintf (outputFile, "*\n"); }
"/" { fprintf (outputFile, "/\n"); }
"DIV" { fprintf (outputFile, "DIV\n"); }
"MOD" { fprintf (outputFile, "MOD\n"); }
"AND" { fprintf (outputFile, "AND\n"); }
"OR" { fprintf (outputFile, "OR\n"); }
"=" { fprintf (outputFile, "=\n"); }
"<" { fprintf (outputFile, "<\n"); }
">" { fprintf (outputFile, ">\n"); }
"#" { fprintf (outputFile, "#\n"); }
"<=" { fprintf (outputFile, "<=\n"); }
">=" { fprintf (outputFile, ">=\n"); }
"IN" { fprintf (outputFile, "IN\n"); }
"FUNCTION" { fprintf (outputFile, "FUNCTION\n"); }
"VAR" { fprintf (outputFile, "VAR\n"); }
"PROCEDURE" { fprintf (outputFile, "PROCEDURE\n"); }
":=" { fprintf (outputFile, ":=\n"); }
"BEGIN" { fprintf (outputFile, "BEGIN\n"); }
"IF" { fprintf (outputFile, "IF\n"); }
"THEN" { fprintf (outputFile, "THEN\n"); }
"ELSE" { fprintf (outputFile, "ELSE\n"); }
"WHILE" { fprintf (outputFile, "WHILE\n"); }
"DO" { fprintf (outputFile, "DO\n"); }
"REPEAT" { fprintf (outputFile, "REPEAT\n"); }
"UNTIL" { fprintf (outputFile, "UNTIL\n"); }
"FOR" { fprintf (outputFile, "FOR\n"); }
"DOWNTO" { fprintf (outputFile, "DOWNTO\n"); }
"TO" { fprintf (outputFile, "TO\n"); }
"WITH" { fprintf (outputFile, "WITH\n"); }
"GOTO" { fprintf (outputFile, "GOTO\n"); }
"LABEL" { fprintf (outputFile, "LABEL\n"); }
"CONST" { fprintf (outputFile, "CONST\n"); }
"TYPE" { fprintf (outputFile, "TYPE\n"); }

%%

int yywrap(){} 
int main(int argc, char const *argv[]) {

    char inputName[20];
    char outputName[20];

    switch (argc) {

        case 1:
            printf("Error: Faltan par%cmetros.\nUso: lexico.exe archivo_entrada archivo_salida\n", 160);
            break;

        case 2:
            printf("Error: Falta par%cmetro.\nUso: lexico.exe archivo_entrada archivo_salida\n", 160);
            break;
        
        case 3:
            strcpy(inputName, argv[1]);
            strcpy(outputName, argv[2]);
            yyin = fopen(inputName, "r");
            outputFile = fopen(outputName, "r");

            if (yyin == NULL) 
                printf("Error: El archivo de entrada no existe.\n");

            else if (outputFile != NULL)
                printf("Error: El archivo de salida ya existe.\n");

            else {
                outputFile = fopen(outputName,"w");
                yylex();
            }
            break;

        default:
            printf("Error: Demasiados par%cmetros\nUso: lexico.exe archivo_entrada archivo_salida\n", 160);
            break;
    }

    return 0;
}