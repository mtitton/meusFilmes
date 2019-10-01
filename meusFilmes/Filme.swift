//
//  Filme.swift
//  meusFilmes
//
//  Created by Marcus Titton on 04/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import UIKit

class Filme {
    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    
    
    init(titulo: String, descricao: String, imagem: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
       
    }
}
