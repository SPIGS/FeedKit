//
//  MediaGroup.swift
//
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

import Foundation

/// The <media:group> element is a sub-element of <item>. It allows grouping
/// of <media:content> elements that are effectively the same content,
/// yet different representations. For instance: the same song recorded
/// in both the WAV and MP3 format. It's an optional element that must
/// only be used for this purpose.
public class MediaGroup {
    /// <media:content> is a sub-element of either <item> or <media:group>.
    /// Media objects that are not the same content should not be included
    /// in the same <media:group> element. The sequence of these items implies
    /// the order of presentation. While many of the attributes appear to be
    /// audio/video specific, this element can be used to publish any type of
    /// media. It contains 14 attributes, most of which are optional.
    public var mediaContents: [MediaContent]?

    /// Notable entity and the contribution to the creation of the media object.
    /// Current entities can include people, companies, locations, etc. Specific
    /// entities can have multiple roles, and several entities can have the same
    /// role. These should appear as distinct <media:credit> elements. It has two
    /// optional attributes.
    public var mediaCredits: [MediaCredit]?

    /// Allows a taxonomy to be set that gives an indication of the type of media
    /// content, and its particular contents. It has two optional attributes.
    public var mediaCategory: MediaCategory?

    /// This allows the permissible audience to be declared. If this element is not
    /// included, it assumes that no restrictions are necessary. It has one
    /// optional attribute.
    public var mediaRating: MediaRating?
   
    /// The "media:description" element is a Text construct that conveys a short 
    /// description describing the media object typically a sentence in length.
    /// It has one optional attribute, "type", which specifies the type of text 
    /// embedded. Possible values are either "plain" or "html". 
    public var mediaDescription: MediaDescription?
  
    /// The "media:title" element is a Text construct that conveys a human-
    /// readable title for the title of the particular media:group. It has one 
    /// optional attribute, "type", which specifies the type of text embedded.
    /// Possible values are either "plain" or "html"
    public var mediaTitle: MediaTitle?
    
    /// The "media:thumbnails" element is a construct that allows particular images 
    /// to be used as representative images for the media object. If multiple 
    /// thumbnails are included, and time coding is not at play, it is assumed that 
    /// the images are in order of importance. It has one required attribute, "url",
    /// which specifies the url of the thumbnail, and 
    /// three optional attributes - "height", "width", and "time" - which specify the 
    /// height of the thumbnail, the width of the thumbnail, and the time offset
    /// relation to the media objec, respectively. 
    public var mediaThumbnails: [MediaThumbnail]?

    public init() {}
}

// MARK: - Equatable

extension MediaGroup: Equatable {
    public static func == (lhs: MediaGroup, rhs: MediaGroup) -> Bool {
        return
            lhs.mediaContents == rhs.mediaContents &&
            lhs.mediaCredits == rhs.mediaCredits &&
            lhs.mediaCategory == rhs.mediaCategory &&
            lhs.mediaRating == rhs.mediaRating &&
            lhs.mediaDescription == rhs.mediaDescription &&
            lhs.mediaTitle == rhs.mediaTitle &&
            lhs.mediaThumbnails == rhs.mediaThumbnails
    }
}
