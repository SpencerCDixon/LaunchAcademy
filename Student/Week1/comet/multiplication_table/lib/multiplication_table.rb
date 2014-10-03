
def multiplication_table(num=12)

x = (1..num)
y = (1..num)

y.each do |j|
    x.each do |i|
    print (i*j).to_s
    print "\t" unless i == num
    end
    print "\n"
end

end
