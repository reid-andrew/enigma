# Enigma

### Project Description
This final project of Turing Mod 1 is a lightweight replication of the Enigma encryption machine, which was famously cracked by the Allies.

### Encrypting and Decrypting Messages
To encrypt a message, type that message into a text file in this repo's root directory. Running this line from the command line will encyrpt the message store it in a file called `encrypted.txt`.

```$ ruby ./lib/encrypt.rb message.txt encrypted.txt```

This will also provide confirmation of the encryption and output the key and date used for encyrpting the message.

```Created 'encrypted.txt' with the key 01234 and date 030220```

To decrypt the message, run this command with the key and date provided by the output above. Doing so will store the decrypted message in a file called `decrypted.txt`

```$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818```

This will also provide a confirmation.

```Created 'decrypted.txt' with the key 82648 and date 240818```

### Project Self Assessment
#### Functionality: 3
I believe I have met the expectations for functionality on this project. Both an Enigma class with #encrypt and #decrypt methods and a Command Line Interface have been successfully implemented. I did not implement a #crack method.

#### Object Oriented Programming: 4
I believe I have designed the project in a manner which goes beyond the expectations for a 3. The project is broken into 5 classes, 1 module, and 2 runner files for the command line interface.

The module `Encryptable` is used to house all state-agnostic functionality for encrypting and decrypting messages. The `Enigma` class inherits from a `Cryptography` class which includes that model. This structure allows for scalability and reuse of existing code for encryption in a manner other than Enigma. `Cyrptography` also inherits from an `Alphabet` class which uses class methods to create two hashes used for shifting letters. This structure allows for scalability and potential inclusion of non-Latin alphabets. Finally, the creation of keys and offsets happens in two additional classes. This ensures separation of single responsibilities and again allows for scalable, resusable code.

#### Ruby Conventions and Mechanics: 3
I believe that I've followed Ruby convention for spacing, indentation, and line length. All methods have followed the guidelines for length and have been appropriately split into helper methods, where applicable. The project has been designed to minimize nested iteration and to use appropriate enumerables.

The `Alphabet` class stores letters in two hashes with a corresponding numeric value. This allows for "shifting" of letters to occur with lookups to hashes instead of manipulating an array of letters.

#### Test Driven Development : 4
All methods are tested at both the unit and intergration levels and SimpleCov indicates 100% coverage of all code. I have implemented stubs to test methods which are designed to return random and date-specific values. All tests have been written to include assertions for edge cases and all potential outputs of methods.

#### Version Control: 3
I have made more than 75 commits which are part of over 12 pull requests. Commits are typically made after development of a single method, with exceptions for those methods which were originally developed with helpers.

All development work was done in functionality-specific branches which were branched from a main `Dev` branch. This was done to ensure pull requests grouped related bits of functionality. Pull requests all contain descriptions of the code they contain with detailed commit messages. As this was an individual project, pull requests do not include in-line comments.
