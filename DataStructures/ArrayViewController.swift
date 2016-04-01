//
//  ArrayViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

private enum ArrayVCRow: Int {
  case Creation = 0,
  InsertAt0,
  InsertAtMid,
  InsertAtEnd,
  DeleteAt0,
  DeleteAtMid,
  DeleteAtEnd,
  LookupByIndex,
  LookupByObject
}

import UIKit

class ArrayViewController: DataStructuresViewController {

  //MARK: - Variables

  let arrayManipulator: ArrayManipulator = SwiftArrayManipulator()

  var creationTime: NSTimeInterval = 0
  var insertAt0Time: NSTimeInterval = 0
  var insertAtMidTime: NSTimeInterval = 0
  var insertAtEndTime: NSTimeInterval = 0
  var removeAt0Time: NSTimeInterval = 0
  var removeAtMidTime: NSTimeInterval = 0
  var removeAtEndTime: NSTimeInterval = 0
  var lookupByIndexTime: NSTimeInterval = 0
  var lookupByObjectTime: NSTimeInterval = 0

  //MARK: - Methods

  //MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    createAndTestButton.setTitle("Create Array and Test", forState: UIControlState.Normal)
  }

  //MARK: Superclass creation/testing overrides

  override func create(size: Int) {
    creationTime = arrayManipulator.setupWithObjectCount(size)
  }

  override func test() {
    if (arrayManipulator.arrayHasObjects()) {
      insertAt0Time = arrayManipulator.insertNewObjectAtBeginning()
      insertAtMidTime = arrayManipulator.insertNewObjectInMiddle()
      insertAtEndTime = arrayManipulator.addNewObjectAtEnd()
      removeAt0Time = arrayManipulator.removeFirstObject()
      removeAtMidTime = arrayManipulator.removeMiddleObject()
      removeAtEndTime = arrayManipulator.removeLastObject()
      lookupByIndexTime = arrayManipulator.lookupByIndex()
      lookupByObjectTime = arrayManipulator.lookupByObject()
    } else {
      println("Array not set up yet!")
    }
  }

  //MARK: Table View Override


  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    switch indexPath.row {
    case ArrayVCRow.Creation.rawValue:
      cell.textLabel!.text = "Array Creation:"
      cell.detailTextLabel!.text = formattedTime(creationTime)
    case ArrayVCRow.InsertAt0.rawValue:
      cell.textLabel!.text = "Insert At Index 0:"
      cell.detailTextLabel!.text = formattedTime(insertAt0Time)
    case ArrayVCRow.InsertAtMid.rawValue:
      cell.textLabel!.text = "Insert In Middle:"
      cell.detailTextLabel!.text = formattedTime(insertAtMidTime)
    case ArrayVCRow.InsertAtEnd.rawValue:
      cell.textLabel!.text = "Insert At End:"
      cell.detailTextLabel!.text = formattedTime(insertAtEndTime)
    case ArrayVCRow.DeleteAt0.rawValue:
      cell.textLabel!.text = "Remove From Index 0:"
      cell.detailTextLabel!.text = formattedTime(removeAt0Time)
    case ArrayVCRow.DeleteAtMid.rawValue:
      cell.textLabel!.text = "Remove From Middle:"
      cell.detailTextLabel!.text = formattedTime(removeAtMidTime)
    case ArrayVCRow.DeleteAtEnd.rawValue:
      cell.textLabel!.text = "Remove From End:"
      cell.detailTextLabel!.text = formattedTime(removeAtEndTime)
    case ArrayVCRow.LookupByIndex.rawValue:
      cell.textLabel!.text = "Lookup By Index:"
      cell.detailTextLabel!.text = formattedTime(lookupByIndexTime)
    case ArrayVCRow.LookupByObject.rawValue:
      cell.textLabel!.text = "Lookup By Object:"
      cell.detailTextLabel!.text = formattedTime(lookupByObjectTime)
    default:
      println("Unhandled row! \(indexPath.row)")
    }

    return cell
  }
}
