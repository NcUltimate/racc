class CardEater
rule
  target:
    valid_input

  valid_input: 
    valid_card PIPE valid_date PIPE cvv { 
      result = val[0].merge(val[2]).merge(val[4])

      cvv   = val[4][:cvv]
      unless cvv.nil?
        type  = result[:card]
        result[:valid_cvv] = valid_cvv_for_type?(cvv, type)
      end
    }

  valid_date:
    DATE {
      result = { 
        date:       val[0].strftime("%m-%y"),
        valid_date: val[0] > Date.today ? true : false 
      }
    }
    | /* nothing */ { result = {} }

  cvv:
    CVV             { result = { cvv: val[0] } }
    | /* nothing */ { result = {} }

  valid_card:
    card { 
      val[0][:valid_pan] &&= luhn_valid?(val[0][:pan])
    }
    | /* nothing */ { result = {} }

  card:
    visa            { result[:card] = 'visa' }
    | mastercard    { result[:card] = 'mastercard' }
    | maestro       { result[:card] = 'maestro' }
    | amex          { result[:card] = 'amex' }


  /********************/
  /*       Visa       */
  /*        4xx       */
  /********************/
  visa:
    visa_iin digit_list  { 
      number = val.join 
      result = pan_details(number)
      result[:valid_pan] = [13, 16].include?(number.length)
    }
  visa_iin: 
    FOUR


  /********************/
  /*    Mastercard    */
  /*      5[1-5]xx    */
  /********************/
  mastercard:
    mastercard_iin digit_list { 
      number = val.join 
      result = pan_details(number)
      result[:valid_pan] = (number.length == 16)
    }
  mastercard_iin:
    FIVE one_thru_five { result = val.join }


  /********************/
  /*      Maestro     */
  /*  5[06-9]xx, 6xx  */
  /********************/
  maestro:
    maestro_iin digit_list { 
      number = val.join 
      result = pan_details(number)
      result[:valid_pan] = (12..19).include?(number.length)
    }
  maestro_iin:
    FIVE six_thru_zero { result = val.join }
    | SIX digit        { result = val.join }


  /********************/
  /* American Express */
  /*    34xx, 37xx    */
  /********************/
  amex:
    amex_iin digit_list { 
      number = val.join 
      result = pan_details(number)
      result[:valid_pan] = (number.length == 15)
    }
  amex_iin:
    THREE amex_iin_second_digit { result = val.join }
  amex_iin_second_digit:
    FOUR | SEVEN



  /********************/
  /*      Common      */
  /********************/
  digit_list:
    digit_list digit { result = val.join }
    | digit

  digit:
    one_thru_five
    | six_thru_zero

  one_thru_five:
    ONE | TWO | THREE | FOUR | FIVE

  six_thru_zero:
    SIX | SEVEN | EIGHT | NINE | ZERO

end

---- inner
require 'json'
require 'date'

  def initialize
    @binstore = 'all_cards.txt'
  end

  def pan_details(pan)
    iin = pan[0...6]
    {
      pan:    pan, 
      iin:    iin,
      meta:   metadata(iin)
    }
  end

  def metadata(iin)
    File.open(@binstore, 'r') do |bins|
      bins.each do |line|
        json = JSON.parse(line)
        return json if json['BIN'] == iin
      end
    end
  end

  def luhn_valid?(number)
    digit_sum = 0
    digits    = number.to_s.reverse.split(//)
    digits.map(&:to_i).each_slice(2) do |a, b|
      even = b > 4 ? (2*b) - 9 : 2*b
      digit_sum += (even + a)
    end
    digit_sum % 10 == 0
  end

  def valid_cvv_for_type?(cvv, type)
    index = case type
    when /s/    then cvv =~ /^\d{3}$/
    when 'amex' then cvv =~ /^\d{4}$/
    else        nil
    end

    !index.nil?
  end

  def parse(str)
    @q = []
    until str.empty?
      case str
      when /\A\s+/
      when /\A\|/
        @q.push [:PIPE, $&]
      when /\A\d{3,4}\Z/
        @q.push [:CVV, $&]
      when /\A\d{2}-\d{4}/
        @q.push [:DATE, Date.strptime($&, '%m-%Y')]
      when /\A\d{2}-\d{2}/
        @q.push [:DATE, Date.strptime($&, '%m-%y')]
      when /\A\d{6,}/
        push_card $&
      when /\A.+/
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

  private

  def push_card(digit_str)
    digit_str.split(//).each do |digit|
      case digit
      when /0/
        @q.push [:ZERO, $&.to_i]
      when /1/
        @q.push [:ONE, $&.to_i]
      when /2/
        @q.push [:TWO, $&.to_i]
      when /3/
        @q.push [:THREE, $&.to_i]
      when /4/
        @q.push [:FOUR, $&.to_i]
      when /5/
        @q.push [:FIVE, $&.to_i]
      when /6/
        @q.push [:SIX, $&.to_i]
      when /7/
        @q.push [:SEVEN, $&.to_i]
      when /8/
        @q.push [:EIGHT, $&.to_i]
      when /9/
        @q.push [:NINE, $&.to_i]
      end
    end
  end

---- footer

$parser = CardEater.new
def parse_line(line)
  $parser.parse(line)
rescue
  if ARGV.count == 0
    raise ParseError
  else
    { errors: "ParseError" }
  end
end

def from_file
  cards = File.open(ARGV[0], &:readlines)
  cards = cards.map(&method(:parse_line))

  puts JSON.pretty_generate(cards)
end

def from_stdin
  while true
    puts
    print '> '
    str = gets.chop!
    break if /^q$/i =~ str
    begin
      output = parse_line(str)
      puts JSON.pretty_generate(output)
    rescue ParseError
      parse_error
    end
  end
end

def parse_error
  puts
  puts "SYNTAX:\t CARD_NO | EXPIRATION\t| CVV"
  puts "FORMAT:\t \d{6,}\t | dd-yy(yy)?\t| \d{3,4}"
  puts
  puts "EXAMPLES:"
  puts "\t| 12-99 | "
  puts "\t41111111111111 | | 123"
  puts "\t5543 4483 7723 3433 | 11-2018 | 556"
  puts
  puts "NOTES:"
  puts "\t- whitespace is ignored (except newline)."
  puts "\t- pipes are necessary, even for omitted values."
end

def main
  if ARGV.count == 0
    from_stdin
  else
    from_file
  end
end

main