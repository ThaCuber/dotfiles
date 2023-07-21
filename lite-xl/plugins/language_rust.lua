-- mod-version:3
local syntax = require "core.syntax"

local number_types = {
  "u8", "u16", "u32", "u64",
  "i8", "i16", "i32", "i64", "i128",
  "f32", "f64", "f128",
  "isize", "usize",
}

syntax.add {
  name = "Rust",
  files = { "%.rs$" },
  comment = "//",
  patterns = {
    { pattern = "//.+$",                                                type = "comment"  },
    { pattern = { "/%*", "%*/" },                                       type = "comment"  },
    { pattern = { 'r#"', '"#', '\\' },                                  type = "string"   },
    { pattern = { '"', '"', '\\' },                                     type = "string"   },
    { pattern = { "#!?%[", "%]" },                                      type = "number"   },
    { pattern = "macro_rules!()%s*%a[%w_]+%s*%f[{]",                    type = { "function", "normal" } },
    { pattern = "'\\?.'",                                               type = "string"   },
    { pattern = "'%a",                                                  type = "keyword2" },
    { pattern = "0[oO_][0-7]+",                                         type = "number"   },
    { pattern = "-?0x[%x_]+",                                           type = "number"   },
    { pattern = "-?%d+_%d",                                             type = "number"   },
    { regex   = "-?\\d+_?["..table.concat(number_types, "|").."]",      type = "number"   },
    { pattern = "-?%d+[%d%.eE]*f?",                                     type = "number"   },
    { pattern = "-?%.?%d+f?",                                           type = "number"   },
    { pattern = "[%+%-=/%*%^%%<>!~|&]",                                 type = "operator" },
    { regex   = "[[:alpha:]_][\\w]*(?=\\s*<[\\w\\s,']+>\\s*\\()",       type = "function" },
    { pattern = "[%a_][%w_]*!%f[%[(]",                                  type = "function" },
    { pattern = "[%a_][%w_]*%f[(]",                                     type = "function" },
    { pattern = "[%a_][%w_]*",                                          type = "symbol"   },
  },
  symbols = {
    ["as"]       = "keyword",
    ["async"]    = "keyword",
    ["await"]    = "keyword",
    ["break"]    = "keyword",
    ["const"]    = "keyword",
    ["continue"] = "keyword",
    ["crate"]    = "keyword",
    ["dyn"]      = "keyword",
    ["else"]     = "keyword",
    ["enum"]     = "keyword",
    ["extern"]   = "keyword",
    ["fn"]       = "keyword",
    ["for"]      = "keyword",
    ["if"]       = "keyword",
    ["impl"]     = "keyword",
    ["in"]       = "keyword",
    ["let"]      = "keyword",
    ["loop"]     = "keyword",
    ["match"]    = "keyword",
    ["mod"]      = "keyword",
    ["move"]     = "keyword",
    ["mut"]      = "keyword",
    ["pub"]      = "keyword",
    ["ref"]      = "keyword",
    ["return"]   = "keyword",
    ["Self"]     = "keyword",
    ["self"]     = "keyword",
    ["static"]   = "keyword",
    ["struct"]   = "keyword",
    ["super"]    = "keyword",
    ["trait"]    = "keyword",
    ["type"]     = "keyword",
    ["unsafe"]   = "keyword",
    ["use"]      = "keyword",
    ["where"]    = "keyword",
    ["while"]    = "keyword",
    ["i32"]      = "keyword2",
    ["i64"]      = "keyword2",
    ["i128"]     = "keyword2",
    ["i16"]      = "keyword2",
    ["i8"]       = "keyword2",
    ["u8"]       = "keyword2",
    ["u16"]      = "keyword2",
    ["u32"]      = "keyword2",
    ["u64"]      = "keyword2",
    ["usize"]    = "keyword2",
    ["isize"]    = "keyword2",
    ["f32"]      = "keyword2",
    ["f64"]      = "keyword2",
    ["f128"]     = "keyword2",
    ["String"]   = "keyword2",
    ["char"]     = "keyword2",
    ["str"]      = "keyword2",
    ["bool"]     = "keyword2",
    ["true"]     = "literal",
    ["false"]    = "literal",
    ["None"]     = "literal",
    ["Some"]     = "literal",
    ["Option"]   = "literal",
    ["Result"]   = "literal",
  },
}
