// To parse the JSON, add this file to your project and do:
//
//   let dataResponse = try? newJSONDecoder().decode(DataResponse.self, from: jsonData)

import Foundation

struct DataResponse: Codable {
    let help: String
    let success: Bool
    let result: Result
}

struct Result: Codable {
    let resourceID: String
    let fields: [Field]
    let records: [Record]
    let links: Links
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case resourceID = "resource_id"
        case fields, records
        case links = "_links"
        case total
    }
}

struct Field: Codable {
    let type, id: String
}

struct Links: Codable {
    let start, next: String
}

struct Record: Codable {
    let volumeOfMobileData, quarter: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case volumeOfMobileData = "volume_of_mobile_data"
        case quarter
        case id = "_id"
    }
}


func generateData(data:DataResponse) -> Array<RecordData> {
    var record = Array<RecordData>()
    var currentRecord = RecordData()
    var lastTotalVolume = Float(0.0)
    for  detail in data.result.records  {
        let detailYear = String(detail.quarter.prefix(4))
        
        if (!currentRecord.year.isEmpty && currentRecord.year != detailYear) {
            if lastTotalVolume < currentRecord.totalRecord {
                currentRecord.imageIconName = "increase"
            }
            else{
                currentRecord.imageIconName = "decrease"
            }
            lastTotalVolume = currentRecord.totalRecord
            record.append(currentRecord)
            currentRecord = RecordData()
        }
       
        currentRecord.year = detailYear
        currentRecord.totalRecord = Float(currentRecord.totalRecord) + (Float(detail.volumeOfMobileData) ??  Float(0.0))
        currentRecord.records.append(detail)
        
    }
    if lastTotalVolume < currentRecord.totalRecord {
        currentRecord.imageIconName = "increase"
    }
    else{
        currentRecord.imageIconName = "decrease"
    }
    record.append(currentRecord)
    
    return record
}
