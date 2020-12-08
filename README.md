# Encryptor
A **Command Line Tool** for **Encrypting** and **Decrypting** Files and Texts

# How to Use :

* First you need to Clone or download the Project into ur machine
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
  * ```
    $ ruby encryptor.rb
    or
    $ ruby encryptor.rb -h
    or
    $ ruby encryptor.rb --help
    ```
    This command will show you a list of arguments you can use !
  --------------------------
  * To encrypt a File
    ```
    $ ruby encryptor.rb -e
    or
    $ ruby encryptor.rb --encrypt
    ```
  * To encrypt a Text or Short Sentence
    ```
    $ ruby encryptor.rb -E
    or
    $ ruby encryptor.rb --E
    ```
  * To decrypt a File
    ```
    $ ruby encryptor.rb -d
    or
    $ ruby encryptor.rb --decrypt
    ```
  * To decrypt a Text or Short sentence
    ```
    $ ruby encryptor.rb -D
    or
    $ ruby encryptor.rb --Decrypt
    ```
-----------------------------------------
## Note :
  * The **Encrypted** or **Decrypted** files will be Automatically saved in the the same directory as the tool itself
  * The **Encrypted** or **Decrypted** Text will be automatically shown on the Terminal

------------------------------
## Contributions :
  Rightnow **PR**s can be made to the **main** branch and i will happilly merge them after reviewing :)