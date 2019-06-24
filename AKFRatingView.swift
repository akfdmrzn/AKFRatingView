//
//  AKFRatingView.swift
//  AKFRatingView
//
//  Created by Akif Demirezen on 24.06.2019.
//
//  AKFRateView.swift
//  BaseProject
//
//  Created by Akif Demirezen on 21.06.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import UIKit



protocol AKFRateViewDelegate {
    func didChangedRateView(sender : AKFRatingView)
}
@IBDesignable
class AKFRatingView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var contentView: UIView!
    
    @IBInspectable var image: UIImage = UIImage.init(named: "emptycircle")!
    @IBInspectable var numberOfCell : Int = 5
    @IBInspectable var currentValue : Int = 0
    
    var delegate : AKFRateViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupThisView()
        self.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupThisView()
    }
    
    private func setupThisView(){
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
        self.collectionView!.register(AKFRatingViewCollectionViewCell.nib, forCellWithReuseIdentifier: AKFRatingViewCollectionViewCell.identifier)
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView!.reloadData()
    }
    
    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: AKFRatingView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self,options: nil).first as? UIView
    }
}
extension AKFRatingView : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AKFRatingViewCollectionViewCell.identifier, for: indexPath)
            as! AKFRatingViewCollectionViewCell
        if self.currentValue == 0 {
            cell.setInfo(isSelected: false, rate: self.currentValue)
        }
        else{
            if indexPath.row == 0 {
                let isSelected = self.currentValue >= indexPath.row ? true : false
                cell.setInfo(isSelected: isSelected, rate: self.currentValue)
            }
            else{
                let isSelected = self.currentValue > indexPath.row ? true : false
                cell.setInfo(isSelected: isSelected, rate: self.currentValue)
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 28.0, height: 28.0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentValue = indexPath.row + 1
        self.collectionView.reloadData()
        self.delegate?.didChangedRateView(sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
extension AKFRatingView : AKFRateViewDelegate{
    func didChangedRateView(sender : AKFRatingView) {
        
    }
}
