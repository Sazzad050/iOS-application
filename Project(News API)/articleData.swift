//
//  articleData.swift
//  Project(News API)
//
//  Created by Bjit on 12/1/23.
//

import Foundation
struct Articledata : Decodable {
    
    let status : String
    let articles: [Articles]
}

struct Articles: Decodable{
    
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

}
