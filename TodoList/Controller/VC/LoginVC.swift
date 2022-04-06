//
//  LoginVC.swift
//  Exam_5
//
//  Created by Sherzod on 08/03/22.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var imgPersonImg: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var surnameTf: UITextField!
    @IBOutlet weak var genderTf: UITextField! {
        didSet {
            genderTf.delegate = self
        }
    }
    
    
    var picData: [[String]] = [
        
        ["Erkak", "Ayol"]
    ]
    var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    func saveImage(imageName: String, image: UIImage) {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
            
        }
        
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
        
    }
    
    @IBAction func chooseBtnTapped(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func startBtnTapped(_ sender: Any) {
        
        UserDefaults.standard.setValue(nameTf.text, forKey: "Name")
        
        
        if nameTf.text! == "" {
            nameTf.layer.borderColor = UIColor.red.cgColor
            nameTf.layer.borderWidth = 1
        } else {
            nameTf.layer.borderColor = .none
            nameTf.layer.borderWidth = 1
        }
        
        if surnameTf.text! == "" {
            surnameTf.layer.borderColor = UIColor.red.cgColor
            surnameTf.layer.borderWidth = 1
        } else {
            surnameTf.layer.borderColor = .none
            surnameTf.layer.borderWidth = 1
        }
        
        if genderTf.text! == "" {
            genderTf.layer.borderColor = UIColor.red.cgColor
            genderTf.layer.borderWidth = 1
        } else {
            genderTf.layer.borderColor = .none
            genderTf.layer.borderWidth = 1
        }
        if nameTf.text! != "" && surnameTf.text! != "" && genderTf.text! != "" {
            saveImage(imageName: "PersonImage", image: self.imgPersonImg.image ?? UIImage(systemName: "trash")!)
            let vc = TabbarItem(nibName: "TabbarItem", bundle: nil)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
}

extension LoginVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            self.imgPersonImg.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func setToolbar() {
        
        self.pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150))
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.backgroundColor = UIColor.white
        genderTf.inputView = self.pickerView
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneTapped))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        
        genderTf.inputAccessoryView = toolBar
    }
    
    @objc func doneTapped() {
        print(genderTf.text!)
        genderTf.resignFirstResponder()
    }
    
    @objc func cancelTapped() {
        genderTf.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        setToolbar()
    }
    
}

extension LoginVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        picData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return picData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genderTf.text = picData[component][row]
        return picData[component][row]
        
    }
}


