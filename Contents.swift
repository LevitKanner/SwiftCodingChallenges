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

