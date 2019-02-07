//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Dani rica on 04/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {


    @IBOutlet weak var houseNameLabel: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    @IBOutlet weak var wordsLabel: UILabel!
    
    
    let model: House
    
    
    init(model: House) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        setupUI()
    }
    
    func syncModelWithView() {
        title = model.name
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words

    }
    
    func setupUI() {
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        
        //Mostrar boton
        
        navigationItem.rightBarButtonItem = wikiButton
    }
    
    @objc func displayWiki(){
        
        //Creamos el controlador
        let wikiViewController = WikiViewController(model: model)
        // Hacemos push
        
     navigationController?.pushViewController(wikiViewController, animated: true)
        
        
    }
}
