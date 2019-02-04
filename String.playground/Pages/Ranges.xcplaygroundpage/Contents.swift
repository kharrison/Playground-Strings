/*:
 ## Using A Range

 To identify a range of elements in a string collection use a range. A range is just a start and end index:
 */
import Foundation

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
 * * *
 [Previous page](@previous) -
 [Next page](@next)

 [Back to Introduction](Introduction)
 * * *
 */
