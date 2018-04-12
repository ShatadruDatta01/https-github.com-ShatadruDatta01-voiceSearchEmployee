//
//  VoiceCallingController.swift
//  TouchIDIntegration
//
//  Created by Shatadru Datta on 4/12/18.
//  Copyright © 2018 Shatadru. All rights reserved.
//

import UIKit

class VoiceCallingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func next(_ sender: UIButton) {
        let secondviewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        self.navigationController?.pushViewController(secondviewController!, animated: true)
    }
    
}
