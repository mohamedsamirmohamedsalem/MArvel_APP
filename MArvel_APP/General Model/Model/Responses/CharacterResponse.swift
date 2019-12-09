//
//  asasassa.swift
//  MArvel_APP
//
//  Created by Mohamed Samir on 12/8/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.

import Foundation

// MARK: - Welcome
struct CharacterResponse : Codable{
    let swaggerVersion, apiVersion: String?
    let basePath: String?
    let resourcePath: String?
    let apis: [API]?
    let models: Models?
}

// MARK: - API
struct API : Codable{
    let path, apiDescription: String?
    let operations: [Operation]?
}

// MARK: - Operation
struct Operation : Codable{
  //  let httpMethod: HTTPMethod?
    let nickname: String?
  //  let responseClass: ID?
    let notes, id: String?
    let errorResponses: [ErrorResponse]?
    let parameters: [Parameter]?
    let summary: String?
}

// MARK: - ErrorResponse
struct ErrorResponse : Codable{
    let code: Int?
 //   let reason: Reason?
    let id: String?
}
//
//enum Reason : Codable{
//    case characterNotFound
//    case comicNotFound
//    case creatorNotFound
//    case emptyParameter
//    case eventNotFound
//    case invalidOrUnrecognizedOrderingParameter
//    case invalidOrUnrecognizedParameter
//    case invalidValuePassedToFilter
//    case limitGreaterThan100
//    case limitInvalidOrBelow1
//    case seriesNotFound
//    case storyNotFound
//    case tooManyValuesSentToAMultiValueListFilter
//}
//
//enum HTTPMethod : Codable{
//    case httpMethodGET
//}

// MARK: - Parameter
struct Parameter : Codable{
    let name, parameterDescription: String?
  //  let dataType: DataType?
  //  let paramType: ParamType?
    let id: String?
    let allowMultiple, parameterRequired: Bool?
    let allowableValues: AllowableValues?
}

// MARK: - AllowableValues
struct AllowableValues : Codable{
   // let valueType: ValueType?
    let id: String?
    let values: [String]?
    let min, max: Int?
}
//
//enum ValueType : Codable{
//    case list
//    case range
//}
//
//enum DataType : Codable{
//    case boolean
//    case date
//    case int
//    case string
//}
//
//enum ParamType : Codable{
//    case path
//    case query
//}
//
//enum ID : Codable{
//    case characterDataWrapper
//    case comicDataWrapper
//    case creatorDataWrapper
//    case eventDataWrapper
//    case seriesDataWrapper
//    case storyDataWrapper
//}

// MARK: - Models
struct Models : Codable{
    let comicList, eventList, creatorList, characterList: List?
    let seriesList, storyList: List?
    let characterSummary: RSummary?
    let eventSummary, seriesSummary, comicSummary: Summary?
    let url: URLClass?
    let creatorSummary: RSummary?
    let storySummary: StorySummary?
    let image: Image?
    let comicDate: ComicDate?
    let characterDataContainer, eventDataContainer: DataContainer?
    let comicPrice: ComicPrice?
    let eventDataWrapper: DataWrapper?
    let creator: Creator?
    let event: Event?
    let comicDataContainer: DataContainer?
    let textObject: TextObject?
    let creatorDataWrapper, storyDataWrapper: DataWrapper?
    let character: MarvelCharacter?
    let characterDataWrapper, comicDataWrapper: DataWrapper?
    let series: Event?
    let seriesDataWrapper: DataWrapper?
    let seriesDataContainer, storyDataContainer: DataContainer?
    let comic: Comic?
    let creatorDataContainer: DataContainer?
    let story: Story?
}

// MARK: - Character
struct MarvelCharacter : Codable{
    let id: String?
    let properties: CharacterProperties?
}

// MARK: - CharacterProperties
struct CharacterProperties : Codable{
    let id, name, propertiesDescription, modified: PuneHedgehog?
    let resourceURI: PuneHedgehog?
    let urls: Urls?
    let thumbnail, comics, stories, events: PuneHedgehog?
    let series: PuneHedgehog?
}

// MARK: - PuneHedgehog
struct PuneHedgehog : Codable{
    let type, puneHedgehogDescription: String?
}

// MARK: - Urls
struct Urls : Codable{
 //   let type: TypeEnum?
    let urlsDescription: String?
    let items: Items?
}

// MARK: - Items
struct Items : Codable{
    let ref: String?
}
//
//enum TypeEnum : Codable{
//    case array
//}

// MARK: - DataContainer
struct DataContainer : Codable{
    let id: String?
    let properties: CharacterDataContainerProperties?
}

// MARK: - CharacterDataContainerProperties
struct CharacterDataContainerProperties : Codable{
    let offset, limit, total, count: PuneHedgehog?
    let results: Urls?
}

// MARK: - DataWrapper
struct DataWrapper : Codable{
  //  let id: ID?
    let properties: CharacterDataWrapperProperties?
}

// MARK: - CharacterDataWrapperProperties
struct CharacterDataWrapperProperties : Codable{
    let code, status, copyright, attributionText: PuneHedgehog?
    let attributionHTML, data, etag: PuneHedgehog?
}

// MARK: - List
struct List : Codable{
    let id: String?
    let properties: CharacterListProperties?
}

// MARK: - CharacterListProperties
struct CharacterListProperties : Codable{
    let available, returned, collectionURI: PuneHedgehog?
    let items: Urls?
}

// MARK: - RSummary
struct RSummary : Codable{
    let id: String?
    let properties: CharacterSummaryProperties?
}

// MARK: - CharacterSummaryProperties
struct CharacterSummaryProperties : Codable{
    let resourceURI, name, role: PuneHedgehog?
}

// MARK: - Comic
struct Comic : Codable{
    let id: String?
    let properties: ComicProperties?
}

// MARK: - ComicProperties
struct ComicProperties : Codable{
    let id, digitalID, title, issueNumber: PuneHedgehog?
    let variantDescription, propertiesDescription, modified, isbn: PuneHedgehog?
    let upc, diamondCode, ean, issn: PuneHedgehog?
    let format, pageCount: PuneHedgehog?
    let textObjects: Urls?
    let resourceURI: PuneHedgehog?
    let urls: Urls?
    let series: PuneHedgehog?
    let variants, collections, collectedIssues, dates: Urls?
    let prices: Urls?
    let thumbnail: PuneHedgehog?
    let images: Urls?
    let creators, characters, stories, events: PuneHedgehog?
}

// MARK: - ComicDate
struct ComicDate : Codable{
    let id: String?
    let properties: ComicDateProperties?
}

// MARK: - ComicDateProperties
struct ComicDateProperties : Codable{
    let type, date: PuneHedgehog?
}

// MARK: - ComicPrice
struct ComicPrice : Codable{
    let id: String?
    let properties: ComicPriceProperties?
}

// MARK: - ComicPriceProperties
struct ComicPriceProperties : Codable{
    let type, price: PuneHedgehog?
}

// MARK: - Summary
struct Summary : Codable{
    let id: String?
    let properties: ComicSummaryProperties?
}

// MARK: - ComicSummaryProperties
struct ComicSummaryProperties : Codable{
    let resourceURI, name: PuneHedgehog?
}

// MARK: - Creator
struct Creator : Codable{
    let id: String?
    let properties: CreatorProperties?
}

// MARK: - CreatorProperties
struct CreatorProperties : Codable{
    let id, firstName, middleName, lastName: PuneHedgehog?
    let suffix, fullName, modified, resourceURI: PuneHedgehog?
    let urls: Urls?
    let thumbnail, series, stories, comics: PuneHedgehog?
    let events: PuneHedgehog?
}

// MARK: - Event
struct Event : Codable{
    let id: String?
    let properties: EventProperties?
}

// MARK: - EventProperties
struct EventProperties : Codable{
    let id, title, propertiesDescription, resourceURI: PuneHedgehog?
    let urls: Urls?
    let modified, start, end, thumbnail: PuneHedgehog?
    let comics, stories, series, characters: PuneHedgehog?
    let creators, next, previous, startYear: PuneHedgehog?
    let endYear, rating, events: PuneHedgehog?
}

// MARK: - Image
struct Image : Codable{
    let id: String?
    let properties: ImageProperties?
}

// MARK: - ImageProperties
struct ImageProperties : Codable{
    let path, propertiesExtension: PuneHedgehog?
}

// MARK: - Story
struct Story : Codable{
    let id: String?
    let properties: [String: PuneHedgehog]?
}

// MARK: - StorySummary
struct StorySummary  : Codable {
    let id: String?
    let properties: StorySummaryProperties?
}

// MARK: - StorySummaryProperties
struct StorySummaryProperties: Codable {
    let resourceURI, name, type: PuneHedgehog?
}

// MARK: - TextObject
struct TextObject : Codable{
    let id: String?
    let properties: TextObjectProperties?
}

// MARK: - TextObjectProperties
struct TextObjectProperties : Codable{
    let type, language, text: PuneHedgehog?
}

// MARK: - URLClass
struct URLClass: Codable {
    let id: String?
    let properties: URLProperties?
}

// MARK: - URLProperties
struct URLProperties : Codable{
    let type, url: PuneHedgehog?
}
