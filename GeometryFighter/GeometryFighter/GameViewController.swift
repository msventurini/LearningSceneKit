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
        spawnShape()
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
        
        scnView.showsStatistics = true
        
        scnView.allowsCameraControl = true
        
        scnView.autoenablesDefaultLighting = true
        
        
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
    
    func spawnShape() {
        
        var geometry: SCNGeometry
        
        switch ShapeType.random() {
        case .sphere:
            geometry = SCNSphere(radius: 1.0)
        case .pyramid:
            geometry = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
        case .torus:
            geometry = SCNTorus(ringRadius: 5.0, pipeRadius: 1.0)
        case .capsule:
            geometry = SCNCapsule(capRadius: 2.0, height: 3.0)
        case .cylinder:
            geometry = SCNCylinder(radius: 2.0, height: 5.0)
        case .tube:
            geometry = SCNTube(innerRadius: 1.0, outerRadius: 2.0, height: 5.0)
            
        default:
            
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
            
        }
        
        let geometryNode = SCNNode(geometry: geometry)
        
        scnScene.rootNode.addChildNode(geometryNode)
        
    }
    
}
