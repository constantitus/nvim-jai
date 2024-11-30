; Includes

[
  "#import"
  "#load"
] @include

; Keywords
; TODO : complete this list
[
  "struct"
  "enum"
  "defer"
  ;"cast"
  ;"xx"
] @keyword

[
  "return"
] @keyword.return

[
  "if"
  "else"
  "case"
  "break"
] @conditional

((if_expression
  [
    "then"
    "ifx"
    "else"
  ] @conditional.ternary)
  (#set! "priority" 105))

; Repeats

[
  "for"
  ;"do" I'm not sure jai has do ?
  "while"
  "continue"
] @repeat

; Variables

(identifier) @variable

; Namespaces

(import (identifier) @namespace)

; Parameters

(parameter (identifier) @parameter ":" "="? (identifier)? @constant)

(default_parameter (identifier) @parameter ":=")

(call_expression argument: (identifier) @parameter "=")

; Functions

(procedure_declaration (identifier) @type)

(procedure_declaration (identifier) @function (procedure (block)))

(call_expression function: (identifier) @function.call)

; Types

(type (identifier) @type)

((type (identifier) @type.builtin)
  (#any-of? @type.builtin
    "bool"
    "int" "s8" "s16" "s32" "s64"
    "u8" "u16" "u32" "u64"
    "string"))


(struct_declaration (identifier) @type "::")

(enum_declaration (identifier) @type "::")

;(union_declaration (identifier) @type "::")

(const_declaration (identifier) @type "::" [(array_type) (pointer_type)])

(struct . (identifier) @type)

;(field_type . (identifier) @namespace "." (identifier) @type)

;(bit_set_type (identifier) @type ";")

;(procedure_type (parameters (parameter (identifier) @type)))

;(polymorphic_parameters (identifier) @type)

((identifier) @type
  (#lua-match? @type "^[A-Z][a-zA-Z0-9]*$")
  (#not-has-parent? @type parameter procedure_declaration call_expression))

; Fields

(member_expression "." (identifier) @field)

;(struct_type "{" (identifier) @field)

(struct_field (identifier) @field "="?)

(field (identifier) @field)

; Constants

((identifier) @constant
  (#lua-match? @constant "^_*[A-Z][A-Z0-9_]*$")
  (#not-has-parent? @constant type parameter))

(member_expression . "." (identifier) @constant)

(enum_declaration "{" (identifier) @constant)

; Literals

(number) @number

(float) @float

(string) @string

;(character) @character

(escape_sequence) @string.escape

(boolean) @boolean

[
  (uninitialized)
  (null)
] @constant.builtin

((identifier) @variable.builtin
  (#any-of? @variable.builtin "context"))

; Operators

[
  ":="
  "="
  "+"
  "-"
  "*"
  "/"
  "%"
  "%%"
  ">"
  ">="
  "<"
  "<="
  "=="
  "!="
  "~="
  "|"
  "~"
  "&"
  "&~"
  "<<"
  ">>"
  "||"
  "&&"
  "!"
  ".."
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
  "||="
  "&&="
  "&~="
  ;"..="
  ;"..<"
  ;"?"
] @operator

; Punctuation

[ "{" "}" ] @punctuation.bracket

[ "(" ")" ] @punctuation.bracket

[ "[" "]" ] @punctuation.bracket

[
  "::"
  "->"
  "."
  ","
  ":"
  ";"
] @punctuation.delimiter

; Comments

[
  (comment)
  (block_comment)
] @comment @spell

; Errors

(ERROR) @error
