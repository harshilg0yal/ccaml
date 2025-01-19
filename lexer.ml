open Re

type token = AUTO
  | BREAK
  | CASE
  | CHAR
  | CONST
  | CONTINUE
  | DEFAULT
  | DO
  | DOUBLE
  | ELSE
  | ENUM
  | EXTERN
  | FLOAT
  | FOR
  | GOTO
  | IF
  | INLINE
  | INT
  | LONG
  | REGISTER
  | RESTRICT
  | RETURN
  | SHORT
  | SIGNED
  | SIZEOF
  | STATIC
  | STRUCT
  | SWITCH
  | TYPEDEF
  | UNION
  | UNSIGNED
  | VOID
  | VOLATILE
  | WHILE
  | ALIGNAS
  | ALIGNOF
  | ATOMIC
  | BOOL
  | COMPLEX
  | GENERIC
  | IMAGINARY
  | NORETURN
  | STATIC_ASSERT
  | THREAD_LOCAL
  | FUNC_NAME
  | ELLIPSIS
  | RIGHT_ASSIGN
  | LEFT_ASSIGN
  | ADD_ASSIGN
  | SUB_ASSIGN
  | MUL_ASSIGN
  | DIV_ASSIGN
  | MOD_ASSIGN
  | AND_ASSIGN
  | XOR_ASSIGN
  | OR_ASSIGN
  | RIGHT_OP
  | LEFT_OP
  | INC_OP
  | DEC_OP
  | PTR_OP
  | AND_OP
  | OR_OP
  | LE_OP
  | GE_OP
  | EQ_OP
  | NE_OP
  | SEMICOLON
  | LBRACE
  | RBRACE
  | PERIOD
  | LPAREN
  | RPAREN
  | COMMA
  | COLON
  | EQUALTO
  | LBOX
  | RBOX
  | AMPERSAND
  | EXCLMARK
  | TILDE
  | MINUS
  | PLUS
  | STAR
  | SLASH
  | PERCENT
  | LESSTHAN
  | GREATERTHAN
  | CARET
  | OR
  | QUESMARK
  | INT_LITERAL of string 
  | FLOAT_LITERAL of string 
  | STRING_LITERAL of string
  | IDENTIFIER of string 
  | ERROR
  | WHITESPACE
  | COMMENT

(*Referenced from https://www.quut.com/c/ANSI-C-grammar-y-2011.html *)
let t_O =  (rg '0' '7') (*Octal Number Regex*)
let t_D = (rg '0' '9')(*Decimal Number Regex*)
let t_NZ = (rg '1' '9')(*Non Zero regex*)
let t_LC = (rg 'a' 'z')(*Lower case regex*)
let t_UC = (rg 'A' 'Z')(*Upper case regex*)
let t_L = alt [t_LC; t_UC; char '_'](*AlphabetUnderscore regex*)
let t_A = alt [t_LC; t_UC; char '_'; t_D](*Alphabet Number Underscore regex*)
let t_H = alt [rg 'a' 'f'; rg 'A' 'F';t_D](*Hexadecimal Number regex*)
let t_HP = seq [char '0'; alt [char 'x';char 'X']](*Hexadecimal Prefix regex*)
let t_E = seq [alt [char 'e'; char 'E'];opt (alt[char '-'; char '+']);rep1 t_D](*Exponential regex*)
let t_P = seq [alt [char 'p'; char 'P'];opt (alt[char '-'; char '+']);rep1 t_D](*Exponential regex*)

let t_FS = alt [char 'f'; char 'F'; char 'l'; char 'L'](*Float Suffix regex*)
let t_IS = alt [str "ul";  str "Ul";  str "uL";  str "UL";  str "lu";  str "Lu"; 
                str "lU";  str "LU";  str "llu"; str "llU"; str "LLu"; str "LLU"; 
                str "ulu"; str "Ulu"; str "uLu"; str "ULu"](*Integer Suffix regex*)
let t_CP = alt[char 'u';char 'U';char 'L'](*Unicode Character Literals eg u'x' / u'z' etc*)
let t_SP = alt[str "u8"; char 'u'; char 'U'; char 'L'](*encoded String literal eg u8"Hello" etc*)
let t_ES = seq [char '\\'; alt [
        alt [char '\''; char '"'; char '?'; char '\\'; char 'a'; char 'b'; char 'f'; char 'n'; char 'r'; char 't'; char 'v'];
        repn t_O 1 (Some 3);
        seq [char 'x'; rep1 t_H]
    ]](*Escape Sequence regex*)
let t_WS = space
let re_int = compile(seq[start;alt[
              seq[t_HP;(rep1 t_H);opt t_IS]
]])
(*Above token regexes are extracted from Aniruddha Deb's Repository: https://github.com/Aniruddha-Deb/ccaml/tree/main *)


