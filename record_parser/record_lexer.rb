class RecordLexer
  class << self
    def lex!(str)
      q = []
      until str.empty?
        case str
        # Phrases
        when /\A\s+/
        when /\ALinked To:/ then q.push [:LINK, $&]
        when /\ADOB/        then q.push [:DOB, $&]
        when /\APOB/        then q.push [:POB, $&]
        when /\AGender/     then q.push [:GENDER, $&]
        when /\Aremoved/    then q.push [:REMOVED, $&]
        when /\Achanged/    then q.push [:CHANGED, $&]
        when /\Aadded/      then q.push [:ADDED, $&]
        when /\A-to-/       then q.push [:TO, $&]
        when /\AThe following/ then q.push [:NEW_SECTION, $&]
        when /\ABusiness Registration Document/ then q.push [:DOCUMENT, $&]

        # Catchalls
        when /\A\[\w+\]/      then q.push [:TAG, $&]
        when /\A(\w\.)+/      then q.push [:DOTSTR, $&]
        when /\A[A-Z][a-z]+/  then q.push [:CAPITAL, $&]
        when /\A[A-Z]+/       then q.push [:UPPER, $&]
        when /\A[a-z]+/       then q.push [:LOWER, $&]
        when /\A\d+/          then q.push [:NUM, $&]
        when /\A[^\s;:,\/\(\)\#\."]+/ then q.push [:STR, $&]

        # Single characters
        when /\A;/    then q.push [:SEMICOLON, $&]
        when /\A:/    then q.push [:COLON, $&]
        when /\A,/    then q.push [:COMMA, $&]
        when /\A\//   then q.push [:FWD_SLASH, $&]
        when /\A\(/   then q.push [:LPAREN, $&]
        when /\A\)/   then q.push [:RPAREN, $&]
        when /\A\./   then q.push [:PERIOD, $&]
        when /\A"/    then q.push [:DQUOTE, $&]
        when /\A#/    then q.push [:POUND, $&]

        when /\A./   then q.push [$&, $&]
        end
        str = $'
      end
      q.push [false, '$end']
      q
    end
  end
end