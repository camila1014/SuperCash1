//
//  DetailViewController.swift
//  SuperCash
//
//  Created by Camila Aichele on 3/22/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var completedImageView: UIImageView!
    @IBOutlet private weak var subscribedLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    var sub: Sub!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// Configure UI for the given task
        private func updateUI() {
            titleLabel.text = sub.title
            descriptionLabel.text = sub.description
            
            let completedImage = UIImage(systemName: sub.isSubscribed ? "circle.inset.filled" : "circle")
            
            // calling `withRenderingMode(.alwaysTemplate)` on an image allows for coloring the image via it's `tintColor` property.
            completedImageView.image = completedImage?.withRenderingMode(.alwaysTemplate)
            subscribedLabel.text = sub.isSubscribed ? "Subscribed" : "UnSubscribed"
            
            let color: UIColor = sub.isSubscribed ? .systemBlue : .tertiaryLabel
            completedImageView.tintColor = color
            subscribedLabel.textColor = color
            
        }
        
    }
}
