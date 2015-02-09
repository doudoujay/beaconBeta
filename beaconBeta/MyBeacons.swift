//
//  MyBeacons.swift
//  beaconBeta
//
//  Created by jay on 15/2/2.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import CoreBluetooth
class Mybeacon: UITableViewController, UITableViewDelegate, UITableViewDataSource, ESTBeaconManagerDelegate, CLLocationManagerDelegate{
    var MainCtrl = ViewController()
    //beacon Manager变量
    var beaconLM:CLLocationManager! = CLLocationManager()
    var beaconRegion: CLBeaconRegion!
    //EST Beacon Manager
    var ESTbeaconLM:ESTBeaconManager! = ESTBeaconManager()
    var ESTbeaconRegionInit:ESTBeaconRegion!
    //存储beacon的数据
    var realBeaconsData:[ESTBeacon]!
    var beaconUUID:String!
    var beaconDistance:NSNumber!
    //beacon数据
    var beaconData = ["test","test","test","test","test","test","test","test","test","test","test","finished"]
    //
    var DataSource: AppDelegate?
    override func loadView() {
        super.loadView()
        
        self.tableView.backgroundColor = UIColor.grayColor()
        self.beaconLM.delegate = self
        self.ESTbeaconLM.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            beaconLM.requestWhenInUseAuthorization()
        }
        if (ESTBeaconManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse){
            ESTbeaconLM.requestWhenInUseAuthorization()
        }
        self.initRegion()
        
        //测试用
        self.beaconManager(ESTbeaconLM, didStartMonitoringForRegion: ESTbeaconRegionInit)
        self.locationManager(beaconLM, didStartMonitoringForRegion: beaconRegion)
        //
        //ESTbeacon
        ESTbeaconLM.startEstimoteBeaconsDiscoveryForRegion(ESTbeaconRegionInit)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //处理tableView事件
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        var count = realBeaconsData?.count
        //        return count!
        if(realBeaconsData != nil) {
            return realBeaconsData!.count
        } else {
            return 0
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let id:String = "MyBeaconID"
        var cell = self.tableView.dequeueReusableCellWithIdentifier(id) as UITableViewCell
        let beacon:ESTBeacon = realBeaconsData![indexPath.row] as ESTBeacon
        let info:String = "UUID:\(beacon.proximityUUID.UUIDString)"
        cell.textLabel?.text = "UUID:\(beacon.proximityUUID.UUIDString)"
        cell.detailTextLabel?.text = "Major:\(beacon.major) Minor:\(beacon.minor)"
        
        return cell
    }
    
    //实现DetailView的跳转
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
        println(indexPath.row)
        
        if (segue.identifier == "showDetail") {
            var beaconDetail = segue.destinationViewController  as BeaconDetail
            beaconDetail.beaconIndex = indexPath.row
            beaconDetail.beaconData = realBeaconsData as [ESTBeacon]
            
        }
    }
    func initRegion(){
        //Estimote Beacon Init
        
        var uuid = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        var idantifier:String = "Estimote"
        self.beaconRegion = CLBeaconRegion(proximityUUID: uuid, identifier: idantifier)
        self.ESTbeaconRegionInit = ESTBeaconRegion(proximityUUID: uuid, identifier: idantifier)
        self.beaconLM.startMonitoringForRegion(self.beaconRegion)
        self.ESTbeaconLM.startRangingBeaconsInRegion(self.ESTbeaconRegionInit)
        
    }
    
    //测试用
    func beaconManager(manager: ESTBeaconManager!, didStartMonitoringForRegion region: ESTBeaconRegion!) {
        self.ESTbeaconLM.startRangingBeaconsInRegion(self.ESTbeaconRegionInit)
    }
    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        self.beaconLM.startRangingBeaconsInRegion(self.beaconRegion)
    }
    //处理数据
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        realBeaconsData = beacons as? [ESTBeacon]
        
    }
    func update(){
        self.tableView.reloadData()
    }
    
    
}