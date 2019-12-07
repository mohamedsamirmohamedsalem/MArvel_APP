//
//  MarvelCharactersTableViewCell.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import Kingfisher

class MarvelCharactersTableViewCell: UITableViewCell {

    //Mark:- IBOutlets
    @IBOutlet var CharactersImage: UIImageView!
    @IBOutlet var CharactersName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with character: Character){
        CharactersName.text = character.name
        if let url = URL(string: character.thumbnail.getUrl()){
            CharactersImage.kf.indicatorType = .activity
            CharactersImage.kf.setImage(with: url)
        } else {
            CharactersImage.image = UIImage(named: "no_avatar")
        }
    }
}
