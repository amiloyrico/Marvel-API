//
//  CharacterTableController.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 9/11/22.
//

import UIKit

class CharacterTableController: UITableViewController {
    
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        
        let services = MarvelService()
        services.getCharacters { result in
            
            switch result {
            case .success(let character):
                DispatchQueue.main.async {
                    self.character = character
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if character == nil {
            return 0
        }
        return character.data.limit
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)as! CharacterCell
        
        cell.IconImage.loadUrl(url: character.data.results[indexPath.row].thumbnail.imageString)
        cell.IconImage.layer.cornerRadius = 30
        
        cell.titleLabel.text = character.data.results[indexPath.row].name
        cell.descriptionLabel.text = character.data.results[indexPath.row].description
        // Configure the cell...

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
