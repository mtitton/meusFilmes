//
//  Login.swift
//  meusFilmes
//
//  Created by Marcus Titton on 05/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class Login: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    @IBAction func Entrar(_ sender: Any) {
        
        //Recuperar os dados digitados
        if let emailR = self.email.text {
            if let senhaR = self.senha.text {
                
                //Autentica o usuario no firebase
                let autenticacao = Auth.auth()
                autenticacao.signIn(withEmail: emailR, password: senhaR) { (usuario, erro) in
                    //Verifica se não deu nenhum erro
                    if erro == nil {
                        //Verifica se o usuario foi encontrado
                        if usuario == nil {
                            self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Usuario não encontrado")
                        }
                        else
                        {
                            //Redireciona o usuario para a tela principal (pós login)
                            self.performSegue(withIdentifier: "segueLogin", sender: nil)
                        }
                    }
                    else{
                        self.exibirMensagem(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar a autenticação")
                    }
                }
                
            }
        }
    }
    
    // Para exibir alertas na tela
    func exibirMensagem(titulo: String, mensagem: String)
    {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(cancelar)
        
        present(alerta, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
