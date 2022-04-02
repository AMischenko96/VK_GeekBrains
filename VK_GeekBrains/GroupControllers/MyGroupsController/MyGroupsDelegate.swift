//
//  MyGroupsDelegate.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

import UIKit

/// Протокол делегата
//protocol MyGroupsDelegate: AnyObject {
//
//    /// Выбрана группа
//    ///   - Parameters:
//    ///   - group: Группа
//    func groupDidSelect(group: GroupModel)
//}

final class MyGroupsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

 //   var myGroups: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addGroup" {
            guard segue.destination is AllGroupsViewController else { return }
   //         vc.delegate = self
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MyGroupsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }
//        cell.avatarImage.image = UIImage(named: myGroups[indexPath.row].image) ?? UIImage()
//        cell.nameLabel.text = myGroups[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//// MARK: - MyGroupsDelegate
//extension MyGroupsController: MyGroupsDelegate {
//    func groupDidSelect(group: GroupModel) {
//        if !myGroups.contains(group) {
//            myGroups.append(group)
//            tableView.reloadData()
//        }
//    }
//}
