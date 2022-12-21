//
//  ViewController.swift
//  MLaur
//
//  Created by Леонид Шелудько on 25.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageFoto: UIImageView!
    @IBOutlet weak var imageFoto2: UIImageView!
    @IBOutlet weak var imageFoto3: UIImageView!
    @IBOutlet weak var imageFoto4: UIImageView!
    @IBOutlet weak var imageFoto5: UIImageView!
    
    let line = UIView()
    let line2 = UIView()
    let line3 = UIView()
    let line4 = UIView()
    let line5 = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageFoto.image = UIImage(named: "photoMLaur.jpg")
        imageFoto2.image = UIImage(named: "photoMLaur.jpg")
        imageFoto3.image = UIImage(named: "photoMLaur.jpg")
        imageFoto4.image = UIImage(named: "photoMLaur.jpg")
        imageFoto5.image = UIImage(named: "photoMLaur.jpg")
        
        line.frame = CGRect(x: 50, y: 220, width: 310, height: 1)
        line.backgroundColor = UIColor.lightGray
        view.addSubview(line)
        
        line2.frame = CGRect(x: 50, y: 310, width: 310, height: 1)
        line2.backgroundColor = UIColor.lightGray
        view.addSubview(line2)
        
        line3.frame = CGRect(x: 50, y: 400, width: 310, height: 1)
        line3.backgroundColor = UIColor.lightGray
        view.addSubview(line3)
        
        line4.frame = CGRect(x: 50, y: 490, width: 310, height: 1)
        line4.backgroundColor = UIColor.lightGray
        view.addSubview(line4)
        
        line5.frame = CGRect(x: 50, y: 580, width: 310, height: 1)
        line5.backgroundColor = UIColor.lightGray
        view.addSubview(line5)
    }
    
    @IBAction func pesnyaButton1(_ sender: Any) {
        presentPlay(pathTrek: "Colorado", nameTrek: "Colorado")
    }
    
    @IBAction func pesnyaButton2(_ sender: Any) {
        presentPlay(pathTrek: "Sterva", nameTrek: "Стерва")
    }
    
    @IBAction func pesnyaButton3(_ sender: Any) {
        presentPlay(pathTrek: "leiVino", nameTrek: "Лей вино")
    }
    
    @IBAction func pesnyaButton4(_ sender: Any) {
        presentPlay(pathTrek: "RokZvezda", nameTrek: "Рок звезда")
    }
    
    @IBAction func pesnyaButton5(_ sender: Any) {
        presentPlay(pathTrek: "GHOST", nameTrek: "гост")
    }
    
    
    
// Переход
    func presentPlay(pathTrek: String, nameTrek: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        vc.updateTrek = pathTrek
        vc.updateName = nameTrek
        self.present(vc, animated: true, completion: nil)
    }
}



