//
//  ComicsTableViewCell.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/7/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ComicsTableViewCell: UITableViewCell {

    //MARK : IBOutlets
    @IBOutlet var MainCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        registerNibFiles()
    }

//////////////////////////////////////////////////////////////////////////////////
    //MARK :_ Methods
    //this function to set the layouts of MarvelCharacters ViewController
      private func setLayout(){
          MainCollectionViewCell.delegate = self
          MainCollectionViewCell.dataSource = self
      }
     //This Funvtion to register cell in tableview
        private func registerNibFiles(){
         MainCollectionViewCell.RegisterNib(Cell: ComicsCollectionViewCell.self)
        }
    
        func reloadData() {
           MainCollectionViewCell.reloadData()
       }
}
/////////////////////////////////////////////////////////////////////////////////////
extension ComicsTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(IndexPath: indexPath) as ComicsCollectionViewCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_WIDTH / 3.5 , height: SCREEN_HEIGHT / 5)
    }
}
