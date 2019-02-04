/*:
 ## Finding Matches

 The `Sequence` and `Collection` methods for finding the first and last element and index of an element that matched a predicate all work with `String`.
 */
import Foundation
/*:
 ### Contains
 Testing if a `String` contains another `String`
 */
let alphabet = "abcdefghijklmnopqrstuvwxyz"
alphabet.contains("jkl")
/*:
 ### Find First Or Last Match

 To find the index of the first matching element (but note that the return value is an optional):
 */
let k = alphabet.first { $0 > "j" }

if let matchedIndex = alphabet.firstIndex(of: "x") {
    alphabet[matchedIndex]  // "x"
}
let nomatchIndex = alphabet.firstIndex(of: "A") // nil

if let nextIndex = alphabet.firstIndex(where: { $0 > "j" }) {
    alphabet[nextIndex]  // "k"
}

/*:
 Swift 4.2 also adds equivalent methods to find the
 last element.
 */
let lastMatch = alphabet.last { $0 > "j" } // "z"

if let lastX = alphabet.lastIndex(of: "x") {
    alphabet[lastX] // "x"
}

if let lastIndex = alphabet.lastIndex(where: { $0 > "j" }) {
    alphabet[lastIndex] // "z"
}
/*:
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
