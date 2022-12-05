x0 = 0.0
tet0 = 45.0
cos0 = Math.cos(Math::PI * tet0 / 180.0)
h = 2.0
mu = 1.0
kr = 1.0
pa = 0.001
Ns = 10000
f = 0.0
b = 0.0
ab = 0.0

rand = Random.new

i = 0

while i < Ns
  x = x0
  cs = cos0
  while true
    g = rand.rand
    l = -Math.log(g) / mu
    x1 = x + l * cs
    if x1 < 0
      b += 1
      break
    end
    if x1 > h
      f += 1
      break
    end

    g = rand.rand
    if g < pa
      ab += 1
      break
    end

    g = rand.rand
    com = g ** (1.0 / (kr + 1.0))

    g = rand.rand
    sfi = Math.sin(2.0 * Math::PI * g)

    cos1 = cs * com - Math.sqrt((1.0 - cs * cs) * (1.0 - com * com)) * sfi
    x = x1
    cs = cos1
  end

  i += 1
end

puts "Transmission ratio: " + (f.to_f / Ns.to_f).to_s
puts "Reflection coefficient: " + (b.to_f / Ns.to_f).to_s
puts "Absorption coefficient: " + (ab.to_f / Ns.to_f).to_s

puts "\n"

Fns = f.to_f / Ns.to_f
Bns = b.to_f / Ns.to_f
Ans = ab.to_f / Ns.to_f

puts "Transmission uncertainty: " + Math.sqrt(Fns * (1.0 - Fns) / Ns.to_f).to_s
puts "Reflection uncertainty: " + Math.sqrt(Bns * (1.0 - Bns) / Ns.to_f).to_s
puts "Absorption uncertainty: " + Math.sqrt(Ans * (1.0 - Ans) / Ns.to_f).to_s
