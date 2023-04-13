//
//  SubCell.swift
//  SuperCash
//
//  Created by Camila Aichele on 3/22/23.
//

import UIKit

class SubCell: UITableViewCell {

    @IBOutlet weak var completedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with sub: Sub) {
        titleLabel.text = sub.title
        titleLabel.textColor = sub.isSubscribed ? .secondaryLabel : .label
        completedImageView.image = UIImage(systemName: sub.isSubscribed ? "circle.inset.filled" : "circle")?.withRenderingMode(.alwaysTemplate)
        completedImageView.tintColor = sub.isSubscribed ? .systemBlue : .tertiaryLabel
    }

}
