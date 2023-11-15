//
//  ViewController.swift
//  CryptoKitDemo
//
//  Created by Angelos Staboulis on 15/11/23.
//

import UIKit
import CryptoKit
class ViewController: UIViewController {
    @IBOutlet weak var lblEncrypted: UILabel!
    @IBOutlet weak var txtPhrase: UITextField!
    
    @IBOutlet weak var btnConvert: UIButton!
    @IBOutlet weak var lblDecrypted: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnConvert(_ sender: Any) {
        let key = SymmetricKey(size: .bits256)
        let newData = txtPhrase.text?.data(using: .utf8)
        let encryptedKey = Helper.shared.encryptedData(data: newData!, key: key)
        let decryptedKey = Helper.shared.decryptedData(dataText: encryptedKey, key: key)
        lblEncrypted.text = encryptedKey.base64EncodedString()
        lblDecrypted.text = String(data: decryptedKey, encoding: .utf8)
    
    }
    
}
extension ViewController{
    func setupButton(){
        btnConvert.tintColor = UIColor.white
        btnConvert.backgroundColor = UIColor.systemBlue
        btnConvert.setTitleColor(.white, for: .normal)
        btnConvert.layer.cornerRadius = 22
    }
}
