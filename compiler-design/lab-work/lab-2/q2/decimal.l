%{
#include <stdio.h>
#include <string.h>
int number = 0;
int temp = 0;

void add_number(int n) {
    if (temp == 0) {
        temp = n;
    } else {
        temp += n;
    }
}

void handle_hundred() {
    if (temp == 0) temp = 1;
    number += temp * 100;
    temp = 0;
}

%}

%%
"ONE"             { add_number(1); }
"TWO"             { add_number(2); }
"THREE"           { add_number(3); }
"FOUR"            { add_number(4); }
"FIVE"            { add_number(5); }
"SIX"             { add_number(6); }
"SEVEN"           { add_number(7); }
"EIGHT"           { add_number(8); }
"NINE"            { add_number(9); }
"TEN"             { add_number(10); }
"ELEVEN"          { add_number(11); }
"TWELVE"          { add_number(12); }
"THIRTEEN"        { add_number(13); }
"FOURTEEN"        { add_number(14); }
"FIFTEEN"         { add_number(15); }
"SIXTEEN"         { add_number(16); }
"SEVENTEEN"       { add_number(17); }
"EIGHTEEN"        { add_number(18); }
"NINETEEN"        { add_number(19); }
"TWENTY"          { add_number(20); }
"THIRTY"          { add_number(30); }
"FORTY"           { add_number(40); }
"FIFTY"           { add_number(50); }
"SIXTY"           { add_number(60); }
"SEVENTY"         { add_number(70); }
"EIGHTY"          { add_number(80); }
"NINETY"          { add_number(90); }
"HUNDRED"         { handle_hundred(); }
[ \t]+            { /* Ignore spaces and tabs */ }
\n                { 
    number += temp;
    printf("Equivalent decimal: %d\n", number);
    number = 0;
    temp = 0;
}
.                 { printf("Invalid input: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}