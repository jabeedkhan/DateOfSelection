//
//  ViewController.swift
//  DateOfSelection
//
//  Created by jabeed on 03/09/19.
//  Copyright © 2019 jabeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var selectOutlet: UIButton!
    
    @IBOutlet var itemOutlet: [UIButton]!
    
    @IBAction func selectAction(_ sender: UIButton) {
        
       
        itemOutlet.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
    }
    

    }
    
    @IBAction func itemDayAction(_ sender: UIButton) {
        itemOutlet.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
//        selectOutlet.titleLabel?.text = sender.titleLabel?.text
        switch sender.titleLabel?.text {
        case "Today":
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yy"
            let result = formatter.string(from: currentDate)
//            selectOutlet.titleLabel?.text =  result + " - " + result
            selectOutlet.setTitle(result + " - " + result, for: .normal)
            print("today is selecte")
            break
        case "Yesterday":
            let currentDate = Date()
            let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yy"
            let result = formatter.string(from: yesterdayDate)
            selectOutlet.setTitle(result + " - " + result, for: .normal)
            print("Yesterday is selected")
            break
        case "Last 7 Days":
            let currentDate = Date()
            let lastSevenDaysDate = Calendar.current.date(byAdding: .day, value: -6, to: currentDate)!
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yy"
            let result = formatter.string(from: lastSevenDaysDate)
            let currentDateResult = formatter.string(from: currentDate)
            selectOutlet.setTitle(result + " - " + currentDateResult, for: .normal)
            print("Last 7 days is selected")
            break
            
        case "Last 30 Days":
            
            let currentDate = Date()
            let lastThirtyDaysDate = Calendar.current.date(byAdding: .day, value: -29, to: currentDate)!
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yy"
            let result = formatter.string(from: lastThirtyDaysDate)
            let currentDateResult = formatter.string(from: currentDate)
            selectOutlet.setTitle(result + " - " + currentDateResult, for: .normal)
            print("Last 30 days is selected")
            break
            
        case "This Month":
            let dateFormatter = DateFormatter()
            let currentDate = Date()
            dateFormatter.dateFormat = "dd MMM yy"
            let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: currentDate)
            let startOfMonth = Calendar.current.date(from: comp)!
            let startDateString = dateFormatter.string(from: startOfMonth)
            
            var comps2 = DateComponents()
            comps2.month = 1
            comps2.day = -1
            let endOfMonth = Calendar.current.date(byAdding: comps2, to: startOfMonth)!
            let endDateString = dateFormatter.string(from: endOfMonth)
            selectOutlet.setTitle(startDateString + " - " + endDateString, for: .normal)

            print("this month is selected")
            break
            
        case "Last Month":
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yy"
            let currentDate = Date()
            let startDateComponents:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: currentDate) as NSDateComponents
            startDateComponents.month -= 1
            let startDate = Calendar.current.date(from: startDateComponents as DateComponents)!
            let startDateString = dateFormatter.string(from: startDate)
            
            
            let endDateComponents:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: currentDate) as NSDateComponents
            endDateComponents.day = 1
            endDateComponents.day -= 1
            let endDate = Calendar.current.date(from: endDateComponents as DateComponents)!
            let endDateString = dateFormatter.string(from: endDate)
            selectOutlet.setTitle(startDateString + " - " + endDateString, for: .normal)
            
            print("Last month is selecte")
            break
            
        default:
            break
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
