//
//  AllGroupsViewController.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

import UIKit

final class AllGroupsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private let service = GroupService()
    private let serviceImage = FriendsServiceManager()
    
    private var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchGroups()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell
        else {
            return UITableViewCell()
        }

        serviceImage.loadImage(url: groups[indexPath.row].photo100) { image in
            cell.avatarImage.image = image
            
        }
        cell.nameLabel.text = groups[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groups[indexPath.row]
//        delegate?.groupDidSelect(group: group)
        navigationController?.popViewController(animated: true)
    }
}

private extension AllGroupsViewController {
    func fetchGroups() {
        service.loadGroups { [weak self] result in
            switch result {
            case .success(let group):
                DispatchQueue.main.async {
                    self?.groups = group
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
