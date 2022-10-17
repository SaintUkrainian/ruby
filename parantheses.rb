def getTheOppositeBrace(char)
  case char
  when '{'
    return '}'
  when '('
    return ')'
  when '['
    return ']'
  else
    return nil
  end
end

def validateFirstCase(chars)
  index = 0;
  inputIsValid = true;
  while index < chars.length() - 1
    oppositeChar = getTheOppositeBrace(chars[index]);
    if (oppositeChar != chars[index + 1])
      inputIsValid = false;
    end
    index += 2;
  end
  return inputIsValid;
end

def validateSecondCase(chars)
  indexLeft = 0;
  indexRight = chars.length() - 1;
  inputIsValid = true;
  while indexLeft < chars.length() - 1
    oppositeChar = getTheOppositeBrace(chars[indexLeft]);
    if (oppositeChar != chars[indexRight])
      inputIsValid = false;
    end
    if (indexLeft + 1 == indexRight)
      if (oppositeChar != chars[indexRight])
        inputIsValid = false;
      end
      break;
    end
    indexLeft += 1;
    indexRight -= 1;
  end
  return inputIsValid;
end

def main()
  userInput = nil;
  while userInput.nil?
    userInput = STDIN.gets.chomp;
  end
  user_input_chars = userInput.chars();
  oppositeToFirst = getTheOppositeBrace(user_input_chars[0]);
  if (user_input_chars[1] == oppositeToFirst)
    puts(validateFirstCase(user_input_chars).to_s);
  elsif (user_input_chars[user_input_chars.length() - 1] == oppositeToFirst)
    puts(validateSecondCase(user_input_chars).to_s);
  else
    puts "false";
  end
end

main();