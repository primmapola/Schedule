//
//  ViewController.swift
//  Schedule
//
//  Created by Grigory Don on 07.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
     
    }
    
    func setupTabBar() {

        let scheduleViewController = createNaigationController(vc: ScheduleViewController(), itemName: "Schedule", itemImage: "calendar.badge.clock")
        let taskViewController = createNaigationController(vc: TasksViewController(), itemName: "Task", itemImage: "text.badge.checkmark")
        let contactsViewController = createNaigationController(vc: ContactsTableViewController(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")

        viewControllers = [scheduleViewController, taskViewController, contactsViewController]
    }

    func createNaigationController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {

        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)

        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = item
    
        return navigationController

    }
}


