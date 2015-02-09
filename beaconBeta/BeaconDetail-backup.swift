//
//  BeaconDetail.swift
//  beaconBeta
//
//  Created by jay on 15/2/3.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//

import Foundation
import UIKit
class BeaconDetail_backup: UIViewController, ESTBeaconManagerDelegate {
    //声明storyboard的UIlabel
//    @IBOutlet weak var beaconUUID: UILabel!
//    @IBOutlet weak var beaconMajor: UILabel!
//    @IBOutlet weak var beaconMinor: UILabel!
//    @IBOutlet weak var beaconRSSI: UILabel!
//    @IBOutlet weak var beaconDistance: UILabel!
//    @IBOutlet weak var testTime: UILabel!
//    
//    @IBAction func runTest(sender: AnyObject) {
//        var alert = UIAlertView()
//        alert.title = "测试结果"
//        alert.message = "TEST"
//        alert.addButtonWithTitle("确认")
//        alert.show()
//    }
    //Beacon
    
    
    var DataSource:AppDelegate!
    var beaconIndex:Int = 0
    var beaconData: [ESTBeacon] = []
    var BeaconSingle: ESTBeacon!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        beaconUUID.text = beaconData[beaconIndex].proximityUUID.UUIDString
//        beaconMajor.text = beaconData[beaconIndex].major.stringValue
//        beaconMinor.text = beaconData[beaconIndex].minor.stringValue
//        beaconRSSI.text = String(beaconData[beaconIndex].rssi)
//        beaconDistance.text = "\(beaconData[beaconIndex].distance.stringValue)米"
//        
//        println("The Result is \(beaconIndex)")
////        DataSource = UIApplication.sharedApplication().delegate as AppDelegate
//        
//        //调用方法添加控件显示信息
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    override func loadView() {
//        super.loadView()
//        
//       
//        
//        if(beaconData != []){
//            BeaconSingle = beaconData[beaconIndex]
//            println("Did get single Beacon Data: \(BeaconSingle)")
//        }
//        else{
//            println("Can't get the single Beacon Data")
//        }
//        //刷新～
////        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
//        
//    }
//    func update(){
//        var tempData = DataSource.BeaconData[beaconIndex]
//        beaconDistance.text = tempData.distance.stringValue
//        beaconRSSI.text = String(tempData.rssi)
//        beaconUUID.text = tempData.proximityUUID.UUIDString
//        beaconMajor.text = tempData.major.stringValue
//        beaconMinor.text = tempData.minor.stringValue
//    }
//    
    
}