//
//  NewListTableViewCell.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import UIKit
import SnapKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {

    static var identifier = "NewsListTableViewCell"

    private lazy var thumbnailImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(label)

        thumbnailImageView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.width.height.equalTo(60).priority(999)
        }

        label.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.left.equalTo(thumbnailImageView.snp.right).inset(-10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configure(thumbnail: String, text: String) {

        label.text = text
        thumbnailImageView.loadImage(thumbnail)

    }

    override func prepareForReuse() {

        label.text = ""
        thumbnailImageView.image = nil

    }

}
