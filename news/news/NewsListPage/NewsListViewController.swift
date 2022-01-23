//
//  ViewController.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import UIKit
import RxSwift
import RxCocoa

import RealmSwift
import RxRealm

class NewsListViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.identifier)

        return tableView
    }()

    private var viewModel = NewsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        setupNavigationBarTitleView()
        viewModel.didUpdateData = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.getNewsListViewObject()
    }

   private func initView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    private func setupNavigationBarTitleView() {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Exam"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
       }

}


extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.news?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath) as? NewsListTableViewCell else { return  UITableViewCell() }

        let new = viewModel.news![indexPath.row]
        cell.configure(thumbnail: new.urlToImage, text: new.title)

        return cell
    }
    
}
