
import java_swift
import Foundation

var responder: SwiftMathBinding_ResponderForward!

// one-off call to bind the Java and Swift sections of app
@_silgen_name("Java_com_millertech_tutorial_MainActivity_bind")
public func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
    
    NSLog("running bind()")
    
    // This Swift instance forwards to Java through JNI
    responder = SwiftMathBinding_ResponderForward( javaObject: __self )
    
    // This Swift instance receives native calls from Java
    var locals = [jobject]()
    return SwiftMathBinding_ListenerImpl().localJavaObject( &locals )
}

class SwiftMathBinding_ListenerImpl: SwiftMathBinding_ListenerBase {
    
    override func processSum(num1: Int, num2: Int) {
        let result = num1 + num2
        responder.processedSum(result: result)
    }
}
