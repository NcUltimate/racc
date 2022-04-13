class Sentence
rule
  target:   
    sentence { result = "You entered a valid sentence."}
    | /* none */
  sentence:
    subject predicate

  subject:
    descriptive_noun_list
    | pronoun_list
  pronoun_list:
    pronoun_list conjunction pronoun
    | pronoun
  descriptive_noun_list:
    descriptive_noun_list conjunction descriptive_noun
    | descriptive_noun
  descriptive_noun:
    article adjective_list noun
    | article noun
    | adjective_list noun
    | noun
  adjective_list:
    adjective_list adjective
    | adjective

  predicate:
    direct_object_clause opt_prepositional_phrase_list
  direct_object_clause:
    descriptive_verb direct_object
  direct_object:
    descriptive_noun_list
    | /* no direct object */
  descriptive_verb:
    adverb_list verb
    | verb
  adverb_list:
    adverb_list adverb
    | adverb

  opt_prepositional_phrase_list:
    prepositional_phrase_list 
    | /* no prepositional phrases */
  prepositional_phrase_list:
    prepositional_phrase_list prepositional_phrase
    | prepositional_phrase

  prepositional_phrase:
    preposition object_of_preposition
    | present_participle
  object_of_preposition:
    descriptive_noun
    | direct_object_clause

  adverb:
    'merrily'
    | 'quickly'
    | 'gracefully'
    | 'thoughtfully'
    | 'everyday'
    | 'sometimes'
    | 'always'
    | 'never'

  conjunction:
    ',' | 'and'

  article:
    'a'
    | 'an'
    | 'the'
    | possessive_pronoun

  possessive_pronoun:
    'my'
    | 'our'
    | 'your'
    | 'their'

  adjective:
    'funny'
    | 'cute'
    | 'fast'
    | 'happy'
    | 'some'

  preposition:
    'to'
    | 'through'
    | 'toward'
    | 'down'
    | 'on'
    | 'under'
    | 'around'
    | 'in'
    | 'near'

  pronoun:
    'I'
    | 'he'
    | 'she'
    | 'it'
    | 'they'
    | 'you'
    | 'we'

  noun:
    'mom'
    | 'dog'
    | 'cat'
    | 'store'
    | 'car'
    | 'house'
    | 'street'
    | 'eggs'
    | 'milk'
 
  verb:
    'walk'
    | 'buy'
    | 'go'
    | 'get'
    | 'fly'
    | 'like'
    | 'want'
    | 'walks'
    | 'gets'
    | 'likes'
    | 'buys'
    | 'goes'
    | 'flies'
    | 'wants'
    | 'walked'
    | 'bought'
    | 'went'
    | 'flew'
    | 'wanted'
    | 'got'

  present_participle:
    'walking'
    | 'eating'
    | 'buying'
    | 'flying'
    | 'being'
    | 'wanting'

end

---- inner
  
  def parse(str)
    @q = []
    until str.empty?
      case str
      when /\A\s+/
      when /\A\w+/
        @q.push [$&, $&]
      when /\A./
        @q.push [$&, $&]
      end
      str = $'
    end
    @q.push [false, '$end']
    do_parse
  end

  def match(str)
    /\A#{str}/
  end

  def next_token
    @q.shift
  end

---- footer

parser = Sentence.new
while true
  puts
  print '> '
  str = gets.chop!
  break if /q/i =~ str
  begin
    puts "= #{parser.parse(str)}"
  rescue ParseError
    puts "Sorry, that is not a valid sentence."
    puts $!
  end
end