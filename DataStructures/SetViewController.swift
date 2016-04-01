//
//  SetViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit

private enum SetVCRow: Int {
  case Creation = 0,
  Add1Object,
  Add5Objects,
  Add10Objects,
  Remove1Object,
  Remove5Objects,
  Remove10Objects,
  Lookup1Object,
  Lookup10Objects
}

class SetViewController: DataStructuresViewController {

  //MARK: - Variables

  let setManipulator = SwiftSetManipulator()

  var creationTime: NSTimeInterval = 0
  var add1ObjectTime: NSTimeInterval = 0
  var add5ObjectsTime: NSTimeInterval = 0
  var add10ObjectsTime: NSTimeInterval = 0
  var remove1ObjectTime: NSTimeInterval = 0
  var remove5ObjectsTime: NSTimeInterval = 0
  var remove10ObjectsTime: NSTimeInterval = 0
  var lookup1ObjectTime: NSTimeInterval = 0
  var lookup10ObjectsTime: NSTimeInterval = 0

  //MARK: - Methods

  //MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    createAndTestButton.setTitle("Create Set and Test", forState: UIControlState.Normal)
  }

  //MARK: Superclass creation/testing overrides

  override func create(size: Int) {
    creationTime = setManipulator.setupWithObjectCount(size)
  }

  override func test() {
    if (setManipulator.setHasObjects()) {
      add1ObjectTime = setManipulator.add1Object()
      add5ObjectsTime = setManipulator.add5Objects()
      add10ObjectsTime = setManipulator.add10Objects()
      remove1ObjectTime = setManipulator.remove1Object()
      remove5ObjectsTime = setManipulator.remove5Objects()
      remove10ObjectsTime = setManipulator.remove10Objects()
      lookup1ObjectTime = setManipulator.lookup1Object()
      lookup10ObjectsTime = setManipulator.lookup10Objects()
    } else {
      println("Set is not set up yet!")
    }
  }

  //MARK: Table View Override

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)

    switch indexPath.row {
    case SetVCRow.Creation.rawValue:
      cell.textLabel!.text = "Set Creation:"
      cell.detailTextLabel!.text = formattedTime(creationTime)
    case SetVCRow.Add1Object.rawValue:
      cell.textLabel!.text = "Add 1 Object:"
      cell.detailTextLabel!.text = formattedTime(add1ObjectTime)
    case SetVCRow.Add5Objects.rawValue:
      cell.textLabel!.text = "Add 5 Objects:"
      cell.detailTextLabel!.text = formattedTime(add5ObjectsTime)
    case SetVCRow.Add10Objects.rawValue:
      cell.textLabel!.text = "Add 10 Objects:"
      cell.detailTextLabel!.text = formattedTime(add10ObjectsTime)
    case SetVCRow.Remove1Object.rawValue:
      cell.textLabel!.text = "Remove 1 Object:"
      cell.detailTextLabel!.text = formattedTime(remove1ObjectTime)
    case SetVCRow.Remove5Objects.rawValue:
      cell.textLabel!.text = "Remove 5 Objects:"
      cell.detailTextLabel!.text = formattedTime(remove5ObjectsTime)
    case SetVCRow.Remove10Objects.rawValue:
      cell.textLabel!.text = "Remove 10 Objects:"
      cell.detailTextLabel!.text = formattedTime(remove10ObjectsTime)
    case SetVCRow.Lookup1Object.rawValue:
      cell.textLabel!.text = "Lookup 1 Object:"
      cell.detailTextLabel!.text = formattedTime(lookup1ObjectTime)
    case SetVCRow.Lookup10Objects.rawValue:
      cell.textLabel!.text = "Lookup 10 Objects:"
      cell.detailTextLabel!.text = formattedTime(lookup10ObjectsTime)
    default:
      println("Unhandled row! \(indexPath.row)")
    }

    return cell
  }
}
