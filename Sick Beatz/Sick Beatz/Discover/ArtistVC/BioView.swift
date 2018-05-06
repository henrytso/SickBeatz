//
//  BioView.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SnapKit

class BioView: UIView {

    var artist: String!
    
    var textField: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont(name: "Helvetica Neue", size: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textField)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(8)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
