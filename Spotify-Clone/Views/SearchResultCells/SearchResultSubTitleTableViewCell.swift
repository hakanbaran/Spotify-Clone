//
//  SearchResultSubTitleTableViewCell.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 22.05.2023.
//

import UIKit
import SDWebImage


class SearchResultSubtitleTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultSubtitleTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    private let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height-10
        iconImageView.frame = CGRect(x: 10, y: 5, width: imageSize, height: imageSize)
        let labelHeight: CGFloat = contentView.height/2
        label.frame = CGRect(x: iconImageView.right+10, y: 0, width: contentView.width-iconImageView.right-15, height: labelHeight)
        subtitleLabel.frame = CGRect(x: iconImageView.right+10, y: label.bottom, width: contentView.width-iconImageView.right-15, height: labelHeight)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        subtitleLabel.text = nil
    }
    
    func configure(with viewModel: SearchResultSubtitleTableViewCellViewModel) {
        label.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        iconImageView.sd_setImage(with: viewModel.imageURL)
    }

}
