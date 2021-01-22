//
//  CoinsFavoritesViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 22/01/21.
//

import UIKit

class CoinsFavoritesViewController: UIViewController {
    
    
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    private lazy var titleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = blackColor
        return view
    }()
    
    private lazy var lblCoin: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "Moeda Digital"
        return label
    }()
    
    private lazy var lblDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "4 jan 2020"
        return label
    }()
    
    private lazy var favoritesView: UIView = {
        let view = UIView()
        
        view.backgroundColor = blackColor
        return view
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = blackColor
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}


extension CoinsFavoritesViewController: ViewConfiguration{
    func buildViewHierarchy() {
        view.addSubview(titleView)
        titleView.addSubview(lblCoin)
        titleView.addSubview(lblDate)
        view.addSubview(favoritesView)
        favoritesView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(80)
        }
        lblCoin.snp.makeConstraints { (make) in
            make.top.equalTo(titleView).offset(10)
            make.left.equalTo(titleView).offset(10)
            make.right.equalTo(titleView).inset(10)
        }
        
        lblDate.snp.makeConstraints { (make) in
            make.top.equalTo(lblCoin.snp.bottom).offset(8)
            make.left.equalTo(titleView).offset(10)
            make.right.equalTo(titleView).inset(10)
        }
        
        favoritesView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(1)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(favoritesView).offset(20)
            make.left.equalTo(favoritesView).offset(20)
            make.right.equalTo(favoritesView).inset(20)
            make.bottom.equalTo(favoritesView).inset(10)
        }
    }
    
    func configureViews() {
        view.backgroundColor = .white
        
    }
    
}

extension CoinsFavoritesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoritesCollectionViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    
}
