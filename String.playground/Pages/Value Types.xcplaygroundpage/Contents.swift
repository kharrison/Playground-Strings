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
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
