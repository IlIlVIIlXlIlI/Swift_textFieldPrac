//
//  ViewController.swift
//  TextFieldPrac
//
//  Created by Shogo Nobuhara on 2021/01/06.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,
                      UIPickerViewDelegate,UIPickerViewDataSource{

    // propatay
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    //=============================================================
    // textField
    //=============================================================
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange, replacementString string: String)->Bool{
        
        let tmpStr = textField.text! as NSString
        let replacedString = tmpStr.replacingCharacters(in: range, with: string)
        if replacedString == ""{
            myLabel.text = "0"
        }else{
            if let num = Int(replacedString)
            {
                myLabel.text = String(num * 25)
            }
        }
        
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLabel.text = "0"
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    //=============================================================
    // pickerView
    //=============================================================
    let compos = [["月","火","水","木","金"],["早朝","午前中","昼間","夜間"]]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    func pickerView(_ pickerView:UIPickerView,numberOfRowsInComponent component: Int)->Int
    {
        let compo = compos[component]
        return compo.count
    }
    
    func pickerView(_ pickerView: UIPickerView,widthForComponent component:Int)->CGFloat{
        if component == 0
        {
            return 50
        }else{
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,titleForRow row:Int,forComponent component:Int)->String?
    {
        let item = compos[component][row]
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let item = compos[component][row]
        
        // 現在選択されている項目名
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        //print("現在選択されている行番号\(row1, row2)")
        
        // 現在選択されている項目名
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        //print("現在選択されている項目名 \(item1!,item2!)")
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTextField.delegate = self
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    //    override func didReceveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//    }


}

