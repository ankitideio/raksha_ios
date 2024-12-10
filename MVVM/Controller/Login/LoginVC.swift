//
//  LoginVC.swift
//  Raksha
//
//  Created by Ideio Soft on 02/12/24.
//

import UIKit
import CountryPickerView

class LoginVC: UIViewController {
    
    //MARK: - OUTLETS
    
    @IBOutlet var widthCountryCode: NSLayoutConstraint!
    @IBOutlet var countryPickerView: CountryPickerView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtFldMobile: UITextField!
    @IBOutlet weak var lblTermPrivacy: UILabel!
    @IBOutlet weak var lblPhoneCode: UILabel!
    
    //MARK: - LIFE CYCLE METHOD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    
    //MARK: - FUNCTIONS
    
    func uiSet(){
        countryPickerSetup()
        DismissKeyboardOnTap()
        let baseText = "By proceeding you agree to our Terms & Conditions and confirm that you are at least 13 years old."
        let termsRange = (baseText as NSString).range(of: "Terms")
        let ConditionsRange = (baseText as NSString).range(of: "Conditions")
        let attributedText = NSMutableAttributedString(string: baseText)
        attributedText.addAttribute(.foregroundColor, value: UIColor(hex: "#6A1B9A"), range: termsRange)
        attributedText.addAttribute(.foregroundColor, value: UIColor(hex: "#6A1B9A"), range: ConditionsRange)
        attributedText.addAttribute(.font, value: UIFont(name: "Roboto-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), range: termsRange)
        attributedText.addAttribute(.font, value: UIFont(name: "Roboto-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14), range: ConditionsRange)
        lblTermPrivacy.attributedText = attributedText
    }
    func countryPickerSetup(){
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        countryPickerView.showCountryNameInView = false
        countryPickerView.showCountryCodeInView = false
        countryPickerView.flagImageView.isHidden = true
        countryPickerView.showPhoneCodeInView = false
    }
    //MARK: - ACTIONS
    
    @IBAction func actionCountryPicker(_ sender: UIButton) {
        countryPickerView.showCountriesList(from: self)
    }
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionGoogle(_ sender: UIButton) {
        
    }
    
    @IBAction func actionApple(_ sender: UIButton) {
        
    }
    
}

//MARK: - TEXTFIELD DELEGATE METHOD

extension LoginVC:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Get the current text
        let currentText = textField.text ?? ""
        guard let textRange = Range(range, in: currentText) else { return true }
        let updatedText = currentText.replacingCharacters(in: textRange, with: string)
        if updatedText.count >= 10 {
            btnLogin.isEnabled = true
            btnLogin.backgroundColor = UIColor(hex: "#6A1B9A")
            btnLogin.alpha = 1.0
        } else {
            btnLogin.isEnabled = false
            btnLogin.backgroundColor = UIColor(hex: "#6A1B9A")
            btnLogin.alpha = 0.5
        }
        
        return updatedText.count <= 10
    }
}
//MARK: - CountryPickerViewDelegate CountryPickerViewDataSource

extension LoginVC: CountryPickerViewDelegate, CountryPickerViewDataSource {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: CPVCountry) {
        lblPhoneCode.text = country.phoneCode
        switch country.phoneCode.count {
        case 3:
            widthCountryCode.constant = 55
        case 4:
            widthCountryCode.constant = 60
        case 5:
            widthCountryCode.constant = 65
        default:
            widthCountryCode.constant = 50
        }
    }
}
