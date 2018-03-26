//
//  HealthKitManager.swift
//  Mobile Medic
//
//  Created by ual-laptop on 1/13/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitManager: NSObject {
    
    static var timer: Timer?
    
    static let healthKitStore = HKHealthStore()
    
    static func authorizeHealthKit() {
        
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        ]
        
        healthKitStore.requestAuthorization(toShare: healthKitTypes,
                                            read: healthKitTypes) { _, _ in }
    }
    
    static func saveMockHeartData() -> HKQuantity {
        
        // 1. Create a heart rate BPM Sample
        let heartRateType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        let heartRateQuantity = HKQuantity(unit: HKUnit(from: "count/min"),
                                           doubleValue: Double(arc4random_uniform(80) + 100))
        let heartSample = HKQuantitySample(type: heartRateType,
                                           quantity: heartRateQuantity, start: NSDate() as Date, end: NSDate() as Date)
        
        // 2. Save the sample in the store
        healthKitStore.save(heartSample, withCompletion: { (success, error) -> Void in
            if let error = error {
                print("Error saving heart sample: \(error.localizedDescription)")
            }
        })
        
        return heartRateQuantity;
    }
    
    static func startMockHeartData() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                                       target: self,
                                                       selector: Selector(("saveMockHeartData")),
                                                       userInfo: nil,
                                                       repeats: true)
    }
    
    static func stopMockHeartData() {
        self.timer?.invalidate()
    }
    
    
}
