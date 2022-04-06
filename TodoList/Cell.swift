//
//  Cell.swift
//  Project
//
//  Created by Sherzod on 08/03/22.
//

import UIKit

protocol CellDelegate {
    
    func isDone(index: IndexPath!)
    func isBell(index: IndexPath!)
}

class Cell: UITableViewCell {
    
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var bellBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var delegate: CellDelegate?
    var index: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        leftView.layer.cornerRadius = 5
        leftView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        
        cellView.layer.masksToBounds = false
        cellView.layer.shadowRadius = 5
        cellView.layer.shadowOpacity = 0.4
        cellView.layer.shadowColor = UIColor.systemGray4.cgColor
        cellView.layer.shadowOffset = CGSize(width: -1, height: 5)
    }
    
    func updateCell(task: TaskDM, index: IndexPath) {
        
        self.index = index
        titleLbl.text = task.title
        dateLbl.text = task.date
        
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
            bellBtn.tintColor = UIColor(red: 255.0/255, green: 213.0/255, blue: 6.0/255, alpha: 1.0)
        } else {
            bellBtn.tintColor = .systemGray4
        }
        
    }
    
    
    @IBAction func doneBtn(_ sender: Any) {
        delegate?.isDone(index: self.index)
    }
    
    
    @IBAction func belllBtn(_ sender: Any) {
        delegate?.isBell(index: self.index)
    }
    
    
}
