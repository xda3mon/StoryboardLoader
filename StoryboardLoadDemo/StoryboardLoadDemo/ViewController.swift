//
//  ViewController.swift
//  Storyboard
//
//  Created by What on 17/06/2017.
//  Copyright © 2017 What. All rights reserved.
//

import NibLoader
import UIKit


class ViewController: UIViewController {
    
    enum Storyboard : StoryboardRepresentable {
        
        typealias ViewController = StoryboardLoadDemo.ViewController
        
        static var storyboardName: String {
            return "One"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(AnotherViewController.storyboardInstance(), animated: true)
    }
}

class AnotherViewController: UIViewController, StoryboardRepresentable {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(StoryboardLoadDemo.ViewController.Storyboard.storyboardInstance(), animated: true)
        
    }
    
    static var storyboardName: String {
        return "Another"
    }
}

