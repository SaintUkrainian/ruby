N = 10000 # кількість генерації чисел у послідовності Фібоначі та чисел у третій степіні

EXPECTED = (1..9).map{|d| Math.log10(1+1.0/d)}

def fib(n)
  a,b = 0,1
  n.times.map{ret, a, b = a, b, a+b; ret}
end

def power_of_threes(n)
  n.times.map{|k| 3**k}
end

def heads(s)
  s.map{|a| a.to_s[0].to_i}
end

def show_dist(title, s)
  s = heads(s)
  c = Array.new(10, 0)
  s.each{|x| c[x] += 1}
  size = s.size.to_f
  res = (1..9).map{|d| c[d]/size}
  puts "\n    %s Benfords Похибка" % title
  res.zip(EXPECTED).each.with_index(1) do |(r, e), i|
    puts "%2d: %5.1f%%  %5.1f%%  %5.1f%%" % [i, r*100, e*100, (r - e).abs*100]
  end
end

def benfords_law
  puts "Benford's Law"
  EXPECTED.each.with_index(1) do |e, i|
    puts "%2d: %5.1f%%" % [i, e*100]
  end
end

def random(n)
  n.times.map{rand(1..n)}
end

benfords_law
puts "-------------------------------------------"

show_dist("Фібоначі", fib(N))
puts "-------------------------------------------"

show_dist("У 3 степ", power_of_threes(N))
puts "-------------------------------------------"

# тільки для того, щоб показати, що не всі набори випадкових чисел так себе ведуть
show_dist("Random", random(N))

