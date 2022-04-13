class RecordParser
rule
  target:   
    entries
    | /* none */
  entries:
    entries entry {
      result << val[1]
    }
    | entry {
      result = [val[0]]
    }
  entry:
    date { result = 'date' }
    | person { result = 'person' }
    | place { result = 'place' }
    | section_desc { result = 'section_desc' }
    | thing { result = 'thing' }

  intro:
    word_sequence COLON

  thing:
    word
    | TAG
    | COLON
    | AKA
    | DOB
    | POB
    | PERIOD
    | SEMICOLON

  date:
    NUM FWD_SLASH NUM FWD_SLASH NUM COLON

  section_desc:
    NEW_SECTION tag_sequence word_sequence section_desc_type section_desc_end
  section_desc_type:
    REMOVED | ADDED | CHANGED
  section_desc_end:
    COLON
    | word_sequence COLON

  place:
    upper_sequence opt_alias_series COMMA word_list_series place_details entry_end
    | quoted_word_sequence opt_alias_series COMMA word_list_series place_details entry_end
  place_details:
    DOCUMENT POUND NUM

  person:
    UPPER COMMA first_name COMMA word_list_series person_details entry_end
  first_name:
    word_sequence opt_alias_series
  person_details:
    date_of_birth place_of_birth gender
  date_of_birth:
    DOB NUM CAPITAL NUM SEMICOLON
  place_of_birth:
    POB word_list_series
  gender:
    GENDER CAPITAL

  entry_end:
    LPAREN word RPAREN tag_sequence opt_linked_to PERIOD

  tag_sequence:
    tag_sequence TAG
    | TAG
  tag_list:
    tag_list COMMA TAG
    | TAG

  word_sequence:
    word_sequence word
    | word
  word_list:
    word_list COMMA word_sequence
    | word_sequence
  word_list_series:
    word_list_series word_list SEMICOLON
    | word_list SEMICOLON

  opt_alias_series:
    LPAREN alias_sequence RPAREN
    | /* no aliases */
  alias_sequence:
    alias_sequence alias_item
    | alias_item
  alias_item:
    DOTSTR word_list opt_semicolon
  opt_semicolon:
    SEMICOLON | /* no semicolon */

  opt_linked_to:
    linked_to
    | /* no link */
  linked_to:
    LPAREN LINK link RPAREN
  link:
    UPPER COMMA word_sequence
    | upper_sequence
  upper_sequence:
    upper_sequence UPPER
    | UPPER

  word:
    STR
    | CAPITAL
    | UPPER
    | LOWER
    | DOTSTR
    | NUM
    | quoted_word_sequence
  quoted_word_sequence:
    DQUOTE word_sequence DQUOTE
end

---- inner
def parse(str)
  @q = RecordLexer.lex!(str)
  do_parse
end

def next_token
  c = @q.shift
  print "#{c}\n"
  c
end

---- footer
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