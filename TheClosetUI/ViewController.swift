//
//  ViewController.swift
//  TheClosetUI
//
//  Created by prashant thakare on 27/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    let multipiller = UIScreen.main.bounds.width/320
    var BtnHeight = 40
    var DeviceWidth:CGFloat = UIScreen.main.bounds.width
    let font = UIFont(name: "Dosis-Regular", size: 15)
    var emailStr = ""
    var passwordStr = ""
    var emailTF = UITextField()
    var passwordTextField = UITextField()
    private let titleBar:UILabel = {
        let titleBar = UILabel()
        titleBar.text = "LOGIN"
        titleBar.font = Globals().font
        return titleBar
        
    }()
//    private var emailTF:UITextField = {
//        let emailTF = UITextField()
//        emailTF.placeholder = "Enter Your Mail"
//        emailTF.font = Globals().font
//
//        return emailTF
//
//    }()
    private let passwordTF:UITextField = {
        let passwordTf = UITextField()
        passwordTf.text = "Enter your PassWord"
        return passwordTf
    }()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleBar
        navigationController?.setSize(width: DeviceWidth, height: 400*multipiller,VC: self)
        navigationController?.setBackgroundClear()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.setupHeaderView()
        self.setupFooterView()
        self.view.layoutIfNeeded()
        tableView.scrollToBottom(animated: true)
//        navigationItem.rightBarButtonItem =
//        self.navigationController?.navigationItem.rightBarButtonItem?.tintColor = UIColor(cgColor: CGColor(red: 65/255, green: 40/255, blue: 61/255, alpha: 1))
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleBar.frame = CGRect(x: 0, y: 0, width: 44*multipiller, height: 22*multipiller)
        
    }
    func setupHeaderView(){
        
        let headerView = Globals().makeContainerView(rect: CGRect(x: 15*multipiller, y: 0, width: DeviceWidth, height:55*multipiller), bgColor: .white)
        let label = Globals().makeLabel(Frame: CGRect(x: 15*multipiller, y: 0, width: DeviceWidth - 10*multipiller, height: 55*multipiller), FontName: "Dosis-Regular", FontSize: 14, TextColor: .black, Text: "If you have an account, sign in with your email address")
        headerView.addSubview(label)
        self.tableView.tableHeaderView = headerView
        
    }
    func setupFooterView(){
        
        let msgStr = Globals().GetStringForKey(key: "Creating an account has many benefits: checkout faster, keep more than one address, track orders and much more")
        let msgHeight = Globals().getTextHeight(text: msgStr, font:UIFont(name: "Dosis-Regular", size: 14)!, constrainedSize: CGSize(width: DeviceWidth - 30*multipiller, height: 9999))
        
        let footerView = Globals().makeContainerView(rect: CGRect(x: 0, y: 0, width: DeviceWidth, height: msgHeight + 115*multipiller), bgColor: UIColor.clear)
       // footerView.backgroundColor = .red
        self.tableView.tableFooterView = footerView
        //footerView.centerX()

        let customerLbl = Globals().makeLabel(Frame: CGRect.zero, FontName: "Dosis-Bold", FontSize: 12, TextColor: .black, Text: Globals().GetStringForKey(key: "NEW CUSTOMER ?"))
        footerView.addSubview(customerLbl)
        customerLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customerLbl.textAlignment = .center
        //customerLbl.contentMode = .scaleAspectFill
        customerLbl.top(constant: 0*multipiller)
        customerLbl.centerX()
        //customerLbl.centerXToView(view: footerView)
        customerLbl.fixWidth(constant: 100*multipiller)
        customerLbl.fixHeight(constant: 30*multipiller)
        
        
//        let divider1 = UIView(frame: CGRect.zero)
//        divider1.backgroundColor = .gray
//        footerView.addSubview(divider1)
//        divider1.leftTo(view: customerLbl, constant: 0)
//        divider1.top(constant: 10*multipiller)
//        divider1.fixHeight(constant: 1)
//        divider1.fixWidth(constant: 65*multipiller)
        let dividerLine1 = UIView(frame: CGRect.zero)
        dividerLine1.backgroundColor = .gray
        footerView.addSubview(dividerLine1)
        dividerLine1.top(constant: (15*multipiller))
        dividerLine1.fixHeight(constant: 1)
       dividerLine1.fixWidth(constant: 65*multipiller)
        dividerLine1.leftTo(view: customerLbl, constant: 0)
        //dividerLine1.leading(constant: 20*multipiller)
        
        let dividerLine2 = UIView(frame: CGRect.zero)
        dividerLine2.backgroundColor = .gray
        footerView.addSubview(dividerLine2)
        dividerLine2.top(constant: (15*multipiller))
        dividerLine2.fixHeight(constant: 1)
        dividerLine2.fixWidth(constant: 65*multipiller)
        dividerLine2.rightTo(view: customerLbl, constant: 0)
       //dividerLine2.trailing(constant:60*multipiller)
        
        
        let msgLbl = Globals().makeLabel(Frame: CGRect(x: 15*multipiller, y: 50*multipiller, width: DeviceWidth - 30*multipiller, height: msgHeight), FontName: "Dosis-Regular", FontSize: 13, TextColor: .black, Text: msgStr)
        msgLbl.textAlignment = .center
        
        footerView.addSubview(msgLbl)
        
        let signUpBtn = Globals().makeButton(Frame: CGRect(x: 10*multipiller, y: msgLbl.frame.origin.y + msgLbl.frame.height + 10*multipiller, width: DeviceWidth - 20*multipiller, height: CGFloat(BtnHeight)*multipiller), FontName: "Dosis-Bold", FontSize: 17, TextColor: .white, Text: Globals().GetStringForKey(key: "Create an account"), BackgroundColor: UIColor.black, BackgroundImage: "")
        signUpBtn.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        footerView.addSubview(signUpBtn)
        
        
        
    }
    @objc func goToRegister(){
        
    }
    @objc func loginCall(){
        
        
    }
    @objc func moveToForgotPassword(){
        
        
        
    }
    @objc func googleTap(){
    
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.selectionStyle = .none
        for subView in cell.contentView.subviews{
            subView.removeFromSuperview()
        }
        let xAxis = 10*multipiller
        let width = DeviceWidth - 20*multipiller
        
        let titlelLbl = Globals().makeLabel(Frame: CGRect(x:xAxis, y: 0*multipiller, width: width, height: 15*multipiller), FontName: "Dosis-Regular", FontSize: 12, TextColor: .black, Text: "")
        
        
        if indexPath.row == 0 {
            
            titlelLbl.text = "Email"
            
            cell.contentView.addSubview(titlelLbl)
            
            self.emailTF.frame = CGRect(x: xAxis, y: titlelLbl.frame.origin.y + titlelLbl.frame.height + 2.5*multipiller, width: width, height: 40*multipiller)
            emailTF.font = UIFont(name: "Dosis-Regular", size: 10)
            emailTF.layer.borderWidth = 0.5
            emailTF.layer.borderColor = UIColor.gray.cgColor
            emailTF.layer.cornerRadius = 5
            self.emailTF.tag = 1
            self.emailTF.delegate = self
            self.emailTF.keyboardType = .emailAddress
            self.emailTF.text = emailStr
            cell.contentView.addSubview(self.emailTF)
        }
        if indexPath.row == 1{
            titlelLbl.text = Globals().GetStringForKey(key: "Password*")
            cell.contentView.addSubview(titlelLbl)
            
            passwordTextField.frame = CGRect(x: xAxis, y: titlelLbl.frame.origin.y + titlelLbl.frame.height + 2.5*multipiller, width: width, height: 40*multipiller)
            passwordTextField.font = UIFont(name: "Dosis-Regular", size: 10)
            passwordTextField.layer.borderWidth = 0.5
            passwordTextField.layer.borderColor = UIColor.gray.cgColor
            passwordTextField.layer.cornerRadius = 5
            passwordTextField.tag = 2
            passwordTextField.delegate = self
            passwordTextField.isSecureTextEntry = true
            passwordTextField.keyboardType = .default
            passwordTextField.text = passwordStr
            cell.contentView.addSubview(self.passwordTextField)
            
        }
        if indexPath.row == 2{
            let loginBtn = Globals().makeButton(Frame: CGRect(x: xAxis, y: 5*multipiller, width: width, height: CGFloat(BtnHeight)), FontName: "Dosis-Regular", FontSize: 14, TextColor: .white, Text: Globals().GetStringForKey(key: "Sign in"), BackgroundColor: .black, BackgroundImage: "")
            loginBtn.addTarget(self, action: #selector(loginCall), for: .touchUpInside)
            cell.contentView.addSubview(loginBtn)
            
            let forgotBtn = Globals().makeButton(Frame: CGRect(x: xAxis, y: loginBtn.frame.origin.y + loginBtn.frame.height + 10*multipiller, width: width, height: 25*multipiller), FontName: "Dosis-Light" , FontSize:12, TextColor: .gray, Text: Globals().GetStringForKey(key: "Forgot Password?"), BackgroundColor: UIColor.clear, BackgroundImage: "")
            //forgotBtn.setUnderLine()
            forgotBtn.addTarget(self, action: #selector(moveToForgotPassword), for: .touchUpInside)
            cell.contentView.addSubview(forgotBtn)
            
            
        }
        if indexPath.row == 3{
            
            

            
            let ORLabel = Globals().makeLabel(Frame: CGRect.zero, FontName: "Dosis-Regular", FontSize: 14, TextColor: .black, Text: Globals().GetStringForKey(key: "OR"))
            ORLabel.textAlignment = .center
            cell.contentView.addSubview(ORLabel)
            ORLabel.translatesAutoresizingMaskIntoConstraints = false
            ORLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
          //  ORLabel.centerYAnchor.constraint(equalTo: ).isActive = true
//            ORLabel.constraintToSafeArea()
//            ORLabel.centerX()
//
//            ORLabel.top(constant: 5*multipiller)
//            ORLabel.leading(constant: 50*multipiller)
           // ORLabel.centerXToView(view: cell.contentView)
              //ORLabel.centerX()
            //ORLabel.trailing(constant: 50*multipiller)
            
        //ORLabel.centerY()
        
            //ORLabel.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
           
//            ORLabel.fixWidth(constant: 20*multipiller)
//            ORLabel.fixWidth(constant: 25*multipiller)
            
            let divider1 = UIView(frame: CGRect.zero)
            divider1.backgroundColor = .gray
            divider1.layer.opacity = 0.7
            cell.contentView.addSubview(divider1)
            divider1.top(constant: 10*multipiller)
            divider1.leftTo(view: ORLabel, constant: 5)
                //divider1.rightTo(view: ORLabel, constant: 0)
            divider1.fixWidth(constant: 65*multipiller)
            divider1.fixHeight(constant: 1)
            
            let divider2 = UIView(frame: CGRect.zero)
            divider2.backgroundColor = .gray
            divider2.layer.opacity = 0.7
            cell.contentView.addSubview(divider2)
            divider2.top(constant: 10*multipiller)
            //divider1.leftTo(view: ORLabel, constant: 5)
            divider2.rightTo(view: ORLabel, constant: 5)
            divider2.fixWidth(constant: 65*multipiller)
            divider2.fixHeight(constant: 1)
            
            let googleBtn = UIButton(frame: CGRect.zero)
            googleBtn.setImage(UIImage(named: "google-logo"), for: .normal)
            googleBtn.addTarget(self, action: #selector(googleTap), for: .touchUpInside)
            cell.contentView.addSubview(googleBtn)
            googleBtn.translatesAutoresizingMaskIntoConstraints = false
            googleBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            //googleBtn.centerX()
            googleBtn.belowTo(view: ORLabel, constant: 25*multipiller)
                //googleBtn.top(constant: ORLabel.frame.origin.y + ORLabel.frame.height + 60*multipiller)
            googleBtn.fixHeight(constant: 35*multipiller)
            googleBtn.fixWidth(constant: 35*multipiller)
            
            let appleBtn = UIButton(frame: CGRect.zero)
            appleBtn.setImage(UIImage(named: "56-apple-512"), for: .normal)
            appleBtn.addTarget(self, action: #selector(googleTap), for: .touchUpInside)
            cell.contentView.addSubview(appleBtn)
            appleBtn.leftTo(view: googleBtn, constant: 10*multipiller)
            appleBtn.belowTo(view: ORLabel, constant: 25*multipiller)
            //fbButton.top(constant: googleBtn.frame.origin.y)
            appleBtn.fixHeight(constant: 35*multipiller)
            appleBtn.fixWidth(constant: 35*multipiller)
            
            let fbBtn = UIButton(frame: CGRect.zero)
            fbBtn.setImage(UIImage(named: "fblogo"), for: .normal)
            fbBtn.addTarget(self, action: #selector(googleTap), for: .touchUpInside)
            cell.contentView.addSubview(fbBtn)
            fbBtn.rightTo(view: googleBtn, constant: 10*multipiller)
            fbBtn.belowTo(view: ORLabel, constant: 25*multipiller)
            //fbButton.top(constant: googleBtn.frame.origin.y)
            fbBtn.fixHeight(constant: 35*multipiller)
            fbBtn.fixWidth(constant: 35*multipiller)
            
            
            
            
        }
    return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        
        case 3:
            return 105*multipiller
        case 2:
            return 85*multipiller
        default:
            return 80*multipiller
        }
        }
}

