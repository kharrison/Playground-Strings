/*:
 ## Substrings

 When you slice a string in Swift 4 you do not get back a `String` you get a `Substring`. A `Substring` has most of the same methods as a `String` (it conforms to `StringProtocol`) which makes life easy.

 A `Substring` shares the storage of the original string. For this reason you should treat it a temporary object. From The Swift Programming Language (Swift 4):

 > substrings aren't suitable for long-term storage -- because they reuse the storage of the original string the entire original string must be kept in memory as long as any of its substrings are being used.

 If you want to store it or pass it around convert it back to a `String`.
 */
import Foundation

/*:
 In Swift 4 you slice a string into a substring using subscripting.
 The use of `substring(from:)`, `substring(to:)` and `substring(with:)` are all deprecated.

 To get a substring from an index up to the end of the string:
 */
let template = "<<<Hello>>>"
let indexStartOfText = template.index(template.startIndex, offsetBy: 3) // 3
let indexEndOfText = template.index(template.endIndex, offsetBy: -3)    // 8

// Swift 4
let substring1 = template[indexStartOfText...]  // "Hello>>>"

// Swift 3 deprecated
// let substring1 = template.substring(from: indexStartOfText)

/*:
 To get a substring from the start of the string up to an index:
 */
// Swift 4
let substring2 = template[..<indexEndOfText]    // "<<<Hello"

// Swift 3 deprecated
// let substring2 = template.substring(to: indexEndOfText)

/*:
 To get a range within the String
 */
// Swift 4
let substring3 = template[indexStartOfText..<indexEndOfText]                       // "Hello"
// Swift 3 deprecated
// let substring3 = template.substring(with: indexStartOfText..<indexEndOfText)

//: To directly get the range:
if let range3 = template.range(of: "Hello") {
    template[range3] // "Hello"
}

/*:
 ### Converting A Substring Back To A String

 Use the `String()` initializer to convert back to a `String`.
 */
let string1 = String(substring1)

/*:
 ### Getting a Prefix or Suffix

 If you just need to drop/retrieve elements at the beginning or end of a `String`.

 These all return a `Substring` - use the `String()` initializer if you need to convert back to a `String`.
 */
let digits = "0123456789"
let tail = digits.dropFirst()  // "123456789"
let less = digits.dropFirst(3) // "3456789"
let head = digits.dropLast(3)  // "0123456"
let prefix = digits.prefix(2)  // "01"
let suffix = digits.suffix(2)  // "89"

/*:
 With Swift 4, prefer to use subscripting over the verbose prefix and suffix methods.
 */

let index4 = digits.index(digits.startIndex, offsetBy: 4)

// The first of each of these examples is preferred
digits[...index4]               // "01234"
digits.prefix(through: index4)

digits[..<index4]               // "0123"
digits.prefix(upTo: index4)

digits[index4...]               // "456789"
digits.suffix(from: index4)

//: ### Insert A Character At Index
var stars = "******"
stars.insert("X", at: stars.index(stars.startIndex, offsetBy: 3)) // "***X***"

//: ### Replace With Range
if let xyzRange = stars.range(of: "XYZ") {
    stars.replaceSubrange(xyzRange, with: "ABC") // "***ABC***"
}

/*:
 ### Append

 You concatenate strings with the `+` operator or the `append` method:
 */
var message = "Welcome"
message += " Tim" // "Welcome Tim"
message.append("!!!")

/*:
 ### Remove and return element at index

 This invalidates any indices you may have on the string
 */
var grades = "ABCDEF"
let ch = grades.remove(at: grades.startIndex) // "A"
print(grades)                                 // "BCDEF"

/*:
 ### Remove Range

 Invalidates all indices
 */
var sequences = "ABA BBA ABC"
let lowBound = sequences.index(sequences.startIndex, offsetBy: 4)
let hiBound = sequences.index(sequences.endIndex, offsetBy: -4)
let midRange = lowBound ..< hiBound
sequences.removeSubrange(midRange) // "ABA ABC"
/*:
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
