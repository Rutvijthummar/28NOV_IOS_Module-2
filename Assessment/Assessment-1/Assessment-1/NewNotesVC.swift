//
//  NewNotesVC.swift
//  Assessment-1
//
//  Created by MAC on 13/06/23.
//

import Foundation
import UIKit


class NewNotesVC: UIViewController {
    
    @IBOutlet weak var lblNoteTitle: UILabel!
    @IBOutlet weak var tvNotesdes: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNoteTitle.text = noteTitle
        tvNotesdes.text = note
        
    }
    
}
