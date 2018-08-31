 

import UIKit


// Attribution: http://stackoverflow.com/a/37238705

/**
 * A simple `UICollectionViewFlowLayout` subclass that would make sure the items are center-aligned in the collection view, when scrolling vertically.
 */
class CollectionViewCenterFlowLayout: UICollectionViewFlowLayout {
  
  // MARK: - Object Lifecycle
  
  public convenience init(layout: UICollectionViewFlowLayout) {
    self.init()
    self.itemSize = layout.itemSize
    self.sectionInset = layout.sectionInset
  }
  
  // MARK: - UICollectionViewFlowLayout
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
    let attributes = NSArray(array: layoutAttributes, copyItems: true) as! [UICollectionViewLayoutAttributes]
    guard scrollDirection == .vertical else { return attributes }
    
    var newAttributes: [UICollectionViewLayoutAttributes] = []
    
    /// We will collect items for each row in this array
    var currentRowAttributes: [UICollectionViewLayoutAttributes] = []
    /// We will use this variable to detect new rows when iterating over items
    var yOffset:CGFloat = sectionInset.top
    for attributes in attributes {
      /// If we happen to run into a new row...
      
      if attributes.frame.origin.y != yOffset {
        /*
         * Update layout of all items in the previous row and add them to the resulting array
         */
        centerSingleRowWithItemsAttributes(attributes: &currentRowAttributes, rect: rect)
        newAttributes += currentRowAttributes
        /*
         * Reset the accumulated values for the new row
         */
        currentRowAttributes = []
        yOffset = attributes.frame.origin.y
      }
      currentRowAttributes += [attributes]
    }

    /*
     * Update the layout of the last row.
     */
    centerSingleRowWithItemsAttributes(attributes: &currentRowAttributes, rect: rect)
    newAttributes += currentRowAttributes    
    return newAttributes
  }
  
  /**
   Updates the attributes for items, so that they are center-aligned in the given rect.
   
   - parameter attributes: Attributes of the items
   - parameter rect:       Bounding rect
   */
  private func centerSingleRowWithItemsAttributes(attributes: inout [UICollectionViewLayoutAttributes], rect: CGRect) {
    guard let item = attributes.last else { return }
    
    let itemsCount = CGFloat(attributes.count)
    let sideInsets = rect.width - (item.frame.width * itemsCount) - (minimumInteritemSpacing * (itemsCount - 1))
    var leftOffset = sideInsets / 2
    
    for attribute in attributes {
      attribute.frame.origin.x = leftOffset
      leftOffset += attribute.frame.width + minimumInteritemSpacing
    }
  }
}
