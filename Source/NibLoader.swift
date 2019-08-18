//
//  NibLoader.swift
//  NibLoader
//
//  Created by What on 17/06/2017.
//  Copyright © 2017 What. All rights reserved.
//

import UIKit

public protocol StoryboardRepresentable {
    
    associatedtype ViewControllerType : UIViewController
    
    static var storyboardName: String { get }
    static var storyboardID: String { get }
    static var storyboardBundle: Bundle { get }
}

public extension StoryboardRepresentable {
    static var storyboardID: String { return .init(describing: ViewControllerType.self) }
    static var storyboardBundle: Bundle { return .init(for: ViewControllerType.self) }
}


public extension StoryboardRepresentable where Self : UIViewController {
    typealias ViewControllerType = Self
}

public extension StoryboardRepresentable {
    
    static func storyboardInstance<ViewController>() -> ViewController where ViewController == Self.ViewControllerType {
        
        if let instance =  UIStoryboard(name: storyboardName, bundle:
            storyboardBundle).instantiateViewController(withIdentifier: storyboardID) as? ViewController {
            return instance
        }
        
        fatalError("""
            Cannot load viewController with storyboard: name -> \(storyboardName), identifier: \(storyboardID)
            in bundle: \(storyboardBundle)
            for type: \(ViewController.self)
        """)
    }
}

public protocol NibRepresentable {
    
    associatedtype ViewType : UIView

    static var nibName: String { get }
    static var nibBundle: Bundle { get }
    static var nibOwner: Any? { get }
    static var nibOptions: [AnyHashable: Any]? { get }
    static var nibOffset: Int? { get }
}

public extension NibRepresentable {
    static var nibName: String { return .init(describing: ViewType.self) }
    static var nibBundle: Bundle { return .init(for: ViewType.self) }
    static var nibOwner: Any? { return ViewType.self }
    static var nibOptions: [AnyHashable: Any]? { return nil }
    static var nibOffset: Int? { return nil }
}

public extension NibRepresentable where Self : UIView {
    typealias ViewType = Self
}

public extension NibRepresentable {
    
     static func nibInstance<View>() -> View where View == Self.ViewType {
        
        let nibs = UINib(nibName: nibName, bundle: nibBundle).instantiate(withOwner: nibOwner, options: nibOptions)
        
        if let nibOffset = nibOffset, let instance = nibs[nibOffset] as? View {
            return instance
        }
        
        if nibOffset == nil, let instance = nibs.first(where: { $0 is Self }) as? View {
            return instance
        }
        
        fatalError("""
            Cannot load view with nib: name -> \(nibName), owner -> \(self), options: options -> \(String(describing: nibOptions))
            in bundle: \(nibBundle)
            at offset: \(String(describing: nibOffset))
            for type: \(View.self)
        """)
    }
}


