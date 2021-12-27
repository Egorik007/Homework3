//
//  ViewController.swift
//  дз
//
//  Created by Егор on 14.12.2021.
//

import UIKit

class ViewController: UIViewController {

   
 
  
    @IBOutlet weak var login: UITextField!
    
    @IBOutlet weak var parol: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func ComeIn(_ sender: Any) {
        
        print("Логин: \(login.text!)")
        print("Пароль: \(parol.text!)")
    }
    
    @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView
            .addGestureRecognizer(
                UITapGestureRecognizer(
                    target: self,
                    action: #selector(hideKeyboard)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier{
    case "goToMain":
        if !checkUser(){
            presentAlert()
            return false}
        else {
            clearData()
            return true
            
        }
    default: return false
        }
    }
    
    private func checkUser() -> Bool
    {
        login.text == "" && parol.text == ""
        
    }
    
    private func presentAlert()
    {
        let alertController = UIAlertController(title: "Ошибка входа", message: "Неверный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    private func clearData()
    {
        login.text = ""
        parol.text = ""
    }

    
}

