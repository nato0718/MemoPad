//
//  ViewController.swift
//  MemoPad
//
//  Created by Toshihiko Nakanishi on 2021/02/07.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {
    
    var skView: SKView?
    override func viewDidLoad() {
        super.viewDidLoad()
        createSKView() // SKView作成
        setupParticle() // Sceneを追加
    }
    
    func createSKView() {
        self.skView = SKView(frame: self.view.frame)
        self.skView!.allowsTransparency = true
    }
    
    func setupParticle() {
        let scene = SKScene(size: self.view.frame.size)
        //scene.backgroundColor = UIColor.clear
        let path = Bundle.main.path(forResource: "MyParticle", ofType: "sks")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let particle = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! SKEmitterNode
        particle.name = "MyParticle"
        particle.position = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        scene.addChild(particle)
        self.skView!.presentScene(scene)
        self.view.addSubview(self.skView!)
        }
}
