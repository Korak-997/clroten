#Adding option parser
require 'optparse'
#Adding encryptor class
load 'encryptor.rb'
load 'cl-gui.rb'
#Adding fileutils for removing the output directory
require 'fileutils'

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

# Checks if the user is sure and want to delete Output Folder
def cofirm_deleting
  answer = nil
  until answer == "Y" || answer == "N"
    40.times{print "=".colorize(:red)}
    puts " "
    puts "Are you sure ? (Y/N)".colorize(:red)
    40.times{print "=".colorize(:red)}
    puts " "
    answer = $stdin.gets.chomp.upcase
  end
  answer
end

def start()
  # prints the logo
  logo()
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ruby main.rb [arguments]"
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
    opts.on("-c", "--clear", "Deletes All Encrypted or Decrypted files by Removing output Folder") do |v|
      options[:clear] = v
    end
    if ARGV.empty?
      puts opts
      exit
    end
  end.parse!
  if options[:encrypt]
    Encryptor.new(get_code).encrypt(get_file, "encrypted#{DateTime.now.to_s}.txt")
  elsif options[:decrypt]
    Encryptor.new(get_code).decrypt(get_file)
  elsif options[:textdecrypt]
    Encryptor.new(get_code).decrypt_text(get_text)
  elsif options[:textencrypt]
    Encryptor.new(get_code).encrypt_text(get_text)
  elsif options[:clear]
    if Dir.exist?('output')
      if cofirm_deleting == "Y"
        FileUtils.remove_dir('output', true)
      else
        exit
      end
    else
      puts "Sorry there is no Output Folder !!"
      exit
    end
  end
end

start()