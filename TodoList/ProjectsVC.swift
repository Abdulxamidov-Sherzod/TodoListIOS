//
//  ProjectsVC.swift
//  Project
//
//  Created by Sherzod on 10/03/22.
//

import UIKit

class ProjectsVC: UIViewController {
    
    var personalTasks: [TaskDM] = []

    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
            collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personName.text = UserDefaults.standard.string(forKey: "Name")
        personImage.image = loadImageFromDiskWith(fileName: "PersonImage")
    }
}

//MARK: - Set Image -
extension ProjectsVC {
    
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
}

//MARK: - Collection View -
extension ProjectsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = self.view.frame.width - 60
        
        return CGSize(width: screenWidth/2, height: screenWidth/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = ProjectTV(nibName: "ProjectTV", bundle: nil)
    
            self.present(vc, animated: true, completion: nil)
            print("0")
        } else if indexPath.row == 1 {
            
            print("1")
        } else if indexPath.row == 2 {
            
            print("2")
        } else {
            
            print("3")
        }
    }
}
