//
//  ViewController.swift
//  ZDMetroLabel
//
//  Created by Nicole De La Feld on 09/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var metroLabel: ZDMetroLabel!
    var timer: NSTimer?
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateLabel"), userInfo: nil, repeats: true)
        timer!.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel() {
        metroLabel.text = "\(counter++)"
    }


}

