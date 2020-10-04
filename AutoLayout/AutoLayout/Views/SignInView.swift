//
//  SignInView.swift
//  AutoLayout
//
//  Created by Amir Zigangarayev on 04.10.2020.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func signInView(_ signInView: SignInView, didRequestSignInWithLogin login: String, password: String)
    func signInViewDidRequestSignUp(_ signInView: SignInView)
}

/// Вьюшка авторизации. Сделана на констрейнтах в Interface Builder.
class SignInView: UIView {
    weak var delegate: SignInViewDelegate?

    func resetFields() {
        loginField.text = ""
        passwordField.text = ""
    }

    @IBOutlet private var loginField: UITextField!
    @IBOutlet private var passwordField: UITextField!

    @IBAction private func signInTap() {
        guard let login = loginField.text, let password = passwordField.text else { return }

        delegate?.signInView(self, didRequestSignInWithLogin: login, password: password)
    }

    @IBAction private func signUpTap() {
        delegate?.signInViewDidRequestSignUp(self)
    }
}
