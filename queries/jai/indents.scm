
[
  (block)
  (enum_declaration)
  (struct_declaration)
  (struct_literal)
  (anonymous_struct_type)
  (call_expression)
  (switch_case)
] @indent.begin

((identifier) . (ERROR "(" @indent.begin))

[
  ")"
  "]"
] @indent.branch @indent.end

; Have to do all closing brackets separately because the one for switch statements shouldn't end.
(block "}" @indent.branch @indent.end)
(enum_declaration "}" @indent.branch @indent.end)
(struct_declaration "}" @indent.branch @indent.end)
(struct_literal "}" @indent.branch @indent.end)
(anonymous_struct_type "}" @indent.branch @indent.end)

[
  (comment)
  (block_comment)
  (string)
  (ERROR)
] @indent.auto

