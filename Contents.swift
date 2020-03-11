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
        print(result)
        
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
