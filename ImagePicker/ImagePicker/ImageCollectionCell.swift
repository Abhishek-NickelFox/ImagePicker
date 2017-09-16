//
//  ImageCollectionCell.swift
//  ImagePicker
//
//  Created by Abhishek on 16/09/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

struct CellModel {
	var image: UIImage
}

class ImageCollectionCell: UICollectionViewCell {
	
	@IBOutlet weak var imgView: UIImageView!
	
	var item: CellModel? {
		didSet {
			self.configure(item)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	func configure(_ item: CellModel?) {
		if let model = item {
			self.imgView.image = model.image
		}
	}
	
}
