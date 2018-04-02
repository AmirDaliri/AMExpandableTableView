//
//  TableViewCell.swift
//  AMExpandableTableView
//
//  Created by Amir Daliri on 4/2/18.
//  Copyright © 2018 AmirDaliri. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var descriptor: ProfileValueDisplayDescriptor? {
        didSet
        {
            self.onDescriptorChanged()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.separatorInset = UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    //MARK: - PUBLIC
    
    func onDescriptorChanged() {
        self.textLabel?.text = descriptor?.displayText()
        self.textLabel?.textColor = descriptor?.displayTextColor()
        
    }
}









class ProfileValueDisplayDescriptor: ProfileValueDescriptor {
    //MARK: - PUBLIC
    
    func displayText() -> String?
    {
        if let displayText = formatter?.stringWithValue(value: value)
        {
            if 0 < displayText.count
            {
                return displayText
            }
        }
        
        return self.notSpecifiedString()
    }
    
    func notSpecifiedString() -> String?
    {
        var notSpecifiedStr: String?
        
        switch type!
        {
        case .Birthday:
            notSpecifiedStr = "Birthday"
            break
            
        case .Phone:
            notSpecifiedStr = "Phone"
            break
            
        case .Bio:
            notSpecifiedStr = "Bio"
            break
            
        default:
            break
        }
        
        return notSpecifiedStr
    }
    
    func displayTextColor() -> UIColor!
    {
        return UIColor.red
    
    func customControlView() -> UIView?
    {
        return nil
    }
    
    func iconName() -> String?
    {
        var iconName: String?
        
        switch type!
        {
        case .FullName:
            iconName = "profile_icon_name"
            break
            
        case .Birthday:
            iconName = "profile_icon_birthday"
            break
            
        case .Email:
            iconName = "profile_icon_email"
            break
            
        case .Phone:
            iconName = "profile_icon_phone"
            break
            
        case .Bio:
            iconName = "profile_icon_bio"
            break
            
        default:
            break
        }
        
        return iconName
    }
}


