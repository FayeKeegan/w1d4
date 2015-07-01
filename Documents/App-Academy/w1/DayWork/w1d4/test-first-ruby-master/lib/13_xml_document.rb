class XmlDocument
attr_reader :indents
attr_accessor :depth

  def initialize(indents = false)
    @indents = indents
    @depth = 0
  end

  def method_missing(name, *args)
    if block_given?
      if self.indents
        self.depth += 1
        spaces = "  "*self.depth
        next_spaces = "  "*(self.depth-1)
        result = "<#{name.to_s}>\n#{spaces}#{yield}#{next_spaces}</#{name.to_s}>"
      else
        result = "<#{name.to_s}>#{yield}</#{name.to_s}>"
      end
    elsif args.length != 0
      result = "<#{name.to_s} #{args[0].keys[0].to_s}='#{args[0].values[0]}'/>"
    else
      result = "<#{name.to_s}/>"
    end
    if self.indents
      result << "\n"
    end
    self.depth -= 1
    result
  end
end
