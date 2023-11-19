//
//  Network.swift
//  UDTW
//
//  Created by RainYang on 2023/8/30.
//

import SwiftUI

class Network: ObservableObject {
    @Published var users : [API] = []

    func getUsers() {
        guard let url = URL(string: "https://api.wolfx.jp/cenc_eqlist.json") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let inform = try JSONDecoder().decode(API.self, from: data)
                        self.users = [inform]
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
