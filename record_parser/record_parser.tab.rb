#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'
class RecordParser < Racc::Parser

module_eval(<<'...end record_parser.y/module_eval...', 'record_parser.y', 119)
def parse(str)
  @q = RecordLexer.lex!(str)
  do_parse
end

def next_token
  c = @q.shift
  print "#{c}\n"
  c
end

...end record_parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    11,    10,    12,    13,    14,    15,    16,    17,    45,    18,
   101,    71,    79,    87,    29,    77,    21,    23,    40,    76,
    76,    25,    76,    22,    24,    26,   109,    39,    23,    67,
    34,    86,    25,    33,    22,    24,    26,    11,    10,    12,
    13,    14,    15,    16,    17,   -47,    18,    31,    83,    63,
    49,    33,    55,    21,    23,    40,    85,    27,    25,    50,
    22,    24,    26,    94,    39,    23,    49,    85,    45,    25,
    97,    22,    24,    26,    40,    98,    36,    99,    82,   -59,
    46,    92,   -59,    39,    23,    40,   103,    31,    25,   105,
    22,    24,    26,    69,    39,    23,    40,   106,    43,    25,
   110,    22,    24,    26,   111,    39,    23,    40,   112,   114,
    25,   116,    22,    24,    54,   117,    39,    23,    40,    34,
    42,    25,    85,    22,    24,    26,   nil,    39,    23,    40,
   nil,   nil,    25,   nil,    22,    24,    26,   nil,    39,    23,
    40,   nil,   nil,    25,   nil,    22,    24,    26,   nil,    39,
    23,    40,   nil,   nil,    25,   nil,    22,    24,    26,   nil,
    39,    23,    40,   nil,   nil,    25,   nil,    22,    24,    26,
   nil,    39,    23,    40,   nil,   nil,    25,   nil,    22,    24,
    26,   nil,    39,    23,    40,   nil,   nil,    25,   nil,    22,
    24,    26,   nil,    39,    23,    40,   nil,   nil,    25,   nil,
    22,    24,    26,   nil,    39,    23,    40,   nil,   nil,    25,
   nil,    22,    24,    26,   nil,    39,    23,   nil,   nil,   nil,
    25,   nil,    22,    24,    26,    40,   nil,   nil,    57,    58,
    59,   nil,   nil,   nil,    39,    23,    40,   nil,   nil,    25,
   nil,    22,    24,    26,   nil,    39,    23,   nil,    40,   nil,
    25,   nil,    22,    24,    26,    74,   nil,    39,    23,    40,
   nil,   nil,    25,   nil,    22,    24,    26,   nil,    39,    23,
    40,   nil,   nil,    25,   nil,    22,    24,    26,   nil,    39,
    23,   nil,    40,   nil,    25,   nil,    22,    24,    26,    74,
   nil,    39,    23,    40,   nil,   nil,    25,   nil,    22,    24,
    26,   nil,    39,    23,    40,    33,   nil,    25,   nil,    22,
    24,    26,   nil,    39,    23,    40,   nil,   nil,    25,   nil,
    22,    24,    26,   nil,    39,    23,   nil,   nil,   nil,    25,
   nil,    22,    24,    26 ]

racc_action_check = [
     0,     0,     0,     0,     0,     0,     0,     0,   104,     0,
    96,    56,    65,    75,    17,    62,     0,     0,    56,    65,
    75,     0,    62,     0,     0,     0,   104,    56,    56,    51,
    19,    74,    56,    19,    56,    56,    56,     2,     2,     2,
     2,     2,     2,     2,     2,    20,     2,    18,    72,    47,
    47,    20,    43,     2,     2,    72,    80,     1,     2,    35,
     2,     2,     2,    86,    72,    72,    33,    90,    30,    72,
    91,    72,    72,    72,    30,    92,    21,    93,    69,    21,
    32,    81,    21,    30,    30,    81,    98,    99,    30,   101,
    30,    30,    30,    55,    81,    81,    37,   103,    29,    81,
   106,    81,    81,    81,   107,    37,    37,   118,   109,   112,
    37,   113,    37,    37,    37,   114,   118,   118,    26,   115,
    27,   118,    73,   118,   118,   118,   nil,    26,    26,   117,
   nil,   nil,    26,   nil,    26,    26,    26,   nil,   117,   117,
   102,   nil,   nil,   117,   nil,   117,   117,   117,   nil,   102,
   102,    97,   nil,   nil,   102,   nil,   102,   102,   102,   nil,
    97,    97,    88,   nil,   nil,    97,   nil,    97,    97,    97,
   nil,    88,    88,    85,   nil,   nil,    88,   nil,    88,    88,
    88,   nil,    85,    85,    36,   nil,   nil,    85,   nil,    85,
    85,    85,   nil,    36,    36,    61,   nil,   nil,    36,   nil,
    36,    36,    36,   nil,    61,    61,    76,   nil,   nil,    61,
   nil,    61,    61,    61,   nil,    76,    76,   nil,   nil,   nil,
    76,   nil,    76,    76,    76,    44,   nil,   nil,    44,    44,
    44,   nil,   nil,   nil,    44,    44,    67,   nil,   nil,    44,
   nil,    44,    44,    44,   nil,    67,    67,   nil,    60,   nil,
    67,   nil,    67,    67,    67,    60,   nil,    60,    60,    49,
   nil,   nil,    60,   nil,    60,    60,    60,   nil,    49,    49,
    50,   nil,   nil,    49,   nil,    49,    49,    49,   nil,    50,
    50,   nil,    66,   nil,    50,   nil,    50,    50,    50,    66,
   nil,    66,    66,    52,   nil,   nil,    66,   nil,    66,    66,
    66,   nil,    52,    52,    54,    52,   nil,    52,   nil,    52,
    52,    52,   nil,    54,    54,    46,   nil,   nil,    54,   nil,
    54,    54,    54,   nil,    46,    46,   nil,   nil,   nil,    46,
   nil,    46,    46,    46 ]

racc_action_pointer = [
    -2,    57,    35,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,    44,    12,
    30,    61,   nil,   nil,   nil,   nil,   109,   120,   nil,    89,
    65,   nil,    65,    43,   nil,    44,   175,    87,   nil,   nil,
   nil,   nil,   nil,    42,   216,   nil,   306,    27,   nil,   250,
   261,    14,   284,   nil,   295,    84,     9,   nil,   nil,   nil,
   239,   186,     7,   nil,   nil,     4,   273,   227,   nil,    76,
   nil,   nil,    46,   101,    14,     5,   197,   nil,   nil,   nil,
    35,    76,   nil,   nil,   nil,   164,    54,   nil,   153,   nil,
    46,    64,    66,    55,   nil,   nil,   -10,   142,    67,    84,
   nil,    70,   131,    88,     5,   nil,    92,    97,   nil,    84,
   nil,   nil,    91,    89,   100,   101,   nil,   120,    98 ]

racc_action_default = [
    -2,   -68,    -1,    -4,    -5,    -6,    -7,    -8,    -9,   -11,
   -12,   -13,   -14,   -15,   -16,   -17,   -18,   -65,   -68,   -47,
   -66,   -62,   -60,   -61,   -63,   -64,   -68,   -68,    -3,   -68,
   -68,   -37,   -68,   -68,   -58,   -68,   -68,   -68,   -41,   -62,
   -65,   -66,   119,   -68,   -68,   -36,   -68,   -68,   -49,   -68,
   -68,   -68,   -47,   -40,   -67,   -68,   -68,   -21,   -22,   -23,
   -68,   -43,   -68,   -46,   -48,   -52,   -68,   -68,   -30,   -68,
   -20,   -24,   -68,   -68,   -68,   -68,   -68,   -45,   -50,   -51,
   -68,   -68,   -19,   -25,   -26,   -68,   -68,   -44,   -42,   -27,
   -68,   -68,   -68,   -68,   -28,   -29,   -68,   -68,   -68,   -68,
   -31,   -68,   -33,   -68,   -54,   -34,   -68,   -68,   -53,   -68,
   -32,   -35,   -68,   -68,   -59,   -57,   -55,   -68,   -56 ]

racc_goto_table = [
     9,    37,     9,    30,    65,    44,    32,    35,    48,    60,
    84,    52,    73,    66,     3,    75,    28,    89,    80,     1,
    70,    75,    64,    20,   115,    20,    51,    95,    90,    37,
    81,    72,    91,    96,   100,   107,    75,    53,    56,    68,
    47,     2,    78,   108,    53,   113,   nil,   nil,   nil,   nil,
   nil,    88,    53,   nil,   nil,   nil,   nil,    75,   nil,   nil,
   102,    53,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    53,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   104,    93,   nil,   nil,    53,   nil,
   nil,   nil,   118,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    53 ]

racc_goto_check = [
    11,    10,    11,    12,    28,    10,    16,    16,    30,    17,
    19,    10,    18,    17,     3,    28,     3,    19,    18,     1,
    14,    28,    30,    20,    15,    20,    21,    19,    22,    10,
    17,    10,    23,    24,    25,    26,    28,    11,    13,    16,
    29,     2,    31,    32,    11,    33,   nil,   nil,   nil,   nil,
   nil,    10,    11,   nil,   nil,   nil,   nil,    28,   nil,   nil,
    17,    11,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    11,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    12,    11,   nil,   nil,    11,   nil,
   nil,   nil,    10,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    11 ]

racc_goto_pointer = [
   nil,    19,    41,    14,   nil,   nil,   nil,   nil,   nil,   nil,
   -25,     0,   -15,    -6,   -36,   -88,   -13,   -37,   -48,   -63,
    23,   -10,   -53,   -49,   -58,   -62,   -69,   nil,   -45,     7,
   -25,   -23,   -61,   -67 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,     4,     5,     6,     7,     8,   nil,
    61,    38,   nil,   nil,   nil,    19,   nil,   nil,   nil,   nil,
    41,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    62,   nil,
   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 29, :_reduce_none,
  0, 29, :_reduce_none,
  2, 30, :_reduce_3,
  1, 30, :_reduce_4,
  1, 31, :_reduce_5,
  1, 31, :_reduce_6,
  1, 31, :_reduce_7,
  1, 31, :_reduce_8,
  1, 31, :_reduce_9,
  2, 37, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  6, 32, :_reduce_none,
  5, 35, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 42, :_reduce_none,
  2, 42, :_reduce_none,
  6, 34, :_reduce_none,
  6, 34, :_reduce_none,
  3, 46, :_reduce_none,
  7, 33, :_reduce_none,
  2, 49, :_reduce_none,
  3, 50, :_reduce_none,
  5, 51, :_reduce_none,
  2, 52, :_reduce_none,
  2, 53, :_reduce_none,
  6, 47, :_reduce_none,
  2, 40, :_reduce_none,
  1, 40, :_reduce_none,
  3, 55, :_reduce_none,
  1, 55, :_reduce_none,
  2, 38, :_reduce_none,
  1, 38, :_reduce_none,
  3, 56, :_reduce_none,
  1, 56, :_reduce_none,
  3, 45, :_reduce_none,
  2, 45, :_reduce_none,
  3, 44, :_reduce_none,
  0, 44, :_reduce_none,
  2, 57, :_reduce_none,
  1, 57, :_reduce_none,
  3, 58, :_reduce_none,
  1, 59, :_reduce_none,
  0, 59, :_reduce_none,
  1, 54, :_reduce_none,
  0, 54, :_reduce_none,
  4, 60, :_reduce_none,
  3, 61, :_reduce_none,
  1, 61, :_reduce_none,
  2, 43, :_reduce_none,
  1, 43, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  1, 39, :_reduce_none,
  3, 48, :_reduce_none ]

racc_reduce_n = 68

racc_shift_n = 119

racc_token_table = {
  false => 0,
  :error => 1,
  :COLON => 2,
  :TAG => 3,
  :AKA => 4,
  :DOB => 5,
  :POB => 6,
  :PERIOD => 7,
  :SEMICOLON => 8,
  :NUM => 9,
  :FWD_SLASH => 10,
  :NEW_SECTION => 11,
  :REMOVED => 12,
  :ADDED => 13,
  :CHANGED => 14,
  :COMMA => 15,
  :DOCUMENT => 16,
  :POUND => 17,
  :UPPER => 18,
  :CAPITAL => 19,
  :GENDER => 20,
  :LPAREN => 21,
  :RPAREN => 22,
  :DOTSTR => 23,
  :LINK => 24,
  :STR => 25,
  :LOWER => 26,
  :DQUOTE => 27 }

racc_nt_base = 28

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "COLON",
  "TAG",
  "AKA",
  "DOB",
  "POB",
  "PERIOD",
  "SEMICOLON",
  "NUM",
  "FWD_SLASH",
  "NEW_SECTION",
  "REMOVED",
  "ADDED",
  "CHANGED",
  "COMMA",
  "DOCUMENT",
  "POUND",
  "UPPER",
  "CAPITAL",
  "GENDER",
  "LPAREN",
  "RPAREN",
  "DOTSTR",
  "LINK",
  "STR",
  "LOWER",
  "DQUOTE",
  "$start",
  "target",
  "entries",
  "entry",
  "date",
  "person",
  "place",
  "section_desc",
  "thing",
  "intro",
  "word_sequence",
  "word",
  "tag_sequence",
  "section_desc_type",
  "section_desc_end",
  "upper_sequence",
  "opt_alias_series",
  "word_list_series",
  "place_details",
  "entry_end",
  "quoted_word_sequence",
  "first_name",
  "person_details",
  "date_of_birth",
  "place_of_birth",
  "gender",
  "opt_linked_to",
  "tag_list",
  "word_list",
  "alias_sequence",
  "alias_item",
  "opt_semicolon",
  "linked_to",
  "link" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

module_eval(<<'.,.,', 'record_parser.y', 7)
  def _reduce_3(val, _values, result)
          result << val[1]
    
    result
  end
.,.,

module_eval(<<'.,.,', 'record_parser.y', 10)
  def _reduce_4(val, _values, result)
          result = [val[0]]
    
    result
  end
.,.,

module_eval(<<'.,.,', 'record_parser.y', 13)
  def _reduce_5(val, _values, result)
     result = 'date' 
    result
  end
.,.,

module_eval(<<'.,.,', 'record_parser.y', 14)
  def _reduce_6(val, _values, result)
     result = 'person' 
    result
  end
.,.,

module_eval(<<'.,.,', 'record_parser.y', 15)
  def _reduce_7(val, _values, result)
     result = 'place' 
    result
  end
.,.,

module_eval(<<'.,.,', 'record_parser.y', 16)
  def _reduce_8(val, _values, result)
     result = 'section_desc' 
    result
  end
.,.,

module_eval(<<'.,.,', 'record_parser.y', 17)
  def _reduce_9(val, _values, result)
     result = 'thing' 
    result
  end
.,.,

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

# reduce 17 omitted

# reduce 18 omitted

# reduce 19 omitted

# reduce 20 omitted

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

# reduce 29 omitted

# reduce 30 omitted

# reduce 31 omitted

# reduce 32 omitted

# reduce 33 omitted

# reduce 34 omitted

# reduce 35 omitted

# reduce 36 omitted

# reduce 37 omitted

# reduce 38 omitted

# reduce 39 omitted

# reduce 40 omitted

# reduce 41 omitted

# reduce 42 omitted

# reduce 43 omitted

# reduce 44 omitted

# reduce 45 omitted

# reduce 46 omitted

# reduce 47 omitted

# reduce 48 omitted

# reduce 49 omitted

# reduce 50 omitted

# reduce 51 omitted

# reduce 52 omitted

# reduce 53 omitted

# reduce 54 omitted

# reduce 55 omitted

# reduce 56 omitted

# reduce 57 omitted

# reduce 58 omitted

# reduce 59 omitted

# reduce 60 omitted

# reduce 61 omitted

# reduce 62 omitted

# reduce 63 omitted

# reduce 64 omitted

# reduce 65 omitted

# reduce 66 omitted

# reduce 67 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class RecordParser

require_relative './record_lexer.rb'

parser = RecordParser.new
while true
  puts
  print '> '
  str = gets.chop!
  break if /q/i =~ str
  begin
    puts "= #{parser.parse(str)}"
  rescue ParseError
    puts $!
  end
end
