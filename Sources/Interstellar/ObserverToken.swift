// Copyright (c) 2015 Jens Ravens (http://jensravens.de)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

/// Observer tokens are created by observables to hande unsubscription. You are not supposed to create them directly.
//public final class ObserverToken: Hashable {
//    private weak var observable: Unsubscribable?
//    public let hashValue: Int
//
//    internal init (observable: Unsubscribable, hashValue: Int) {
//        self.observable = observable
//        self.hashValue = hashValue
//    }
//
//    public func unsubscribe() {
//        observable?.unsubscribe(self)
//    }
//}
//
//public func ==(lhs: ObserverToken, rhs: ObserverToken) -> Bool {
//    return lhs.hashValue == rhs.hashValue
//}


public final class ObserverToken: Hashable {
    public static func == (lhs: ObserverToken, rhs: ObserverToken) -> Bool {
        return lhs.hashingValue == rhs.hashingValue
    }
    
    private weak var observable: Unsubscribable?
    public let hashingValue: Int
    
    internal init (observable: Unsubscribable, hashValue: Int) {
        self.observable = observable
        self.hashingValue = hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashingValue)
    }
    
    public func unsubscribe() {
        observable?.unsubscribe(self)
    }
}
