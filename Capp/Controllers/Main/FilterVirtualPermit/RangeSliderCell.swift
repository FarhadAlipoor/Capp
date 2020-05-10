//
//  RangeSliderCell.swift
//  Capp
//
//  Created by tannaz on 1/29/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import UIKit
protocol SelectedRangeDelegate {
    func selectedRangeIs(_ rangeItem: JRange)
}

class RangeSliderCell: UITableViewCell  , RangeSeekSliderDelegate {

    @IBOutlet weak var vwRangeSlider: RangeSeekSlider!
    @IBOutlet weak var lblMinSlider: UILabel!
    @IBOutlet weak var lblMaxSlider: UILabel!
    var delegate: SelectedRangeDelegate?
    var indexPath: IndexPath?
    func configure(_ sliderData: [Int] , selectedRangeDelegate: SelectedRangeDelegate , selectedIndexPath: IndexPath) {
        vwRangeSlider.maxValue = CGFloat(sliderData.max()!)
        vwRangeSlider.minValue = CGFloat(sliderData.min()!)
        vwRangeSlider.minDistance = vwRangeSlider.minValue
        vwRangeSlider.maxDistance = vwRangeSlider.maxValue
        lblMaxSlider.text = sliderData.max()?.rial()
        lblMinSlider.text = sliderData.min()?.rial()
        vwRangeSlider.selectedMaxValue = vwRangeSlider.maxValue
        vwRangeSlider.selectedMinValue = vwRangeSlider.minValue
        
        delegate = selectedRangeDelegate
        indexPath = selectedIndexPath
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwRangeSlider.delegate  = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func didEndTouches(in slider: RangeSeekSlider) {
        var item = JRange(minValue: slider.selectedMinValue, indexPath: indexPath!, maxValue: slider.selectedMaxValue)
         delegate?.selectedRangeIs(item)
        
    }

}

