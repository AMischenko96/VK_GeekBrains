//
//  ViewController.swift
//  VK_GeekBrains
//
//  Created by Анастасия Мищенко on 23.11.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var VKLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    

    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewDidLoad")
        loginInput.layer.shadowColor = UIColor.black.cgColor
        loginInput.layer.shadowOpacity = 100
        scrollView.delegate = self
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyBoardGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        runAnimate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewWillDisappear")
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()

        if !checkResult {
            showLoginError()
        }

        loginInput.text = ""
        passwordInput.text = ""

        return checkResult
    }

    @IBAction func unwindVC(unwind: UIStoryboardSegue) {}

    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }

    @objc func keyBoardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)

        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }

    @objc func keyBoardWillBeHidden(notification: Notification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset

    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}

private extension ViewController {

    func runAnimate() {
        pathAnimation()
    }

    func layerAnimation() {
        let animation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = loginInput.layer.shadowRadius + 200
        animation.toValue = loginInput.layer.shadowRadius
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        loginInput.layer.add(animation, forKey: nil)
    }

    func spingAnimation() {
        let animation = CASpringAnimation(keyPath: "position.x")
        animation.fromValue = loginInput.layer.position.x + 500
        animation.toValue = loginInput.layer.position.x
        animation.duration = 3
        animation.timingFunction = .init(name: .easeInEaseOut)
        animation.mass = 2
        animation.stiffness = 100
        loginInput.layer.add(animation, forKey: nil)
    }

    func keyFrameAnimation() {
        UIView.animateKeyframes(withDuration: 3,
                                delay: 0,
                                options: [],
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.25,
                               animations: {
                self.passwordLabel.transform = CGAffineTransform(translationX: 100, y: 0)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.25,
                               animations: {
                self.passwordLabel.transform = CGAffineTransform(translationX: 100, y: 100)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.25,
                               animations: {
                self.passwordLabel.transform = CGAffineTransform(translationX: 0, y: 100)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.75,
                               relativeDuration: 0.25,
                               animations: {
                self.passwordLabel.transform = .identity
            })
        }) { isCompleted in
            print("Анимация выполнилась \(isCompleted)")
        }
    }

    func groupAnimation() {
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.fromValue = 0
        opacity.toValue = 1

        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.stiffness = 100
        scaleAnimation.mass = 2

        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 1
        animationGroup.beginTime = CACurrentMediaTime() + 1
        animationGroup.fillMode = CAMediaTimingFillMode.backwards
        animationGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationGroup.animations = [scaleAnimation, opacity]
        passwordLabel.layer.add(animationGroup, forKey: nil)
        loginLabel.layer.add(animationGroup, forKey: nil)
    }

    func pathAnimation() {
        let cloudView = UIView()

        view.addSubview(cloudView)
        cloudView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cloudView.widthAnchor.constraint(equalToConstant: 120),
            cloudView.heightAnchor.constraint(equalToConstant: 70)
        ])

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 60))
        path.addQuadCurve(to: CGPoint(x: 20, y: 40), controlPoint: CGPoint(x: 5, y: 50))
        path.addQuadCurve(to: CGPoint(x: 40, y: 20), controlPoint: CGPoint(x: 20, y: 20))
        path.addQuadCurve(to: CGPoint(x: 70, y: 20), controlPoint: CGPoint(x: 55, y: 0))
        path.addQuadCurve(to: CGPoint(x: 80, y: 30), controlPoint: CGPoint(x: 80, y: 20))
        path.addQuadCurve(to: CGPoint(x: 110, y: 60), controlPoint: CGPoint(x: 110, y: 30))
        path.close()

        let layerAnimation = CAShapeLayer()
        layerAnimation.path = path.cgPath
        layerAnimation.strokeColor = UIColor.blue.cgColor
        layerAnimation.fillColor = UIColor.clear.cgColor
        layerAnimation.lineWidth = 8
        layerAnimation.lineCap = .round

        cloudView.layer.addSublayer(layerAnimation)

        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationEnd.fromValue = 0
        pathAnimationEnd.toValue = 1
        pathAnimationEnd.duration = 2
        pathAnimationEnd.isRemovedOnCompletion = false
        pathAnimationEnd.fillMode = .both
//        pathAnimationEnd.beginTime =

        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.fromValue = 0
        pathAnimationStart.toValue = 1
        pathAnimationStart.duration = 2
        pathAnimationStart.isRemovedOnCompletion = false
        pathAnimationStart.fillMode = .both
        pathAnimationStart.beginTime = 1

//        layerAnimation.add(pathAnimationEnd, forKey: nil)

        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 3
        animationGroup.fillMode = CAMediaTimingFillMode.backwards
        animationGroup.animations = [pathAnimationEnd, pathAnimationStart]
        animationGroup.repeatCount = .infinity
        layerAnimation.add(animationGroup, forKey: nil)
    }

    func checkUserData() -> Bool {
        guard
            let login = loginInput.text,
            let password = passwordInput.text
        else {
            return false
        }
        if login == "admin" && password == "1234" {
            return true
        } else {
            return false
        }
    }

    func showLoginError() {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Введены неверные данные пользователя",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
