def sum(sample_file)
  total = 0
  File.open(sample_file, 'r').each_line do |l|
   total += l.to_i 
  end
  total
end
