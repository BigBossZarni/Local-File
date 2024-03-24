=begin
var1="This is Tedsting No1"
var2="This is Tedsting No2"
puts var1
puts var2
=end

=begin
puts "Enter Value:"
value=gets
puts "Your Lucky Number is "+value
=end

=begin
str="Hello"
putc str
=end

=begin
print "Hello "
print "Zarni"
=end

=begin
file=File.new("sample.txt","r")
if file
    content=file.sysread(20)
    puts content
else 
    puts "Enable to Open File"
end
=end

=begin
file=File.new("sample.txt","r+")
if file
    content=file.syswrite("A Yan")
    puts content
else
    puts "Enable to Open"
end
=end

=begin
file=File.new("sample.txt","r+")
if file
    file.syswrite("Hello World!")
    file.each_byte{|i| putc i;putc ?.}
else
    puts "Enable to Open"
end
=end

=begin
arr=IO.readlines("test.txt")
puts arr[0]
puts arr[1]
=end

a=File.size?( "test.txt" ) 
puts Dir.pwd