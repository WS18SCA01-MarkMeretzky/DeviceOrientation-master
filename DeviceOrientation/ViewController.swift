//
//  ViewController.swift
//  DeviceOrientation
//
//  Created by Antonio Porras on 1/2/19.
//  Copyright © 2019 Antonio Porras. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {

    let bodyParts: [String] = [
        "Unknown",   //0 UIDeviceOrientation.unknown
        "Shoulders", //1 UIDeviceOrientation.portrait
        "Abs",       //2 UIDeviceOrientation.portraitUpsideDown
        "Chest",     //3 UIDeviceOrientation.landscapeLeft
        "Abs",       //4 UIDeviceOrientation.landscapeRight
        "Chest",     //5 UIDeviceOrientation.faceUp
        "Back"       //6 UIDeviceOrientation.faceDown
    ];
    
    @IBOutlet weak var imageView: UIImageView!;
    @IBOutlet weak var label: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationChanged),
            name: UIDevice.orientationDidChangeNotification,
            object: nil);
    }
    
    @objc func orientationChanged (_ notification: NSNotification) {
        let i: Int = UIDevice.current.orientation.rawValue;
        print("UIDevice.current.orientation.rawValue = \(i)");
        
        guard i > 0 else {  //0 is UIDeviceOrientation.unknown
            return;
        }
        
        imageView.image = UIImage(named: "pic0\(i)");
        label.text = bodyParts[UIDevice.current.orientation.rawValue];
    }
    
    //Try to allow all orientations.  (See also the last method in AppDelegate.swift.)
    //UIDeviceOrientation.portraitUpsideDown doesn't work on newer phones.
    //supportedInterfaceOrientations is a computed property.
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .all;
        }
    }
    
}
