//
//  SongTableViewController.swift
//  BachToBack
//
//  Created by Alumno ITESM Toluca on 29/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    var canciones = [Song]()
    
    private func llenarDatos(){
        
        let cover1 = UIImage(named: "wagner")
        let cover2 = UIImage(named: "beethoven")
        let cover3 = UIImage(named: "bach")
        
        guard let song1 = Song(nombre: "Flight of the Valkyries", file: "flight", cover: cover1) else {
            fatalError("Error al crear elemento")
        }
        guard let song2 = Song(nombre: "For Elise", file: "elise", cover: cover2) else {
            fatalError("Error al crear elemento")
        }
        guard let song3 = Song(nombre: "Toccata et Fugue BWM 565", file: "fugue", cover: cover3) else {
            fatalError("Error al crear elemento")
        }
        
        canciones += [song1, song2, song3]
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        llenarDatos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return canciones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as? SongTableViewCell else {
            fatalError("Error al cargar celda como objeto")
        }

        // Configure the cell...
        
        let cancion = canciones[indexPath.row]
        
        cell.uiName.text = cancion.nombre
        cell.uiCover.image = cancion.cover

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
            case "cancionDetalle":
                guard let detalleViewController = segue.destination as? ViewController else {
                    fatalError("Error al inicializar view Controller")
                }
                
                guard let celdaSeleccionada = sender as? SongTableViewCell else{
                    fatalError("Error al inicializar el view controller")
                }
                
                guard let indexCelda = tableView.indexPath(for: celdaSeleccionada) else{
                    fatalError("Error al inicializar el view controller")
                }
                
                let cancionSeleccionada = canciones[indexCelda.row]
                detalleViewController.cancion = cancionSeleccionada
            
            default:
                fatalError("Caso no valido")
            
        }
    }
    

}
