# def url?(str)
#   !!str.match(/\Ahttps?:\/\/\S+\z/)
# end

# p url?('https://launchschool.com')     # -> true
# p url?('http://example.com')           # -> true
# p url?('https://example.com hello')    # -> false
# p url?('   https://example.com')       # -> false
#--------------

# def fields(text)
#   text.split(/[ ,\t]+/)
# end

# p fields("Pete,201,Student") == ["Pete", "201", "Student"]
# p fields("Pete \t 201    ,  TA") == ["Pete", "201", "TA"]
# p fields("Pete \t 201") == ["Pete", "201"]
# p fields("Pete \n 201") == ["Pete", "\n", "201"]
#------------------

# def mystery_math(equation)
#   equation.sub(/[+\-*\/]/, '?')
# end

# puts mystery_math('4 + 3 - 5 = 2') == '4 ? 3 - 5 = 2'
# puts mystery_math('(4 * 3 + 2) / 7 - 1 = 1') == '(4 ? 3 + 2) / 7 - 1 = 1'
#----------------

# def mysterious_math(equation)
#   equation.gsub(/[+\-*\/]/, '?')
# end

# puts mysterious_math('4 + 3 - 5 = 2') == '4 ? 3 ? 5 = 2'
# puts mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') == '(4 ? 3 ? 2) ? 7 ? 1 = 1'
#---------------

# def danish(str)
#   str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
# end

# puts danish('An apple a day keeps the doctor away') == 'An danish a day keeps the doctor away'
# puts danish('My favorite is blueberry pie') == 'My favorite is danish pie'
# puts danish('The cherry of my eye') == 'The danish of my eye'
# puts danish('apple. cherry. blueberry.') == 'danish. cherry. blueberry.'
# puts danish('I love pineapple') == 'I love pineapple'
#---------------

# def format_date(date)
#   date.split('-').reverse.join('.')
# end

# def format_date(date)
#   if date.match?(/\d{4}-\d{2}-\d{2}/)
#     date.split(/-/).reverse.join('.')
#   else
#     date
#   end
# end

# puts format_date('2016-06-17') == '17.06.2016'
# puts format_date('2016/06/17') == '2016/06/17'
#---------------

def format_date(date)
  date.sub(/(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)/, '\4.\3.\1')
end

puts format_date('2016-06-17') == '17.06.2016'
puts format_date('2017/05/03') == '03.05.2017'
puts format_date('2015/01-31') == '2015/01-31'