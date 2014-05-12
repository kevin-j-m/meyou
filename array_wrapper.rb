class ArrayWrapper
  def initialize(array=nil)
    @array = array || [] 
  end

  def each_with_parameter(&block)
    for element in @array
      if block_given?
        block.call(element)
      end
    end
  end

  def each_no_parameter
    for element in @array
      if block_given?
        yield element
      end  
    end
  end
end


array = ArrayWrapper.new([1,2,3]) 
puts 'Show ouput with method signature that takes a block:'
array.each_with_parameter do |x|
  puts x
end

puts 'Show output with method signature with no parameters:'
array.each_no_parameter do |x|
  puts x
end