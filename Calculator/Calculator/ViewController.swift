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
    var PrviBroj: Int? = nil;
    var DrugiBroj: Int? = nil;
    var odabranaOperacija: String = "";
 
    
    func ProvjeraZareza(num1: Int, num2: Int)-> Bool{
        let rezultat: Float  = Float(num1) / Float(num2)
        if (rezultat - floor(rezultat) > 0){
            return true;
        }
        return false
    }
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
       }
    
    
    @IBAction func Ocisti(_ sender: Any) {
           Prikaz.text = "";
           OperacijaPressed = false;
       }
    @IBAction func Brojevi(_ sender: UIButton) {
        
            if OperacijaPressed == true {
                if Prikaz.text == String(PrviBroj!)  {
                    Prikaz.text = String(sender.tag);
                }
                else{
                    Prikaz.text = Prikaz.text! + String(sender.tag)
                }
                DrugiBroj = Int(Prikaz.text!)!;
                
            }
            else{
                Prikaz.text = Prikaz.text! + String(sender.tag)
                PrviBroj = Int(Prikaz.text!);
            }
           
        }
    @IBAction func Result(_ sender: UIButton) {
       
            switch odabranaOperacija {
            case "-":
                Prikaz.text = String(PrviBroj! - DrugiBroj!)
            case "+":
                Prikaz.text = String(PrviBroj! + DrugiBroj!)
            case "/":
                if ProvjeraZareza(num1: PrviBroj!, num2: DrugiBroj!){
                    Prikaz.text = String(Float(PrviBroj!) / Float(DrugiBroj!));
                }
                else {
                    Prikaz.text = String(PrviBroj! / DrugiBroj!);
                }
            case "x":
                Prikaz.text = String(PrviBroj! * DrugiBroj!)
            default:
                odabranaOperacija = "N/A"
            }
            OperacijaPressed = false;
            Operacija.backgroundColor = primarna;
            
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
}


