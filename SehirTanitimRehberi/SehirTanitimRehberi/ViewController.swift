//
//  ViewController.swift
//  SehirTanitimRehberi
//
//  Created by Hüseyin HÖBEK on 22.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sehirDizisi = [Sehir]()
    var kullaniciSecimi : Sehir?
    
    var sehirIsimleri = [String]()
    var sehirBolgeIsimleri = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Şehirler
       
        let istanbul = Sehir (isim: "Istanbul", bolge: "Marmara", gorsel: UIImage(named: "istanbul")!)
        
        let ankara = Sehir (isim: "Ankara", bolge: "İç Anadolu", gorsel: UIImage(named: "ankara")!)
        
        let izmir = Sehir (isim: "Izmir", bolge: "Ege", gorsel: UIImage(named: "izmir")!)
        
        let adana = Sehir (isim: "Adana", bolge: "Akdeniz", gorsel: UIImage(named: "adana")!)
        
        
        sehirDizisi = [istanbul, ankara, izmir, adana]
        
       

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirDizisi.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sehirDizisi[indexPath.row].isim
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kullaniciSecimi = sehirDizisi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenSehir = kullaniciSecimi
        }
    }
}

