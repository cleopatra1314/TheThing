//
//  signInViewController.swift
//  TheThing
//
//  Created by 黃郁雯 on 2022/11/3.
//

import UIKit

class signInViewController: UIViewController {
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var gifImageView: UIImageView!
    
    @IBOutlet weak var alertTextView: UITextView!
    
    @IBOutlet weak var signInButton: UIButton!
    
    //設定帳號、密碼
    let email = "a"
    let password = "a"
    var signInAuthentication: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let animatedImage = UIImage.animatedImageNamed("birdy-", duration: 1)
        gifImageView.image = animatedImage
      
    }
    
    //使用Email登入
    @IBAction func signInButton(_ sender: UIButton) {
        if accountTextField.text == email && passwordTextField.text == password{
            //signInAuthentication = true
            print("succeed")
            performSegue(withIdentifier: "SignInToHomepage", sender: nil)
        }else{
            //signInAuthentication = false
            alertTextView.text = "Email 或密碼錯誤，請重新輸入"
            alertTextView.textColor = .red
            print("wrong")
        }
    }

    //
//    @IBAction func SignInToHomepageButton(_ sender: UIButton) {
//
//        self .performSegue(withIdentifier: "SignInToHomepage", sender: nil)
//    }
}
