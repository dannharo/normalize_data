#
require 'date'

def normalize_data(input)
  r_input = input
  input.map do |key, value| 
    if key.eql?(:year)
      value = n_year(value)
      r_input[key] = value
    end
    if key.eql?(:make)
      value = n_make(value)
      r_input[key] = value
    end
    if key.eql?(:model)
      value = n_model(value)
      r_input[key] = value
    end
    if key.eql?(:trim)
      value = n_trim(value)
      r_input[key] = value
    end
  end
  return r_input
end

def n_year(value)
  if value.to_i >= 1900 && value.to_i <= (Date.today.year)+2
    return value.to_i
  else
    return value      
  end
end

def n_make(value)
  
end

def n_model(value)

end

def n_trim(value)
  validations = ['blank']
  if validations.include?(value)
    value = nil
  end
  return value
end

examples = [

  [{ :year => '2018', :make => 'fo', :model => 'focus', :trim => 'blank' },

   { :year => 2018, :make => 'Ford', :model => 'Focus', :trim => nil }],

  [{ :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' },

   { :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }],

  [{ :year => '1999', :make => 'Chev', :model => 'IMPALA', :trim => 'st' },

   { :year => 1999, :make => 'Chevrolet', :model => 'Impala', :trim => 'ST' }],

  [{ :year => '2000', :make => 'ford', :model => 'focus se', :trim => '' },

   { :year => 2000, :make => 'Ford', :model => 'Focus', :trim => 'SE' }]

]

examples.each_with_index do |(input, expected_output), index|

  if (output = normalize_data(input)) == expected_output
    puts "Example #{index + 1} passed!"

  else

    puts "Example #{index + 1} failed,
          Expected: #{expected_output.inspect}

          Got:      #{output.inspect}"

  end

end