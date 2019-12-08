//
//  CharactersDetailsTableViewCell.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import Foundation

class CharactersDetailsTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterDiscription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK :- Methods
    func configureCell(with character: Character){
           characterName.text = character.name
           characterDiscription.text = character.description
           if let url = URL(string: character.thumbnail.getUrl()){
               characterImage.kf.indicatorType = .activity
               characterImage.kf.setImage(with: url)
           } else {
               characterImage.image = UIImage(named: "no_avatar")
           }
       }
    
}
