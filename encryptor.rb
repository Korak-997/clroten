#Adding Progress_bar
require 'progress_bar'
#Adding Colorize for Coloring Terminal Outputs
require 'colorize'
class Encryptor
  def small_letters
    ('a'..'z').to_a
  end
  def capital_letters
    ('A'..'Z').to_a
  end

  def initialize(code)
    @code = code
  end
  # encryptes a text
  def encrypt_text(text)
    encrypted_text = ""
    text.each_char do |char|
      if char =~ /[A-Z]/
        letter_case = capital_letters
      elsif char =~ /[a-z]/
        letter_case = small_letters
      end
      char =~ /[A-Za-z]/ ? encrypted_text << letter_case[(letter_case.index(char) + @code) % letter_case.length].to_s : encrypted_text << char
    end
    puts "=========================================".colorize(:yellow)
    puts encrypted_text.colorize(:green)
    puts "=========================================".colorize(:yellow)
  end
  # decryptes a text
  def decrypt_text(text)
    @code = -@code
    encrypt_text(text)
    @code = -@code
  end
  # encryptes a file
  def encrypt(file, out_name)
    # checks if the an encrypted or decrypted file already exists it will delete it
    File.delete(out_name) if File.exist?(out_name)
    file = File.read(file)
    ln = 0
    file.each_line{|l|ln += 1}
    bar = ProgressBar.new(ln)
    file.each_line do |line|
      string = ""
      line.strip.each_char do |char|
        if char =~ /[A-Z]/
          letter_case = capital_letters
        elsif char =~ /[a-z]/
          letter_case = small_letters
        end
        char =~ /[A-Za-z]/ ? string << letter_case[(letter_case.index(char) + @code) % letter_case.length].to_s : string << char
      end
      File.open(out_name, 'a'){|f| f.puts "#{string}"}
      sleep 0.1
      bar.increment!
    end
  end
  # decryptes a file

  def decrypt(file)
    @code = -@code
    encrypt(file, "decrypted.txt")
    @code = -@code
  end
end

