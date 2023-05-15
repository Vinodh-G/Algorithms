import UIKit

var greeting = "Hello, playground"


class Test {
    
    func testCompletion(completionBlock: @escaping (_ success: Bool) -> Void) {
        testCompletion(completionBlock: completionBlock)
    }
    
    func testCompletion2(completionBlock: @escaping (_ success: Bool) -> Void) {
//        DispatchQueue.main.async {
            completionBlock(true)
            
//        }
    }
    
}


let t1 = Test()

t1.testCompletion { success in
    print(success)
}
