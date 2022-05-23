//
//  URLSessionClient.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

class URLSessionClient: HTTPClient {
    
    private struct UnexpectedResponseError: Error {}
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func get(url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let dataTask = session.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let urlResponse = urlResponse as? HTTPURLResponse {
                completion(.success((data, urlResponse)))
            } else {
                completion(.failure(UnexpectedResponseError()))
            }
        }
        dataTask.resume()
    }
}
