//
//  GenericTextFieldCell.swift
//  Menu2
//
//  Created by Siyu Liu on 8/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct LateralEdgeInsets {
    var left: CGFloat
    var right: CGFloat
}

protocol GenericTextFieldCellDelegate: class {
    func textDidChange(to newText: String, in cell: GenericTextFieldCell)
}

class GenericTextFieldCell: UITableViewCell, UITextFieldDelegate {
    weak var delegate: GenericTextFieldCellDelegate?
    var isTextfieldEditable = false {
        didSet {
            if isTextfieldEditable {
                enableEditing()
            } else {
                disableEditing()
            }
        }
    }
    
    private func disableEditing() {
        titleLabel.frame = normalFrame
        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    private func enableEditing() {
        titleLabel.frame = shrinkedFrame
        titleLabel.textColor = UIColor.themeColour
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
    }
    
    var viewModel: GenericTextFieldCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            textField.text = viewModel.value
            textField.keyboardType = viewModel.keyboardType
            layoutViews()
            
            isTextfieldEditable = viewModel.isEditable
        }
    }
    
    var normalFrame = CGRect.zero
    var shrinkedFrame = CGRect.zero
    
    private func layoutViews() {
        let verticalOffSet: CGFloat = 10
        textField.frame = CGRect(x: 16, y: verticalOffSet, width: contentView.frame.width - 32, height: contentView.frame.height - verticalOffSet)
        line.frame = CGRect(x: 16, y: verticalOffSet + textField.frame.height - 12, width: textField.frame.width, height: 1)
        normalFrame = CGRect(x: 16, y: verticalOffSet, width: 100, height: contentView.frame.height - verticalOffSet)
        shrinkedFrame = CGRect(x: 16, y: 5, width: 100, height: 15)
        // calculate frames for animation
    }
    
    static let preferredCellHeight: CGFloat = 60
    var lateralEdgeInsets = LateralEdgeInsets(left: 16, right: 16)
    
    static let cellId = "textFieldCell"
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        return view
    }()
    
    var line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(textField)
        contentView.addSubview(titleLabel)
        contentView.addSubview(line)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let formatter = NumberFormatter()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.keyboardType == .default {
            return true
        }
        
        if string.count == 0 || (string=="-" && range.location==0) {
            return true // allow backspace and negative sign at the start
        }
        
        return formatter.number(from: "\(textField.text!)\(string)") != nil

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            // animate if the textfield is empty
            self.isTextfieldEditable = true
            self.line.backgroundColor = UIColor.themeColour
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            // animate if textfield is empty
            self.line.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            if self.textField.text!.isEmpty {
                self.isTextfieldEditable = false
            }
        }
    }
    
    @objc private func textFieldDidChange() {
        // notify parent view (or model) of text change
        // - in this case the preview is updated
        guard let delegate = delegate else { return }
        delegate.textDidChange(to: textField.text ?? "", in: self)
    }


}
