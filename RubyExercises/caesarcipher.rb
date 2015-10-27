def cipher_hash(shift)
    alphabet_array = []
    j = 0
    alphabet_array[j] = "a"
    alphabet_shift = []
    cipher_hash = {}
    for i in 1..25 do
        alphabet_array[i] = alphabet_array[j].next
        j += 1
    end
    for i in 0..25 do
        alphabet_shift[i] = alphabet_array[i - shift]
    end
    for i in 0..25 do
        cipher_hash[alphabet_array[i]] = alphabet_shift[i]
    end
    return Hash[cipher_hash]
end

def caesar_cipher(string, shift)
    ciphered_string = ""
    hash = cipher_hash(shift)
    for i in 0..string.length do
        current_letter = string[i].to_s
        if current_letter.match(/[[:blank:]]/).nil? == false #NOT nil, i.e. there's a match for blank
            ciphered_string[i] = " "
        elsif current_letter.match(/[[:punct:]]/).nil? == false
            ciphered_string[i] = current_letter
        elsif current_letter.match(/[[:upper:]]/).nil? == false
            lookup = hash[current_letter.downcase].to_s
            ciphered_string[i] = lookup.upcase
        else
            lookup = hash[string[i]].to_s
            ciphered_string[i] = lookup
        end
    end
    return ciphered_string
end

puts "Enter a phrase."
user_input = gets.chomp
puts "Now enter the number of characters to shift."
shift_number = gets.chomp

puts caesar_cipher(user_input, shift_number.to_i).to_s

