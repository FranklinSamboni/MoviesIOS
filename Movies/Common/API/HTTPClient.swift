//
//  HTTPClient.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

protocol HTTPClient {
    func get(url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
