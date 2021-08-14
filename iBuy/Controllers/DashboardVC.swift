//
//  Prueba.swift
//  iBuy
//
//  Created by Camilo Jimenez on 6/08/21.
//

import UIKit

class DashboardVC: UIViewController {
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var emptyState: UIView!
    fileprivate var categoriesViewModel = CategoriesVM()
    fileprivate var categories = [CategoryModel]()
    fileprivate var result: ProductsResponse?
    
    fileprivate func setupCollectionView() {
        let nib = UINib(nibName: Constants.CellIdentifier.categoryCell, bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: Constants.CellIdentifier.categoryCell)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.backgroundColor = .none
        categoriesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    fileprivate func setupSearchButton() {
        searchButton.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        searchButton.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        searchButton.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        let spacing: CGFloat = 10; // the amount of spacing to appear between image and title
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing);
        searchButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0);

    }
    
    @IBAction func searchButtonAction(_ sender: UIButton) {
        self.result = nil
        self.performSegue(withIdentifier: "goToSearch", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesViewModel.getCategories { categoriesRes, error in
            if let e = error {
                print(e)
            } else if let categories = categoriesRes {
                self.categories = categories
                self.categoriesCollectionView.reloadData()
            }
        }
        setupCollectionView()
        setupSearchButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SearchVC {
            vc.itemsList = result
        }
    }
}

extension DashboardVC: UICollectionViewDataSource {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categories.count == 0 {
            emptyState.isHidden = false
            categoriesCollectionView.isHidden = true
        } else {
            emptyState.isHidden = true
            categoriesCollectionView.isHidden = false
        }
        return categories.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.categoryCell, for: indexPath) as! CategoryCell
        cell.setup(titleCategory: categories[indexPath.row].name)
        return cell
    }
}

extension DashboardVC: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width - 15) / 2) // 15 because of paddings
        let height = ((collectionView.frame.width - 15) / 4)

        return CGSize(width: width, height: height)
   }
}

extension DashboardVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoriesViewModel.getItemInCategoryAvailable(category: categories[indexPath.item].id) { itemsRes, error in
            if let e = error {
                print(e)
            } else if let items = itemsRes {
                self.result = items
            }
            
            self.categoriesCollectionView.deselectItem(at: indexPath, animated: false)
            self.performSegue(withIdentifier: "goToSearch", sender: nil)
        }
    }
}
