//
//  WalkTough.swift
//  Exam_5
//
//  Created by Sherzod on 08/03/22.
//

import UIKit

class WalkTough: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func getStarted(_ sender: Any) {
        
        let vc = LoginVC(nibName: "LoginVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
