//
//  MyGroupViewController.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 06.12.2021.
//

import UIKit

class MyGroupViewController: UIViewController {
    let VKServ = VKService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            [weak self] in self?.VKServ.loadData(getData: "groups.get")
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var myGroupTableView: UITableView! {
        didSet {
            myGroupTableView.delegate = self
            myGroupTableView.dataSource = self
        }
    }

}
extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mygroup.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myGroupTableView.dequeueReusableCell(withIdentifier: "reusableCell") as! MyGroupCell
        cell.avatarGroup.image = mygroup[indexPath.row].avatarGroup
        cell.nameGroup.text = mygroup[indexPath.row].nameGroup
        return cell
    }
    
    @IBAction func addGroup (segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup",
        let sourceVC = segue.source as? GlobalGroupViewController,
        let selectedGroup = sourceVC.selectedGroup,
        let selectedGroupName = sourceVC.selectedGroup?.nameGroup{
            if !mygroup.contains(where: { $0.nameGroup == selectedGroupName }) {
            
                mygroup.append(selectedGroup)
            myGroupTableView.reloadData()
            }
        }
    }
    
}
