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
import Foundation

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
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
