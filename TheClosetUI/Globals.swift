//
//  Globals.swift
//  TheClosetUI
//
//  Created by prashant thakare on 27/05/21.
//

//import Foundation
import UIKit

class Globals:UIViewController{
    
    public static let shared = Globals()
    let font = UIFont(name: "Dosis-Regular", size: 15)
    let multipiller = UIScreen.main.bounds.width/320
    
    func makeContainerView (rect : CGRect, bgColor:UIColor) -> UIView
    {
        let view = UIView()
        view.frame=rect
        view.backgroundColor=bgColor
        
        return view
        
    }
    func makeButton(Frame:CGRect, FontName:String, FontSize:CGFloat, TextColor:UIColor, Text:String , BackgroundColor:UIColor,BackgroundImage:String ) -> UIButton {
        
        let button = UIButton(type: .custom)
        
        button.frame=Frame;
        button.titleLabel?.font=UIFont(name:FontName, size:FontSize) //[ fontWithName:fontName size:size];
        button.titleLabel?.textColor=TextColor;
        button.titleLabel?.numberOfLines=0;
        button.layer.cornerRadius = 3
        button.setTitleColor(TextColor, for: UIControl.State.normal);
        button.setTitle(Text, for: UIControl.State.normal)
        button.backgroundColor=BackgroundColor;
        
        
        if (BackgroundImage.count>0) {
            button.setBackgroundImage(UIImage(named: BackgroundImage), for: UIControl.State.normal)
        }
        
        return button;
    }
    func makeTextField(frame:CGRect, placeholder:String , tffont:String, tffontSize:CGFloat, tftextColor:UIColor, lbtext:String  ) -> UITextField {
        
        let textField =  UITextField();
        textField.frame = frame;
        textField.font = UIFont(name: tffont, size: 14)
        textField.textColor = tftextColor
        textField.tintColor = tftextColor
        textField.makeBorder(strokeColor: UIColor.black.cgColor)
        textField.text = lbtext
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.black.cgColor])
        textField.layer.cornerRadius = 14
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor.clear
        textField.borderStyle =  .none
        textField.textAlignment = Globals().isEnglishLang() ? .left : .right
        
        textField.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10*multipiller, height: 25));
        textField.leftViewMode = .always
        textField.rightView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10*multipiller, height: 25));
        textField.rightViewMode = .always;
        
        return textField
    }
    
    
    
    func makeLabel(Frame:CGRect, FontName:String, FontSize:CGFloat, TextColor:UIColor, Text:String) -> UILabel {
        
        let label = UILabel()
        
        label.frame = Frame;
        label.backgroundColor = UIColor.clear;
        label.numberOfLines=0;
        label.font=UIFont(name:FontName, size:FontSize) //[ fontWithName:fontName size:size];
        label.textColor=TextColor;
        //        label.textAlignment = isEnglishLang() ? NSTextAlignment.left : NSTextAlignment.right;
        
        let attributedString = NSMutableAttributedString(string: Text)
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        // *** set LineSpacing property in points **
        paragraphStyle.lineSpacing = 0// Whatever line spacing you want in points //3
        // *** Apply attribute to string ***
        attributedString.addAttribute(kCTParagraphStyleAttributeName as NSAttributedString.Key, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        // *** Set Attributed String to your label ***
        label.attributedText = attributedString;
        // label.text=Text;
        label.textAlignment = isEnglishLang() ? NSTextAlignment.left : NSTextAlignment.right;
        return label;
        
    }
    func isEnglishLang() -> Bool {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.isEnglish!
    }

    func setupNavigation(title:String){
      ///  self.navigationController?.navigationItem
        
        
        
    }
    func GetStringForKey(key:String) -> String {
        
        return NSLocalizedString(key, tableName: isEnglishLang() ? "English": "Arabic", bundle: Bundle.main, value: "", comment: "")
    }
    func getTextHeight(text:String, font:UIFont, constrainedSize: CGSize) -> CGFloat {
        
        var height:CGFloat = 0;
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        
        let rect:CGRect = NSString(string: text).boundingRect(with: constrainedSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font,NSAttributedString.Key.paragraphStyle: paragraphStyle],  context: nil)
        
        //        let rect:CGRect = NSString(string: text).boundingRect(with: constrainedSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font],  context: nil)
        
        height = rect.size.height
        
        
        return height
    }
    
    
    
    
}
extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Dosis-Regular", size: size)
    }
}
extension UINavigationController{
    
    func setBackgroundClear(){
        
        self.navigationBar.barTintColor = UIColor.white
    }
    func setSize(width:CGFloat,height:CGFloat,VC:UIViewController){
        let navBar: UINavigationBar = UINavigationBar()
        self.navigationBar.frame = CGRect(x: 0, y: 0, width:width , height: height)
        self.navigationBar.addSubview(navBar)
    }
}




extension UIView {
    func addConstaintsToPinHorizontalEdgesToSuperView(padding: CGFloat = 0) {
        prepareForConstraints()
        self.superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[view]-(padding)-|",
                                                                      options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                      metrics: ["padding":padding],
                                                                      views: ["view":self]))
    }
    
    func addConstaintsToPinVerticalEdgesToSuperView(padding: CGFloat = 0) {
        prepareForConstraints()
        self.superview!.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(padding)-[view]-(padding)-|",
                                                                      options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                      metrics: ["padding":padding],
                                                                      views: ["view":self]))
    }
    
    func centerY() {
        prepareForConstraints()
        self.superview!.addConstraint(NSLayoutConstraint(item: self,
                                                         attribute: .centerY,
                                                         relatedBy: .equal,
                                                         toItem: self.superview!,
                                                         attribute: .centerY,
                                                         multiplier: 1.0, constant: 0))
    }
    
    func centerX() {
        prepareForConstraints()
        self.superview!.addConstraint(NSLayoutConstraint(item: self,
                                                         attribute: .centerX,
                                                         relatedBy: .equal,
                                                         toItem: self.superview!,
                                                         attribute: .centerX,
                                                         multiplier: 1.0, constant: 0))
    }
    
    func centerYToView(view:UIView) {
        prepareForConstraints()
        self.superview!.addConstraint(NSLayoutConstraint(item: self,
                                                         attribute: .centerY,
                                                         relatedBy: .equal,
                                                         toItem: view,
                                                         attribute: .centerY,
                                                         multiplier: 1.0, constant: 0))
    }
    
    func centerXToView(view:UIView) {
        prepareForConstraints()
        self.superview!.addConstraint(NSLayoutConstraint(item: self,
                                                         attribute: .centerX,
                                                         relatedBy: .equal,
                                                         toItem: view,
                                                         attribute: .centerX,
                                                         multiplier: 1.0, constant: 0))
    }
    
    func heightlessthanEqual(constant: CGFloat) {
        prepareForConstraints()
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: constant)
        self.superview!.addConstraint(heightConstraint)
    }
    
    func widthlessthanEqual(constant: CGFloat) {
        prepareForConstraints()
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: constant)
        self.superview!.addConstraint(heightConstraint)
    }
    
    func heightgreaterthanEqual(constant: CGFloat) {
        prepareForConstraints()
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: constant)
        self.superview!.addConstraint(heightConstraint)
    }
    
    func widthgreaterthanEqual(constant: CGFloat) {
        prepareForConstraints()
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: constant)
        self.superview!.addConstraint(heightConstraint)
    }
    
    func leading(constant: CGFloat)  {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: self.superview!,
                                            attribute: .leading,
                                            multiplier: 1, constant: constant)
        self.superview!.addConstraint(constraint)
    }
    
    func trailing(constant: CGFloat)  {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: self.superview!,
                                            attribute: .trailing,
                                            multiplier: 1, constant: -(constant))
        self.superview!.addConstraint(constraint)
    }
    
    func top(constant: CGFloat) {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: self.superview!,
                                            attribute: .top,
                                            multiplier: 1, constant: constant)
        self.superview!.addConstraint(constraint)
    }
    
    func bottom(constant: CGFloat) {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: self.superview!,
                                            attribute: .bottom,
                                            multiplier: 1, constant: -(constant))
        self.superview!.addConstraint(constraint)
    }
    
    func fixHeight(constant: CGFloat){
        
        prepareForConstraints()
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: constant)
        self.superview!.addConstraint(heightConstraint)
        
    }
    
    func fixWidth(constant: CGFloat)
    {
        prepareForConstraints()
        let widthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: constant)
        self.superview!.addConstraint(widthConstraint)
        
    }
    
    func aboveTo(view:UIView,constant: CGFloat) {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .top,
                                            multiplier: 1, constant: -(constant))
        self.superview!.addConstraint(constraint)
    }
    
    func belowTo(view:UIView,constant: CGFloat) {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .bottom,
                                            multiplier: 1, constant: constant)
        
        self.superview!.addConstraint(constraint)
    }
    
    func rightTo(view:UIView,constant: CGFloat) {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: Globals().isEnglishLang() ? .left:.right,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: Globals().isEnglishLang() ? .right:.left,
                                            multiplier: 1, constant: Globals().isEnglishLang() ? constant:-constant)
        self.superview!.addConstraint(constraint)
    }
    
    func leftTo(view:UIView,constant: CGFloat) {
        prepareForConstraints()
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: Globals().isEnglishLang() ? .right:.left,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: Globals().isEnglishLang() ? .left:.right,
                                            multiplier: 1, constant: Globals().isEnglishLang() ? -constant:constant)
        self.superview!.addConstraint(constraint)
    }
    
    func equalHeightTo(view:UIView)
    {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0.0)
         self.superview!.addConstraint(constraint)
    }
    
    func addConstaintsToFillSuperviewWithPadding(padding: CGFloat = 0) {
        prepareForConstraints()
        addConstaintsToPinHorizontalEdgesToSuperView(padding: padding)
        addConstaintsToPinVerticalEdgesToSuperView(padding: padding)
    }
    
    private func prepareForConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if superview == nil {
            assert(false, "You need to have a superview before you can add contraints")
        }
    }
}

extension  UIView {
    
    func makeBorder(strokeColor:CGColor){
        
        let border = CAShapeLayer()
        border.frame = self.bounds
        border.lineWidth = 0.2
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 14).cgPath
        border.strokeColor = strokeColor
        border.fillColor = UIColor.clear.cgColor

        self.layer.addSublayer(border)
    }
    
    func makeBorderWithoutRadius(strokeColor:CGColor){
        
        let border = CAShapeLayer()
        border.frame = self.bounds
        border.lineWidth = 0.2
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0).cgPath
        border.strokeColor = strokeColor
        border.fillColor = UIColor.clear.cgColor

        self.layer.addSublayer(border)
    }
}
extension UITableView {
    func scrollToBottom(animated:Bool)  {
        let numberOfRows = self.numberOfRows(inSection: self.numberOfSections - 1) - 1
        if numberOfRows >= 0{
            let indexPath = IndexPath(
                row: numberOfRows,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
        } else {
            let point = CGPoint(x: 0, y: self.contentSize.height + self.contentInset.bottom - self.frame.height)
            if point.y >= 0{
                self.setContentOffset(point, animated: animated)
            }
        }
    }
}
extension UIView {

    ///Constraints a view to its superview
    func constraintToSuperView() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
    }

    ///Constraints a view to its superview safe area
    func constraintToSafeArea() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor).isActive = true
    }

}
