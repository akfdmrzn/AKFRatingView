//
//  AKFRateView.swift
//  BaseProject
//
//  Created by Akif Demirezen on 21.06.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit

class AKFRatingViewCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    
    @IBOutlet weak var imageViewRate: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    func setInfo(isSelected : Bool,rate : Int){
        if isSelected {
            if(rate < 2){
                self.imageViewRate.image = UIImage.init(named: "Ellipse_Red")
            }else if(rate < 3){
                self.imageViewRate.image = UIImage.init(named: "Ellipse_Orange")
            } else if(rate < 4){
                self.imageViewRate.image = UIImage.init(named: "Ellipse_Yellow")
            } else if(rate < 5){
                self.imageViewRate.image = UIImage.init(named: "Ellipse_YGreen")
            }
            else{
                self.imageViewRate.image = UIImage.init(named: "Ellipse")
            }
        }
        else{
            self.imageViewRate.image = UIImage(named: "emptycircle")
        }
    }
}
