
import java_swift
import Foundation

final class SwiftMathBinding_ListenerImpl: SwiftMathBinding_Listener {
    
    let responder: SwiftMathBinding_ResponderForward
    
    // one-off call to bind the Java and Swift sections of app
    @_silgen_name("Java_com_millertech_tutorial_MainActivity_bind")
    public static func bind( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?, __self: jobject? )-> jobject? {
        
        // This Swift instance forwards to Java through JNI
        let responder = SwiftMathBinding_ResponderForward( javaObject: __self )
        
        // This Swift instance receives native calls from Java
        var locals = [jobject]()
        return SwiftMathBinding_ListenerImpl(responder: responder).localJavaObject( &locals )
    }
    
    
    init(responder: SwiftMathBinding_ResponderForward) {
        self.responder = responder
    }
    
    
    override func processSum( num1: Int, num2: Int ) {
        
        NSLog("\(type(of: self)): \(#function)")
        
        responder.processedSum(num1+num2)
    }
    
    deinit {
        NSLog("\(type(of: self)) \(#function)")
    }
}
