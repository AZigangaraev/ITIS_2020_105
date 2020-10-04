//
//  ViewController.swift
//  AutoLayout
//
//  Created by Amir Zigangarayev on 04.10.2020.
//

import UIKit

class ViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate {

    private let signInView: SignInView = .instantiateFromSameNamedNib()
    private let signUpView: SignUpView = .instantiateFromSameNamedNib()
    private var passwords: [String: String] = [ "1": "1" ]

    private var signInViewBottomConstraint: NSLayoutConstraint?
    private var signUpViewBottomConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        setupSignInView()
        setupSignUpView()
        signInView.isHidden = false
        signUpView.isHidden = true
        setupKeyboardNotifications()
    }

    private func setupSignInView() {
        signInView.delegate = self
        view.addSubview(signInView)
        signInView.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = signInView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraint = signInView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        centerYConstraint.priority = UILayoutPriority(500)
        let bottomConstraint = view.bottomAnchor.constraint(greaterThanOrEqualTo: signInView.bottomAnchor)
        bottomConstraint.priority = .defaultLow
        signInViewBottomConstraint = bottomConstraint
        NSLayoutConstraint.activate([ centerXConstraint, centerYConstraint, bottomConstraint ])
    }

    private func setupSignUpView() {
        signUpView.delegate = self
        view.addSubview(signUpView)
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        let centerXConstraint = signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let centerYConstraint = signUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        centerYConstraint.priority = UILayoutPriority(500)
        let bottomConstraint = view.bottomAnchor.constraint(greaterThanOrEqualTo: signUpView.bottomAnchor)
        bottomConstraint.priority = .defaultLow
        signUpViewBottomConstraint = bottomConstraint
        NSLayoutConstraint.activate([ centerXConstraint, centerYConstraint, bottomConstraint ])
    }

    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIApplication.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIApplication.keyboardWillHideNotification,
            object: nil
        )
    }

    enum State {
        case signIn
        case signUp
    }

    private func set(state: State) {
        switch state {
            case .signIn:
                signUpView.isHidden = true
                signInView.resetFields()
                signInView.isHidden = false
            case .signUp:
                signInView.isHidden = true
                signUpView.resetFields()
                signUpView.isHidden = false
        }
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let size = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else { return }

        for constraint in [ signInViewBottomConstraint, signUpViewBottomConstraint ] {
            constraint?.constant = size.height
            constraint?.priority = .defaultHigh
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        [ signInViewBottomConstraint, signUpViewBottomConstraint ].forEach { $0?.priority = .defaultLow }
    }

    // MARK: - SignInViewDelegate

    func signInView(_ signInView: SignInView, didRequestSignInWithLogin login: String, password: String) {
        guard passwords[login] == password else {
            let signInFailedAlert = UIAlertController(title: "Wrong login/pasword", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            signInFailedAlert.addAction(cancelAction)
            present(signInFailedAlert, animated: true)
            return
        }

        let signInSuccessfulAlert = UIAlertController(title: "Sign in successful", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        signInSuccessfulAlert.addAction(cancelAction)
        present(signInSuccessfulAlert, animated: true)
    }

    func signInViewDidRequestSignUp(_ signInView: SignInView) {
        set(state: .signUp)
    }

    // MARK: - SignUpViewDelegate

    func signUpView(
        _ signUpView: SignUpView,
        didRequestAuthorizeWithLogin login: String,
        password: String,
        passwordConfirmation: String
    ) {
        guard password == passwordConfirmation else {
            let passwordsDontMatchAlert = UIAlertController(title: "Passwords don't match", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                signUpView.resetPasswords()
            }
            passwordsDontMatchAlert.addAction(cancelAction)
            present(passwordsDontMatchAlert, animated: true)
            return
        }

        guard login.count > 0 else {
            let emptyLoginAlert = UIAlertController(title: "Login field is empty", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            emptyLoginAlert.addAction(cancelAction)
            present(emptyLoginAlert, animated: true)
            return
        }

        guard password.count > 0 else {
            let emptyPasswordAlert = UIAlertController(title: "Password field is empty", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel)
            emptyPasswordAlert.addAction(cancelAction)
            present(emptyPasswordAlert, animated: true)
            return
        }

        passwords[login] = password
        set(state: .signIn)
    }

    func signUpViewDidRequestSignIn(_ signUpView: SignUpView) {
        set(state: .signIn)
    }
}

