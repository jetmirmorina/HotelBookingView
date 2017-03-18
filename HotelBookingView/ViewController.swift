//
//  ViewController.swift
//  HotelBookingView
//
//  Created by Jetmir Morina on 3/17/17.
//  Copyright © 2017 Jetmir Morina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var  selectedSection : Int = -1
    var days:[Int]!
    var checkinDate = Date();
    var checkoutDate = Date();
    var numberOfNights = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCells()
        costumizeView()
        days =  Array(1 ... self.totalDaysOfCurrentMonth()) as [Int]
    }
    @IBAction func search_TouchUpInside(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "Hotel booking screen", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func registerCells(){
        tableView.register(UINib(nibName:"HeaderTableViewCell", bundle:nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(UINib(nibName:"DescriptionsTableViewCell", bundle:nil), forCellReuseIdentifier: "DescriptionsTableViewCell")
        tableView.register(UINib(nibName:"PickerViewTableViewCell", bundle:nil), forCellReuseIdentifier: "PickerViewTableViewCell")
        tableView.register(UINib(nibName:"DatePickerTableViewCell", bundle:nil), forCellReuseIdentifier: "DatePickerTableViewCell")
    }
    
    func costumizeView(){
        tableView.backgroundColor = kMAIN_BG_COLOR
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
        let tableviewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: self.view.frame.size.height/2))
        tableviewFooter.backgroundColor = kSELECTED_CELL_BG_COLOR
        tableView.tableFooterView = UIView()
        checkoutDate = checkinDate.dateByAddingNumberOfDays(numberOfDays: numberOfNights)!
    }
    
    func totalDaysOfCurrentMonth()->Int{
        let cal = Calendar(identifier: .gregorian)
        let monthRange = cal.range(of: .day, in: .month, for: Date())!
        let daysInMonth = monthRange.count
        return daysInMonth
    }
    
    func datePickerChanged( picker : UIDatePicker) {
        if picker.tag == DatePickerTag.checkinDateTag.rawValue{
            checkinDate = picker.date;
            checkoutDate = checkinDate.dateByAddingNumberOfDays(numberOfDays: numberOfNights)!
        }else{
            checkoutDate = picker.date;
            numberOfNights = checkinDate.daysBetweenDate(toDate: checkoutDate)
        }
        tableView.reloadData()
    }
}
//MARK: - TableView DataSource -
extension ViewController:UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        if selectedSection == section {
            return 2;
        }
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionsTableViewCell") as! DescriptionsTableViewCell
                cell.leftLabel.text = "Nights"
                cell.rightLabel.text = "\(numberOfNights)"
                cell.iconImageView.image = #imageLiteral(resourceName: "Nights")
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "PickerViewTableViewCell") as! PickerViewTableViewCell
                cell.pickerView.delegate = self
                return cell
            }
        case 2:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionsTableViewCell") as! DescriptionsTableViewCell
                cell.leftLabel.text = "Check In"
                let checkInDate = checkinDate.stringInFormat(format: "MMM dd, yyyy")
                cell.rightLabel.text = checkInDate
                cell.iconImageView.image = #imageLiteral(resourceName: "checkIn")
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerTableViewCell") as! DatePickerTableViewCell
                cell.datePicker.date = checkinDate;
                cell.datePicker.minimumDate = checkinDate
                cell.datePicker.tag = DatePickerTag.checkinDateTag.rawValue
                cell.datePicker.addTarget(self, action: #selector(self.datePickerChanged(picker:)), for: UIControlEvents.valueChanged)
                
                return cell
            }
        default:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionsTableViewCell") as! DescriptionsTableViewCell
                cell.leftLabel.text = "Check Out"
                let checkOut = checkoutDate.stringInFormat(format: "MMM dd, yyyy")
                cell.rightLabel.text = checkOut
                cell.iconImageView.image = #imageLiteral(resourceName: "check-out")

                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DatePickerTableViewCell") as! DatePickerTableViewCell
                cell.datePicker.date = checkoutDate;
                cell.datePicker.minimumDate = checkinDate.nextDay()
                cell.datePicker.tag = DatePickerTag.checkinDateTag.rawValue
                cell.datePicker.addTarget(self, action: #selector(self.datePickerChanged(picker:)), for: UIControlEvents.valueChanged)

                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section != 0{
            if indexPath.row == 0{
                return 44.0
            }else{
                return 163
            }
        }
        return 210
    }
    
  
}
//MARK: - TableView Delegate
extension ViewController:UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0{
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.beginUpdates()
            if(selectedSection >= 0){
                tableView.deleteRows(at: [NSIndexPath(item: 1, section: selectedSection) as IndexPath], with: UITableViewRowAnimation.middle)
            }
            if(selectedSection != indexPath.section) {
                selectedSection = indexPath.section;
                tableView.insertRows(at: [NSIndexPath(item: 1, section: selectedSection) as IndexPath], with: .middle)
                tableView.endUpdates()
            }
            else {
                selectedSection = -1;
                tableView.endUpdates()
            }
        }
    }
    
}

//MARK: - PickerView Methods
extension ViewController:UIPickerViewDelegate, UIPickerViewDataSource{
  
    // DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    // Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(days[row])"
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedSection == 1{
            numberOfNights = row+1;
            checkoutDate = checkinDate.dateByAddingNumberOfDays(numberOfDays: numberOfNights)!
        }
        tableView.reloadData()
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "\(row+1)", attributes: [NSForegroundColorAttributeName : UIColor.white])
        return attributedString
    }
}


