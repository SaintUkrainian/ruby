def functionOne(x, a)
  a * (1 - x) * x
end

def functionTwo(y, m)
  Math.exp(-m * y)
end

def functionThree(z, k)
  Math.sin(Math::PI * k * z)
end

def findS(func, coefficient)
  s = 0.0
  period = 0

  while period < @quantity
    s += method(func).call((period.to_f - (1.0/2.0)) * (1.0 / @quantity.to_f), coefficient.to_f)
    period += 1
  end

  s = (1.0 / @quantity.to_f) * s.to_f

  s
end

def directIntegration(a, m, k)
  s1 = findS(:functionOne, a);
  s2 = findS(:functionTwo, m);
  s3 = findS(:functionThree, k);

  s1 * s2 * s3
end

def rectangleMethod(a, m, k)
  period = 0
  s1 = 0
  s2 = 0
  s3 = 0
  h = 1.0 / @quantity.to_f

  while period < @quantity
    value = h / 2.0 + period.to_f * h
    s1 += functionOne(value, a)
    s2 += functionTwo(value, m)
    s3 += functionThree(value, k)
    period += 1
  end

  s1 *= h
  s2 *= h
  s3 *= h

  (s1 * s2 * s3)
end

def rectangleMethod2(a, m, k)
  period = 0
  s1 = 0
  s2 = 0
  s3 = 0
  h = 1.0 / @quantity.to_f

  while period < @quantity
    value = h / 2.0 + period.to_f * h
    s1 += functionOne(value, a)
    s2 += functionTwo(value, m)
    s3 += functionThree(value, k)
    period += 2
  end

  s1 *= h
  s2 *= h
  s3 *= h

  (s1 * s2 * s3)
end

def getRandomValue()
  rand = Random.new
  return rand.rand(0.0..1.0)
end

def simplestMonteCarlo(a, m, k)
  s1 = functionOne(getRandomValue(), a)
  s2 = functionTwo(getRandomValue(), m)
  s3 = functionThree(getRandomValue(), k)
  period = 0

  while period < @quantity
    s1 += (functionOne(getRandomValue(), a) - s1) / (period.to_f + 1.0)
    s2 += (functionTwo(getRandomValue(), m) - s2) / (period.to_f + 1.0)
    s3 += (functionThree(getRandomValue(), k) - s3) / (period.to_f + 1.0)
    period += 1
  end

  (s1 * s2 * s3)
end

def find_min_and_max(min, max, func, coefficient)
  f_min = f_max = method(func).call(min, coefficient)
  (0...@quantity).each { |val|
    f = method(func).call((max - min).to_f / @quantity * val, coefficient)
    if f < f_min
      f_min = f
    elsif f > f_max
      f_max = f
    end
  }
  [f_min, f_max]
end

def geometric_monte_carlo(min, max, func, coefficient)
  min_max = find_min_and_max(min, max, func, coefficient)
  f_min = min_max[0]
  f_max = min_max[1]
  n_1 = 0
  (0...@quantity).each {
    x = min + (max - min) * rand(min.to_f..max.to_f)
    y = f_min + (f_max - f_min) * rand(min.to_f..max.to_f)
    if method(func).call(x, coefficient) > y
      n_1 += 1
    end
  }
  (max - min) * ((f_max - f_min) * n_1.to_f / @quantity.to_f + f_min)
end

def geometricMonteCarlo(a, m, k)
  s1 = geometric_monte_carlo(0, 1, :functionOne, a)
  s2 = geometric_monte_carlo(0, 1, :functionTwo, m)
  s3 = geometric_monte_carlo(0, 1, :functionThree, k)

  s1 * s2 * s3
end

a = 0.5
m = 0.5
k = 3.0

@quantity = 1000000.0

directIntegrationResult = directIntegration(a, m, k)
rectangleMethodResult = rectangleMethod(a, m, k)
rectangleMethod2Result = rectangleMethod2(a, m, k)
simplestMonteCarloResult = simplestMonteCarlo(a, m, k)
geometricMonteCarloResult = geometricMonteCarlo(a, m, k)

puts "Безпосереднє інтегрування результат: " + directIntegrationResult.to_s
puts "Метод прямокутників результат: " + rectangleMethodResult.to_s
puts "Найпростіший метод Монте-Карло результат: " + simplestMonteCarloResult.to_s
puts "Геометричний метод Монте-Карло результат: " + geometricMonteCarloResult.to_s

puts "\n"

puts "Значення похибки для методу Прямокутників: " + (directIntegrationResult - rectangleMethodResult).to_s
puts "Значення похибки для Найпростішого методу Монте-Карло: " + (directIntegrationResult - simplestMonteCarloResult).to_s
puts "Значення похибки для Геометричного методу Монте-Карло: " + (directIntegrationResult - geometricMonteCarloResult).to_s

puts "\n"

puts "Значення похибки для методу Прямокутників за формулою Рунге: " + (rectangleMethodResult - rectangleMethod2Result).to_s