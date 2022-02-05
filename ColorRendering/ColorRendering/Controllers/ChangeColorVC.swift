//
//  ChangeColorVC.swift
//  ColorRendering
//
//  Created by Владимир Данилович on 5.02.22.
//

import UIKit

final class ChangeColorVC: UIViewController {

    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var redTF: UITextField!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var greenTF: UITextField!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var blueTF: UITextField!
    @IBOutlet private weak var opacitySlider: UISlider!
    @IBOutlet private weak var opacityTF: UITextField!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var button: UIButton!

    weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction private func changeRedSlider() {
        let shortValue = round(Double(redSlider.value) * 1) / 1
        redTF.text = String(shortValue)
        if shortValue < 50.0 {
            colorView.backgroundColor = redSlider.maximumTrackTintColor
        } else { colorView.backgroundColor = redSlider.minimumTrackTintColor }
    }

    @IBAction private func changeRedTF() {
        redSlider.value = Float(redTF.text ?? "") ?? 0.0
        if redSlider.value < 50 {
            colorView.backgroundColor = redSlider.maximumTrackTintColor
        } else { colorView.backgroundColor = redSlider.minimumTrackTintColor }
    }

    @IBAction private func changeGreenSlider() {
        let shortValue = round(Double(greenSlider.value) * 1) / 1
        greenTF.text = String(shortValue)
        if shortValue < 50.0 {
            colorView.backgroundColor = greenSlider.maximumTrackTintColor
        } else { colorView.backgroundColor = greenSlider.minimumTrackTintColor }
    }

    @IBAction private func changeGreenTF() {
        greenSlider.value = Float(greenTF.text ?? "") ?? 0.0
        if greenSlider.value < 50 {
            colorView.backgroundColor = greenSlider.maximumTrackTintColor
        } else { colorView.backgroundColor = greenSlider.minimumTrackTintColor }
    }

    @IBAction private func changeBlueSlider() {
        let shortValue = round(Double(blueSlider.value) * 1) / 1
        blueTF.text = String(shortValue)
        if shortValue < 50.0 {
            colorView.backgroundColor = blueSlider.maximumTrackTintColor
        } else { colorView.backgroundColor = blueSlider.minimumTrackTintColor }
    }

    @IBAction private func changeBlueTF() {
        blueSlider.value = Float(blueTF.text ?? "") ?? 0.0
        if blueSlider.value < 50 {
            colorView.backgroundColor = blueSlider.maximumTrackTintColor
        } else { colorView.backgroundColor = blueSlider.minimumTrackTintColor }
    }

    @IBAction private func changeOpacitySlider() {
        let shortValue = round(Double(opacitySlider.value) * 10) / 10
        opacityTF.text = String(shortValue)
        colorView.alpha = shortValue
    }

    @IBAction private func changeOpacityTF() {
        opacitySlider.value = Float(opacityTF.text ?? "") ?? 0.0
    }

    @IBAction private func goMain(_ sender: Any) {
        delegate?.update(UIcolor: colorView.backgroundColor ?? .red, alpha: opacitySlider.value)
        navigationController?.popToRootViewController(animated: true)
    }

    private func setupUI() {
        redSlider.value = 0
        redSlider.minimumValue = 1
        redSlider.maximumValue = 100

        greenSlider.value = 0
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 100

        blueSlider.value = 0
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 100

        opacitySlider.value = 0
        opacitySlider.minimumValue = 0
        opacitySlider.maximumValue = 1

        button.layer.cornerRadius = 20

        colorView.alpha = 1
    }
}

