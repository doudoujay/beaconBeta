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
    var beaconData:[ESTBeacon]!
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
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    func update(){
        //保持数据1秒一次更新
        beaconData = (UIApplication.sharedApplication().delegate as AppDelegate).BeaconData
        let beacon = beaconData[beaconIndex]
        algorithm.startRecordData(beacon)
        
        //更新界面
        testTimes.text = String(algorithm.testTimes)
        liveDistance.text = beacon.distance.stringValue
    }
}
