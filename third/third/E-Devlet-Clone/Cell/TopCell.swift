//
//  TopCell.swift
//  third
//
//  Created by Melih Bugra Esmek on 20.09.2021.
//

import UIKit

class TopCell: UICollectionViewCell,EDevletCellProtocol {
    
    static var reuseIdentifier: String = "TopCell"
    
    let containerView = UIView()
    let imageView = UIImageView()
    let title = UILabel()
    let separator = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.backgroundColor = .red
        containerView.layer.cornerRadius = 50
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .green
        
        title.font = UIFont.preferredFont(forTextStyle: .headline)
        title.textColor = .label
        
        let stackView = UIStackView(arrangedSubviews: [separator,imageView,title])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment  = .leading
        stackView.spacing = 10
        contentView.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor)
            
        ])
        stackView.setCustomSpacing(10, after: separator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with edevlet: EDevlet?) {
        title.text = edevlet?.name ?? "-"
        imageView.image = UIImage(named: edevlet?.image ?? "")
        
    }
    
    
}
