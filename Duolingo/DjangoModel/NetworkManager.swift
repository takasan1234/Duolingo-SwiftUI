//
//  NetworkManager.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/23.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var problems = [Problem]()
    func fetchProblemsData(sectionNum: Int, unitNum: Int, componentNum: Int) {
        if let url = URL(string: "http://localhost:8000/duolingo/problems/?section_num=\(sectionNum)&unit_num=\(unitNum)&component_num=\(componentNum)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                let decorder = JSONDecoder()
                if let safeData = data {
                    do{
                        let results = try decorder.decode([Problem].self, from: safeData)
                        DispatchQueue.main.async {
                            self.problems = results
                            print("↓=====================")
                            print(self.problems)
                            print("↑=====================")
                        }
                    } catch {
                       print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
