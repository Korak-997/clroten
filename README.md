# Encryptor
A **Command Line Tool** for **Encrypting** and **Decrypting** Files and Texts

# Features

* Easy basic Encrypting and Decrypting
* Based on Cipher Cryptography Methods
* it works well with
  * Text files
  * Single or Multiple Words
  * Single or Multiple Sentences

# How to Use :

* First you need to Clone or download the Project into your machine
* Second Make sure that you have Ruby **2.7.1** installed
* Then run these commands in your Terminal
    * Go to the location where you saved the files
      ```
      $ cd <PATH TO YOUR FILE>
      ```
    * Download the Needed Gems
      ```
      $ gem install progress_bar
      $ gem install colorize
      ```
* Now you can Use the Tool
  In your Terminal you can use these commands :
   ```
    $ ruby main.rb
    or
    $ ruby main.rb -h
    or
    $ ruby main.rb --help
    ```
    This command will show you a list of arguments you can use !
  --------------------------
  * To encrypt a File
    ```
    $ ruby main.rb -e
    or
    $ ruby main.rb --encrypt
    ```
  * To encrypt :
    *  Single or Multiple words
    *  Single or Multiple Sentences
    ```
    $ ruby main.rb -E
    or
    $ ruby main.rb --E
    ```
  * To decrypt a File
    ```
    $ ruby main.rb -d
    or
    $ ruby main.rb --decrypt
    ```
  * To decrypt :
    *  Single or Multiple words
    *  Single or Multiple Sentences
    ```
    $ ruby main.rb -D
    or
    $ ruby main.rb --Decrypt
    ```
  * All Files will be saved in a folder called **output** , whenever you like you can remove and all **auto created files** in the folder with
    ```
    $ ruby main.rb -c
    or
    $ ruby main.rb --clear
    ```
-----------------------------------------
## Note :
  * The **Encrypted** or **Decrypted** files will be Automatically saved in the the **output** directory
  * The **Encrypted** or **Decrypted** Text will be automatically shown on the Terminal

------------------------------
## Contributions :
  Rightnow **PR**s can be made to the **main** branch and i will happilly merge them after reviewing :)