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
        let zeros = String(repeating: "0", count: 8 - count)
        eightBits = zeros + binary
    }
    
    let reversed = String(eightBits.reversed())
    
    return Int(reversed ,radix: 2)!
}
binaryReversed(input: 32)
binaryReversed(input: 41)
binaryReversed(input: 4)
binaryReversed(input: 148)



/*
 Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits
 0 through 9.
 
 Sample input and output
 • The input “01010101” should return true.
 • The input “123456789” should return true.
 • The letter “9223372036854775808” should return true.
 • The letter “1.01” should return false; “.” is not a number.
 */

func containsNumbersOnly(input: String) -> Bool {
    return input.allSatisfy {("0"..."9") ~= $0}
}

containsNumbersOnly(input: "01010101")
containsNumbersOnly(input: "123456789")
containsNumbersOnly(input: "9223372036854775808")
containsNumbersOnly(input: "1.01")



/*
 Given a string that contains both letters and numbers, write a function that pulls out all the
 numbers then returns their sum.
 
 Sample input and output
 • The string “a1b2c3” should return 6 (1 + 2 + 3).
 • The string “a10b20c30” should return 60 (10 + 20 + 30).
 • The string “h8ers” should return “8”.
 */

func sumNumbersOnly(input: String) -> Int {
    var numbers = [Int]()
    var strings = "0"
    
    for letter in input{
        if ("0"..."9") ~= letter {
            strings.append("\(letter)")
        }else {
            numbers.append(Int(strings)!)
            strings = "0"
        }
    }
    numbers.append(Int(strings)!)
    return numbers.reduce(0) { $0 + $1 }
}
sumNumbersOnly(input: "a1b2c3")
sumNumbersOnly(input: "a10b20c30")
sumNumbersOnly(input: "h8ers")



/*
 Write a function that returns the square root of a positive integer, rounded down to the nearest
 integer, without using sqrt().
 
 Sample input and output
 • The number 9 should return 3.
 • The number 16777216 should return 4096.
 • The number 16 should return 4.
 • The number 15 should return 3.
 */

func mysqrt(input: Int) -> Int {
    guard input > 1 else { return 1 }
    var lowerbound = 0
    var upperbound = input / 2
    
    while lowerbound + 1 < upperbound {
        let middle = lowerbound + (upperbound - lowerbound)/2
        
        if middle * middle == input {
            return middle
        }else if middle * middle > input{
            upperbound = middle
        }else {
            lowerbound = middle
        }
    }
    return lowerbound
}

mysqrt(input: 16)
mysqrt(input: 15)
mysqrt(input: 9)
mysqrt(input: 16777216)



/*
 Create a function that subtracts one positive integer from another, without using -.
 
 Sample input and output
 • The code challenge26(subtract: 5, from: 9) should return 4.
 • The code challenge26(subtract: 10, from: 30) should return 20.
 */

func subtract(_ number: Int , from: Int) -> Int {
    return (number..<from).count
}

///or using the bitwise Not operator
func challenge26(_ number: Int , from: Int) -> Int {
    return from + (~number + 1)
}
subtract(5, from: 9)
subtract(10, from: 30)
subtract(1, from: 100)
challenge26(5, from: 9)
challenge26(10, from: 30)
challenge26(1, from: 100)




//Chapter 3 (FILES)








//Chapter 4 (COLLECTIONS)

/*
 Write an extension for collections of integers that returns the number of times a specific digit
 appears in any of its numbers.
 
 Sample input and output
 • The code [5, 15, 55, 515].challenge37(count: "5") should return 6.
 • The code [5, 15, 55, 515].challenge37(count: "1") should return 2.
 • The code [55555].challenge37(count: "5") should return 5.
 • The code [55555].challenge37(count: "1") should return 0.
 */

extension Collection where Self == [Int] {
    func count(of: Int) -> Int {
        let number = String(of)
        var count = 0
        
        for value in self {
            let string = String(value)
            guard string.contains(number) else {continue}
            
            count += string.filter({"\($0)" == number}).count
        }
        
        return count
    }
}
[5, 15, 55, 515].count(of: 5)
[5, 15, 55, 515].count(of: 1)
[55555].count(of: 5)
[55555].count(of: 1)






/*
 Write an extension for all collections that returns the N smallest elements as an array, sorted
 smallest first, where N is an integer parameter.
 
 Sample input and output
 • The code [1, 2, 3, 4].challenge38(count: 3) should return [1, 2, 3].
 • The code ["q", "f", "k"].challenge38(count: 10) should return [“f”, “k”, “q”].
 • The code [256, 16].challenge38(count: 3) should return [16, 256].
 • The code [String]().challenge38(count: 3) should return an empty array.
 */

extension Collection where Iterator.Element: Comparable {
    
    func nSmallest(count: Int) -> [Element]{
        return Array(self.sorted().prefix(count))
    }
}
[1, 2, 3, 4].nSmallest(count: 3)
["q", "f", "k"].nSmallest(count: 10)
[256, 16].nSmallest(count: 3)
[String]().nSmallest(count: 3)





/*
 Extend collections with a function that returns an array of strings sorted by their lengths,
 longest first.
 
 Sample input and output
 • The code ["a", "abc", "ab"].challenge39() should return ["abc", "ab", "a"].
 • The code ["paul", "taylor", "adele"].challenge39() should return ["taylor", "adele",
 "paul"].
 • The code [String]().challenge39() should return [].
 */

extension Collection where Iterator.Element == String {
    func longestFirst() -> [Element]{
        return self.sorted { $0.count > $1.count }
    }
}
["a", "abc", "ab"].longestFirst()
["paul", "taylor", "adele"].longestFirst()
[String]().longestFirst()




/*
 Create a function that accepts an array of unsorted numbers from 1 to 100 where zero or more
 numbers might be missing, and returns an array of the missing numbers.
 
 
 Sample input and output
 If your test array were created like this:
 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)
 Then your method should [7, 21, 26], because those are the numbers missing from the array.
 */
func findMissing(input: [Int]) -> [Int]{
    let sorted = input.sorted()
    let count = sorted.count
    let original = Array(sorted[0]...sorted[count - 1])
    
    return  Array(Set(original).subtracting(sorted))
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)

findMissing(input: testArray)
findMissing(input: [1, 2, 3, 4])
findMissing(input: [5, 15, 55, 515])



/*
 Write an extension to collections that accepts an array of Int and returns the median average,
 or nil if there are no values.
 Tip: The mean average is the sum of some numbers divided by how many there are. The median average is the middle of a sorted list. If there is no single middle value – e.g. if there are eight numbers - then the median is the mean of the two middle values.
 
 Sample input and output
 • The code [1, 2, 3].challenge41() should return 2.
 • The code [1, 2, 9].challenge41() should return 2.
 • The code [1, 3, 5, 7, 9].challenge41() should return 5.
 • The code [1, 2, 3, 4].challenge41() should return 2.5.
 • The code [Int]().challenge41() should return nil.
 */

extension Collection where Iterator.Element == Int {
    
    func median() -> Double? {
        guard !self.isEmpty else {return nil}
        let ordered = sorted()
        let count = self.count
        let middle: Int = (count / 2)
        
        if count % 2 == 0 {
            return Double(ordered[middle] + ordered[middle - 1]) / 2
        }else{
            return Double(ordered[middle])
        }
        
    }
}
[1, 2, 3].median()
[1, 2, 9].median()
[1, 3, 5, 7, 9].median()
[1, 2, 3, 4].median()
[Int]().median()





/*
 Finding the mode average on a collection of integers
 */

extension Collection where Iterator.Element == Int {
    func mode() -> [Int]{
        guard  !self.isEmpty else { return  [ ] }
        let ordered = sorted()
        
        var pairs = [(Int, Int)]()
        var highestCount = 0
        var count = 0
        var value = ordered.first!
        
        for number in ordered {
            guard value == number else {
                pairs.append((value , count))
                
                highestCount = count > highestCount ? count : highestCount   ///Gets the modal count of the mode
                
                value = number
                count = 1
                continue
            }
            count += 1
        }
        pairs.append((value , count))
        
        var mode = [Int]()
        
        pairs.forEach {
            if $0.1 == highestCount{
                mode.append($0.0)
            }
        }
        return mode
    }
}
[1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 9].mode()





/*
 Write an extension for all collections that reimplements the firstIndex(of:) method.
 Tip: This is one of the easiest standard library methods to reimplement, so please give it an especially good try before reading any hints.
 
 Sample input and output
 • The code [1, 2, 3].challenge42(firstIndexOf: 1) should return 0.
 • The code [1, 2, 3].challenge42(firstIndexOf: 3) should return 2.
 • The code [1, 2, 3].challenge42(firstIndexOf: 5) should return nil.
 */
extension Collection where Iterator.Element: Equatable {
    func indexFor(element: Element) -> Int? {
        guard self.contains(element) else { return nil }
        
        for (index , value) in enumerated(){
            if value == element {
                return index
            }
        }
        return nil
    }
}
[1, 2, 3].indexFor(element: 1)
[1, 2, 3].indexFor(element: 3)
[1, 2, 3].indexFor(element: 5)





/*
 Create a linked list of lowercase English alphabet letters, along with a method that traverses all
 nodes and prints their letters on a single line separated by spaces.
 
 Sample input and output
 • The output of your code should be the English alphabet printed to the screen, i.e. “a b c d ... x y z”.
 */

///Create a node class
class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    var hashValue: Int
    
    init(hashValue: Int ,value: T) {
        self.value = value
        self.hashValue = hashValue
    }
    
}

//Creates a list class with the method to print nodes
class LinkedList<T> {
    private var unique = 0
    var start: LinkedListNode<T>?
    
    //Print method
    func printNodes(){
        var currentNode = start
        
        while let node = currentNode {
            print(node.value , terminator: " ")
            currentNode = node.next
        }
    }
    
    func getUniqueId() -> Int {
        unique += 1
        return unique
    }
}



let list = LinkedList<Character>()
var previousNode: LinkedListNode<Character>? = nil

for letter in "abcdefghijklmnopqrstuvwxyz" {
    let node = LinkedListNode(hashValue: list.getUniqueId(), value: letter)
    
    if let predecessor = previousNode {
        predecessor.next = node
    }else {
        list.start = node
    }
    previousNode = node
}

list.printNodes()



/*
 Extend your linked list class with a new method that returns the node at the mid point of the
 linked list using no more than one loop.
 Tip: If the linked list contains an even number of items, returning the one before or the one after the center is acceptable.
 
 Sample input and output
 • If the linked list contains 1, 2, 3, 4, 5, your method should return 3.
 • If the linked list contains 1, 2, 3, 4, your method may return 2 or 3.
 • If the linked list contains the English alphabet, your method may return M or N.
 */

extension LinkedList {
    var centerPoint: LinkedListNode<T>? {
        var slowPointer = self.start
        var fastPointer = self.start
        
        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        return slowPointer
    }
}
list.centerPoint


/*
 Write an extension for all collections that reimplements the map() method.
 
 Sample input and output
 • The code [1, 2, 3].challenge46 { String($0) } should return [“1”, "2", "3"]
 • The code ["1", "2", "3"].challenge46 { Int($0)! } should return [1, 2, 3].
 */
extension Collection {
    func mapElements<T>(_ closure : (Element) throws -> T ) rethrows -> [T]{
        var returnValue : [T] = [ ]
        
        for item in self {
            let transformed = try closure(item)
            returnValue.append(transformed)
        }
        
        return returnValue
    }
}

[2 , 3 , 5].mapElements {String($0)}
["1", "2" , "3"].mapElements {Int($0)!}




/*
 Write an extension for all collections that reimplements the min() method.
 
 Sample input and output
 • The code [1, 2, 3].challenge47() should return 1.
 • The code ["q", "f", "k"].challenge47() should return “f”.
 • The code [4096, 256, 16].challenge47() should return 16.
 • The code [String]().challenge47() should return nil.
 */
extension Collection where Iterator.Element: Comparable {
    func minimum() -> Element? {
        guard !self.isEmpty else { return nil}
        return sorted().first!
    }
}
[1, 2, 3].minimum()
["q", "f", "k"].minimum()
[4096, 256, 16].minimum()
[String]().minimum()



/*
 Create a new data type that models a double-ended queue using generics, or deque. You should be able to push items to the front or back, pop them from the front or back, and get the number of items.
 Tip: It’s pronounced like “deck”.
 
 Sample input and output
 Once your data structure has been created, this code should compile and run cleanly:
 var numbers = deque<Int>()
 numbers.pushBack(5)
 numbers.pushBack(8)
 numbers.pushBack(3)
 assert(numbers.count == 3)
 assert(numbers.popFront()! == 5)
 assert(numbers.popBack()! == 3)
 assert(numbers.popFront()! == 8)
 assert(numbers.popBack() == nil)
 */

struct Deque<T> {
    private var array = [T]()
    
    var count: Int {
        array.count
    }
    
    mutating func pushBack(_ element: T){
        self.array.append(element)
    }
    
    mutating func pushFront(_ element: T){
        self.array.insert(element, at: 0)
    }
    mutating func popFront() -> T? {
        guard !array.isEmpty else {return nil}
        return self.array.removeFirst()
    }
    mutating func popBack() -> T? {
        guard !array.isEmpty else {return nil}
        return self.array.removeLast()
    }
}

var numbers = Deque<Int>()
numbers.pushBack(5)
numbers.pushBack(8)
numbers.pushBack(3)
assert(numbers.count == 3)
assert(numbers.popFront()! == 5)
assert(numbers.popBack()! == 3)
assert(numbers.popFront()! == 8)
assert(numbers.popBack() == nil)




/*
 Write a function that accepts a variadic array of integers and return the sum of all numbers that
 appear an even number of times.
 
 Sample input and output
 • The code challenge49(1, 2, 2, 3, 3, 4) should return 5, because the numbers 2 and 3 appear twice each.
 • The code challenge49(5, 5, 5, 12, 12) should return 12, because that’s the only number that appears an even number of times.
 • The code challenge49(1, 1, 2, 2, 3, 3, 4, 4) should return 10.
 */
func sumEven(numbers: Int...) -> Int {
    var dictionary = [Int: Int]()
    
    numbers.forEach {
        dictionary[$0 , default: 0] += 1
    }
    
    return dictionary.filter { $1 % 2 == 0 }.map {$0.key}.reduce(0) { $0 + $1 }
}
sumEven(numbers: 1, 2 , 2, 3, 3, 4)
sumEven(numbers: 5, 5, 5, 12, 12)
sumEven(numbers: 1, 1, 2, 2, 3, 3, 4, 4)





/*
 Write one function that sums an array of numbers. The array might contain all integers, all
 doubles, or all floats.
 
 Sample input and output
 • The code challenge52(numbers: [1, 2, 3]) should return 6.
 • The code challenge52(numbers: [1.0, 2.0, 3.0]) should return 6.0.
 • The code challenge52(numbers: Array<Float>([1.0, 2.0, 3.0])) should return 6.0.
 */

func sumUP<T: Numeric>(input: [T]) -> T {
    return input.reduce(0, +)
}
sumUP(input: [1, 2, 3])
sumUP(input: [1.0, 2.0, 3.0])
sumUP(input: Array<Float>([1.0, 2.0, 3.0]))


/*
 Someone used the linked list you made previously, but they accidentally made one of the items link back to an earlier part of the list. As a result, the list can’t be traversed properly because it loops infinitely.
 Your job is to write a method for your linked list that returns the node at the start of its loop, i.e. the one that is linked back to.
 */
extension LinkedList{
    func findNode() -> LinkedListNode<T>? {
        var current = start
        var seen = Set<LinkedListNode<T>>()
        
        while let node = current {
            if seen.contains(node){
                return node
            }else {
                seen.insert(node)
                current = node.next
            }
        }
        return nil
    }
}

extension LinkedListNode: Hashable {
    static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}



/*
 Create a binary search tree data structure that can be initialized from an unordered array of
 comparable values, then write a method that returns whether the tree is balanced.
 */

class Node<T> {
    var value: T
    var rightNode: Node?
    var leftNode: Node?
    
    init(value: T) {
        self.value = value
    }
}

class Tree<T: Comparable>: CustomStringConvertible{
    
    var description: String{
        guard root != nil else { return "Tree is Empty"}
        var queue = [Node<T>]()
        queue.append(root!)
        
        var output = ""
        
        while queue.count > 0 {
            var nodesAtCurrentLevel = queue.count
            
            while nodesAtCurrentLevel > 0 {
                
                let node = queue.removeFirst()
                output += "\(node.value)"
                
                if node.leftNode != nil { queue.append(node.leftNode!)}
                if node.rightNode != nil {queue.append(node.rightNode!)}
                
                nodesAtCurrentLevel -= 1
            }
            output += "\n"
        }
        return output
    }
    
    
    var root: Node<T>?
    
    
    init(array: [T]) {
        for item in array {
            
            
            var created = false       //Tracks whether a node has been created from the item
            
            if let predecessor = root {
                
                var parent = predecessor
                
                while !created{
                    
                    if item <= parent.value {
                        if parent.leftNode == nil {
                            parent.leftNode = Node(value: item)
                            created = true
                        }
                        parent = parent.leftNode!
                        
                    }else {
                        if parent.rightNode == nil {
                            parent.rightNode = Node(value: item)
                            created = true
                        }
                        parent = parent.rightNode!
                    }
                }
            }else{
                root = Node(value: item)
            }
        }
    }
    
    
    
    func isBalanced() -> Bool {
        func minDepth(from node:Node<T>?) -> Int {
            guard let node = node else { return 0 }
            
            let returnValue = 1 + min(minDepth(from: node.leftNode), minDepth(from: node.rightNode))
            print("Got min depth \(returnValue) for \(node.value)")
            return returnValue
        }
        
        
        func maxDepth(from node: Node<T>?) -> Int {
            guard let node = node else { return 0 }
            let returnValue = 1 + max(maxDepth(from: node.leftNode), maxDepth(from: node.rightNode))
            print("Got max depth \(returnValue) for \(node.value)")
            return returnValue
        }
        
        guard let root = root else { return true }
        let difference = maxDepth(from: root) - minDepth(from: root)
        return difference <= 1 }
}


let tree = Tree(array: [1 , 3 , 5 , 3 , 2 , 9 , 7 , 8])
tree.description
tree.isBalanced()
