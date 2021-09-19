//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Alejandra Rodríguez Abella on 4/9/21.
//

import Foundation
import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addMemeButton: UIBarButtonItem!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableViewCell") as! SentMemesTableViewCell
        let meme = memes[indexPath.row]
        cell.memeLabel.text = "\(meme.topText)...\(meme.bottomText)"
        cell.memeImageView.image = meme.memedImage
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let memeDetailVC = storyboard.instantiateViewController(identifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetailVC.hidesBottomBarWhenPushed = true
        let selectedMeme = memes[indexPath.row]
        memeDetailVC.meme = selectedMeme
        navigationController?.pushViewController(memeDetailVC, animated: true)
    }
    
    @IBAction func createMeme(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let createMemeVC = storyboard.instantiateViewController(identifier: "CreateMemeViewController")
        createMemeVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(createMemeVC, animated: true)
    }
}

