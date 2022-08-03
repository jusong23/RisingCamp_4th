//
//  LoginViewController.swift
//  Thread_Example_Project
//
//  Created by 이주송 on 2022/08/03.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    var loginCompleteNumber = 0
    
    @IBOutlet weak var google: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue(0, forKey: "LOGINED")
    }
    
    @IBAction func googleLogin(_ sender: Any) {
        let config = GIDConfiguration(clientID: "795344605481-eh9clt5aracqv6avsfmr3ca611nemc7k.apps.googleusercontent.com")
                
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            if let error = error { return }
            guard let user = user else { return }
      
            print(user.profile?.name)
            self.loginCompleteNumber += 1
            if self.loginCompleteNumber == 1 {
                print(self.loginCompleteNumber)
//                guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
//                      viewController.modalPresentationStyle = .fullScreen // 기본적인 모달형식(밑에서 올라오지만 꽉 차지 않음)을 Fullscreen으로 변경 !
//                      self.present(viewController, animated: true, completion: nil)
                
                
                guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") else { return }
                    self.navigationController?.pushViewController(viewController, animated: true)
                
                self.loginCompleteNumber -= 1
            }
        }
        
       
    }
    
    
    
    
}
