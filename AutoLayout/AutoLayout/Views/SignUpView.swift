//
//  SignUpView.swift
//  AutoLayout
//
//  Created by Amir Zigangarayev on 04.10.2020.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func signUpView(
        _ signUpView: SignUpView,
        didRequestAuthorizeWithLogin login: String,
        password: String,
        passwordConfirmation: String
    )
    func signUpViewDidRequestSignIn(_ signUpView: SignUpView)
}

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?

    func resetFields() {
        loginField.text = ""
        passwordField.text = ""
        confirmPasswordField.text = ""
    }

    func resetPasswords() {
        passwordField.text = ""
        confirmPasswordField.text = ""
    }

    @IBOutlet private var loginField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var confirmPasswordField: UITextField!

    @IBAction private func signUpTap() {
        guard
            let login = loginField.text,
            let password = passwordField.text,
            let passwordConfirmation = confirmPasswordField.text
        else { return }

        delegate?.signUpView(
            self,
            didRequestAuthorizeWithLogin: login,
            password: password,
            passwordConfirmation: passwordConfirmation
        )
    }

    @IBAction private func signInTap() {
        delegate?.signUpViewDidRequestSignIn(self)
    }
}
