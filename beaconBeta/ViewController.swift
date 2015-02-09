//
//  ViewController.swift
//  beaconBeta
//
//  Created by jay on 15/2/2.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//


import UIKit
import CoreLocation

class ViewController: UIViewController, ESTBeaconManagerDelegate {
    var LManeger = ESTBeaconManager()
    var beaconUUID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
    var identifierString = "Estimotes"
    var region: ESTBeaconRegion!
    var BeaconData:[ESTBeacon]!
    var dataSource:AppDelegate!
    //    var AVOSBeaconData:AVObject!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer(timeInterval: 0.5, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func loadView() {
        super.loadView()
        dataSource = UIApplication.sharedApplication().delegate as AppDelegate
        
        //tableview的管理
        //        self.tableView.delegate = self
        //        self.tableView.dataSource = self
        LManeger.delegate = self
        if(CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Authorized){
            LManeger.requestWhenInUseAuthorization()
        }
        region = ESTBeaconRegion(proximityUUID: beaconUUID, identifier: identifierString)
        LManeger.startRangingBeaconsInRegion(self.region)
        LManeger.startMonitoringForRegion(self.region)
        self.beaconManager(LManeger, didStartMonitoringForRegion: self.region)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "BeaconSearch"){
            var vc = segue.destinationViewController as Mybeacon
            vc.realBeaconsData = BeaconData
        }
    }
    
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        BeaconData = beacons as? [ESTBeacon]
        //        AVOSBeaconData = AVObject(className: "BeaconRawData")
        if(BeaconData != nil){
            println("Beacon Data Recieved");
            //            AVOSBeaconData.setObject(BeaconData, forKey: "beacondata")
            
        }
    }
    func beaconManager(manager: ESTBeaconManager!, didStartMonitoringForRegion region: ESTBeaconRegion!) {
        self.LManeger.startRangingBeaconsInRegion(self.region)
    }
    //    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        if(dataSource.BeaconData! != []){
    //            return dataSource.BeaconData!.count as Int
    //        }
    //        else{
    //            return 0
    //        }
    //
    //    }
    //    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("BriefViewCell") as UITableViewCell
    //        var singleBeacon = dataSource.BeaconData[indexPath.row] as ESTBeacon
    //        if (singleBeacon != ESTBeacon()){
    //        cell.textLabel?.text = singleBeacon.proximityUUID.UUIDString
    //        cell.detailTextLabel?.text = "Major:\(singleBeacon.major), Minor:\(singleBeacon.minor)"}
    //        else{
    //            cell.textLabel?.text = "Wait"
    //            cell.detailTextLabel?.text = "Wait"
    //        }
    //        return cell
    //    }
    func update(){
        self.tableView.reloadData()
    }
}