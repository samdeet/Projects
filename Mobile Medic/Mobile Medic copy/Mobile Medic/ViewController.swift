//
//  ViewController.swift
//  Mobile Medic
//
//  Created by ual-laptop on 1/13/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import UIKit
import ContactsUI
import HealthKit

class ViewController: UIViewController , CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 20))
        let quantity = HealthKitManager.saveMockHeartData()
        let beats = quantity.doubleValue(for: HKUnit(from: "count/min"))
        label.text = "Heart Rate: " + String(format:"%f", beats)
        self.view.addSubview(label)
        
        /* Step Count Display In Progress
         let label_steps = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 20))
        var steps = 0
        
        let endDate = NSDate()
        let startDate = NSCalendar.currentCalendar.dateByAddingUnit(.CalendarUnitMonth, value: -1, toDate: endDate, options: nil)
        
        let weightSampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        let predicate = HKQuery.predicateForSamplesWithStartDate(startDate, endDate: endDate, options: .None)
        
        let query = HKSampleQuery(sampleType: weightSampleType, predicate: predicate, limit: 0, sortDescriptors: nil, resultsHandler: {
            (query, results, error) in
            if results == nil {
                println("There was an error running the query: \(error)")
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                var dailyAVG:Double = 0
                for steps in results as [HKQuantitySample]
                {
                    // add values to dailyAVG
                    dailyAVG += steps.quantity.doubleValueForUnit(HKUnit.countUnit())
                }
                steps = dailyAVG
            }
        })
        HKHealthStore.execute(query)
        
        label_steps.text = "Steps: " + String(format:"%f", steps)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectContact(_ sender: UIButton) {
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
    }
    @IBAction func authorizeTapped(_ sender: Any) {
        HealthKitManager.authorizeHealthKit()
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
            }
        }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }
    
}
