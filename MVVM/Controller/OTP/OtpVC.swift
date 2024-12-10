//
//  OtpVC.swift
//  Raksha
//
//  Created by Ideio Soft on 10/12/24.
//

import UIKit
import OTPFieldView

class OtpVC: UIViewController {
    @IBOutlet weak var widthResend: NSLayoutConstraint!
    @IBOutlet weak var lblOtpTitle: UILabel!
    @IBOutlet weak var btnTimer: UIButton!
    @IBOutlet weak var lblReceiveCode: UILabel!
    @IBOutlet weak var otpVw: OTPFieldView!
    
    var timer: Timer?
    var remainingSeconds: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOtpView()
        startTimer()
        setupOtpTitleLabel()
    }
    
    func setupOtpTitleLabel() {
        let phoneNumber = "+91 ******6789"
        let fullText = "Please enter the 4 digit code sent to \(phoneNumber) through SMS"
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the color for the phone number
        let phoneNumberRange = (fullText as NSString).range(of: phoneNumber)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blackText, range: phoneNumberRange) // Change to desired color
        
        // Set the attributed string to the label
        lblOtpTitle.attributedText = attributedString
    }
    func setupOtpView() {
        self.otpVw.fieldsCount = 4
        self.otpVw.fieldBorderWidth = 1
        self.otpVw.defaultBorderColor = UIColor.purple
        self.otpVw.filledBorderColor = UIColor.purple
        self.otpVw.cursorColor = UIColor.purple
        self.otpVw.displayType = .square
        self.otpVw.fieldSize = 50
        self.otpVw.separatorSpace = 8
        self.otpVw.shouldAllowIntermediateEditing = false
        self.otpVw.delegate = self
        self.otpVw.initializeUI()
    }
    
    func startTimer() {
        remainingSeconds = 60
        updateTimerButton()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.remainingSeconds -= 1
            self.updateTimerButton()
            
            if self.remainingSeconds <= 0 {
                self.timer?.invalidate()
                self.timer = nil
                self.btnTimer.setTitle("Resend OTP", for: .normal)
                self.widthResend.constant = 250
                self.btnTimer.isEnabled = true
            }
        }
    }
    
    func updateTimerButton() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        let timeString = String(format: "%02d:%02d", minutes, seconds)
        btnTimer.setTitle(timeString, for: .normal)
        btnTimer.isEnabled = false
        widthResend.constant = 205
    }
    
    @IBAction func actionTimer(_ sender: UIButton) {
        // Logic to resend OTP
        print("Resend OTP")
        startTimer()
    }
    
    @IBAction func actionOtpVerification(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
    }
    @IBAction func actionBack(_ sender: UIButton) {
        // Logic to handle back action
        self.navigationController?.popViewController(animated: true)
    }
}

extension OtpVC: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
}
