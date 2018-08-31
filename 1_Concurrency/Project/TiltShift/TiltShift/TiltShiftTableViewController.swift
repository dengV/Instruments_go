

import UIKit

class TiltShiftTableViewController: UITableViewController {
  
  let imageList = TiltShiftImage.loadDefaultData()
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return imageList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TiltShiftCell", for: indexPath)
    
    if let cell = cell as? ImageTableViewCell {
      let tsImage = imageList[indexPath.row]
      let imageProvider = TiltShiftImageProvider(tiltShiftImage: tsImage)
      
      cell.tiltShiftImage = imageList[indexPath.row]
      cell.updateImageViewWithImage(imageProvider.image)
    }
  
    return cell
  }
}

