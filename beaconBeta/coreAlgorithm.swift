//
//  coreCalculation.swift
//  beaconBeta
//
//  Created by jay on 15/2/9.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//

import UIKit

class coreAlgorithm {
    //所有变量的声明
    var beaconDistance:[NSNumber] = []
    
    var testTimes = 0
    
    //数据的全局操作
    func startRecordData(beacon:ESTBeacon){
        beaconDistance.append(beacon.distance)
        
        testTimes = beaconDistance.count
        println(testTimes)
    }
    //Distance
    func DistanceAvg(array:NSArray) -> Int{
        var temp:Int
        // Need to work on!
        return 0
        }
    
    func DistanceMax() -> Int{
        return 0
    }
    
    func DistanceMin() ->Int {
        return 0
    }
    //Diviation
    func DiviationAvg() -> Int{
        return 0
    }
    func DiviationMax() -> Int{
        return 0
    }
    func DiviationMin() -> Int{
        return 0
    }
    func DiviarionStandard() -> Int{
        return 0
    }
    
    //percentage of loss
    func lossPercentage() -> Int{
        return 0
    }
    
    func ExpTimes() -> Int{
        return 0
    }
    
    func Expectation() -> Int {
        return 0
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
