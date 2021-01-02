//
//  Product.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 2.01.2021.
//

import Foundation

class Product: Codable {
    public var name:String?
    public var cost:String?
    public var costFloat:Float? //to be able to sort
    public var prodid:String?
    public var altImage:String?
    public var allImages:[String]?
    public var mainImage:String?  //mainImage : not in json , /will be used to find main image to show in collectionview.
}
