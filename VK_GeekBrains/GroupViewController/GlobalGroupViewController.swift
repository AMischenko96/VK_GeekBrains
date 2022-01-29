//
//  GlobalGroupViewController.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 06.12.2021.
//

import UIKit

class GlobalGroupViewController: UIViewController {
    let VKServ = VKService()
    var selectedGroup: VKGroup?
    var selectedGroupName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            [weak self] in self?.VKServ.loadData(getData: "groups.search")
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var globalGroupTableView: UITableView! {
        didSet {
            globalGroupTableView.delegate = self
            globalGroupTableView.dataSource = self
        }
    }

}
extension GlobalGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalGroup.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = globalGroupTableView.dequeueReusableCell(withIdentifier: "reusableCell") as! GroupCell
        cell.avatarGroup.image = globalGroup[indexPath.row].avatarGroup
        cell.nameGroup.text = globalGroup[indexPath.row].nameGroup
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedGroup = globalGroup[indexPath.row]
        selectedGroupName = globalGroup[indexPath.row].nameGroup
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
}
