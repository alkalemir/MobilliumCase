//
//  RegisterViewController.swift
//  MobilliumCase
//
//  Created by Emir Alkal on 1.06.2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    func configureButton() {
        registerButton.layer.cornerRadius = 8
        registerButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        for textField in textFields {
            if textField.text == "" {
                presentAlert(title: "Error", message: "You must enter all intformation.")
                return
            }
        }
    
        if passwordTextField.text?.count ?? 0 < 3 {
            presentAlert(title: "Error", message: "Your password must have to minimum 3 digit.")
            return
        }
        
        if passwordTextField.text != retypePasswordTextField.text {
            presentAlert(title: "Error", message: "Passwords don't match.")
            return
        }
        
        // User passes all controls
        
        let destinationVC = UIStoryboard(name: StoryBoards.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: Views.login.rawValue) as? LoginViewController ?? LoginViewController()
        
        destinationVC.modalPresentationStyle = .fullScreen
        destinationVC.email = mailTextField.text
        destinationVC.password = passwordTextField.text
        
        present(destinationVC, animated: true)
    }
    
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
