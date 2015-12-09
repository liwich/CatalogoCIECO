//
//  Especie.swift
//  CatalogoCIECO
//
//  Created by Adalid Ramirez on 03/08/15.
//  Copyright (c) 2015 Luis Manuel Rodriguez Ramirez. All rights reserved.
//

import Foundation
import CoreData

class Especie: NSManagedObject {

    @NSManaged var clase: String
    @NSManaged var familia: String
    @NSManaged var genero: String
    @NSManaged var imagen1: NSData
    @NSManaged var imagen2: NSData
    @NSManaged var imagen3: NSData
    @NSManaged var imagen4: NSData
    @NSManaged var nombreCientifico: String
    @NSManaged var orden: String
    @NSManaged var nombreComun: String
    @NSManaged var referencias: String
    @NSManaged var subclase: String
    @NSManaged var superorden: String
    @NSManaged var tipoEs: String

}
