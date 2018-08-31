//
//  TableViewController.swift
//  Async_2_TiltShift
//
//  Created by dengjiangzhou on 2018/7/13.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var tiltShiftedImages = [UIImage?]()
    var tiltShiftedImages_second = [UIImage?]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let workerQueue = DispatchQueue(label: "com.deng.worker", attributes: .concurrent)
        let imageNames = ["dark_road_small", "train_day", "train_dusk", "train_night"]
        let images = imageNames.map { UIImage(named: "\($0).jpg") }
        
        for image in images{
            asyncTiltShift(image, runQueue: workerQueue, completionQueue: DispatchQueue.main) { (image) in
                self.tiltShiftedImages.append(image)
            }
        }
        
        for image in images{
            asyncTiltShift(image, runQueue: DispatchQueue.global(), completionQueue: DispatchQueue.main) { (image) in
                self.tiltShiftedImages_second.append(image)
            }
        }
        
    }
    
    func asyncTiltShift(_ inputImage: UIImage? , runQueue: DispatchQueue, completionQueue: DispatchQueue, completion: @escaping (UIImage?) -> ()){
        runQueue.async {
            let outputImage = tiltShift(image: inputImage)
            completionQueue.async {
                completion(outputImage)
                self.tableView.reloadData()
            }
           
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
        // Configure the cell...
        switch indexPath.section{
            case 0:
                print(tiltShiftedImages.count)
                if tiltShiftedImages.count > indexPath.row, let image = tiltShiftedImages[indexPath.row]{
                    cell.imageView?.image = image
                }
            case 1:
                if  tiltShiftedImages_second.count > indexPath.row, let image = tiltShiftedImages_second[indexPath.row]{
                    cell.imageView?.image = image
                }
            
            default:
            
                break
            
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
/*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(ViewController(nibName: <#T##String?#>, bundle: <#T##Bundle?#>), animated: true) {
            
        }
    }
*/

}
