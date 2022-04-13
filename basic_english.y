class BasicEnglish
rule
  target:   
    sentence
    | /* none */

  sentence:
    subject predicate
  subject:
    PRONOUN | noun_clause
  predicate:
    predicate clause | clause

  clause:
    direct_object_phrase | prepositional_phrase
  direct_object_phrase:
    VERB opt_gerund_phrase_or_noun
  opt_gerund_phrase_or_noun:
    gerund_phrase_or_noun |
  gerund_phrase_or_noun:
    GERUND opt_noun_clause
    | noun_clause

  prepositional_phrase:
    PREP noun_clause

  opt_noun_clause:
    noun_clause |
  noun_clause:
    art_or_poss opt_adj NOUN

  art_or_poss:
    ARTICLE | POSS_PRONOUN
  opt_adj:
    ADJ | /* no adj */

end

---- inner
  
  def parse(str)
    @q = []
    until str.empty?
      case str
      when /\A\s+/
      when /\A(\w+?ing)/i
        @q.push [:GERUND, $&]
      when /\A(I|we|he|she|it|they|you)/i
        @q.push [:PRONOUN, $&]
      when /\A(my|our|his|her|its|their|your)/i
        @q.push [:POSS_PRONOUN, $&]
      when /\A(at|on|to|in|by|of|out|as)/i
        @q.push [:PREP, $&]
      when /\A(very|yesterday|tomorrow|\w+?ly)/i
        @q.push [:ADV, $&]
      when /\A(a|an|the)/i
        @q.push [:ARTICLE, $&]
      when /\A(dog|cat|mom|sister|house|store|car|food)/i
        @q.push [:NOUN, $&]
      when /\A(happy|sad|red|fast|slow|big|small)/i
        @q.push [:ADJ, $&]
      when /\A(walk|go|want|eat|be|like)/i
        @q.push [:VERB, $&]
      when /\A./
        @q.push [$&, $&]
      end
      str = $'
    end
    @q.push [false, '$end']
    do_parse
  end

  def next_token
    @q.shift
  end

---- footer

parser = BasicEnglish.new
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