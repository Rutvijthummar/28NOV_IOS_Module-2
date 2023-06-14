//
//  CreateNotesVC.swift
//  Assessment-1
//
//  Created by MAC on 13/06/23.
//

import Foundation
import UIKit


class CreateNotesVC: UIViewController {
    
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var tblNotes: UITableView!
    
    
    @IBAction func barBtnAddTapped(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "NotesVC") as? NotesVC else {
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.lblNotes.isHidden = true
            self.tblNotes.isHidden = false
            
            self.tblNotes.reloadData()
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        
        self.tblNotes.delegate = self
        self.tblNotes.dataSource = self
        
        
    }
    
}

extension CreateNotesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "NewNotesVC") as? NewNotesVC else {
            return
        }
        
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}
