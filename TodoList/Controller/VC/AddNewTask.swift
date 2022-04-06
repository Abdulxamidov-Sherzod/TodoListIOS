//
//  AddNewTask.swift
//  Project
//
//  Created by Sherzod on 08/03/22.
//

import UIKit

protocol AddNewTaskDelegate {
    
    func add(task: TaskDM)
}

class AddNewTask: UIViewController {

    @IBOutlet var views: [UIView]!
    let task = TaskDM()
    
    
    @IBOutlet var btns: [UIButton]!
    @IBOutlet weak var addView: UIView!
    
    var delegate: AddNewTaskDelegate?
    @IBOutlet weak var datePick: UIDatePicker!
    @IBOutlet weak var titleTf: UITextField!
    
    @IBOutlet weak var dateTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        addView.layer.cornerRadius = 50
        addView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    @IBAction func dateP(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = .init(identifier: "uz")
        dateTitle.text = "\(dateFormatter.string(from: datePick.date))"
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            self.task.uiColor = .yellow
            views[0].backgroundColor = .white
            btns[0].backgroundColor = UIColor(red: 255.0/255, green: 213.0/255, blue: 6.0/255, alpha: 1.0)
            btns[0].tintColor = .white
            for i in btns.enumerated() where i.offset != 0 {
                i.element.backgroundColor = .clear
            }
        } else {
            btns[0].tintColor = .gray
            views[0].backgroundColor = UIColor(red: 255.0/255, green: 213.0/255, blue: 6.0/255, alpha: 1.0)
        }
        
        if sender.tag == 1 {
            self.task.uiColor = .green
            views[1].backgroundColor = .white
            btns[1].backgroundColor = UIColor(red: 93.0/255, green: 230.0/255, blue: 26.0/255, alpha: 1.0)
            btns[1].tintColor = .white
            for i in btns.enumerated() where i.offset != 1 {
                i.element.backgroundColor = .clear
            }
        } else {
            btns[1].tintColor = .gray
            views[1].backgroundColor = UIColor(red: 93.0/255, green: 230.0/255, blue: 26.0/255, alpha: 1.0)
        }
        
        if sender.tag == 2 {
            self.task.uiColor = .red
            views[2].backgroundColor = .white
            btns[2].backgroundColor = UIColor(red: 209.0/255, green: 2.0/255, blue: 99.0/255, alpha: 1.0)
            btns[2].tintColor = .white
            for i in btns.enumerated() where i.offset != 2 {
                i.element.backgroundColor = .clear
            }
        } else {
            btns[2].tintColor = .gray
            views[2].backgroundColor = UIColor(red: 209.0/255, green: 2.0/255, blue: 99.0/255, alpha: 1.0)
        }
        
        if sender.tag == 3 {
            self.task.uiColor = .purple
            views[3].backgroundColor = .white
            btns[3].backgroundColor = UIColor(red: 48.0/255, green: 68.0/255, blue: 242.0/255, alpha: 1.0)
            btns[3].tintColor = .white
            for i in btns.enumerated() where i.offset != 3 {
                i.element.backgroundColor = .clear
            }
        } else {
            btns[3].tintColor = .gray
            views[3].backgroundColor = UIColor(red: 48.0/255, green: 68.0/255, blue: 242.0/255, alpha: 1.0)
        }
    }
    
   
    @IBAction func addBtnTapped(_ sender: Any) {
        
        task.title = titleTf.text
        task.date = dateTitle.text

        delegate?.add(task: task)
        self.dismiss(animated: true, completion: nil)
    }
    
}
