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


/*
 Given a string in English, return a tuple containing the number of vowels and consonants.
 Tip: Vowels are the letters, A, E, I, O, and U; consonants are the letters B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z.
 
 Sample input and output
 • The input “Swift Coding Challenges” should return 6 vowels and 15 consonants.
 • The input “Mississippi” should return 4 vowels and 7 consonants.
 */

func vowelsAndConsonants(in input: String) -> (Int , Int) {
    let vowels = "aeiou" , consonants = "bcdfghjklmnpqrstvwxyz"
    let vowelArray = input.filter {
        vowels.contains($0.lowercased())
    }
    let consonantsArray = input.filter {
        consonants.contains($0.lowercased())
    }
    return (vowels: vowelArray.count , consonants: consonantsArray.count)
}
vowelsAndConsonants(in: "Swift Coding Challenges")
vowelsAndConsonants(in: "Mississippi")


/*
 Write a function that accepts two strings, and returns true if they are identical in length but
 have no more than three different letters, taking case and string order into account.
 
 Sample input and output
 • The strings “Clamp” and “Cramp” would return true, because there is one letter difference.
 • The strings “Clamp” and “Crams” would return true, because there are two letter
 differences.
 • The strings “Clamp” and “Grams” would return true, because there are three letter
 differences.
 • The strings “Clamp” and “Grans” would return false, because there are four letter
 differences.
 • The strings “Clamp” and “Clam” would return false, because they are different lengths.
 • The strings “clamp” and “maple” should return false. Although they differ by only one
 letter, the letters that match are in different positions.
 
 */

func threeLetters(first: String , second: String) -> Bool {
    guard first.count == second.count else {
        return false
    }
    var difference = 0
    
    for (index , letter) in first.enumerated() {
        if letter != Array(second)[index]{
            difference += 1
        }
    }
    
    return difference < 4
}
threeLetters(first: "Clamp", second: "Cramp")
threeLetters(first: "Clamp", second: "Crams")
threeLetters(first: "Clamp", second: "Grams")
threeLetters(first: "Clamp", second: "Grans")
threeLetters(first: "Clamp", second: "Clam")
threeLetters(first: "clamp", second: "maple")



/*
 Write a function that accepts a string of words with a similar prefix, separated by spaces, and
 returns the longest substring that prefixes all words.
 
 Sample input and output
 • The string “swift switch swill swim” should return “swi”.
 • The string “flip flap flop” should return “fl”.
 */
func longestPrefix(input: String) -> String {
    let components = input.components(separatedBy: " ")
    var prefix = ""
    var longestPrefix = ""
    
    guard let firstWord = components.first else {
        return longestPrefix
    }
    
    for character in firstWord {
        prefix.append(character)
        
        if !components.allSatisfy({$0.hasPrefix(prefix)}){
            return longestPrefix
        }
        
        longestPrefix = prefix
        
    }
    
    return longestPrefix
}

longestPrefix(input: "swift switch swill swim")
longestPrefix(input: "flip flap flop")


/*
 Write a function that accepts a string as input, then returns how often each letter is repeated in
 a single run, taking case into account.
 Tip: This approach is used in a simple lossless compression technique called run-length encoding.
 
 Sample input and output
 • The string “aabbcc” should return “a2b2c2”.
 • The strings “aaabaaabaaa” should return “a3b1a3b1a3”
 • The string “aaAAaa” should return “a2A2a2”
 */

func runLength(input: String) -> String {
    var currentLetter = ""
    var count = 0
    var returnString = ""
    
    
    guard let first = input.first else { return returnString }
    currentLetter = String(first)
    
    for letter in input {
        if String(letter) == currentLetter {
            count += 1
        }else {
            returnString.append("\(currentLetter)\(count)")
            currentLetter = String(letter)
            count = 1
        }
    }
    returnString.append("\(currentLetter)\(count)")
    return returnString
}

runLength(input: "aabbcc")
runLength(input: "aaabaaabaaa")
runLength(input: "aaAAaa")



/*
 Write a function that returns a string with each of its words reversed but in the original order,
 without using a loop.
 
 Sample input and output
 • The string “Swift Coding Challenges” should return “tfiwS gnidoC segnellahC”.
 • The string “The quick brown fox” should return “ehT kciuq nworb xof”.
 */
func reversed(input: String) -> String{
    let components = input.components(separatedBy: " ")
    var returnString = ""
    
    components.forEach {
        returnString.append("\(String($0.reversed())) ")
    }
    return returnString
}
reversed(input: "Swift Coding Challenges")
reversed(input: "The quick brown fox")







//Chapter 2 : Numbers
/*
 Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
 
 Sample input and output
 • 1 should print “1”
 • 2 should print “2”
 • 3 should print “Fizz”
 • 4 should print “4”
 • 5 should print “Buzz”
 • 15 should print “Fizz Buzz”
 */

func fizzBuzz(){
    (1...100).forEach {
        if $0 % 5 == 0 && $0 % 3 == 0 {
            print("Fizz Buzz")
        }else if $0 % 3 == 0 {
            print("Fizz")
        }else if $0 % 5 == 0 {
            print("Buzz")
        }else {
            print(String($0))
        }
    }
}
fizzBuzz()


/*
 Write a function that accepts positive minimum and maximum integers, and returns a random
 number between those two bounds, inclusive.
 
 Sample input and output
 • Given minimum 1 and maximum 5, the return values 1, 2, 3, 4, 5 are valid.
 • Given minimum 8 and maximum 10, the return values 8, 9, 10 are valid.
 • Given minimum 12 and maximum 12, the return value 12 is valid.
 • Given minimum 12 and maximum 18, the return value 7 is invalid.
 */
func randomNumber(between: Int , and: Int) -> Int {
    let array = [between , and].sorted()
    return (array[0]...array[1]).randomElement()!
}
randomNumber(between: 11, and: 20)



/*
 Create a function that accepts positive two integers, and raises the first to the power of the
 second.
 Tip: If you name your function myPow() or challenge18(), you’ll be able to use the built-in
 pow() for your tests. The built-in pow() uses doubles, so you’ll need to typecast.
 
 Sample input and output
 • The inputs 4 and 3 should return 64, i.e. 4 multiplied by itself 3 times.
 • The inputs 2 and 8 should return 256, i.e. 2 multiplied by itself 8 times.
 */

func mypow(_ number: Int ,power: Int) -> Int {
    guard number > 0 && power > 0 else {
        return 0
    }
    return Array(repeating: number, count: power).reduce(1) { $0 * $1 }
}
mypow(5, power: 5)
mypow(2, power: 3)
mypow(2, power: 8)
mypow(4, power: 3)




/*
 Swap two positive variable integers, a and b, without using a temporary variable.
 
 Sample input and output
 • Before running your code a should be 1 and b should be 2; afterwards, b should be 1 and a should be 2.
 */

func numberSwap(firstNumber: Int , secondNumber: Int) -> (Int , Int){
    let (first , second) = (firstNumber, secondNumber)
    return (first , second)
}
numberSwap(firstNumber: 8, secondNumber: 10)




/*
 Write a function that accepts an integer as its parameter and returns true if the number is prime.
 Tip: A number is considered prime if it is greater than one and has no positive divisors other than 1 and itself.
 
 Sample input and output
 • The number 11 should return true.
 • The number 13 should return true.
 • The number 4 should return false.
 • The number 9 should return false.
 • The number 16777259 should return true.
 */
func isPrime(number: Int) -> Bool {
    guard number >= 2 else { return false }
    
    for i in (2...number/2){
        if number % i == 0 {
            return false
        }
    }
    return true
}
isPrime(number: 11)
isPrime(number: 13)
isPrime(number: 4)
isPrime(number: 9)
isPrime(number: 16777259)


/*
 Create a function that accepts any positive integer and returns the next highest and next lowest number that has the same number of ones in its binary representation. If either number is not possible, return nil for it.
 
 Sample input and output
 • The number 12 is 1100 in binary, so it has two 1s. The next highest number with that many 1s is 17, which is 10001. The next lowest is 10, which is 1010.
 • The number 28 is 11100 in binary, so it has three 1s. The next highest number with that many 1s is 35, which is 100011. The next lowest is 26, which is 11010.
 */

func sameOnes(number: Int) -> (nextHighest: Int? , nextLowest: Int?) {
    let binary = String(number, radix: 2, uppercase: false)
    let ones = binary.filter {$0 == "1"}.count
    var highest: Int? = nil
    var lowest: Int? = nil
    
    for i in number + 1 ... Int.max {
        let currentBinary = String(i , radix: 2)
        let onesCount = currentBinary.filter { $0 == "1"}.count
        if onesCount == ones {
            highest = i
            break
        }
    }
    
    for i in stride(from: number - 1, to: 0, by: -1){
        let currentBinary = String(i , radix: 2)
        let onesCount = currentBinary.filter { $0 == "1"}.count
        if onesCount == ones {
            lowest = i
            break
        }
    }
    
    return (highest , lowest)
   
}
sameOnes(number: 12)
sameOnes(number: 28)



/*
 Create a function that accepts an unsigned 8-bit integer and returns its binary reverse, padded
 so that it holds precisely eight binary digits.
 Tip: When you get the binary representation of a number, Swift will always use as few bits as possible – make sure you pad to eight binary digits before reversing.
 
 Sample input and output
 • The number 32 is 100000 in binary, and padded to eight binary digits that’s 00100000. Reversing that binary sequence gives 00000100, which is 4. So, when given the input 32 your function should return 4.
 • The number 41 is 101001 in binary, and padded to eight binary digits that 00101001. Reversing that binary sequence gives 10010100, which is 148. So, when given the input 41 your function should return 148.
 • It should go without saying that your function should be symmetrical: when fed 4 it should return 32, and when fed 148 it should return 41.
 */
func binaryReversed(input: Int) -> Int {
    let binary = String(input , radix: 2)
    let count = binary.count
    var eightBits = binary
    
    if count < 8 {
        let zeros = String( Array(repeating: "0", count: 8 - count))
        eightBits = zeros + binary
    }
    
    let reversed = String(eightBits.reversed())
    
    return Int(reversed ,radix: 2)!
}
binaryReversed(input: 32)
binaryReversed(input: 41)
binaryReversed(input: 4)
binaryReversed(input: 148)

