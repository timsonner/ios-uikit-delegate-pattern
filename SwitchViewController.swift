//
//  SwitchViewController.swift
//  Delegate Pattern
//
//  Created by Timothy Sonner on 11/1/22.
//

import UIKit

protocol switchDelegate {
    func toggleSwitch(_ state: Bool)
}

class SwitchViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    
    var switchIsOn: Bool!
    var delegate: switchDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchView.setOn(switchIsOn, animated: true)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        delegate.toggleSwitch(sender.isOn)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
