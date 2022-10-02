
=begin
    alphabet_position("The sunset sets at twelve o' clock.")
    "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
=end

def main()
    puts "Enter sentence:"
    sentences = gets.chomp
    alphabet = Array.new()

    d = 0
    while d < sentences.length do
        if sentences[d] =~ /[a-zA-Z]/ 
            alphabet << sentences[d]
        end
        d += 1
    end

    
    print "\nPosition of numbers in the alphabet:\n["
    for item in alphabet do
        print "#{item}-#{position_in_alphabet(item)}, "
    end
    puts "]"
end

def position_in_alphabet(character)
    for_upcase = 64
    for_downcase = 96

    if character =~ /[a-z]/ 
        return character.ord - for_downcase
    else
        return character.ord - for_upcase
    end
end

main()