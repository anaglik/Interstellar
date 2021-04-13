import Foundation

internal class Fail: Error, Equatable {
    public static func ==(lhs: Fail, rhs: Fail) -> Bool {
        return lhs.error == rhs.error
    }

    let error: String
    
    internal init(_ error: String) {
        self.error = error
    }
}
