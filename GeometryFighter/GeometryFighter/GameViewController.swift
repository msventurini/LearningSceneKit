//
//  GameViewController.swift
//  GeometryFighter
//
//  Created by Matheus Silveira Venturini on 27/05/23.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var scnView: SCNView!
    var scnScene: SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func setupView() {
        // fazemos um cast da self.view para a scnview aqui
        // para não precisarmos fazer isso toda hora
        scnView = self.view as! SCNView
    }
    
    func setupScene() {
        // criamos uma instância em branco da SCNScene
        // e definimos ela como a cena a ser exibida
        // pela view
        scnScene = SCNScene()
        scnView.scene = scnScene
        // posteriormente iremos colocar componentes como
        // câmera, geometrias, luzes e partículas como filhos
        // dessa scene!
        
        scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.jpg"
        
    }
    
}
