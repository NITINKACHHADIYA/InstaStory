//
//  StoryCell.swift
//  InstaStory
//
//  Created by Nitin Kachhadiya on 30/05/21.
//

import UIKit

class StoryCell: UICollectionViewCell {

    @IBOutlet private weak var storyButton:StoryButton!
    @IBOutlet private weak var imageView:UIImageView!
    @IBOutlet private weak var nameLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView.clipsToBounds = true
        self.imageView.layer.cornerRadius = self.imageView.frame.width/2
    }

    public func setupCell(model: Story) {
        
        self.imageView.image = UIImage(named: model.image)
        self.storyButton.isAnimated = model.animated
        if model.statusViewed {
            self.storyButton.borderColors = [UIColor.lightGray, UIColor.lightGray];
        } else {
            self.storyButton.borderColors = [UIColor.blue, UIColor.green];
        }
        self.storyButton.layoutSubviews()
        self.nameLabel.text = model.name
    }
}
