//
//  DetailViewController.swift
//  MyApi
//
//  Created by ddyack on 22.09.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    var image: UIImage?
    var text: String?

    @IBOutlet weak var detailPhoto: UIImageView!
    @IBOutlet weak var detailAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailPhoto.image = image
        detailAbout.text = text
    }
    
}
