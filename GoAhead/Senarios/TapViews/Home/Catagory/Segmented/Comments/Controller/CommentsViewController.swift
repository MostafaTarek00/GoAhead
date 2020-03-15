//
//  CommentsViewController.swift
//  GoAhead
//
//  Created by Mustafa on 3/15/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    var commentArray = ["Nice Product" , "Good" , "oooooh Very Good"]
    var commentName = ["Mostafa" , "Ahmed" , "Ali"]
    @IBOutlet weak var writeCommentTf: UITextField!{
        didSet{
            writeCommentTf.delegate = self
        }
    }
    @IBOutlet weak var commentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func SendComment(_ sender: UIButton) {
        if let comment = writeCommentTf.text {
            commentArray.append(comment)
            commentName.append(UserDefault.getName())
            commentTableView.reloadData()
            writeCommentTf.text = ""
        }
    }
    
}



//MARK: - Extension

//MARK:-UITableViewDataSource And UITableViewDelegate

extension CommentsViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  commentArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsSegmentedTableViewCell", for: indexPath) as! CommentsSegmentedTableViewCell
        let cellIndex = indexPath.row
        cell.commentPersonName.text = commentName[cellIndex]
        cell.commentText.text = commentArray[cellIndex]
        return cell
        
    }
    
    
}

