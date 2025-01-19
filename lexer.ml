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

let t_O =  (rg '0' '7')
let t_D = (rg '0' '9')
let t_NZ = (rg '1' '9')


