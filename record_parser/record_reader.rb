require_relative './record_parser.tab.rb'

class RecordReader
  class << self
    def parse(recordfile)
      lines = File.open(recordfile, 'r', &:readlines)
      start_idx = lines.index do |line|
        line =~ %r{\d\d/\d\d/\d\d:}
      end

      content = lines[start_idx..-1].join
      RecordParser.new.parse(content)
    end
  end
end