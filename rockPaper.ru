KAMEN = "kamen";
NOZHNITSI = "nozhnitsi";
BUMAGA = "bumaga";

options = [KAMEN, NOZHNITSI, BUMAGA];

puts(options.join(" ") + "?");

userInput = nil;

while userInput.nil?
  userInput = STDIN.gets.chomp
end

userInput = userInput.downcase;

if (!options.include?(userInput))
  abort("Input is not valid!")
end


machineOption = options[rand(0..2)];

machineWon = "#{machineOption} beats #{userInput}";
userWon = "#{userInput} beats #{machineOption}";

if (machineOption == userInput)
  puts("Draw!");
else if (machineOption == KAMEN)
  if (userInput == NOZHNITSI)
    puts(machineWon);
  else 
    puts(userWon);
  end
else if (machineOption == NOZHNITSI)
  if (userInput == BUMAGA)
    puts(machineWon);
   else 
    puts(userWon);
  end
else if (machineOption == BUMAGA)
  if (userInput == NOZHNITSI)
    puts(userWon);
   else 
    puts(machineWon)
  end
end
end
end
end