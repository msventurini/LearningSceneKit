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
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
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
    
    func setupCamera() {
        //Criamos um SCNNode vazio e instanciamos este no cameraNode
        cameraNode = SCNNode()
        
        //no cameraNode, instanciamos a camera
        cameraNode.camera = SCNCamera()
        
        //definimos a posicao da camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        
        //adicionamos ela ao nodo raiz da cena
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    
}
