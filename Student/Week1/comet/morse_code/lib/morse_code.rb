require 'pry'
def decode(code)
  letters = code.split(' ')
  result = ""

  alphabet = {
    ".-"=> "A",
    "-..."=> "B",
    "-.-."=> "C",
    "-.."=> "D",
    "."=> "E",
    "..-."=> "F",
    "--."=> "G",
    "...."=> "H",
    ".."=> "I",
    ".---"=> "J",
    "-.-"=> "K",
    ".-.."=> "L",
    "--"=> "M",
    "-."=> "N",
    "---"=> "O",
    ".--."=> "P",
    "--.-"=> "Q",
    ".-."=> "R",
    "..."=>"S",
    "-"=>"T",
    "..-"=>"U",
    "...-"=>"V",
    ".--"=>"W",
    "-..-"=>"X",
    "-.--"=> "Y",
    "--.."=> "Z",
    "-.-.--" => "!",
    ".-.-" => ",",
    ".----." => "'",
    }

   letters.each do |letter|
     if letter == '/'
       result << ' '
     end
     alphabet.each do |k,v|
       if letter == k
         result << v
       end
     end
   end
   result += "32589"
end
