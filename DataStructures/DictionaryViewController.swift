//
//  DictionaryViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit

private enum DictionaryVCRow: Int {
  case Creation = 0,
  Add1Entry,
  Add5Entries,
  Add10Entries,
  Remove1Entry,
  Remove5Entries,
  Remove10Entries,
  Lookup1Entry,
  Lookup10Entries
}

class DictionaryViewController: DataStructuresViewController {

  //MARK: - Variables

  let dictionaryManipulator: DictionaryManipulator = SwiftDictionaryManipulator()

  var creationTime: NSTimeInterval = 0
  var add1EntryTime: NSTimeInterval = 0
  var add5EntriesTime: NSTimeInterval = 0
  var add10EntriesTime: NSTimeInterval = 0
  var remove1EntryTime: NSTimeInterval = 0
  var remove5EntriesTime: NSTimeInterval = 0
  var remove10EntriesTime: NSTimeInterval = 0
  var lookup1EntryTime: NSTimeInterval = 0
  var lookup10EntriesTime: NSTimeInterval = 0

  //MARK: - Methods

  //MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    createAndTestButton.setTitle("Create Dictionary and Test", forState: UIControlState.Normal)
  }

  //MARK: Superclass creation/testing overrides

  override func create(size: Int) {
    creationTime = dictionaryManipulator.setupWithEntryCount(size)
  }

  override func test() {
    if dictionaryManipulator.dictHasEntries() {
      add1EntryTime = dictionaryManipulator.add1Entry()
      add5EntriesTime = dictionaryManipulator.add5Entries()
      add10EntriesTime = dictionaryManipulator.add10Entries()
      remove1EntryTime = dictionaryManipulator.remove1Entry()
      remove5EntriesTime = dictionaryManipulator.remove5Entries()
      remove10EntriesTime = dictionaryManipulator.remove10Entries()
      lookup1EntryTime = dictionaryManipulator.lookup1EntryTime()
      lookup10EntriesTime = dictionaryManipulator.lookup10EntriesTime()
    } else {
      println("Dictionary not yet set up!")
    }
  }

  //MARK: Table View Override

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)

    switch indexPath.row {
    case DictionaryVCRow.Creation.rawValue:
      cell.textLabel!.text = "Dictionary Creation:"
      cell.detailTextLabel!.text = formattedTime(creationTime)
    case DictionaryVCRow.Add1Entry.rawValue:
      cell.textLabel!.text = "Add 1 Entry:"
      cell.detailTextLabel!.text = formattedTime(add1EntryTime)
    case DictionaryVCRow.Add5Entries.rawValue:
      cell.textLabel!.text = "Add 5 Entries:"
      cell.detailTextLabel!.text = formattedTime(add5EntriesTime)
    case DictionaryVCRow.Add10Entries.rawValue:
      cell.textLabel!.text = "Add 10 Entries:"
      cell.detailTextLabel!.text = formattedTime(add10EntriesTime)
    case DictionaryVCRow.Remove1Entry.rawValue:
      cell.textLabel!.text = "Remove 1 Entry:"
      cell.detailTextLabel!.text = formattedTime(remove1EntryTime)
    case DictionaryVCRow.Remove5Entries.rawValue:
      cell.textLabel!.text = "Remove 5 Entries:"
      cell.detailTextLabel!.text = formattedTime(remove5EntriesTime)
    case DictionaryVCRow.Remove10Entries.rawValue:
      cell.textLabel!.text = "Remove 10 Entries:"
      cell.detailTextLabel!.text = formattedTime(remove10EntriesTime)
    case DictionaryVCRow.Lookup1Entry.rawValue:
      cell.textLabel!.text = "Lookup 1 Entry:"
      cell.detailTextLabel!.text = formattedTime(lookup1EntryTime)
    case DictionaryVCRow.Lookup10Entries.rawValue:
      cell.textLabel!.text = "Lookup 10 Entries:"
      cell.detailTextLabel!.text = formattedTime(lookup10EntriesTime)
    default:
      println("Unhandled row! \(indexPath.row)")
    }

    return cell
  }
}