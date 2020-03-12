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
    
    guard input.rangeOfCharacter(from: invalidCharacters) == nil else { return false}
    
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
    // your code
    
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
