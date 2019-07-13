//
//  ViewController.swift
//  GradeCalculator
//
//  Created by Ahmet Mohammed on 5/1/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var g1: UITextField!
    @IBOutlet weak var g2: UITextField!
    @IBOutlet weak var g3: UITextField!
    @IBOutlet weak var g4: UITextField!
    @IBOutlet weak var g5: UITextField!
    @IBOutlet weak var g6: UITextField!
    
    
    @IBOutlet weak var w1: UITextField!
    @IBOutlet weak var w2: UITextField!
    @IBOutlet weak var w3: UITextField!
    @IBOutlet weak var w4: UITextField!
    @IBOutlet weak var w5: UITextField!
    @IBOutlet weak var w6: UITextField!
    
    @IBOutlet weak var gradelbl: UILabel!
    
    
    
    @IBAction func calculate(_ sender: Any) {
        let getg1 = Double(g1.text!)!
        let getg2 = Double(g2.text!)!
        let getg3 = Double(g3.text!)!
        let getg4 = Double(g4.text!)!
        let getg5 = Double(g5.text!)!
        let getg6 = Double(g6.text!)!
        
        let conw1 = Double(w1.text!)!
        let conw2 = Double(w2.text!)!
        let conw3 = Double(w3.text!)!
        let conw4 = Double(w4.text!)!
        let conw5 = Double(w5.text!)!
        let conw6 = Double(w6.text!)!

        
        let a = getg1 * conw1
        let b = getg2 * conw2
        let c = getg3 * conw3
        let x = getg4 * conw4
        let y = getg5 * conw5
        let z = getg6 * conw6
        
        let d = conw1 + conw2 + conw3 + conw4 + conw5 + conw6
        let e = (a+b+c+x+y+z)
        
        
        gradelbl.text = String((e/d))
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        g1.text = String(1)
        g2.text = String(1)
        g3.text = String(1)
        g4.text = String(1)
        g5.text = String(1)
        g6.text = String(1)
        
        w1.text = String(0)
        w2.text = String(0)
        w3.text = String(0)
        w4.text = String(0)
        w5.text = String(0)
        w6.text = String(0)
        
        
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.g1.delegate = self;
        self.g2.delegate = self;
        self.g3.delegate = self;
        self.g4.delegate = self;
        self.g5.delegate = self;
        self.g6.delegate = self;
        
        self.w1.delegate = self;
        self.w2.delegate = self;
        self.w3.delegate = self;
        self.w4.delegate = self;
        self.w5.delegate = self;
        self.w6.delegate = self;
        
        
        
        self.hideKeyboard()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 6
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        
        let allowedChars = CharacterSet(charactersIn: "1234567890")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedChars.isSuperset(of: characterSet) && newString.length <= maxLength
    }
    
    


}


extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
