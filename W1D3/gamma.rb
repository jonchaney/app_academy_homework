def gamma(n)
  return 1 if (n == 2)
  (n - 1) * gamma(n - 1)
end

puts gamma(5)
