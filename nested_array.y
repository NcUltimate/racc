class NestedArray
rule
  target:   
    array
    | /* none */

  array:    
    LBRACE opt_itemlist RBRACE  { result = val[1] || '' }

  opt_itemlist:
    itemlist
    | /* nothing */

  itemlist: 
    itemlist COMMA item { result = val[0] + val[2] }
    | item   

  item: 
    STR | NUM | array
end

---- inner
  
  def parse(str)
    @q = []
    until str.empty?
      case str
      when /\A\s+/
      when /\A\[/
        @q.push [:LBRACE, $&]
      when /\A\]/
        @q.push [:RBRACE, $&]
      when /\A,/
        @q.push [:COMMA, $&]
      when /\A(["'])(\w+)\1/
        @q.push [:STR, $2]
      when /\A\d+/
        @q.push [:NUM, $&]
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

parser = NestedArray.new
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