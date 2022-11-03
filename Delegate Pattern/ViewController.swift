//
//  ViewController.swift
//  Delegate Pattern
//
//  Created by Timothy Sonner on 11/1/22.
//

import UIKit

class ViewController: UIViewController {

        var switchState = false
        
    @IBOutlet weak var emojiLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            let tap = UITapGestureRecognizer(target: self, action: #selector(self.goToSwitchView))
            emojiLabel.addGestureRecognizer(tap)
            emojiLabel.isUserInteractionEnabled = true
        }
        
        @objc func goToSwitchView() {
            let controller = storyboard?.instantiateViewController(identifier: "SwitchViewController") as! SwitchViewController
            controller.switchIsOn = switchState
            controller.delegate = self
            present(controller, animated: true, completion: nil)
        }
    }

    extension ViewController: SwitchDelegate {
        func toggleSwitch(_ isSwitchOn: Bool) {
            switchState = isSwitchOn
            if isSwitchOn {
                self.view.backgroundColor = .orange
                emojiLabel.text = "🌞"
            } else {
                self.view.backgroundColor = .darkGray
                emojiLabel.text = "🌙"
            }
        }
    }




