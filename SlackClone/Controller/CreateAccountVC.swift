//
//  CreateAccountVC.swift
//  SlackClone
//
//  Created by Mihai Ruber on 12/30/17.
//  Copyright © 2017 Mihai Ruber. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
