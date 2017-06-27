//
//  StoryboardLoader.swift
//  Storyboard
//
//  Created by What on 17/06/2017.
//  Copyright © 2017 What. All rights reserved.
//

import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String { return "\(self)" }
}

extension UIViewController: Identifiable {}

/**
 enum Storyboard<T: UIViewController>: String, StoryboardLoader {
    typealias ViewController = T
    case main = "Main"
 }
 
 struct Storyboard<T: UIViewController>: RawRepresentable, StoryboardLoader {
 
     static var main: StoryboardStruct<T> { return Storyboard<T>(rawValue: "Main")! }
 
     typealias ViewController = T
     let rawValue: String
 
     init?(rawValue: String) {
         self.rawValue = rawValue
     }
 }
 */

/// storyboard ID of the view controller must be equal to the name of its class Type.
public protocol StoryboardLoader {
    
    associatedtype ViewController: UIViewController
    var value: ViewController { get }
}

public extension StoryboardLoader where Self: RawRepresentable, Self.RawValue == String {
    
    var value: ViewController {
        
        if let vc = UIStoryboard(name: rawValue, bundle: nil)
            .instantiateViewController(withIdentifier: ViewController.identifier)
            as? ViewController {
            return vc
        }
        fatalError("cannot load viewController with storyboard name: \(rawValue), identifier: \(ViewController.identifier)")
    }
}
