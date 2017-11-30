//
//  Song.swift
//  BachToBack
//
//  Created by Alumno ITESM Toluca on 22/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import Foundation
import UIKit

class Song{
    var nombre: String
    var file:String
    var cover: UIImage?
    
    init?(nombre: String, file:String, cover:UIImage?) {
        guard !nombre.isEmpty && !file.isEmpty else {
            return nil
        }
        guard cover != nil else {
            return nil
        }
        
        self.nombre = nombre
        self.file = file
        self.cover = cover
    }
}
