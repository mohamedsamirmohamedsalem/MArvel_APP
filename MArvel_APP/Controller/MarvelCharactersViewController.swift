//
//  ViewController.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/6/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class MarvelCharactersViewController: UIViewController {
    
    //MARK:- Instances
    //RequestCharacter
    let requestCharacter = RequestCharacter()
    var characters: [Character] = []
    ///Flag indicativa de carregamento usada para endlessscroll
    var loadingCharacters = false
    ///Página atual usada para calculo do offset posteriormente
    var currentPage = 0
    ///Total de characters carregados
    var total = 0
    ///Armazena Character selecionado na tableView
    var selectedCharacter: Character? = nil
    ///name do character
    var nameSearch = ""
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    ///////////////////////////////////////////////////////////////////////////////
    //MARK:- IBOutlets
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var MainTableView: UITableView!
    @IBOutlet var searchStackView: UIStackView!
    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    ////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setLayout()
        registerNibFiles()
    }
    ////////////////////////////////////////////////////////////////////////////////////
    //MARK:- IBActions
    
    //Show and hide the searchBar and marvel image
    @IBAction func ShowAndHideSearchBar(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            //Search Button Clicled
            if sender.tag == 0 {
                self.searchStackView.isHidden = false
                self.mainStackView.isHidden = true
                self.MainTableView.backgroundColor = #colorLiteral(red: 0.1515806438, green: 0.1632818436, blue: 0.1808670461, alpha: 1)
                self.searchBar.becomeFirstResponder()
            }else{//  //Cancel Button Clicled
                self.searchStackView.isHidden = true
                self.mainStackView.isHidden = false
            }
            self.view.layoutIfNeeded()
            //hide keyBoard
            self.view.endEditing(true)
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////
    //MARK:- Methods
    //this function to set the layouts of MarvelCharacters ViewController
    private func setLayout(){
        searchBar.delegate = self
        self.searchStackView.isHidden = true
        searchBar.backgroundImage = UIImage()
        if characters.count == 0{
            self.initActivityIndicator()
        }
    }
    //This Funvtion to register cell in tableview
    private func registerNibFiles(){
        MainTableView.RegisterNib(Cell: MarvelCharactersTableViewCell.self)
    }
    
    // present and move to CharacterDetails ViewController
    func goToCharacterDetailsVC(){
        //        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CharacterDetailsViewController") as! CharacterDetailsViewController
        //        present(storyBoard, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CharacterDetailsViewController" {
            if let destinetion = segue.destination as? CharacterDetailsViewController {
                destinetion.characters = characters
            }
        }
    }
    
    func initActivityIndicator(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func loadData(){
        loadingCharacters = true
        requestCharacter.loadCharacters(name: nameSearch, page: currentPage) { (response) in
            switch response {
            case .success(let model):
                self.total = model.data.total
                self.characters.append(contentsOf: model.data.results)
                self.MainTableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.loadingCharacters = false
            case .serverError(let description):
                print("Server error: \(description) \n")
            case .noConnection(let description):
                print("Server error noConnection: \(description) \n")
            case .timeOut(let description):
                print("Server error timeOut: \(description) \n")
            }
        }
    }
    
    func cleanLoadDada(){
        characters = []
        nameSearch = ""
        loadData()
    }
}
