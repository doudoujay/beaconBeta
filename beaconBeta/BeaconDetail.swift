//
//  BeaconDetail.swift
//  beaconBeta
//
//  Created by jay on 15/2/8.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//
import Foundation
import UIKit

class BeaconDetail: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var beaconUUID: UILabel!
    @IBOutlet weak var beaconMajor: UILabel!
    @IBOutlet weak var beaconMinor: UILabel!
    @IBOutlet weak var beaconRSSI: UILabel!
    @IBOutlet weak var beaconDistance: UILabel!
    @IBOutlet weak var testDistance: UITextField!

    @IBOutlet weak var buttonEnable: UIButton!
    
    
    //BeaconData
    var DataSource:AppDelegate!
    var beaconIndex:Int = 0
    var beaconData: [ESTBeacon] = []
    var BeaconSingle: ESTBeacon!
    override func viewDidLoad() {
        super.viewDidLoad()
        testDistance.delegate = self
        println("Index:\(beaconIndex)")
        //初始化界面
        beaconUUID.text = beaconData[beaconIndex].proximityUUID.UUIDString
        beaconMajor.text = beaconData[beaconIndex].major.stringValue
        beaconMinor.text = beaconData[beaconIndex].minor.stringValue
        beaconRSSI.text = String(beaconData[beaconIndex].rssi)
        beaconDistance.text = "\(beaconData[beaconIndex].distance.stringValue)米"
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        testDistance.delegate = self
        buttonEnable.enabled = false
    }
    override func loadView() {
        super.loadView()
        DataSource = UIApplication.sharedApplication().delegate as AppDelegate
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func update(){
        var tempData = DataSource.BeaconData[beaconIndex]
        beaconDistance.text = tempData.distance.stringValue
        beaconRSSI.text = String(tempData.rssi)
        beaconUUID.text = tempData.proximityUUID.UUIDString
        beaconMajor.text = tempData.major.stringValue
        beaconMinor.text = tempData.minor.stringValue
    }
    //键盘事件处理
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "runTest"){
            var distance:Float = (testDistance.text as NSString).floatValue
            var testVC = segue.destinationViewController as BeaconTest
            testVC.beaconIndex = self.beaconIndex
            testVC.testDistance = distance
            
        }
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text = (testDistance.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        if let intVal = text.toInt() {
            buttonEnable.enabled = true
        }
        else{
            buttonEnable.enabled = false
        }
        return true
    }
}