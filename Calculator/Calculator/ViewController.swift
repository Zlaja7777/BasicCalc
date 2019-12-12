//
//  ViewController.swift
//  Calculator
//
//  Created by Zlatan Haljeta on 09/12/2019.
//  Copyright © 2019 Zlatan Haljeta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Operacija: UIButton!;
    @IBOutlet var Prikaz: UILabel!
    var primarna: UIColor!;
    var OperacijaPressed: Bool = false;
    var PrviBroj: Float? = nil;
    var DrugiBroj: Float? = nil;
    var odabranaOperacija: String = "";
    
    
    func ProvjeraBroja() -> Bool{
        if (Prikaz.text == "0" || OperacijaPressed == true ) {
            
            return true;
        }
        return false;
    }
    func ProvjeraOperacije() {
       if OperacijaPressed == false {
            PrviBroj = Float(Prikaz.text!);
       }
       else{
            DrugiBroj = Float(Prikaz.text!);
        }
    }
    @IBAction func Ocisti(_ sender: Any) {
        Prikaz.text = "0";
        OperacijaPressed = false;
    }
  
    
    @IBAction func Brojevi(_ sender: UIButton) {
        if ProvjeraBroja()
        {
            Prikaz.text = String(sender.tag)
        }
        else
        {
            Prikaz.text = Prikaz.text! + String(sender.tag);
        }
        ProvjeraOperacije()
    }
    @IBAction func Operacije(_ sender: UIButton) {
        OperacijaPressed = true;
        primarna = sender.backgroundColor;
        sender.backgroundColor = UIColor.darkGray;
        
        switch sender.tag {
        case 100:
            odabranaOperacija = "+"; break;
        case 101:
            odabranaOperacija = "-"; break;
        case 102:
            odabranaOperacija = "/"; break;
        case 103:
            odabranaOperacija = "x"; break;
        default:
            odabranaOperacija = "N/A"
        }
        Operacija = sender;
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Test github")
        
    }
    
    @IBAction func Result(_ sender: UIButton) {
   
       
        if odabranaOperacija == "-" {
            
            Prikaz.text = String(PrviBroj! - DrugiBroj!)
        }
        else if odabranaOperacija == "+" {
            Prikaz.text = String(PrviBroj! + DrugiBroj!)
        }
        

        else if odabranaOperacija == "/" {
            Prikaz.text = String (PrviBroj! / DrugiBroj!)
        }
        else{
            Prikaz.text = String (PrviBroj! * DrugiBroj!)
        }
        OperacijaPressed = false;
        Operacija.backgroundColor = primarna;
    }
    
}


