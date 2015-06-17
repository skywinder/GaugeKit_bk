//
//  MainViewController.swift
//  SuperBody
//
//  Created by Petr Korolev on 21/05/15.
//  Copyright (c) 2015 Petr Korolev. All rights reserved.
//

import UIKit
import SWGaugeKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

//    @IBOutlet var scaleLabel: UILabel!
    @IBOutlet var gauge: Gauge!
    @IBOutlet var gaugeSmall: Gauge!
    @IBOutlet var leftGauge: GaugeHalf!
    @IBOutlet var rightGauge: GaugeHalf!
    @IBAction func sliderChanged(sender: UISlider) {
        gauge.rate = CGFloat(sender.value)
        gaugeSmall.rate = CGFloat(sender.value)
        leftGauge.rate = CGFloat(sender.value)
        rightGauge.rate = CGFloat(sender.value)
//        scaleLabel.text = "\(sender.value)"
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if LoginManager.isLoggedIn() == false {
            self.logOut()
        }
    }

    @IBAction func switchChanged(sender: UISwitch) {
        gauge.reverse = sender.on
        leftGauge.reverse = sender.on
        rightGauge.reverse = sender.on

    }

    internal func logOut() -> () {
        let l = "log out"
        println("l = \(l)")
        let setViewController = self.storyboard!.instantiateViewControllerWithIdentifier("loginView") as! UINavigationController
        self.sideMenuViewController.presentViewController(setViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
