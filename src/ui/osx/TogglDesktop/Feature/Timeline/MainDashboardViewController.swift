//
//  MainDashboardViewController.swift
//  TogglDesktop
//
//  Created by Nghia Tran on 6/17/19.
//  Copyright © 2019 Alari. All rights reserved.
//

import Cocoa

final class MainDashboardViewController: NSViewController {

    private struct Constants {
        static let TimeEntryXibName = NSNib.Name("TimeEntryListViewController")
        static let TimelineXibName = NSNib.Name("TimelineDashboardViewController")
        static let TimerXibName = NSNib.Name("TimerEditViewController")
    }

    enum Tab: Int {
        case timeEntryList = 0
        case timeline = 1
    }

    // MARK: OUTLET

    @IBOutlet weak var timerContainerView: NSView!
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var timeEntryTabContainerView: NSView!
    @IBOutlet weak var timelineTabContainerView: NSView!
    @IBOutlet weak var listBtn: FlatButton!
    @IBOutlet weak var timelineBtn: FlatButton!
    @IBOutlet weak var tabButtonContainer: NSView!
    @IBOutlet weak var headerContainerView: NSView!
    
    // MARK: Controllers

    @objc lazy var timeEntryController = TimeEntryListViewController(nibName: Constants.TimeEntryXibName, bundle: nil)
    @objc lazy var timelineController = TimelineDashboardViewController(nibName: Constants.TimelineXibName, bundle: nil)
    @objc lazy var timerController = TimerEditViewController(nibName: Constants.TimerXibName, bundle: nil)
    
    // MARK: Variables

    private var currentTab = Tab.timeEntryList {
        didSet {
            guard currentTab != oldValue else { return }
            updateTabLayout()
        }
    }

    // MARK: View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        initCommon()
<<<<<<< HEAD
        initNotification()
=======
>>>>>>> feature/timeline-ui
        initTimerView()
        initTabs()
    }

<<<<<<< HEAD
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

=======
>>>>>>> feature/timeline-ui
    @IBAction func listBtnOnTap(_ sender: Any) {
        currentTab = .timeEntryList
    }

    @IBAction func timelineBtnOnTap(_ sender: Any) {
        currentTab = .timeline
    }
<<<<<<< HEAD

    @objc func timelineDataNotification(_ noti: Notification) {
        guard let cmd = noti.object as? TimelineDisplayCommand else { return }
        timelineController.render(with: cmd)
    }
=======
>>>>>>> feature/timeline-ui
}

// MARK: Private

extension MainDashboardViewController {

    fileprivate func initCommon() {
        listBtn.isSelected = true
        timeEntryController.delegate = self
        headerContainerView.applyShadow(color: .black, opacity: 0.1, radius: 6.0)
    }

<<<<<<< HEAD
    fileprivate func initNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.timelineDataNotification(_:)),
                                               name: NSNotification.Name(kDisplayTimeline),
                                               object: nil)
    }

=======
>>>>>>> feature/timeline-ui
    fileprivate func initTabs() {
        timeEntryTabContainerView.addSubview(timeEntryController.view)
        timeEntryController.view.edgesToSuperView()
        timelineTabContainerView.addSubview(timelineController.view)
        timelineController.view.edgesToSuperView()
    }

    fileprivate func initTimerView() {
        timerContainerView.addSubview(timerController.view)
        timerController.view.edgesToSuperView()
    }

    fileprivate func updateTabLayout() {
        tabView.selectTabViewItem(at: currentTab.rawValue)
<<<<<<< HEAD
        updateNextKeyView()
=======
>>>>>>> feature/timeline-ui
        switch currentTab {
        case .timeEntryList:
            listBtn.isSelected = true
            timelineBtn.isSelected = false
        case .timeline:
            timelineBtn.isSelected = true
            listBtn.isSelected = false
        }
    }
<<<<<<< HEAD

    fileprivate func updateNextKeyView() {
        switch currentTab {
        case .timeline:
            timerController.autoCompleteInput.nextKeyView = listBtn
            listBtn.nextKeyView = timelineBtn
            timelineBtn.nextKeyView = timelineController.recordSwitcher
            timelineController.updateNextKeyView()
            timelineController.datePickerView.nextDateBtn.nextKeyView = timerController.autoCompleteInput
        case .timeEntryList:
            timerController.autoCompleteInput.nextKeyView = listBtn
        }
    }
=======
>>>>>>> feature/timeline-ui
}

// MARK: TimeEntryListViewControllerDelegate
// It's for backward compatible in TimeEntryListViewController

extension MainDashboardViewController: TimeEntryListViewControllerDelegate {

    func isTimerFocusing() -> Bool {
        return timerController.autoCompleteInput.currentEditor() != nil
    }

    func containerViewForTimer() -> NSView! {
        return timerContainerView
    }
}
