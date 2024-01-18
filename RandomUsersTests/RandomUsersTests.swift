//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Kevin Martinez on 1/18/24.
//

import XCTest
@testable import RandomUsers

final class RandomUsersTests: XCTestCase {
    
    
     // generic function to load data from a bundle file
    
    private func getTestJSONData () -> Data  {
        let data: Data
        let fileName = "randomUsers.json"
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle")
        }
        
        do {
             data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
        }
        
        return data
  
    }

    func testUserModel() throws {
        let jsonData = getTestJSONData()
        
        do {
           _ = try JSONDecoder().decode(Response.self, from: jsonData)
        } catch {
            XCTFail("Failed to decode JSON into the model \(error)")
        }
        
    }


}
