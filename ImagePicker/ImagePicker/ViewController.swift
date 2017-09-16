//
//  ViewController.swift
//  ImagePicker
//
//  Created by Abhishek on 16/09/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imgCollectionView: UICollectionView!
	
	var cellItems: [CellModel] = []
	var imagePicker: UIImagePickerController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.imgCollectionView.delegate = self
		self.imgCollectionView.dataSource = self
		
		self.imagePicker = UIImagePickerController()
		self.imagePicker?.sourceType = .photoLibrary
		self.imagePicker?.delegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func openPhotos(_ sender: Any) {
		self.present(self.imagePicker!, animated: true, completion: nil)
	}

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let image = info[UIImagePickerControllerOriginalImage] as! UIImage
		let model = CellModel(image: image)
		self.cellItems.append(model)
		self.imgCollectionView.reloadData()
		picker.dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}
	
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.cellItems.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as! ImageCollectionCell
		cell.item = self.cellItems[indexPath.row]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView,
	                    layout collectionViewLayout: UICollectionViewLayout,
	                    sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let dimension = (self.view.frame.size.width - 40)/3
		return CGSize(width: dimension, height: dimension)
	}

}
