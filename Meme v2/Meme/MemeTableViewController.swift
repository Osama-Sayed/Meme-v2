//
//  MemeTableViewController.swift
//  Meme
//
//  Created by osama on 4/28/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = getAppDelegate()
        memes = appDelegate.memes
        toggleNavAndTabBars(on: false)
        self.tableView.reloadData()
    }
    
    func toggleNavAndTabBars(on: Bool) {
        self.tabBarController?.tabBar.isHidden = on
        self.navigationController?.navigationBar.isHidden = on
    }
    
    func getAppDelegate() -> AppDelegate {
        let object = UIApplication.shared.delegate
        return object as! AppDelegate
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell") as! MemeTableViewCell
        cell.memeImageView?.image = memes[indexPath.row].finalImage
        cell.nameLabel?.text = "\(memes[indexPath.row].topText!)...\(memes[indexPath.row].botText!)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailView") as! DetailViewController
        detailVC.meme = self.memes[indexPath.row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            let appDelegate = self.getAppDelegate()
            appDelegate.memes.remove(at: indexPath.row)
            self.memes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        return [deleteAction]
    }
    
    
}
