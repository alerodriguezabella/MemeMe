//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Alejandra Rodríguez Abella on 4/9/21.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        flowLayout.estimatedItemSize = .zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemesCollectionViewCell
        let meme = memes[indexPath.row]
        cell.memeImageView.image = meme.memedImage
        return cell
    }
    
    //MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
    

