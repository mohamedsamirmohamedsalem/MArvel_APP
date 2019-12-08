//
//  MarvelCharactersVC.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import  UIKit


extension MarvelCharactersViewController: UISearchBarDelegate{
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resignFirstResponder()
        activityIndicator.startAnimating()
        if let search = searchBar.text{
            characters = []
            nameSearch = search
            loadData()
        }
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text!.isEmpty{
            cleanLoadDada()
        } else {
            loadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if characters.count == 0 {
            cleanLoadDada()
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        activityIndicator.startAnimating()
              if let search = searchBar.text{
                  characters = []
                  nameSearch = search
                  loadData()
              }
    }
}
