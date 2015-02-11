//
//  BeaconTest.swift
//  beaconBeta
//
//  Created by jay on 15/2/2.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//

import Foundation
import UIKit

class BeaconTest: UIViewController {
    @IBOutlet weak var testTimes: UILabel!
    @IBOutlet weak var liveDistance: UILabel!
    @IBOutlet weak var avgDistance: UILabel!
    
    var beaconIndex:Int = 0
    var testDistance:Float = 0.0
    var beaconData:[ESTBeacon]!
    var timer: NSTimer!
    //核心算法
    var algorithm = coreAlgorithm()
    override func loadView() {
        super.loadView()
        beaconData = (UIApplication.sharedApplication().delegate as AppDelegate).BeaconData
        
        if(beaconData == []){
            var alert = UIAlertView()
            alert.title = "错误！"
            alert.message = "无法获取beacon的信息！"
            alert.addButtonWithTitle("好")
            alert.show()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillDisappear(animated: Bool) {
        timer.invalidate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        println("The test distance is\(testDistance)")
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    func update(){
        //保持数据1秒一次更新
        beaconData = (UIApplication.sharedApplication().delegate as AppDelegate).BeaconData
        let beacon = beaconData[beaconIndex]
        algorithm.startRecordData(beacon)
        
        //更新界面
        testTimes.text = String(algorithm.testTimes)
        liveDistance.text = beacon.distance.stringValue
        avgDistance.text = "\(algorithm.DistanceAvg())米"
        //AVOStest
        var AVOSBeacon:AVObject = AVObject(className: "BeaconData")
        AVOSBeacon["test"] = beacon.distance.stringValue
        AVOSBeacon.save()
        
        
        
    }
}
