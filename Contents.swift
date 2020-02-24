import UIKit

/*
 Write a function that accepts a String as its only parameter, and returns true if the string has
 only unique letters, taking letter case into account.
 
 Sample input and output
 • The string “No duplicates” should return true.
 • The string “abcdefghijklmnopqrstuvwxyz” should return true.
 • The string “AaBbCc” should return true because the challenge is case-sensitive.
 • The string “Hello, world” should return false because of the double Ls and double Os.
 */


//My function
func hasUniqueLetters(input: String) -> Bool {
    var letters = [Character]()
    
    input.forEach {
        if !letters.contains($0){
            letters.append($0)
        }
    }
    return input == String(letters)
}

hasUniqueLetters(input: "No duplicates")
hasUniqueLetters(input: "abcdefghijklmnopqrstuvwxyz")
hasUniqueLetters(input: "AaBbCc")
hasUniqueLetters(input: "Hello, world")




/*
 Write a function that accepts a String as its only parameter, and returns true if the string reads
 the same when reversed, ignoring case.
 
 Sample input and output
 • The string “rotator” should return true.
 • The string “Rats live on no evil star” should return true.
 • The string “Never odd or even” should return false; even though the letters are the same in
 reverse the spaces are in different places.
 • The string “Hello, world” should return false because it reads “dlrow ,olleH” backwards.
 */

func isPalindrome(input: String) -> Bool {
    return input.lowercased() == String(input.lowercased().reversed())
}

isPalindrome(input: "rotator")
isPalindrome(input: "Rats live on no evil star")
isPalindrome(input: "Never odd or even")
isPalindrome(input: "Hello, world")



/*
 Write a function that accepts two String parameters, and returns true if they contain the same
 characters in any order taking into account letter case.
 
 Sample input and output
 • The strings “abca” and “abca” should return true.
 • The strings “abc” and “cba” should return true.
 • The strings “ a1 b2 ” and “ b1 a2 ” should return true. • The strings “abc” and “abca” should return false.
 • The strings “abc” and “Abc” should return false.
 • The strings “abc” and “cbAa” should return false.
 • The strings “abcc” and “abca” should return false.
 */

func containsSameLetter(first: String , second: String) -> Bool {
    guard  first.count == second.count else {
        return false
    }
    return first.sorted() == second.sorted()
}

containsSameLetter(first: "abca", second: "abca")
containsSameLetter(first: "abc", second: "cba")
containsSameLetter(first: " a1 b2 ", second: " b1 a2 ")
containsSameLetter(first: "abc", second: "Abc")
containsSameLetter(first: "abc", second: "cbAa")
containsSameLetter(first: "abcc", second: "abca")




/*
 Write your own version of the contains() method on String that ignores letter case, and
 without using the existing contains() method.
 
 Sample input and output
 • The code "Hello, world".fuzzyContains("Hello") should return true.
 • The code "Hello, world".fuzzyContains("WORLD") should return true.
 • The code "Hello, world".fuzzyContains("Goodbye") should return false.
 */

extension String {
    func fuzzyContains(_ other: String) -> Bool {
        return self.lowercased().range(of: other.lowercased()) != nil
    }
}
"Hello world".fuzzyContains("Hello")
"Hello world".fuzzyContains("WORLD")
"Hello world".fuzzyContains("Goodbye")




/*
 Write a function that accepts a string, and returns how many times a specific character appears,
 taking case into account.
 
 Sample input and output
 • The letter “a” appears twice in “The rain in Spain”.
 • The letter “i” appears four times in “Mississippi”.
 • The letter “i” appears three times in “Hacking with Swift”.
 */

func count(of letter: Character , in input: String) -> Int {
    let letters = input.filter { $0 == letter }
    return letters.count
}
count(of: "a", in: "he rain in Spain")
count(of: "i", in: "Mississippi")
count(of: "i", in: "Hacking with Swift")



/*
 Write a function that accepts a string as its input, and returns the same string just with
 duplicate letters removed.
 Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.
 
 Sample input and output
 • The string “wombat” should print “wombat”.
 • The string “hello” should print “helo”.
 • The string “Mississippi” should print “Misp”
 */

func removeDuplicates(from: String) -> String {
    var word = [Character]()
    
    from.forEach {
        if !word.contains($0) {
            word.append($0)
        }
    }
    return String(word)
}
removeDuplicates(from: "wombat")
removeDuplicates(from: "Mississippi")
removeDuplicates(from: "hello")



/*
 Write a function that returns a string with any consecutive spaces replaced with a single space.
 
 
 Sample input and output
 I’ve marked spaces using “[space]” below for visual purposes:
 • The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.
 • The string “[space][space][space][space]a” should return “[space]a”.
 • The string “abc” should return “abc”.
 */

func condenseWhiteSpace(in input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression)
}
condenseWhiteSpace(in: "a   b   c")
condenseWhiteSpace(in: "    a")
condenseWhiteSpace(in: "abc")

//Second Function for condensing white spaces
func condense(input: String) -> String {
    
    var letters = [Character]()
    var isSpace = false
    
    for letter in input {
        
        if letter == " " && isSpace == false {
            letters.append(letter)
            isSpace = true
        }
        
        if letter != " " {
            letters.append(letter)
            isSpace = false
        }
    }
    return String(letters)
}
condense(input: "a   b   c")
condenseWhiteSpace(in: "    a")
condense(input: "abc")



/*
 Write a function that accepts two strings, and returns true if one string is rotation of the other,
 taking letter case into account.
 Tip: A string rotation is when you take a string, remove some letters from its end, then append them to the front. For example, “swift” rotated by two characters would be “ftswi”.
 
 Sample input and output
 • The string “abcde” and “eabcd” should return true.
 • The string “abcde” and “cdeab” should return true.
 • The string “abcde” and “abced” should return false; this is not a string rotation.
 • The string “abc” and “a” should return false; this is not a string rotation.
 */

func canRotate(_ input: String , into: String) -> Bool {
    let parent = input + input
    
    guard input.count == into.count else {
        return false
    }
    
    return parent.contains(into)
}
canRotate("abcde", into: "eabcd")
canRotate("abcde", into: "cdeab")
canRotate("abcde", into: "abced")
canRotate("abc", into: "a")



/*
 Write a function that returns true if it is given a string that is an English pangram, ignoring
 letter case.
 Tip: A pangram is a string that contains every letter of the alphabet at least once.
 Sample input and output
 
 • The string “The quick brown fox jumps over the lazy dog” should return true.
 • The string “The quick brown fox jumped over the lazy dog” should return false, because
 it’s missing the S.
 */

func isPangram(input: String) -> Bool {
    let alphabets = "abcdefghijklmnopqrstuvwxyz"
    let newWord = Set(input.lowercased()).sorted()
    return alphabets == String(newWord).replacingOccurrences(of: " ", with: "")
}

isPangram(input: "The quick brown fox jumps over the lazy dog")
isPangram(input: "The quick brown fox jumped over the lazy dog")

