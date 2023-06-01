//
//  TableVC.swift
//  M5ASS6
//
//  Created by MAC on 21/04/23.
//  Make an app to increase height of each cell.

import Foundation
import UIKit


class TableVC: UIViewController {
    
    @IBOutlet weak var tblData: UITableView!
    
    var arrOfDetails = ["Everything you can imagine is real.", "A woman finds a pot of treasure on the road while she is returning from work.Delighted (very happy) with her luck, she decides to keep it. As she is taking it home, it keeps changing.However, her enthusiasm refuses to fade away (disappear or faint slowly).What Is Great About It: The old lady in this story is one of the most cheerful characters anyone can encounter in English fiction.", "Live as if you were to die tomorrow", "This classic fable (story) tells the story of a very slow tortoise (turtle) and a speedy hare (rabbit).The tortoise challenges the hare to a race. The hare laughs at the idea that a tortoise could run faster than he, but the race leads to surprising results.", "Timmie Willie is a country mouse who is accidentally taken to a city in a vegetable basket. When he wakes up, he finds himself at a party and makes a friend.When he is unable to bear (tolerate or experience) the city life, he returns to his home but invites his friend to the village.When his friend visits him, something similar happens.What Is Great About It: Humans have been living without cities or villages for most of history.", "Tomorrow is now.", "It always seems impossible until it's done.", "If you can't do great things, do small things in a great way.", "Learn to live with less so that you appreciate more.", "Ruskin Bond used to spend his summer at his grandmother’s house in Dehradun.While taking the train, he always had to pass through a small station called Deoli. No one used to get down at the station and nothing happened there.Until one day he sees a girl selling fruit and he is unable to forget her.What Is Great About It: Ruskin Bond is a writer who can communicate deep feelings in a simple way."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblData.delegate = self
        self.tblData.dataSource = self
        
    }
    
}

let colorList: [UIColor] = [.red, .green, .link, .yellow, .gray, .cyan, .magenta, .black,  .systemPink, .brown]

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellVC") as! CellVC
        cell.lblDetail.text = arrOfDetails[indexPath.row]
        
        switch indexPath.row {
        case 0: cell.backgroundColor = .red
        case 1: cell.backgroundColor = .gray
        case 2: cell.backgroundColor = .yellow
        case 3: cell.backgroundColor = .cyan
        case 4: cell.backgroundColor = .systemPink
        case 5: cell.backgroundColor = .magenta
        case 6: cell.backgroundColor = .link
        case 7: cell.backgroundColor = .blue
        case 8: cell.backgroundColor = .brown
                
                default:
                    cell.backgroundColor = .green
                }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

    
    
}
