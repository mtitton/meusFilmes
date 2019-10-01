//
//  ViewController.swift
//  meusFilmes
//
//  Created by Marcus Titton on 04/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes: [Filme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mostre a Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.hidesBackButton = true
        
        var filme: Filme
        
        filme = Filme(titulo: "Filme 1", descricao: "Descrição 1", imagem: #imageLiteral(resourceName: "filme1.png"))
        filmes.append(filme)
        
        filme = Filme(titulo: "Filme 2", descricao: "Descrição 2", imagem: #imageLiteral(resourceName: "filme2.png"))
        filmes.append(filme)
    }
    
    // Define a quantidade de sessões da nossa tabela
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Retorna o numero de linhas da sessão
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    // Loop para preencher as células do TableView
    // Função que configura a celula, onde deve-se atribuir as variaveis
    // Para cada linha atribui-se o valor dos dados do class Filme
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var filme: Filme = filmes[indexPath.row] // Define a posição da linha/celula
        
        // preenche os valores dos campos da celula
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        celula.filmeImageView.image = filme.imagem
        celula.tituloLabel.text = filme.titulo
        celula.descricaoLabel.text = filme.descricao
        
        celula.filmeImageView.layer.cornerRadius = 42 // Para um circulo exato, deve-se aplicar a metade do tamanho definido na imagem
        
        return celula
        
    }
    
    
    // Chama a tela do detalhe passando o indexPath selecionado, isto é a linha que foi selecionado na TableView
    // Utilizado para passar dados de um ViewController para outro
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        // verifica se o segue está correto
        if segue.identifier == "detalheFilme"
        {
            
            //pega o indexPath Selecionado
            if let indexPath = tableView.indexPathForSelectedRow {
                
                
                let filmeSelecionado = self.filmes[indexPath.row]
                
                
                //chama a tela do detalhe passando o filmeSelecionado
                let viewControllerDestino = segue.destination as! DetalheFilmeViewController
                viewControllerDestino.filme = filmeSelecionado
            }
        }
        
    }

}

