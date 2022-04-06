//
//  TableViewCell.swift
//  Project
//
//  Created by Sherzod on 10/03/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bellbtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func updateCell(task: TaskDM) {
        dateLbl.text = task.date
        titleLbl.text = task.title
        
        
        if Color.yellow == task.uiColor {
            leftView.backgroundColor = UIColor(red: 255.0/255, green: 213.0/255, blue: 6.0/255, alpha: 1.0)
        } else if Color.green == task.uiColor {
            leftView.backgroundColor = UIColor(red: 93.0/255, green: 230.0/255, blue: 26.0/255, alpha: 1.0)
        } else if Color.red == task.uiColor {
            leftView.backgroundColor = UIColor(red: 209.0/255, green: 2.0/255, blue: 99.0/255, alpha: 1.0)
        } else {
            leftView.backgroundColor = UIColor(red: 48.0/255, green: 68.0/255, blue: 242.0/255, alpha: 1.0)
        }
        
        if task.isDone {
            doneBtn.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            doneBtn.tintColor = .green
        } else {
            doneBtn.setImage(UIImage(systemName: "circle"), for: .normal)
            doneBtn.tintColor = .systemGray4
        }
        
        if task.isBell {
            bellbtn.tintColor = UIColor(red: 255.0/255, green: 213.0/255, blue: 6.0/255, alpha: 1.0)
        } else {
            bellbtn.tintColor = .systemGray4
        }
        
    }

 
    
}
