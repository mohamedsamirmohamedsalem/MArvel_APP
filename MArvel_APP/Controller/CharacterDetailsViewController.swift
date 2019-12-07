//
//  CharacterDetailsViewController.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet var MainTableView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.MainTableView.reloadData()
        self.MainTableView.beginUpdates()
        self.MainTableView.endUpdates()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    //MARK:- IBActions
    ///////////////////////////////////////////////////////////////////////////////
    //MARK: Methods
    
    //this function to set the layouts of MarvelCharacters ViewController
    private func setLayout(){
        // MainTableView.backgroundView = UIImageView(image: UIImage(named: "bluringImage.png"))
        MainTableView.rowHeight = UITableView.automaticDimension
        MainTableView.backgroundColor = UIColor.clear
        registerNibFiles()
    }
    //This Funvtion to register cell in tableview
    private func registerNibFiles(){
        MainTableView.RegisterNib(Cell: CharactersDetailsTableViewCell.self)
        MainTableView.RegisterNib(Cell: ComicsTableViewCell.self)
        MainTableView.RegisterNib(Cell: RelatedLinksTableViewCell.self)
        MainTableView.reloadData()
        
    }
    
}


extension CharacterDetailsViewController : UITableViewDelegate , UITableViewDataSource{
    
    //return number of sections in tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    //Return number of charcters from the API (Data Source Method)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // set hight for header (before table view first cell)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    // set view of header (before table view first cell) to be clear
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v: UIView = UIView.init()
        v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return v
    }
    
    // deque cell according to number of charcters with differnet images in each time dequing a cell  (Data Source Method)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeue(IndexPath: indexPath) as CharactersDetailsTableViewCell
            return cell
        }else if indexPath.section == 5 {
            let cell = tableView.dequeue(IndexPath: indexPath) as RelatedLinksTableViewCell
            return cell
        }else{
            let cell = tableView.dequeue(IndexPath: indexPath) as ComicsTableViewCell
            
            cell.reloadData()
            return cell
        }
        //this for change backgroundColor of cell when select it
       
    }
    
    //define hight for cell  (Delgate Method)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 { //first section (0)
            return SCREEN_HEIGHT / 1.5
        }else if indexPath.section == 5 {//last section(5)
            return SCREEN_HEIGHT / 6
        }else{ //all section from 1 to 4
            return SCREEN_HEIGHT / 3.8
        }
        
    }
    
    //this function set action for taping in cell (Delgate Method)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

