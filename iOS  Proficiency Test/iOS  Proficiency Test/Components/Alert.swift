//
//  Alert.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import Foundation
import UIKit


// extension to show alert view with different combinations
class Alert : NSObject {
    
    @objc let style:UIAlertControllerStyle
    @objc var title:String?
    @objc var message:String?
    @objc var actions:[UIAlertAction] = []
    
    @objc init(style:UIAlertControllerStyle) {
        self.style = style
    }
    
    @objc static func alert(_ title:String) -> Alert {
        return Alert(style:.alert).title(title)
    }
    
    @objc static func sheet() -> Alert {
        return Alert(style:.actionSheet)
    }
    
    @objc static func sheet(_ title:String) -> Alert {
        return sheet().title(title)
    }
    
    @objc func title(_ title:String?) -> Alert {
        self.title = title
        return self
    }
    
    @objc func message(_ message:String?) -> Alert {
        self.message = message
        return self
    }
    
    @objc @discardableResult func ok(_ button:String) -> Alert {
        return ok(button: button, callback: nil)
    }
    
    @objc func ok(button:String, callback:(()->())?) -> Alert {
        actions.append(UIAlertAction(title: button, style: .default, handler: { _ in
            callback?()
        }))
        return self
    }
    
    @objc func cancel(_ button:String) -> Alert {
        return cancel(button, nil)
    }
    
    @objc func cancel(_ button:String, _ callback: (()->())?) -> Alert {
        actions.append(UIAlertAction(title: button, style: .cancel, handler: { _ in
            callback?()
        }))
        return self
    }
    
    @objc func destruct(_ button:String) -> Alert {
        return destruct(button, nil)
    }
    
    @objc func destruct(_ button:String, _ callback:(()->())?) -> Alert {
        actions.append(UIAlertAction(title: button, style: .destructive, handler: { _ in
            callback?()
        }))
        return self
    }
    
    @objc func show() {
        if actions.isEmpty {
            ok(&&"dismiss")
        }
        let vc = UIAlertController(title: title, message:message, preferredStyle: style)
        actions.forEach() { vc.addAction($0) }
        Alert.present(vc)
    }
    
    @objc static func ok(_ title:String, _ message:String?, _ callback: @escaping () -> ()) {
        alert(title).message(message).ok(button: &&"dismiss", callback: callback).show()
    }
    
    @objc static func ok(_ title:String, _ message:String?) {
        alert(title).message(message).ok(&&"dismiss").show()
    }
    
    @objc static func okcancel(_ title:String, _ message:String?, _ button: String = &&"ok", _ callback: @escaping () -> ()) {
        alert(title).message(message).ok(button: button, callback: callback).cancel(&&"cancel").show()
    }
    
    @objc static func button(_ title:String, _ message:String?, _ button:String, _ callback: (()->())?) {
        alert(title).message(message).ok(button: button, callback: callback).show()
    }
    
    @objc static func button2(_ title:String, _ message:String?, _ okbutton:String, _ cancelbutton:String, _ callback: (()->())?) {
        alert(title).message(message).ok(button: okbutton, callback: callback).cancel(cancelbutton).show()
    }
    
    fileprivate static func present(_ vc:UIViewController) {
        delay(10) {
            if let c = topController() {
                c.present(vc, animated: true, completion: nil)
            }
            
        }
    }
}
