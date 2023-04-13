//
//  AddViewController.swift
//  SuperCash
//
//  Created by Camila Aichele on 3/22/23.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    

    // When a new task is created, this closure is called, passing in the newly created task.
    var onAddSub: ((Sub) -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapDoneButton(_ sender: Any) {

        guard let title = titleField.text,
              let description = descriptionField.text,
              let price = priceField.text,
              !title.isEmpty,
              !description.isEmpty,
              !price.isEmpty else {
            presentEmptyFieldsAlert()
            return
        }
        
        let sub = Sub(title: title, description: description, price: price)
        onAddSub?(sub)
        dismiss(animated: true)
    }

    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

    private func presentEmptyFieldsAlert() {
        let alertController = UIAlertController(
            title: "Oops...",
            message: "Both title, description, and price fields must be filled out",
            preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)

        present(alertController, animated: true)
    }
}
