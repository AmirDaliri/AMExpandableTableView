//
//  ProfileViewAdapter.swift
//  AMExpandableTableView
//
//  Created by Amir Daliri on 4/2/18.
//  Copyright © 2018 AmirDaliri. All rights reserved.
//

import Foundation

enum ProfileRowType: Int
{
    case FullName
    case FirstName
    case LastName
    case Birthday
    case Email
    case Phone
    case Bio
}

class ProfileViewAdapter: NSObject
{
    var dataDictionary: Dictionary<ProfileRowType, AnyObject> = [:]
    var rowTypes: Array<ProfileRowType> = [
        .FullName,
        .Birthday,
        .Email,
        .Phone,
        .Bio
    ]
    

    
    func cellIdentifiers() -> Array<String>
    {
        return ["ProfileViewCell"]
    }
    
    func cellClassForIdentifier(cellIdentifier: String) -> AnyClass?
    {
        return TableViewCell.self
    }
    
    func cellIdentifierAtIndexPath(indexPath: IndexPath) -> String
    {
        return "ProfileViewCell"
    }
    
    func numberOfRows() -> Int
    {
        return rowTypes.count
    }
    
    func cellDescriptorAtIndexPath(indexPath: IndexPath) -> ProfileValueDisplayDescriptor!
    {
        let rowType = rowTypes[indexPath.row]
        
        return self.cellDescriptorForRowType(rowType: rowType)
    }
    
    func cellDescriptorForRowType(rowType: ProfileRowType) -> ProfileValueDisplayDescriptor!
    {
        let value = dataDictionary[rowType]as AnyObject
        
        let descriptor = ProfileValueDisplayDescriptor()
        
        descriptor.formatter = self.formatterForRowType(rowType: rowType)
        descriptor.type = rowType
        descriptor.value = value
        
        return descriptor
    }
    
    func formatterForRowType(rowType: ProfileRowType) -> ProfileValueFormatter!
    {
        var formatter: ProfileValueFormatter!
        
        switch rowType
        {
        case .Birthday:
            formatter = nil
            break
            
        default:
            formatter = ProfileValueFormatter()
            break
        }
        
        return formatter
    }
}
