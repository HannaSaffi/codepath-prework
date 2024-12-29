//
//  ViewController.swift
//  IOS101-Prework
//
//  Created by Hanna Saffi on 12/24/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var colorChangeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check outlets
        guard imageView != nil, textField != nil, colorChangeButton != nil else {
            print("Outlets are not connected properly!")
            return
        }
        
        // Setting up a gradient background
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        // Styling the button
        colorChangeButton.layer.cornerRadius = 10
        colorChangeButton.layer.shadowColor = UIColor.black.cgColor
        colorChangeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        colorChangeButton.layer.shadowOpacity = 0.3
        
        // Set up default image and text field placeholder
        imageView.image = UIImage(systemName: "photo") // Use a placeholder system image
        textField.placeholder = "Type something here!"
    }

    @IBAction func ChangeBackgroundColor(_ sender: UIButton) {
        func randomColor() -> UIColor {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
        
        let randomBackgroundColor = randomColor()
        let randomTextColor = randomColor()
        
        // Animate background and text color changes
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = randomBackgroundColor
            
            for subview in self.view.subviews {
                if let label = subview as? UILabel {
                    label.textColor = randomTextColor
                }
            }
        }
    }
}
