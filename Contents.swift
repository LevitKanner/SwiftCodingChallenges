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
