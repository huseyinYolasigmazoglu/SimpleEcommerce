//
//  Products.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 25.12.2020.
//

import Foundation


class ProductDetail: Codable {
    public var Products:[Product]
    public var Metadata:Metadata
}


class Product: Codable {
    public var name:String?
    public var cost:String?
    public var prodid:String
    public var altImage:String?
    public var allImages:[String]
}

class Metadata: Codable {
    public var Breadcrumbs:String?
    public var canonicalUrl:String?
}
