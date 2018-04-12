//
//  CheckViewController.swift
//  TouchIDIntegration
//
//  Created by Shatadru Datta on 4/13/18.
//  Copyright © 2018 Shatadru. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var phno = +919831369867
    var arrContext = ["UserId:", "Name:", "Identity:", "Department:", "Position:", "KAUSTID:"]
    @IBOutlet weak var tblDetails: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblDetails.tableFooterView = UIView()
        
        let jsonText = "{\"first_name\":\"Sergey\"}"
        var dictonary:NSDictionary?
        
        if let data = jsonText.data(using: String.Encoding.utf8) {
            
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as! NSDictionary
                
                if let myDictionary = dictonary
                {
                    print(" First name is: \(myDictionary["first_name"]!)")
                }
            } catch let error as NSError {
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func notification(_ sender: UIButton) {
    }
    
    @IBAction func call(_ sender: UIButton) {
        if let url = URL(string: "tel://\(phno)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func sms(_ sender: UIButton) {
    }
    
    @IBAction func email(_ sender: UIButton) {
        
    }
    
    @IBAction func videoCall(_ sender: UIButton) {
        if let facetimeURL:NSURL = NSURL(string: "facetime://\(phno)") {
            let application = UIApplication.shared
            if (application.canOpenURL(facetimeURL as URL)) {
                application.openURL(facetimeURL as URL);
            }
        }
    }
    
}

//  TableViewDelegate, TableViewDatasource
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            profileCell.lblName.text = "Shatadru Datta"
            profileCell.lblPhno.text = "+919836017418"
            profileCell.lblEmailId.text = "datta.shatadru01@gmail.com"
            profileCell.selectionStyle = .none
            return profileCell
        default:
            let detailsCell = tableView.dequeueReusableCell(withIdentifier: "DetailsViewCell", for: indexPath) as! DetailsViewCell
            detailsCell.lblContext.text = self.arrContext[indexPath.row]
            detailsCell.lblContextValue.text = "Test"
            detailsCell.selectionStyle = .none
            return detailsCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180.0
        default:
            return 50.0
        }
    }
}
