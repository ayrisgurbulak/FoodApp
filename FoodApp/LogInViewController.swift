//
//  LoginViewController.swift
//  FoodApp
//
//  Created by Ayris Gürbulak on 2.06.2022.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == C.loginIdentifier {
                let barViewControllers = segue.destination as! TabbarViewController
                let nav = barViewControllers.viewControllers![0] as! UINavigationController
                let destinationViewController = nav.topViewController as! FoodsPageViewController
                destinationViewController.username = emailTextfield.text
        }
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e)
                        } else {
                            self.performSegue(withIdentifier: C.loginIdentifier, sender: self)
                        }
                    }
                }
    }
    
}
