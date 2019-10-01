//
//  DetalheFilmeViewController.swift
//  meusFilmes
//
//  Created by Marcus Titton on 04/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import UIKit

class DetalheFilmeViewController: UIViewController {
    
    var filme: Filme!
    
    @IBOutlet weak var filmeImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmeImageView.image = filme.imagem
        tituloLabel.text = filme.titulo
        descricaoLabel.text = filme.descricao
        
    }
    
}
