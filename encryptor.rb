#Adding Progress_bar
require 'progress_bar'
#Adding option parser
require 'optparse'
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
    puts encrypted_text
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
def get_code
  code = nil
  until code
    puts 'Give me the Key :'
    code = $stdin.gets.chomp.to_i
    code = nil if code <= 0
  end
  code
end

def get_text
  text = nil
  until text
    puts 'Give me the text :'
    text = $stdin.gets.chomp
    text = nil if text.empty?
  end
  text
end

def get_file
  file = nil
  until file
    puts 'Give me the File Location :'
    file = $stdin.gets.chomp
    file = nil if file.empty?
  end
  file
end

def start()
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ruby encryptor.rb [arguments]"
    opts.on("-h", "--help", "Show Informations") do |v|
      puts opts
      exit
    end
    opts.on("-e", "--encrypt", "Encryptes a file") do |v|
      options[:encrypt] = v
    end
    opts.on("-d", "--decrypt", "Decryptes a file") do |v|
      options[:decrypt] = v
    end
    opts.on("-D", "--Decrypt", "Decryptes a text") do |v|
      options[:textdecrypt] = v
    end
    opts.on("-E", "--Encrypt", "Encryptes a text") do |v|
      options[:textencrypt] = v
    end
    if ARGV.empty?
      puts opts
      exit
    end
  end.parse!
  if options[:encrypt]
    Encryptor.new(get_code).encrypt(get_file, "encrypted.txt")
  elsif options[:decrypt]
    Encryptor.new(get_code).decrypt(get_file)
  elsif options[:textdecrypt]
    Encryptor.new(get_code).decrypt_text(get_text)
  elsif options[:textencrypt]
    Encryptor.new(get_code).encrypt_text(get_text)
  end
end

start()
