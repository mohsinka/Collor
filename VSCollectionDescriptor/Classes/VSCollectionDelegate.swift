//
//  VSCollectionDelegate.swift
//  VSC
//
//  Created by Guihal Gwenn on 29/06/16.
//  Copyright © 2016 VSCT. All rights reserved.
//

import Foundation
import UIKit

public class VSCollectionDelegate: NSObject, UICollectionViewDelegate {
    
    public var collectionDatas: VSCollectionDatas?
    public weak var delegate: VSCollectionDidSelectCellDelegate?
    
    public init(delegate: VSCollectionDidSelectCellDelegate) {
        self.delegate = delegate
        super.init()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let sectionDescriptor = collectionDatas?.sections[indexPath.section] {
            let cellDescriptor = sectionDescriptor.cells[indexPath.item]
            return cellDescriptor.selectable
        }
        return false
    }
    
    // MARK: UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let sectionDescriptor = collectionDatas?.sections[indexPath.section] {
            let cellDescriptor = sectionDescriptor.cells[indexPath.item]
            delegate?.didSelectCell(cellDescriptor, sectionDescriptor: sectionDescriptor, indexPath: indexPath)
        }
    }
    
}

extension VSCollectionDelegate : UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let sectionDescriptor = collectionDatas?.sections[indexPath.section] {
            let cellDescriptor = sectionDescriptor.cells[indexPath.item]
            return cellDescriptor.size(collectionView, sectionDescriptor: sectionDescriptor)
        }
        return CGSize.zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if let sectionDescriptor = collectionDatas?.sections[section] {
            return sectionDescriptor.sectionInset(collectionView)
        }
        return UIEdgeInsets()
    }
    
}