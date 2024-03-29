# frozen_string_literal: true

def caesar_cipher(text, shift = 0)
  ascii = text.bytes # short conversion

  shift = if shift.negative?
            26 - (shift.abs % 26) # convert negative shift to positive equivalent
          else
            shift % 26
          end

  ascii.map! do |n| # destructive for ease of working
    if n.between?(65, 122)
      if (n < 91 && (n + shift) >= 91) || (n < 123 && (n + shift) >= 123) # if characters overflow correct for this
        n - 26 + shift
      else
        n + shift
      end
    else # only convert characters
      n
    end
  end

  new_text = ascii.map! { |n| n.chr }.join # create new ciphered string

  puts "Original text was '#{text}'. Shifted by #{shift} letters, the ciphered text becomes '#{new_text}'"
end

# Show examples
caesar_cipher('Hello')
caesar_cipher('Ziggo', 26)
caesar_cipher('What a string!', 5)

# Now do it yourself!
puts 'Please input your own text to convert now:'
user_text = gets.chomp
puts 'And how large will your shuffle be tonight? (please enter a number!)'
user_shift = gets.chomp.to_i

caesar_cipher(user_text, user_shift)
