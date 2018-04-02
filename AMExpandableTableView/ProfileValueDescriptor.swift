//
//  ProfileValueDescriptor.swift
//  AMExpandableTableView
//
//  Created by Amir Daliri on 4/2/18.
//  Copyright © 2018 AmirDaliri. All rights reserved.
//

import Foundation

protocol ProfileValueDescriptorDelegate: NSObjectProtocol
{
    func profileValueDescriptor(descriptor: ProfileValueDescriptor!, didChangeValue value: AnyObject?)
}

class ProfileValueDescriptor: NSObject
{
    //MARK: - VAR
    
    var formatter: ProfileValueFormatter?
    var type: ProfileRowType?
    var value: AnyObject?
    
    weak var delegate: ProfileValueDescriptorDelegate?
    
    //MARK: - PUBLIC
    
    func updateValue(newValue: AnyObject?)
    {
        value = newValue
        
        delegate?.profileValueDescriptor(descriptor: self, didChangeValue: newValue)
    }
}




import Foundation

class ProfileValueFormatter
{
    //MARK: - PUBLIC
    
    func stringWithValue(value: AnyObject?) -> String?
    {
        if let stringValue = value as? String
        {
            return stringValue
        }
        
        return nil
    }
}
