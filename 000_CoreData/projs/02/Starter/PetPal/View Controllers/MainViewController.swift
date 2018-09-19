

import UIKit

class MainViewController: UIViewController {
	@IBOutlet private weak var collectionView:UICollectionView!
	
	private var friends = [Friend]()
	private var filtered = [Friend]()
	private var isFiltered = false
	private var friendPets = [String:[String]]()
    
    
	private var selected:IndexPath!
	private var picker = UIImagePickerController()
	
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //  get a reference to our context 数据存储上下文
    
    
    
    

	override func viewDidLoad() {
		super.viewDidLoad()
		picker.delegate = self
	}
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        do{
            friends = try context.fetch(Friend.fetchRequest())
            // 上下文取数据，
            // this takes a fetch request.
            
            
            
            //  Friend.fetchRequest()
            //  this is going to return a preconfigured fetch request for us
            //  返回一个 预先配置好的 获取数据 请求
        }
        catch{
            fatalError("Could not fetch \(error.localizedDescription)")
        }   //  catch
        
        
        
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
				let friend = friends[index.row]
				if let pets = friendPets[friend.name!] {
					pvc.pets = pets
				}
				pvc.petAdded = {
					self.friendPets[friend.name!] = pvc.pets
				}
			}
		}
	}
    
    
    

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
		friends.append(friend)
		let index = IndexPath(row:friends.count - 1, section:0)
		collectionView?.insertItems(at: [index])
	}
	
    
    
    
	// MARK:- Private Methods
	private func showEditButton() {
		if friends.count > 0 {
			navigationItem.leftBarButtonItem = editButtonItem
		}
	}
}




// Collection View Delegates
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let count = isFiltered ? filtered.count : friends.count
		return count
	}
	
    
    
    
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendCell
		let friend = isFiltered ? filtered[indexPath.row] : friends[indexPath.row]
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
		guard let query = searchBar.text else {
			return
		}
		isFiltered = true
        filtered = friends.filter({(friend: Friend) -> Bool in
            return friend.name!.contains(query)
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
extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let image = info[UIImagePickerControllerOriginalImage] as! UIImage
		let friend = isFiltered ? filtered[selected.row] : friends[selected.row]
		
        
        friend.photo = UIImagePNGRepresentation(image) as NSData?
        appDelegate.saveContext()
        
        
		collectionView?.reloadItems(at: [selected])
		picker.dismiss(animated: true, completion: nil)
	}
}


