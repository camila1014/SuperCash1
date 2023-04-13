//
//  SubscriptionsViewController.swift
//  SuperCash
//
//  Created by Camila Aichele on 3/22/23.
//

import UIKit

class SubscriptionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!

    var subs = [Sub]() {
        didSet {
            emptyStateLabel.isHidden = !subs.isEmpty
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // UI candy: Hide 1st / top cell separator
        tableView.tableHeaderView = UIView()

        tableView.dataSource = self

        // Populate mocked data
        // Comment out this line if you want the app to load without any existing tasks.
        subs = Sub.mockedSubs
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Segue to Compose View Controller
        if segue.identifier == "AddSegue" {

            // Since the segue is connected to the navigation controller that manages the ComposeViewController
            // we need to access the navigation controller first...
            if let addNavController = segue.destination as? UINavigationController,
                // ...then get the actual ComposeViewController via the navController's `topViewController` property.
               let addViewController = addNavController.topViewController as? AddViewController {

                // Update the tasks array for any new task passed back via the `onComposeTask` closure.
                addViewController.onAddSub = { [weak self] sub in
                    self?.subs.append(sub)
                }
            }

            // Segue to Detail View Controller
        } else if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? DetailViewController,
                // Get the index path for the current selected table view row.
               let selectedIndexPath = tableView.indexPathForSelectedRow {

                // Get the task associated with the slected index path
                let sub = subs[selectedIndexPath.row]

                // Set the selected task on the detail view controller.
                detailViewController.sub = sub
            }
        }
    }
}

extension SubscriptionsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubCell", for: indexPath) as? SubCell else {
            fatalError("Unable to dequeue Sub Cell")
        }

        cell.configure(with: subs[indexPath.row])

        return cell
    }
}
