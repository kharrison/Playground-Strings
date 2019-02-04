/*:
 ## Initializing A String

 There are an almost endless number of ways to create a String, using literals, conversions from other Swift types, Unicode, etc.
 */
import Foundation

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
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
