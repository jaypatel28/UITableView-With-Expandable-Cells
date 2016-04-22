//
//  ButtonTableViewCell.swift
//  ExpandableCell
//
//  Created by Jay Patel on 4/22/16.
//  Copyright © 2016 MEAMobile. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    var isObserving = false;
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var buttonView: UIView!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    let expandedHeight: CGFloat = 200
    let defaultHeight:  CGFloat = 44
    
    func checkHeight() {
        buttonView.hidden = (frame.size.height < expandedHeight)
    }
    
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: .New, context: nil)
            isObserving = true
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false
        }
        
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
