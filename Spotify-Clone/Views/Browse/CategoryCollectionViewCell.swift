//
//  GenreCollectionViewCell.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 12.05.2023.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "categoryCollectionViewCell"
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "music.quarternote.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .regular))
        
        return imageView
    }()
    
    
    
    private let label: UILabel = {
        
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let colors: [UIColor] = [
            .systemPink,
            .systemBlue,
            .systemPurple,
            .systemOrange,
            .systemGreen,
            .systemRed,
            .systemYellow,
            .systemGray,
            .systemTeal
    ]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        imageView.layer.masksToBounds = true
        
//        imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)

        
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        
        contentView.bringSubviewToFront(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        imageView.image = UIImage(systemName: "music.quarternote.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .regular))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: 10, y: contentView.height/1.6, width: contentView.width-20, height: contentView.height/2)
        
        imageView.frame = contentView.bounds
        
    }
    
    func configure(with viewModel: CategoryCollectionViewCellViewModel) {
        contentView.backgroundColor = colors.randomElement()
        
        
        imageView.sd_setImage(with: viewModel.artworkURL)
        label.text = viewModel.title
        
    }
    
    
    
}
