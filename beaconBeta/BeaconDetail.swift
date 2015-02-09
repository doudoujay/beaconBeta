//
//  BeaconDetail.swift
//  beaconBeta
//
//  Created by jay on 15/2/8.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//
import Foundation
import UIKit

class BeaconDetail: UIViewController {
    @IBOutlet weak var beaconUUID: UILabel!
    @IBOutlet weak var beaconMajor: UILabel!
    @IBOutlet weak var beaconMinor: UILabel!
    @IBOutlet weak var beaconRSSI: UILabel!
    @IBOutlet weak var beaconDistance: UILabel!
    @IBOutlet weak var testTime: UILabel!
    
    //BeaconData
    var DataSource:AppDelegate!
    var beaconIndex:Int = 0
    var beaconData: [ESTBeacon] = []
    var BeaconSingle: ESTBeacon!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Index:\(beaconIndex)")
        //初始化界面
        beaconUUID.text = beaconData[beaconIndex].proximityUUID.UUIDString
        beaconMajor.text = beaconData[beaconIndex].major.stringValue
        beaconMinor.text = beaconData[beaconIndex].minor.stringValue
        beaconRSSI.text = String(beaconData[beaconIndex].rssi)
        beaconDistance.text = "\(beaconData[beaconIndex].distance.stringValue)米"
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
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
    
}