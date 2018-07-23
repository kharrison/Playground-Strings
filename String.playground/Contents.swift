/*:
# Swift String Cheat Sheet

 The Swift String API is [hard](https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html) to get used to. It has also changed over time as the Swift language and the standard library have developed. I first wrote this guide for Swift 2 and have since needed to update it for Swift 3 and now Swift 4. So for my future reference and yours if you are struggling to make sense of it all here is my Swift String Cheat Sheet.

The blog post that accompanies this playground:

+ [Swift String Cheat Sheet](https://useyourloaf.com/blog/swift-string-cheat-sheet/)

## Xcode Playground

You can get the latest version of the Xcode playground from my GitHub repository:

+ [Xcode Strings Playground](https://github.com/kharrison/Playground-Strings)

## Version History

 See the following posts for the main changes since I first wrote this guide for Swift 2:

 + [Updating Strings for Swift 4.2](https://useyourloaf.com/blog/updating-strings-for-swift-4.2/)
 + [Updating Strings For Swift 4](https://useyourloaf.com/blog/updating-strings-for-swift-4/)
 + [Updating Strings For Swift 3](https://useyourloaf.com/blog/updating-strings-for-swift-3/)

 © 2015-2018 Keith Harrison - [useyourloaf.com](https://useyourloaf.com)
*/

//: ## Setup
//: Import Foundation if you want to bridge to NSString
import Foundation

/*:
 ## Initializing A String

There are an almost endless number of ways to create a String, using literals, conversions from other Swift types, Unicode, etc.
 */
var emptyString = ""        // Empty (Mutable) String
let stillEmpty = String()   // Another empty String
let helloWorld = "Hello World!" // String inferred

let a = String(true)        // from boolean: "true"
let b: Character = "A"      // Explicit type required to create a Character
let c = String(b)           // from character "A"
let d = String(3.14)        // from Double "3.14"
let e = String(1000)        // from Int "1000"
let f = "Result = \(d)"     // Interpolation "Result = 3.14"
let g = "\u{2126}"          // Unicode Ohm sign Ω

// New in Swift 4.2
let hex = String(254, radix: 16, uppercase: true) // "FE"
let octal = String(18, radix: 8) // "22"
//: ### Creating A String With Repeating Values
let h = String(repeating:"01", count:3) // 010101

/*:
 ### Creating A String From A File

 The file is in the playground Resources folder.
 */
if let txtPath = Bundle.main.path(forResource: "lorem", ofType: "txt") {
  do {
    let lorem = try String(contentsOfFile: txtPath, encoding: .utf8)
    print(lorem)
  } catch {
    print("Something went wrong")
  }
}

/*:
 ### Multi-line String Literals (Swift 4)
  Swift now allows you to create a multi-line String literals. You wrap the strings in triple double quotes (`"""String"""`). You do not need to escape newlines and quotes within the string:
 */
let verse = """
    To be, or not to be - that is the question;
    Whether 'tis nobler in the mind to suffer
    The slings and arrows of outrageous fortune,
    Or to take arms against a sea of troubles,
    """
/*:
You can control the leading white space with the indentation of the text relative to the closing `"""`. In the last example there is no leading whitespace in the final string literal. In this next example we indent the text by two spaces:
 */
let indentedText = """
    Hello, this text is indented by
    two spaces from the closing quotes
  """
/*:
 Source code with overly long string literals can be hard to read. To split long lines in the source use a \ to escape the new line.
 */
let singleLongLine = """
    This is a single long line split \
    over two lines by escaping the newline.
    """

/*:
 ## Strings Are Value Types
 Strings are value types that are copied when assigned
 or passed to a function. The copy is performed lazily
 on mutation.
 */
var aString = "Hello"
var bString = aString
bString += " World!"
print("\(aString)")   // "Hello\n"

//: ### Testing For Empty
let name = ""
name.isEmpty   // true

let title = String()
title.isEmpty  // true

/*:
 ### Testing For Equality

 Swift is Unicode correct so the equality operator
 (“==”) checks for Unicode canonical equivalence.
 This means that two Strings that are composed from
 different Unicode scalars will be considered equal
 if they have the same linguistic meaning and appearance:
 */
let spain = "España"
let tilde = "\u{303}"
let country = "Espan" + "\(tilde)" + "a"
if country == spain {
  print("Matched!")       // "Matched!\n"
}

//: ### Comparing For Order
if "aaa" < "bbb" {
  print("aaa is less than bbb")
}

//: ### Testing For Suffix/Prefix
let line = "0001 Some test data here %%%%"
line.hasPrefix("0001")    // true
line.hasSuffix("%%%%")    // true

//: ### Converting To Upper/Lower Case
let mixedCase = "AbcDef"
let upper = mixedCase.uppercased() // "ABCDEF"
let lower = mixedCase.lowercased() // "abcdef"

/*:
 ## Views

 In Swift 4 Strings are back to being collections of
 characters. You can access different representations
 of the string through the appropriate collection view.
 */
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
Using `characters` to get the character view is unnecessary and deprecated with Swift 4.2:
*/

// Swift 3
// This still works in Swift 4 but is
// deprecated in Swift 4.2
//for character in country.characters {
//    print(character)
//}

/*:
 To get the first or last character in a `String`. The
 result is an optional returning nil if the `String` is
 empty.
 */
country.first
country.last

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

// spain = "España"
spain.count                  // 6
spain.unicodeScalars.count  // 6
spain.utf16.count           // 6
spain.utf8.count            // 7

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
if let indexC = word1.index(of: "C") {
  let distance = word1.distance(from: word1.startIndex, to: indexC) // 2
  let digit = word2[word2.index(startIndex, offsetBy: distance)]    // "2"
    print(digit)
}

/*:
 ## Finding Characters

 The `Sequence` and `Collection` methods for finding the first and last element and index of an element that matched a predicate all work with `String`.
*/

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
 In Swift 4.2 the following methods still exist and have not yet been deprecated. It seems likely they will be deprecated by Swift 5 so you should migrate to the above methods:

 + alphabet.index(of: "x")
 + alphabet.index(where: { $0 > "j" })
 */

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
 ## Using A Range

 To identify a range of elements in a string collection use a range. A range is just a start and end index:
 */
let fqdn = "useyourloaf.com"
let tldEndIndex = fqdn.endIndex
let tldStartIndex = fqdn.index(tldEndIndex, offsetBy: -3)
let range = Range(uncheckedBounds: (lower: tldStartIndex, upper: tldEndIndex))
fqdn[range]

//: ### Creating A Range with `...` Or `..<` Operators
let endOfDomain = fqdn.index(fqdn.endIndex, offsetBy: -4)
let rangeOfDomain = fqdn.startIndex ..< endOfDomain
fqdn[rangeOfDomain] // useyourloaf

/*:
 ### Returning The Range Of A Matching Substring

 To return the range of a matching substring or `nil` if not found:
 */
if let rangeOfTLD = fqdn.range(of: "com") {
    let tld = fqdn[rangeOfTLD] // "com"
    print(tld)
}

/*:
 ## Substrings

 When you slice a string in Swift 4 you do not get back a `String` you get a `Substring`. A `Substring` has most of the same methods as a `String` (it conforms to `StringProtocol`) which makes life easy.

 A `Substring` shares the storage of the original string. For this reason you should treat it a temporary object. From The Swift Programming Language (Swift 4):

 > substrings aren't suitable for long-term storage -- because they reuse the storage of the original string the entire original string must be kept in memory as long as any of its substrings are being used.

 If you want to store it or pass it around convert it back to a `String`.
 */

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
 ## Bridging To `NSString`

 `String` is bridged to Objective-C as `NSString`.
 If the Swift Standard Library does not have what
 you need import the Foundation framework to get
 access to methods defined by NSString.
  
 Be aware that this is not a toll-free bridge so
 stick to the Swift Standard Library where possible.

 **Don't forget to import Foundation**
 */

let welcome = "hello world!"
welcome.capitalized // "Hello World!

/*:
 ### Searching for a substring

 An example of using `NSString` methods to perform a
 search for a substring:
 */
let text = "123045780984"
// Find last occurance of 0
if let rangeOfZero = text.range(of: "0", options: .backwards) {
  // Get the characters after the last 0
  let suffix = text[rangeOfZero.upperBound...] // "984"
  print(suffix)
}

/*:
 ## Further Reading

+ [Swift Standard Library Reference - String](https://developer.apple.com/reference/swift/string)

Swift evolution changes in Swift 4.2 that impact `String`:

+ [SE-0204 Add last(where:) and lastIndex(where:) Methods](https://github.com/apple/swift-evolution/blob/master/proposals/0204-add-last-methods.md)
+ [SE-0202 Random Unification](https://github.com/apple/swift-evolution/blob/master/proposals/0202-random-unification.md)

Swift Evolution Changes in Swift 4

+ [SE-0183 Substring performance affordances](https://github.com/apple/swift-evolution/blob/master/proposals/0183-substring-affordances.md)
+ [SE-0182 String Newline Escaping](https://github.com/apple/swift-evolution/blob/master/proposals/0182-newline-escape-in-strings.md)
+ [SE-0180 String Index Overhaul](https://github.com/apple/swift-evolution/blob/master/proposals/0180-string-index-overhaul.md)
+ [SE-0178 Add unicodeScalars property to Character](https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md)
+ [SE-0168 Multi-line String Literals](https://github.com/apple/swift-evolution/blob/master/proposals/0168-multi-line-string-literals.md)
+ [SE-0163 String Revision: Collection Conformance, C Interop, Transcoding](https://github.com/apple/swift-evolution/blob/master/proposals/0163-string-revision-1.md)

Swift Evolution Changes in Swift 3

+ [SE-0006 Apply API Guidelines to the Standard Library](https://github.com/apple/swift-evolution/blob/master/proposals/0006-apply-api-guidelines-to-the-standard-library.md)
+ [SE-0065 A New Model for Collections and Indices](https://github.com/apple/swift-evolution/blob/master/proposals/0065-collections-move-indices.md)
 */
