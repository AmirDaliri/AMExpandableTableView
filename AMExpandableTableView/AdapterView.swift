//
//  AdapterView.swift
//  AMExpandableTableView
//
//  Created by Amir Daliri on 4/2/18.
//  Copyright © 2018 AmirDaliri. All rights reserved.
//

protocol ProfileEditViewAdapterDelegate
{
    func profileEditViewAdapter(adapter: ProfileEditViewAdapter!, didAddCellsAtIndexPaths indexPaths: [IndexPath])
    func profileEditViewAdapter(adapter: ProfileEditViewAdapter!, didRemoveCellsAtIndexPaths indexPaths: [IndexPath])
    func profileEditViewAdapter(adapter: ProfileEditViewAdapter!, didReloadCellsAtIndexPaths indexPaths: [IndexPath])
    
    func profileEditViewAdapterDidSelectEmail(adapter: ProfileEditViewAdapter!, descriptor: ProfileValueDescriptor?)
    //    func profileEditViewAdapterDidSelectLocation(adapter: ProfileEditViewAdapter!, descriptor: ProfileValueDescriptor?)
}

import Foundation

class ProfileEditViewAdapter: NSObject {

    var delegate: ProfileEditViewAdapterDelegate?

    func onTapCell(cell: TableViewCell!) {
        if let rowType = cell.descriptor?.type {
            switch rowType {
            case .FullName:
                
                let indexPaths = [IndexPath.init(row: 1, section: 0), IndexPath.init(row: 2, section: 0)]
                
                if rowTypes.contains(.FirstName) && rowTypes.contains(.LastName) {
                    rowTypes.removeSubrange(1..<3)
                    
                    delegate?.profileEditViewAdapter(adapter: self, didRemoveCellsAtIndexPaths: indexPaths)
                } else {
                    rowTypes.insert(contentsOf: [.FirstName, .LastName], at: 1)
                    
                    delegate?.profileEditViewAdapter(adapter: self, didAddCellsAtIndexPaths: indexPaths)
                }
                
                break
                
            case .Email:
                
                delegate?.profileEditViewAdapterDidSelectEmail(adapter: self, descriptor: cell.descriptor)
                break
                
            default:
                break
            }
        }
    }
}
