//
//  DetailViewController.swift
//  Meme
//
//  Created by osama on 4/28/20.
//  Copyright © 2020 Udacity. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageView.image = meme.finalImage
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editPressed))
        self.navigationItem.setRightBarButton(editButton, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    //Fixxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @objec
    
    @objc func editPressed() {
        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        ViewController.editMeme = meme
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
}
