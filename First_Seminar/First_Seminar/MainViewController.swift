//
//  MainViewController.swift
//  First_Seminar
//
//  Created by 이성민 on 2023/04/01.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        return label
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textfield = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        paddingView.alpha = 0
        textfield.placeholder = "이름을 입력해주세요"
        textfield.clearButtonMode = .whileEditing
        textfield.layer.borderColor = UIColor.systemGray.cgColor
        textfield.layer.borderWidth = 1.5
        textfield.layer.cornerRadius = 10
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
        textfield.clearButtonMode = .always
        return textfield
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        hideKeyboard()
        style()
        setLayout()
    }
    
    // MARK: - func
    
    func presentToSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .automatic
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        let secondViewController = SecondViewController()
        if let name = nameTextField.text {
            secondViewController.dataBind(name: name)
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    // Delegate - 대리자
    // Delegate 선언을 왜 하냐? -> 더 다양한 작업을 해주기 위해(?)로 알고 있음
    // 나중에 가면 delegate pattern 이란 것도 있는데, 구글링 해보세요 ^__^
    // 그냥 이것만 추가해두면 오류가 뜨는데, UITextFieldDelegate Protocol을 추가하라고 할거임
    // fix 누르면 지금 VC 옆의 UIViewController 옆에 생기는데, 보통 extension으로 빼서 구분해둠
    // 고로 아래에 extension으로 따로 관리를 할거임!
    func setupDelegate() {
        nameTextField.delegate = self
    }
    
    // MARK: - objc func
    
    @objc
    func endEditingView() {
        view.endEditing(true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        pushToSecondViewController()
    }
}

private extension MainViewController {
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}

// 요기에서 관리할건데, UICollectionViewDelegate나 UITableViewDelegate 등
// 각 Delegate 별로 추가로 사용할 수 있는 함수들이 몇 가지 있음
// UITextFieldDelegate에는 어떤게 있는지 알아보기 위해서는 공홈 찾아보길!
// 지금 하려는건 nameTextField를 탭 했을 때 테두리 색을 바꾸는 것인데
// 함수 이름 치면 저절로 내장되어 있는 함수 몇 가지 나올거임
// 그 중에서 Did(했다)Begin(시작)Editing(편집) -> TextField 편집 시작했을 때 실행되는 함수인거임

// DispatchQueue.main.async 는 사실 잘은 모르는 부분이지만,
// 대충 설명해두자면 Swift에서도 쓰레드 개념이 있는데, main 쓰레드는 항상 UI를 변경할 때에 사용되고,
// 그걸 보장해주기 위해 Dispatch.main.async {  } 안에 UI 바꾸는 코드를 넣어둔 것

// 그 다음에 나오는 함수는 Did(했다)End(끝)Editing(편집) -> TextField 편집 끝났을 때 실행되는 함수이고
// 다시 원래 상태로 돌려주기 위해 그 안에 borderColor를 다시 원래 상태로 만들어준 것
extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.nameTextField.layer.borderColor = UIColor.systemCyan.cgColor
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.nameTextField.layer.borderColor = UIColor.systemGray.cgColor
            }
        }
    }
}

// GestureRecognizerDelegate 는 아직 저도 잘...
// 하지만 요 코드는 상당히 자주 보게 될 텐데 뭘 하는 코드냐..
// 시뮬레이터에서는 그냥 키보드에서 타이핑 하면 타이핑이 되는데, command + K 를 누르면 키보드가 올라옴
// 평소에 키보드 외의 부분을 터치하면 키보드가 내려가야 하는데, 키보드가 내려가지 않는 문제가 있을거임
// 아래 코드는 이 문제를 해결하기 위한 것 -> 키보드 외의 부분을 터치하면 키보드가 내려감을 확인할 수 있다~
// 얘도 delegate 선언해주는 것이므로 viewDidLoad 에서 실행시켜주면 좋다~
extension MainViewController: UIGestureRecognizerDelegate {
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditingView))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
}
