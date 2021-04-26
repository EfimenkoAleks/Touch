//
//  ContactTableViewCell.swift
//  TouchIt
//
//  Created by user on 11.04.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    static var reuseId: String = "ContactTableViewCell"
    var delegate: PressButtonPhoneDelegate?
    
    var texttLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = ""
        lb.backgroundColor = .clear
        lb.textColor = .white
        lb.layer.masksToBounds = true
        lb.numberOfLines = 1
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    var stacView: UIStackView = {
        let stackV   = UIStackView()
        stackV.axis  = NSLayoutConstraint.Axis.horizontal
        stackV.distribution  = UIStackView.Distribution.equalSpacing
        stackV.alignment = UIStackView.Alignment.bottom
        stackV.backgroundColor = .clear
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.spacing = 20.0
        return stackV
    }()
    
    lazy var buttonPhone: UIButton = {
        let butt = UIButton()
        butt.setImage(UIImage(systemName: "phone"), for: .normal)
        butt.tintColor = .white
        butt.backgroundColor = .systemBlue
        butt.layer.cornerRadius = 14
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.addTarget(self, action: #selector(ContactTableViewCell.tapButton), for: .touchUpInside)
        return butt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .black
        self.setupConstraints()
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapButton() {
        self.delegate?.pressPhone(phone: texttLabel.text!)
    }
    
    func configure(text: String, icon: UIImage) {
        iconImageView.image = icon
        texttLabel.text = text
        texttLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ContactTableViewCell {
    func setupConstraints() {
        
        contentView.addSubview(stacView)
        stacView.addArrangedSubview(iconImageView)
        stacView.addArrangedSubview(texttLabel)
        stacView.addArrangedSubview(buttonPhone)
        
        NSLayoutConstraint.activate([
        stacView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        iconImageView.heightAnchor.constraint(equalToConstant: 28),
        iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
        iconImageView.centerYAnchor.constraint(equalTo: stacView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonPhone.heightAnchor.constraint(equalToConstant: 40),
            buttonPhone.widthAnchor.constraint(equalTo: buttonPhone.heightAnchor)
        ])
    }
}


