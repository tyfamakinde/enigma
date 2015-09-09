require_relative 'cipher'
require_relative 'rotation_key'

module Enigma
  class Decryptor

    # def decrypt_letter(letter, cipher_for_rotation)
    #   cipher_for_rotation.key(letter)
    # end
         def decrypt_letter(letter, rotated)
       cipher_for_rotation = cipher(rotated)    
       cipher_for_rotation.key(letter)
     end

    # def decrypt(secret, secret_key, secret_date)
    #   secret_array = (secret).downcase.split("").each_slice(4).to_a
    #   require "pry-nav"; binding.pry

    #   new_rotation = Rotation.new
    #   rotation_array = new_rotation.rotate_key(secret_key,secret_date)
    #   cipher_array = cipher(rotation_array)

    #   index = 0
    #   results = secret_array.collect do |arr|
    #     index = 0
    #     result = arr.collect do |letter|
    #       index = index > 2 ? 0 : index + 1
    #       decrypt_letter(letter, cipher_array[index])
    #     end
    #     result
    #   end
    #   results.join
    # end

       def decrypt(string, enc_key, enc_date)
     stringed = (string).downcase.split("").each_slice(4).to_a
      new_key = Rotation.new
     result = stringed.collect do |arr|
       rotation_hash = new_key.break_key(enc_key, enc_date, arr)
       p rotation_hash
       results = rotation_hash.collect do |letter, rotation|
         encrypted_letter = decrypt_letter(rotation, letter)
       end
       results.join
     end
     result.join
   end

    # def cipher(rotation_array)
    #   new_cipher = Cipher.new
    #   cipher_array = []
    #   rotation_array.each do |rotation|
    #     cipher_array << new_cipher.cipher(rotation)
    #   end
    #   cipher_array
    # end

  end
end