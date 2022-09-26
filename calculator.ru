def get_int_values
    [gets, gets].map{ |s| s.chomp.to_i }
  end
  
  puts "Would you like to [add], [multiply], [divide] or [subtract]?"
  userInput = gets.chomp
  
  case userInput.downcase
  when 'add'
    puts "Which numbers would you like to add?"
    operator = :+
  
  when 'subtract'
    puts "Which numbers would you like to subtract?"
    operator = :-
  
  when 'multiply'
    puts "Which numbers would you like to multiply?"
    operator = :*
  when 'divide'
    puts "Which numbers would you like to divide?"
    operator = :/
  
  end
  
  result = get_int_values.inject(operator)
  puts "The result is #{ result }"