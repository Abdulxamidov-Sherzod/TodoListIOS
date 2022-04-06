//
//  MainVC.swift
//  Project
//
//  Created by Sherzod on 08/03/22.
//

import UIKit
import RealmSwift
import SwiftUI

class MainVC: UIViewController, AddNewTaskDelegate, CellDelegate {
 
    
    @IBOutlet weak var plusBtn: UIButton!
    
    var realm: Realm!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    var tasks: [TaskDM] = []
    var task: TaskDM?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
            tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
            
        }
    }
    
    
    @IBOutlet weak var stackDiss: UIStackView!
    
    @IBOutlet weak var bellView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        personImage.image = loadImageFromDiskWith(fileName: "PersonImage")
        print("url = ", realm.configuration.fileURL!)
        fetchTasks()
        
        if realm.objects(TaskDM.self).compactMap({$0}).count == 0 && tasks.count == 0 {
            tableView.isHidden = true
            print("False")
            stackDiss.isHidden = false
        } else {
            tableView.isHidden = false
            stackDiss.isHidden = true
            print("true")
        }
        userName.text = UserDefaults.standard.string(forKey: "Name")
        
    }
    
    func addRealm(task: TaskDM) {
        
        try! self.realm.write({
            self.realm.add(task)
        })
        
    }
    
    func fetchTasks() {
        
        self.tasks = realm.objects(TaskDM.self).compactMap{$0}
        self.tableView.reloadData()
    
    }
    
    func deleteTasks(index: IndexPath) {
      
        try! self.realm.write({
            self.realm.delete(tasks[index.row])
            self.tasks.remove(at: index.row)
            tableView.reloadData()
        })
    }

    
    func add(task: TaskDM) {
    
        if realm.objects(TaskDM.self).compactMap({$0}).count < 0  && tasks.count < 0 {
            tableView.isHidden = true
            print("False")
            stackDiss.isHidden = false
        } else {
            tableView.isHidden = false
            stackDiss.isHidden = true
            print("true")
        }
        

        self.tasks.append(task)
        addRealm(task: task)
        tableView.reloadData()
    }
    
    func deleteRealm(index: IndexPath) {
        if realm.objects(TaskDM.self).compactMap({$0}).count == 1 && tasks.count == 1 {
            tableView.isHidden = true
            print("False")
            let vc = AddNewTask(nibName: "AddNewTask", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
            stackDiss.isHidden = false
        } else {
            tableView.isHidden = false
            stackDiss.isHidden = true
            print("true")
        }
        try! self.realm.write({
            self.realm.delete(tasks[index.row])
            tasks.remove(at: index.row)
            tableView.reloadData()
        })
    }
    
    func isDone(index: IndexPath!) {
        try! self.realm.write({
            
            tasks[index.row].isDone = !tasks[index.row].isDone
            tableView.reloadData()
        })
    }
    
    func isBell(index: IndexPath!) {
        try! self.realm.write({
            tasks[index.row].isBell = !tasks[index.row].isBell
            print("Bell")
            tableView.reloadData()
        })
    }
    
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        
        return nil
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        
        bellView.isHidden = true
    }
    
    
    
    @IBAction func addNewTask(_ sender: Any) {
        
        let vc = AddNewTask(nibName: "AddNewTask", bundle: nil)
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
}




extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        deleteRealm(index: indexPath)
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else { return UITableViewCell() }
        
        cell.updateCell(task: tasks[indexPath.row], index: indexPath)
        cell.delegate = self
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("ll")
    }
    
}
