 

import UIKit

class PetsViewController: UIViewController {
	@IBOutlet private weak var collectionView:UICollectionView!
	
	var petAdded:(()->Void)!
	var pets = [String]()

	private var isFiltered = false
	private var filtered = [String]()
	private var selected:IndexPath!
	private var picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
		picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK:- Actions
	@IBAction func addPet() {
		var pet = PetData()
		while pets.contains(pet.name) {
			pet = PetData()
		}
		pets.append(pet.name)
		let index = IndexPath(row:pets.count - 1, section:0)
		collectionView.insertItems(at: [index])
		// Call closure
		petAdded()
	}
}

// Collection View Delegates
extension PetsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let count = isFiltered ? filtered.count : pets.count
		return count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCell", for: indexPath) as! PetCell
		let pet = isFiltered ? filtered[indexPath.row] : pets[indexPath.row]
		cell.nameLabel.text = pet
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		selected = indexPath
//		self.navigationController?.present(picker, animated: true, completion: nil)
	}
}

// Search Bar Delegate
extension PetsViewController:UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let query = searchBar.text else {
			return
		}
		isFiltered = true
		filtered = pets.filter({(txt) -> Bool in
			return txt.contains(query)
		})
		searchBar.resignFirstResponder()
		collectionView.reloadData()
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		isFiltered = false
		filtered.removeAll()
		searchBar.text = nil
		searchBar.resignFirstResponder()
		collectionView.reloadData()
	}
}

// Image Picker Delegates
extension PetsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    _ = info[UIImagePickerControllerOriginalImage] as! UIImage
		collectionView?.reloadItems(at: [selected])
		picker.dismiss(animated: true, completion: nil)
	}
}
