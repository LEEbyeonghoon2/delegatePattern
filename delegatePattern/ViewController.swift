//
//  ViewController.swift
//  delegatePattern
//
//  Created by 이병훈 on 2021/04/13.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var TF: UITextField!
    
    override func viewDidLoad() {
        self.TF.delegate = self
        self.TF.clearsOnBeginEditing = true
    }
    
    /*텍스트 필드의 텍스트가 편집 시작할때 호출*/
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드가 편집 시작!")
        return true
    }
    /*텍스트 필드의 텍스트가 제거될떄 호출*/
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 텍스트가 제거!")
        return true
    }
    /*리턴키를 눌렀을때 최초응답자를 잃기 */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TF.resignFirstResponder()
        return true
    }
    /*텍스트 필드에 문자열을 입력할수 없도록 하기*/
    /*텍스트 필드의 글자 범위 8자 이하로 지정*/
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textCount = textField.text?.count else {
            return false
        }
        if textCount > 7 {
            let alert = UIAlertController(title: "경고", message: "8글자를 넘었습니다.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default) { (_) in
                self.TF.text = ""
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: false)
            
            return false
            
        }
        if Int(string) != nil {
            return true
        } else {
            return false
        }
    }


}

