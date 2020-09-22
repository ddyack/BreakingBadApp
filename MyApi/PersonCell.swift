//
//  PersonCell.swift
//  MyApi
//
//  Created by ddyack on 21.09.2020.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var about: String?
    
    func configure(with character: PersonData) {
        name.text = character.name
        about = character.description
        
        guard let imageURL = URL(string: character.img) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        
        DispatchQueue.main.async {
            self.photo.image = UIImage(data: imageData)
        }
    }
}
