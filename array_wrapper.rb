class ArrayWrapper
  def initialize(array=nil)
    @array = array || [] 
  end

  def map
    result = []
    each_no_parameter {|i| result.push(yield i)}
    result
  end

  def each_with_parameter(&block)
    for element in @array
      if block_given?
        block.call(element)
      else 
        @array
      end
    end
  end

  def each_no_parameter
    for element in @array
      if block_given?
        yield element
      else
        @array
      end  
    end
  end
end

=begin
Console output to manually test
array = ArrayWrapper.new([1,2,3]) 
puts 'Show ouput with method signature that takes a block:'
array.each_with_parameter do |x|
  puts x
end

puts 'Show output with method signature with no parameters:'
array.each_no_parameter do |x|
  puts x
end

increment = array.map {|x| x + 1}
puts 'increment'
puts increment
=end

describe ArrayWrapper do
  it 'iterates through each element' do
    array = ArrayWrapper.new([1,2,3])
    expect(array.map{|x| x+1 }).to eq [2,3,4]
  end
end