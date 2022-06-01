//
//  LoginViewController.swift
//  MobilliumCase
//
//  Created by Emir Alkal on 1.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var checkBox1: UIButton!
    @IBOutlet weak var checkBox2: UIButton!
    
    @IBOutlet weak var secondStackView: UIStackView!
    
    var email: String?
    var password: String?
    var isCheckBox1Checked: Bool?
    var isCheckBox2Checked: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureButton()
        configureCheckBox()
        
        isCheckBox1Checked = false
        isCheckBox2Checked = false
        secondStackView.isHidden = true
    }
    
    func configureButton() {
        loginButton.layer.cornerRadius = 8
        loginButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    func configureCheckBox() {
        checkBox1.layer.cornerRadius = 5
        checkBox1.layer.borderWidth = 1
        checkBox1.layer.borderColor = UIColor(named: "buttonBorderColor")?.cgColor
        
        checkBox2.layer.cornerRadius = 5
        checkBox2.layer.borderWidth = 1
        checkBox2.layer.borderColor = UIColor(named: "buttonBorderColor")?.cgColor
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if nameTextField.text == email && passwordTextField.text == password {
            let destinationVC = UIStoryboard(name: StoryBoards.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: Views.movieList.rawValue)
            
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Username or password is wrong!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
                self.nameTextField.text = ""
                self.passwordTextField.text = ""
            }))
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func checkBox1Pressed(_ sender: UIButton) {
        isCheckBox1Checked?.toggle()
        
        if isCheckBox1Checked! {
            secondStackView.isHidden = false
            sender.setImage(UIImage(systemName: Images.checkBoxImage.rawValue), for: .normal)
        } else {
            sender.setImage(UIImage(), for: .normal)
        }
    }
    
    @IBAction func checkBox2Pressed(_ sender: UIButton) {
        isCheckBox2Checked?.toggle()
        
        if isCheckBox2Checked! {
            sender.setImage(UIImage(systemName: Images.checkBoxImage.rawValue), for: .normal)
        } else {
            sender.setImage(UIImage(), for: .normal)
        }
    }
}


