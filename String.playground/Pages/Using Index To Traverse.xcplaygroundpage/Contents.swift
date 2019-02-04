/*:
 ## Using Index To Traverse A Collection

 Each of the collection views has an Index
 that you use to traverse the collection.
 This is maybe one of the big causes of pain
 when getting to grips with String. You cannot
 randomly access an element in a string using
 a subscript (e.g. string[5]).

 Each collection has two instance properties you
 can use as subscripts to index into the collection:

 +  `startIndex`: the position of the first element if
 non-empty, else identical to endIndex.
 +  `endIndex`: the position just “past the end” of the string.
 */
import Foundation

/*:
 When used directly with a `String` or `Substring` you
 get an index into the character view:
 */
let hello = "hello"
let startIndex = hello.startIndex // 0
let endIndex = hello.endIndex     // 5
hello[startIndex] // "h"

/*:
 **Note the choice for `endIndex` means you cannot use it directly as a subscript as it is out of range.**
 */

/*:
 Use `index(after:)` and `index(before:)` to move forward or backward from an index
 */
hello[hello.index(after: startIndex)] // "e"
hello[hello.index(before: endIndex)]  // "o"

//: Use `index(_:offsetBy:)` to move in arbitrary steps. A negative offset moves backwards:
hello[hello.index(startIndex, offsetBy: 1)]  // "e"
hello[hello.index(endIndex, offsetBy: -4)]   // "e"

/*:
 You can also limit the offset to avoid an error when you run off the end of the index. The function `index(_:offsetBy:limitedBy:)` returns an optional which will be `nil` if you go too far:
 */
if let someIndex = hello.index(startIndex, offsetBy: 4, limitedBy: endIndex) {
    hello[someIndex] // "o"
}

//: Using the `utf16` view
let cafe = "café"
let view = cafe.utf16
let utf16StartIndex = view.startIndex
let utf16EndIndex = view.endIndex

view[utf16StartIndex]                          // 99 - "c"
view[view.index(utf16StartIndex, offsetBy: 1)] // 97 - "a"
view[view.index(before: utf16EndIndex)]        // 233 - "é"

/*:
 The indices property returns a range for all elements
 in a String that can be useful for iterating through
 the collection:
 */
for index in cafe.indices {
    print(cafe[index])
}

/*:
 You cannot use an index from one string to access a
 different string. You can convert an index to an integer
 value with the `distance(from:to:)` method:
 */
let word1 = "ABCDEF"
let word2 = "012345"
if let indexC = word1.firstIndex(of: "C") {
    let distance = word1.distance(from: word1.startIndex, to: indexC) // 2
    let digit = word2[word2.index(startIndex, offsetBy: distance)]    // "2"
    print(digit)
}
/*:
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
