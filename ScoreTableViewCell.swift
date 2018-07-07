//
//  ScoreTableViewCell.swift
//  
//
//  Created by Irwin Gonzales on 7/5/18.
//

import UIKit
import FoldingCell

class ScoreTableViewCell: FoldingCell {
    
    override func awakeFromNib() {
//        foregroundView.layer.cornerRadius = 10
//        foregroundView.layer.masksToBounds = true
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
        // Initialization code
    }
    
    // Animation Control
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ScoreTableViewCell
{
    @IBAction func buttonHandler(_: AnyObject) {
        print("tap")
    }
}
