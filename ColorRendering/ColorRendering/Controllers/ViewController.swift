//
//  ViewController.swift
//  ColorRendering
//
//  Created by Владимир Данилович on 5.02.22.
//

import UIKit

final class ViewController: UIViewController, FirstViewControllerDelegate {
   
    @IBOutlet var mainView: UIView!
    @IBOutlet private weak var button: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ChangeColorVC else { return }
        destination.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    func update(UIcolor: UIColor, alpha: Float) {
        mainView.backgroundColor = UIcolor
        mainView.alpha = CGFloat(alpha)
    }
    private func setupUI() {
        button.layer.cornerRadius = 20
    }
}

protocol FirstViewControllerDelegate: AnyObject {
    func update(UIcolor: UIColor, alpha: Float)
}

