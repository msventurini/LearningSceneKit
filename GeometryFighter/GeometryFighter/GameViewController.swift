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
        case .box:
          geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        case .sphere:
          geometry = SCNSphere(radius: 0.5)
        case .pyramid:
          geometry = SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
        case .torus:
          geometry = SCNTorus(ringRadius: 0.5, pipeRadius: 0.25)
        case .capsule:
          geometry = SCNCapsule(capRadius: 0.3, height: 2.5)
        case .cylinder:
          geometry = SCNCylinder(radius: 0.3, height: 2.5)
        case .cone:
          geometry = SCNCone(topRadius: 0.25, bottomRadius: 0.5, height: 1.0)
        case .tube:
          geometry = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 1.0)
        }
        
        let geometryNode = SCNNode(geometry: geometry)
        // quando passamos "nil" como shape, o scenekit define automaticamente o physics body
        // a partir do formato do nodo
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        let randomX = Float.random(min: -2, max: 2)
        let randomY = Float.random(min: 10, max: 18)
        
        let force = SCNVector3(x: randomX, y: randomY, z: 0)
        
        let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)
        
        geometryNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
        
        scnScene.rootNode.addChildNode(geometryNode)
        
    }
    
}
