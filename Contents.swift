import UIKit

/* Create an extension for arrays that sorts them using the bubble sort algorithm.
 Tip: A bubble sort repeatedly loops over the items in an array, comparing items that are next to each other and swapping them if they aren’t sorted. This looping continues until all items are in their correct order.
 
 Sample input and output
 • The array [12, 5, 4, 9, 3, 2, 1] should become [1, 2, 3, 4, 5, 9, 12].
 • The array ["f", "a", "b"] should become ["a", "b", "f"].
 • The array [String]() should become [].
 */

extension Array where Element: Comparable {
    func bubbleSort() -> Self {
        guard !self.isEmpty else {return []}
        var copy = self
        
        var swapMade: Bool
        
        repeat {
            swapMade = false
            
            for index in  0..<copy.count - 1 {
                
                let current = copy[index]
                let next = copy[index + 1]
                
                if current > next {
                    copy.swapAt(index, index + 1)
                    swapMade = true
                }
            }
            
        }while swapMade
        
        return copy
    }
}
[12, 5, 4, 9, 3, 2, 1].bubbleSort()





/*
 Create an extension for arrays that sorts them using the insertion sort algorithm.
 Tip: An insertion sort creates a new, sorted array by removing items individually from the input array and placing them into the correct position in the new array.
 
 Sample input and output
 • The array [12, 5, 4, 9, 3, 2, 1] should become [1, 2, 3, 4, 5, 9, 12].
 • The array ["f", "a", "b"] should become ["a", "b", "f"].
 • The array [String]() should become [].
 */

extension Array where Element: Comparable{
    func insertionSort() -> [Element]{
        guard !self.isEmpty else { return [] }
        
        var copy = self
        var sorted = [Element]()
        
        for _ in 0..<copy.count{
            
            //Removes first element in self
            let current = copy.removeFirst()
            
            //Tracks whether an item was inserted
            var inserted = false
            
            //Inserts the first item into the new array
            guard !sorted.isEmpty else {
                sorted.append(current)
                continue
            }
            
            for (position , item ) in sorted.enumerated(){
                if current < item {
                    sorted.insert(current, at: position)
                    inserted = true
                    break
                }
            }
            
            //Adds to the back of the array when an item wasn't inserted
            if !inserted {
                sorted.append(current)
            }
        }
        
        return sorted
    }
}
["f", "a", "b"].insertionSort()
[12, 5, 4, 9, 3, 2, 1] .insertionSort()
[4, 7, 0, 5, 7, 9, 13, 56, 20].insertionSort()
[100, 34 , 76 , 88 , 90 , 5].insertionSort()
["Levit" , "king" , "write" , "Swift"].insertionSort()





func inArray(_ a1: [String], _ a2: [String]) -> [String] {
    var intersection = [String]()
    
    for word in a1 {
        a2.forEach {
            if $0.contains(word){
                if !intersection.contains(word){
                    intersection.append(word)
                }
            }
        }
    }
    
    return intersection.sorted()
}
inArray(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"])





/*
 A function that returns the number of times the individual digits in a number must be multiplied to get a single digit number
 */
func persistence(for num: Int) -> Int {
    guard String(num).count > 1 else { return 0 }
    
    var result: String = String(num)
    var count = 0
    
    repeat {
        let components = result.compactMap { String($0) }
        
        let product = components.reduce(1) {$0 * Int($1)!}
        
        result = String(product)
        
        count += 1
        
    }while result.count > 1
    
    return count
}
persistence(for: 34)
persistence(for: 39)
persistence(for: 9)





func nbDig(_ n: Int, _ d: Int) -> Int {
    // your code
    guard d >= 0 && d <= 9 else { return 0 }
    let stringy = String(d)
    
    let squares = (0...n).map {$0 * $0}
    var numbersWithD = [String]()
    
    squares.forEach {
        if String($0).contains(stringy){
            numbersWithD.append("\($0)")
        }
    }
    return numbersWithD.joined().filter({$0 == Character(stringy)}).count
}
nbDig(8, 1)
nbDig(15, 2)





/*
 Write a function that accepts two values and returns true if they are isomorphic. That is, each
 part of the value must map to precisely one other, but that might be itself.
 Tip: Strings A and B are considered isomorphic if you can replace all instances of each letter with another. For example, “tort” and “pump” are isomorphic, because you can replace both Ts with a P, the O with a U, and the R with an M. For integers you compare individual digits, so 1231 and 4564 are isomorphic numbers. For arrays you compare elements, so [1, 2, 1] and [4, 8, 4] are isomorphic.
 
 Sample input and output
 These are all isomorphic values:
 • “clap” and “slap”
 • “rum” and “mud”
 • “pip” and “did”
 • “carry” and “baddy”
 • “cream” and “lapse”
 • 123123 and 456456
 • 3.14159 and 2.03048
 • [1, 2, 1, 2, 3] and [4, 5, 4, 5, 6]
 
 These are not isomorphic values:
 • “carry” and “daddy” – the Rs have become D, but C has also become D.
 • “did” and “cad” – the first D has become C, but the second has remained D.
 • “maim” and “same” – the first M has become S, but the second has become E.
 • “curry” and “flurry” – the strings have different lengths.
 */

func isomorphic<T>(first: T , second: T) -> Bool {
    
    guard "\(first)".count == "\(second)".count else { return false }
    
    func countOfElements<T>(input: T) -> [Int]{
        var count = 0
        let stringy = "\(input)".sorted()
        var currentElement: Character = stringy.first!
        var counts = [Int]()
        
        for char in stringy{
            
            if currentElement == char {
                count += 1
            }else{
                counts.append(count)
                currentElement = char
                count = 1
            }
        }
        counts.append(count)
        
        return counts
    }
    
    return countOfElements(input: first).sorted() == countOfElements(input: second).sorted()
}
isomorphic(first: "clap", second: "slap")
isomorphic(first: "rum", second: "mud")
isomorphic(first: "pip", second: "did")
isomorphic(first: "carry", second: "baddy")
isomorphic(first: "cream", second: "lapse")
isomorphic(first: "123123", second: "456456")
isomorphic(first: "3.14159", second: "2.03048")
isomorphic(first: "[1, 2, 1, 2, 3]", second: "[4, 5, 4, 5, 6]")
isomorphic(first: "carry", second: "daddy")
isomorphic(first: "did", second: "cad")
isomorphic(first: "maim", second: "same")
isomorphic(first: "curry", second: "flurry")







/*
 Write a function that accepts a string containing the characters (, [, {, <, >, }, ], and ) in any arrangement and frequency. It should return true if the brackets are opened and closed in the correct order, and if all brackets are closed. Any other input should false.
 
 Sample input and output
 • The string “()” should return true.
 • The string “([])” should return true.
 • The string “([])(<{}>)” should return true.
 • The string “([]{}<[{}]>)” should return true. • The string “” should return true.
 • The string “}{” should return false.
 • The string “([)]” should return false.
 • The string “([)” should return false.
 • The string “([” should return false.
 • The string “[<<<{}>>]” should return false.
 • The string “hello” should return false.
 */

func balancedBrackets(input: String) -> Bool {
    let validBrackets = "(<{[]}>)"
    let invalidCharacters = CharacterSet(charactersIn: validBrackets).inverted
    
    guard input.rangeOfCharacter(from: invalidCharacters) == nil else { return false }
    
    let brackets: [Character: Character] = ["(": ")" , "<" : ">" , "{" : "}" , "[" : "]"]
    var usedBrackets = [Character]()
    
    for bracket in input {
        
        if brackets.keys.contains(bracket){
            //Pushes bracket onto stack if it is an opening bracket
            usedBrackets.append(bracket)
        }else{
            
            //Checks the last opening bracket in the stack, if the current bracket is its closing bracket continue; else return false
            if let previousBracket = usedBrackets.popLast() {
                if brackets[previousBracket] != bracket {
                    return false
                }
            }else {
                //Return false when theres no opening bracket in the stack
                return false
            }
        }
    }
    return usedBrackets.count == 0
}
balancedBrackets(input: "([])(<{}>)")
balancedBrackets(input: "([])")
balancedBrackets(input: "[<<<{}>>]")



func playPass(_ s: String, _ n: Int) -> String {
    let alphabets = Array("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz").map(String.init)
    let array = Array(s.lowercased()).map(String.init)
    var new = [String]()
    
    for (_ ,character ) in array.enumerated() {
        
        if ("0"..."9") ~= character {
            new.append("\(9 - Int("\(character)")!)".uppercased())
            continue
        }
        
        if alphabets.contains(character) {
            for (index , letter ) in alphabets.enumerated(){
                if letter == character{
                    new.append("\(alphabets[index + n].uppercased())")
                    break
                }
            }
            continue
        }
        
        new.append("\(character)")
    }
    
    for (position , element) in new.enumerated(){
        if position % 2 == 1 {
            new.remove(at: position)
            new.insert(element.lowercased(), at: position)
        }
    }
    return new.reversed().joined()
}




/*
 Create an extension for arrays that sorts them using the quicksort algorithm.
 */

extension Array where Element: Comparable {
    func quicksort() -> [Element] {
        guard self.count > 1 else { return self}
        let pivot = self.randomElement()!
        
        let lesserValues = self.filter { $0 < pivot }
        let greaterValues = self.filter { $0 > pivot }
        let equalValues = self.filter { $0 == pivot }
        
        return lesserValues.quicksort() + equalValues + greaterValues.quicksort()
    }
}
[1 , 6 , 10 , 8,  4 , 5, 6].quicksort()




/*
 Create a function that detects whether either player has won in a game of Tic-Tac-Toe.
 Tip: A tic-tac-toe board is 3x3, containing single letters that are either X, O, or empty. A win is three Xs or Os in a straight line.
 */

func tictoeWinner(board: [[String]]) -> Bool{
    for i in 0..<3{
        //Checks all rows
        if board[i][0] != "" && board[i][0] == board[i][1] && board[i][0] == board[i][2] {
            return true
        }
        //Checks all columns
        if board[0][i] != "" && board[0][i] == board[1][i] && board[0][i] == board[2][i] {
            return true
        }
        //Checks forward diagonal
        if board[0][0] != "" && board[0][0] == board[1][1] && board[0][0] == board[2][2]{
            return true
        }
        //checks backward diagonal
        if board[0][2] != "" && board[0][2] == board[1][1] && board[0][2] == board[2][0]{
            return true
        }
    }
    
    //After all checks and couldn't return
    return false
}
tictoeWinner(board: [
    ["X", "" , "O"]
    , ["" , "X" , "O"]
    , ["", "" , "X"]
])



/*
 Write a function that returns an array of prime numbers from 2 up to but excluding N, taking
 care to be as efficient as possible.
 Tip: Calculating primes is easy. Calculating primes efficiently is not. Take care!
 
 Sample input and output
 • The code challenge61(upTo: 10) should return 2, 3, 5, 7.
 • The code challenge61(upTo: 11) should return 2, 3, 5, 7; remember to exclude the upper
 bound.
 • The code challenge61(upTo: 12) should return 2, 3, 5, 7, 11.
 */

//My First solution
func primeNumbers(upTo: Int) -> [Int]{
    guard upTo > 2 else { return [2]}
    var primes = [Int]()
    
    for number in 2..<upTo {
        
        if (2..<number).allSatisfy({number % $0 != 0}){
            primes.append(number)
        }
    }
    return primes
}

primeNumbers(upTo: 10)
primeNumbers(upTo: 11)
primeNumbers(upTo: 12)


//My solution after trying to optimize
func optimized(upTo: Int) -> [Int]{
    guard upTo > 2 else { return [2]}
    var primes = [Int]()
    
    for number in 2..<upTo {
        
        //Assumes all numbers are prime
        var isPrime = true
        
        for value in 2..<number {
            //Sets isPrime to false when a number that can divide the current number is found
            if number % value == 0 {
                isPrime = false
                break
            }
        }
        
        if isPrime {
            primes.append(number)
        }
        
    }
    
    return primes
}
optimized(upTo: 10)
optimized(upTo: 11)
optimized(upTo: 12)



func challenge61(upTo max: Int) -> [Int] {
    guard max > 1 else { return [] }
    var sieve = [Bool](repeating: true, count: max)
    sieve[0] = false
    sieve[1] = false
    for number in 2 ..< max {
        if sieve[number] == true {
            for multiple in stride(from: number * number, to: sieve.count, by: number) {
                sieve[multiple] = false }
        }
        
    }
    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}
challenge61(upTo: 10)
challenge61(upTo: 11)
challenge61(upTo: 12)



class Solution {
    static func twosum(numbers: [Double], target: Double) -> [Int] {
        
        var indices = [Int]()
        
        for (index , value ) in numbers.enumerated(){
            
            //        guard index != numbers.endIndex - 1 else { return indices}
            
            for position in (index + 1)..<numbers.count{
                if value + numbers[position] == target {
                    indices.append(index )
                    indices.append(position)
                }
            }
            
        }
        return indices
    }
}

Solution.twosum(numbers: [1, 2, 3], target: 4)
Solution.twosum(numbers: [1,54,24,35], target: 59)



func duplicateEncode(_ word: String) -> String {
    var copy = [String]()
    
    var characterDictionary = [Character: Int]()
    
    for character in word.lowercased() {
        characterDictionary[character , default: 0] += 1
    }
    
    let singles = String(characterDictionary.filter {$0.value == 1}.keys).lowercased()
    
    for letter in word.lowercased() {
        if singles.contains(letter){
            copy.append("(")
            continue
        }
        copy.append(")")
    }
    return copy.joined()
}
duplicateEncode("Success")



func dig_pow(for number: Int , using power: Int) -> Int {
    var power = power
    let digits = Array("\(number)")
    var powered = [Double]()
    
    for digit in digits {
        powered.append(pow(Double(String(digit))!, Double(power)))
        power += 1
    }
    return powered.reduce(0, +).truncatingRemainder(dividingBy: Double(number)) == 0 ? Int(powered.reduce(0, +) / Double(number)) : -1
}

dig_pow(for: 89, using: 1)
dig_pow(for: 92, using: 1)
dig_pow(for: 695, using: 2)
dig_pow(for: 46288, using: 3)



func countDuplicates(_ s:String) -> Int {
    var dictionary = [Character: Int]()
    var count = 0
    
    for character in s.lowercased(){
        dictionary[character , default: 0] += 1
    }
    
    for (_ , value ) in dictionary where value >= 2{
        count += 1
    }
    return count
}
countDuplicates("abcde")
countDuplicates("aabbcde")
countDuplicates("aabBcde")
countDuplicates("indivisibility")
countDuplicates("aA11")
countDuplicates("ABBA")
countDuplicates("Indivisibilities")


func shiftedDiff(_ s1: String, _ s2: String) -> Int? {
    let combined = (s2 + s2)
    guard combined.contains(s1) else {return nil}
    let left = combined.replacingOccurrences(of: s1, with: " ")
    
    var returnWord = ""
    
    for (_ , letter) in left.enumerated(){
        if letter != " " {
            returnWord += "\(letter)"
            continue
        }
        break
    }
    return returnWord.count
}



func camelCase(_ str: String) -> String {
    return str.capitalized.replacingOccurrences(of: " ", with: "")
}
camelCase("hello case")
camelCase("camel case word")
camelCase("")


/*
 An extension on Integers to tell if a number is prime
 */
extension Int {
    func isPrime() -> Bool{
        guard (2...) ~= self else { return false }
        
        for i in 2...((self / 2) + 1){
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}



func gap(_ g: Int, _ m: Int, _ n: Int) -> (Int, Int)? {
    guard g % 2 == 0 else {return nil}
    var previous: Int?
    
    for i in m...n where i.isPrime() {
        if let first = previous {
            if i - first == g {
                return (first , i)
            }else{
                previous = i
            }
        }else {
            previous = i
        }
    }
    return nil
}



func mix(_ s1: String, _ s2: String) -> String {
    let keys = Set( s1 + s2)
    
    let firstString = s1.replacingOccurrences(of: " ", with: "")
    let secondString = s2.replacingOccurrences(of: " ", with: "")
    
    var s1Dict = [Character : Int]()
    var s2Dict = [Character : Int]()
    
    for letter in firstString { s1Dict[letter , default: 0] += 1 }
    for letter in secondString { s2Dict[letter , default: 0] += 1 }
    
    var returnString = [String]()
    
    for key in keys{
        guard key.isLetter else {continue}
        guard s1Dict[key , default: 0] > 1 || s2Dict[key , default: 0] > 1 else {continue}
        
        if s1Dict[key , default: 0] > s2Dict[key , default: 0]{
            let count = s1Dict[key]
            returnString.append("1:\(String(repeating: key, count: count!))")
        }
        
        if s1Dict[key , default: 0] < s2Dict[key , default: 0]{
            let count = s2Dict[key]
            returnString.append("2:\(String(repeating: key, count: count!))")
        }
        
        if s1Dict[key , default: 0] == s2Dict[key , default: 0]{
            let count = s2Dict[key]
            returnString.append("E:\(String(repeating: key, count: count!))")
        }
    }
    let sorted = returnString.sorted {
        if $0.count != $1.count {
            return $0.count > $1.count
        }
        
        if $0.count == $1.count {
            return $0.first! < $1.first!
        }
        
        if $0.first! == $1.first! {
            return $0.last! < $1.last!
        }
        
        return $0 < $1
    }
    return sorted.joined(separator: "/")
}



extension BinaryInteger {
    func clamp() -> Self {
        return min(max(self, 0), 255)
    }
}


/*
 Returns rgb format
 */
func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
    return String(format: "%02X%02X%02X", r.clamp() , g.clamp() , b.clamp())
}


/*
 Divisors of 42 are : 1, 2, 3, 6, 7, 14, 21, 42. These divisors squared are: 1, 4, 9, 36, 49, 196, 441, 1764. The sum of the squared divisors is 2500 which is 50 * 50, a square!

 Given two integers m, n (1 <= m <= n) we want to find all integers between m and n whose sum of squared divisors is itself a square. 42 is such a number.
 */
func sumOfSquaredDivisors(of num: Int) -> Int {
    guard num > 1 else { return 1 }
    var result = (num * num )
    
    for i in 1 ... (num / 2 ) {
        if num % i == 0 {
            result += (i * i)
        }
    }
    return result
}

func isSquare(_ num: Int) -> Bool {
    let root = sqrt(Double(num)).rounded()
    return Int(pow(root, 2)) == num
}


func listSquared(_ m: Int, _ n: Int) -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    for num in m...n {
        let sum = sumOfSquaredDivisors(of: num)
        if isSquare(sum){
            result.append((num, sum))
        }
    }
    return result
}







