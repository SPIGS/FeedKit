//
//  YouTubeTests.swift
//
//  Copyright (c) 2023 Naufal Fachrian
//  Copyright (c) 2016 - 2018 Nuno Manuel Dias
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
import FeedKit

class YouTubeTests: BaseTestCase {
    
    func testAtomFeed() {
        
        // Given
        let URL = fileURL("YouTube", type: "xml")
        let parser = FeedParser(URL: URL)
        
        do {
            // When
            let feed = try parser.parse().get().atomFeed

            // Then
            
            XCTAssertNotNil(feed)
          
          XCTAssertEqual(feed?.entries?.first?.media?.mediaGroup?.mediaDescription?.value, """
            SwiftUI’s DatePicker view is analogous to UIDatePicker, and comes with a variety options for controlling how it looks and works. Like all controls that store values, it does need to be bound to some sort of state in your app. 

            From iOS 14 onwards, you can use the new GraphicalDatePickerStyle() to get a more advanced date picker, that shows a calendar plus space to enter a precise time
            """)
            
        } catch {
            XCTFail(error.localizedDescription)
        }
      
    }
  
  func testYouTubeChannelID() {
        
        let URL = fileURL("YouTubeXMLFeed", type: "xml")
        let parser = FeedParser(URL: URL)
        
        do {
            
            let feed = try parser.parse().get().atomFeed
            
            XCTAssertEqual(feed?.entries?.last?.yt?.channelID, "UCE_M8A5yxnLfW0KghEeajjw")
        } catch {
            XCTFail(error.localizedDescription)
        }
    
  }
        
    func testYouTubeVideoID() {
        
        let URL = fileURL("YouTubeXMLFeed", type: "xml")
        let parser = FeedParser(URL: URL)
        
        do {
            
            let feed = try parser.parse().get().atomFeed
            
            [
                "51QO4pavK3A",
                "j1HGOY32s2Y",
                "rc46cO3spSE",
                "0okuAwqTHs0",
                "GYkq9Rgoj8E",
                "TX9qSaGXFyg",
                "4-7jSoINyq4",
                "0mqWw5UH1qg",
                "L5wx0Takylc",
                "fVW8-px4Ufw",
                "1S8L7t2tu0U",
                "svpvEfQ1cp8",
                "f1VEks-QQ4Y",
                "1HWUjMjaBJI",
                "oMf_i1YBuMk"
            ].forEach { videoID in
                XCTAssertTrue(feed?.entries?.contains(where: { entry in entry.yt?.videoID == videoID }) == true)
            }
            
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testAtomFeedParsingPerformance() {
        
        self.measure {
            
            // Given
            let expectation = self.expectation(description: "Atom Parsing Performance")
            let URL = self.fileURL("YouTube", type: "xml")
            let parser = FeedParser(URL: URL)
            
            // When
            parser.parseAsync { (result) in
                
                // Then
                expectation.fulfill()
                
            }

            self.waitForExpectations(timeout: self.timeout, handler: nil)
        }
    }
}
