//
//  DataStructuresViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit

/**
* Base subclass for the three view controllers, which handles most of the UI setup.
*/
class DataStructuresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  //MARK: - Variables

  //MARK: IBOutlets

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var resultsTableView: UITableView!
  @IBOutlet weak var createAndTestButton: UIButton!
  @IBOutlet weak var testOnlyButton: UIButton!
  @IBOutlet weak var spinner: UIActivityIndicatorView!

  //MARK: item tracking

  private var numberOfItems: Int = 1000 //Default to 1000

  //MARK: Lazy-instantiated variables

  lazy private var numberFormatter: NSNumberFormatter = {
    var formatter = NSNumberFormatter()
    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
    return formatter
    }()

  lazy private var timeNumberFormatter: NSNumberFormatter = {
    var formatter = NSNumberFormatter()
    formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
    let digits = 6
    formatter.minimumFractionDigits = digits
    formatter.maximumFractionDigits = digits
    return formatter
    }()

  //MARK: - Methods

  //MARK: Init

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

  }

  //MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    testOnlyButton.enabled = false
    resultsTableView.scrollEnabled = false
    updateCountLabel()
  }

  //MARK: Create/Test

  func create(size: Int) {
    println("Override this method in " + self.description + ", but do not call super.")
  }

  func test() {
    println("Override this method in " + self.description + ", but do not call super.")
  }

  //MARK: Convenience methods

  func updateCountLabel() {
    countLabel.text = "Number of items: \(numberFormatter.stringFromNumber(numberOfItems)!)"
  }

  func setSliderValueProgrammatically(value: Int) {
    slider.value = Float(value)
    sliderAdjusted(slider)
  }

  func setControlsEnabled(enabled: Bool) {
    testOnlyButton.enabled = enabled
    createAndTestButton.enabled = enabled
    slider.enabled = enabled
    if enabled {
      spinner.stopAnimating()
    } else {
      spinner.startAnimating()
    }
  }

  func formattedTime(time: NSTimeInterval) -> String? {
    return timeNumberFormatter.stringFromNumber(time)
  }

  //MARK: IBActions

  @IBAction func sliderAdjusted(adjustedSlider: UISlider) {
    numberOfItems = Int(ceil(adjustedSlider.value))
    testOnlyButton.enabled = false
    updateCountLabel()
  }

  @IBAction func createAndTest() {
    setControlsEnabled(false)

    //Fire the heavy lifting in the background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
      self.create(self.numberOfItems)
      self.test()
      dispatch_async(dispatch_get_main_queue()) {
        //Update the UI on the main thread
        self.resultsTableView.reloadData()
        self.setControlsEnabled(true)
      }
    }
  }

  @IBAction func testOnly() {
    setControlsEnabled(false)

    //Fire the heavy lifting in the background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
      self.test()
      dispatch_async(dispatch_get_main_queue()) {
        //Update the UI on the main thread
        self.resultsTableView.reloadData()
        self.setControlsEnabled(true)
      }
    }
  }

  //MARK: UITableViewDataSource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //There will always be one section
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //There are always 9 items
    return 9
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 26
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //In the superclass, just return an empty cell
    let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "REUSE")

    cell.textLabel!.text = "OVERRIDE"
    cell.detailTextLabel!.text = "in subclass!"
    cell.detailTextLabel!.textColor = UIColor.blackColor()
    cell.selectionStyle = UITableViewCellSelectionStyle.None
    return cell
  }
}
