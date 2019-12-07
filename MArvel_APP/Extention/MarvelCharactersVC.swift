//
//  MarvelCharactersVC.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import  UIKit

extension MarvelCharactersViewController : UITableViewDelegate , UITableViewDataSource{
    
    //Return number of charcters from the API (Data Source Method)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    // deque cell according to number of charcters with differnet images in each time dequing a cell  (Data Source Method)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(IndexPath: indexPath) as MarvelCharactersTableViewCell
        cell.configureCell(with: characters[indexPath.row])
        return cell
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        //print("display row: \(indexPath.row)")
        if indexPath.row == (characters.count - 10) && !loadingCharacters && characters.count != total{
            currentPage += 1
            loadData()
        }
    }
    //define hight for cell  (Delgate Method)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_HEIGHT / 4
    }
    
    //this function set action for taping in cell (Delgate Method)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //this for change backgroundColor of cell when select it
        
        goToCharacterDetailsVC()
    }
    
}

