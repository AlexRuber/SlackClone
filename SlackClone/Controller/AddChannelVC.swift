//
//  AddChannelVC.swift
//  SlackClone
//
//  Created by Mihai Ruber on 1/2/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    // Outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapBG(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createChannelPressed(_ sender: Any) {
        
    }
    
    func setUpView() {
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
    }
    
    
}
