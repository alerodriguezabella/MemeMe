//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Alejandra Rodríguez Abella on 4/9/21.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet var memeImageView: UIImageView!
    var meme: Meme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImageView.image = meme?.memedImage
    }
    
}
