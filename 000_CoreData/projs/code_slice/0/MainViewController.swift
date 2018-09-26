

import UIKit

import CoreData


class MainViewController: UIViewController {
	
    @IBOutlet private weak var collectionView:UICollectionView!
    public var fetchedRequestController: NSFetchedResultsController<Friend>!
	private var friendPets = [String:[String]]()
    
    
	private var selected:IndexPath!
	private var picker = UIImagePickerController()
	
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //  get a reference to our context 数据存储上下文
    
    
    public var query = ""
    

	override func viewDidLoad() {
		super.viewDidLoad()
		picker.delegate = self
	}
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
       
        
        showEditButton()
    }
    
    
    
    
    
    
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    

    
    
    
	// MARK:- Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "petSegue" {
			if let index = sender as? IndexPath {
				let pvc = segue.destination as! PetsViewController
				let friend = fetchedRequestController.object(at: index)
				if let pets = friendPets[friend.name!] {
					pvc.pets = pets
				}
				pvc.petAdded = {
					self.friendPets[friend.name!] = pvc.pets
				}
			}
		}
	}
    
    
    
    //  有一个 bug, 搜索的情况下， 是应该不能添加的。
	// MARK:- Actions
	@IBAction func addFriend() {
        
        let data = FriendData()
        let friend = Friend(entity: Friend.entity(), insertInto: context)
        friend.name = data.name
        friend.address = data.address
        //  this does not save anything yet, 上面的代码
        
        //  we have to manually save it ourselves.
        //  必须手动
        
        
        friend.dob = data.dob
        friend.eyeColor = data.eyeColor
        // Color , 也可以存 r, g, b

        appDelegate.saveContext()
        
        //  直接存对象
        
        //  然后改 UI
        
   
        refresh()
        
		collectionView.reloadData()
	}
	//  when a new friend is added,
    //  they are automatically sorted.
    
    
    // automatically sort our friends as we add them.
    
    
    
    
    
	// MARK:- Private Methods
	private func showEditButton() {
        guard let objects = fetchedRequestController.fetchedObjects else{
            return
        }
		if objects.count > 0 {
			navigationItem.leftBarButtonItem = editButtonItem
		}
	}
}




// Collection View Delegates
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let objects = fetchedRequestController.fetchedObjects else{
            return 0
        }
		let count = objects.count
		return count
	}
	
    
    
    
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
		let friend = fetchedRequestController.object(at: indexPath)
		cell.nameLabel.text = friend.name!
        
        cell.addressLabel.text = friend.address
        
        
        
        cell.ageLabel.text = "Age: \(friend.age)"
        cell.eyeColorView.backgroundColor = friend.eyeColor as? UIColor
        //  做一个 cast,
        //  convert NSObject to UIColor
        
        if let data = friend.photo as Data?{
            cell.pictureImageView.image = UIImage(data: data)
        }
        else{
            cell.pictureImageView.image = UIImage(named: "person-placeholder")
        }
        
        
        
		return cell
	}
	
    
    
    
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if isEditing {
            
            // isEditing, 这个属性好
            
			selected = indexPath
			self.navigationController?.present(picker, animated: true, completion: nil)
		} else {
			performSegue(withIdentifier: "petSegue", sender: indexPath)
		}
	}
}






// Search Bar Delegate
extension MainViewController:UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let queryStr = searchBar.text else {
			return
		}
		query = queryStr
        
        refresh()
        //  request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", queryStr)
            //  NSPredicate(format: "name CONTAINS &@", query)     错， 崩溃
        
        //  NSPredicate(format: "name CONTAINS[cd] %@", query)    大小写不敏感， ignore the case
        //  NSPredicate(format: "name CONTAINS %@", query)  大小写敏感
        
        
        
 
        
		searchBar.resignFirstResponder()
		collectionView.reloadData()
	}   //  searchBarSearchButtonClicked
	
    
    
    
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		query = ""
        refresh()
        
		searchBar.text = nil
		searchBar.resignFirstResponder()
		collectionView.reloadData()
	}   //  searchBarCancelButtonClicked
}








// Image Picker Delegates
extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let image = info[UIImagePickerControllerOriginalImage] as! UIImage
		let friend = friends[selected.row]
		
        
        friend.photo = UIImagePNGRepresentation(image) as NSData?
        appDelegate.saveContext()
        
        
		collectionView?.reloadItems(at: [selected])
		picker.dismiss(animated: true, completion: nil)
	}
}


