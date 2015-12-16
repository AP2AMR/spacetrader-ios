//
//  QuestsVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/15/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class QuestsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.registerClass(QuestStringCell.self, forCellReuseIdentifier: "cell")
        
        self.edgesForExtendedLayout = UIRectEdge.None
    }

    // TABLE VIEW METHODS************************************************************************
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of open quests: \(player.specialEvents.quests.count)")
        return player.specialEvents.quests.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("generating cell for quest #\(indexPath.row)")
        let cell: QuestStringCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as! QuestStringCell
        //cell.test()
        
        cell.setCell("This sentence is a test string. If it displays correctly, the problem has to do with retrieving information from quest string storage.")
        //cell.setCell(player.specialEvents.quests[indexPath.row].questString)
        //cell.textLabel?.text = player.specialEvents.quests[indexPath.row].questString
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row) selected")
    }
    
    

}

class QuestStringCell: UITableViewCell {
    


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textGoesHere: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(text: String) {
        //var v = viewcontroller.view
        
        //textGoesHere.text = text
        
        print("TESTING!")
        if label == nil {
            print("label is nil")
        } else {
            print("label is not nil")
        }
        
        label.text = "this is supposed to display in label"
    }
    
}
