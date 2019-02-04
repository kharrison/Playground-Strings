/*:
 ## Character Collections

 In Swift 4 Strings are back to being collections of
 characters. You can access different representations
 of the string through the appropriate collection view.
 */
import Foundation

let country = "España"
country.unicodeScalars   // Unicode scalar 21-bit codes
country.utf16            // UTF-16 encoding
country.utf8             // UTF-8 encoding

/*:
 ### Strings Are Collections Of Characters (Swift 4)

 A `String` is now a collection of characters by default so iterating over a `String` or `Substring` gives you each character in the `String`:
 */

// Swift 4
for character in country {
    print(character)
}

/*:
 To get the first or last character in a `String`. The
 result is an optional returning nil if the `String` is
 empty.
 */
country.first  // "E"
country.last   // "a"

/*:
 ### Random Element and Shuffle

 Swift 4.2 allows you to get a random element from
 any collection. When used on a `String` you get a
 random character or `nil` if the `String` is empty:
 */
let suits = "♠︎♣︎♥︎♦︎"
suits.randomElement()

/*:
 Iterate over shuffled `String`
 */
for suit in suits.shuffled() {
    print(suit)
}

/*:
 ### Counting

 Count is implemented for each of the collection views
 as it is dependent on the representation. The `count`
 property of a String is the character count.
 */

let spain = "España"
spain.count                  // 6
spain.unicodeScalars.count  // 6
spain.utf16.count           // 6
spain.utf8.count            // 7
/*:
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
