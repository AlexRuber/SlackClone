//
//  ChannelVC.swift
//  SlackClone
//
//  Created by Mihai Ruber on 12/28/17.
//  Copyright © 2017 Mihai Ruber. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
    }



}
