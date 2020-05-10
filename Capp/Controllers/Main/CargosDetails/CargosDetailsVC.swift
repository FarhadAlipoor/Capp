//
//  CargosDetailsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class CargosDetailsVC: MyVC {
    
    func configure(cargo:JVPSCargo , mode: CargosDetailsVM.Mode) {
        viewModel.vpsCargo = cargo
        viewModel.detailsMode = mode
    }
    
    let viewModel = CargosDetailsVM()
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblDistination: UILabel!
    @IBOutlet weak var lblOriginAddress: UILabel!
    @IBOutlet weak var lblDistinationAddress: UILabel!
    @IBOutlet weak var lblShippingRate: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lbltimeOfLoading: UILabel!
    @IBOutlet weak var lblRemain: UILabel!
    @IBOutlet weak var lblCargoNumber: UILabel!
    @IBOutlet weak var lblCargoDescription: UILabel!
    @IBOutlet weak var cnsOriginAddressHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsDistinationAddressHeight: NSLayoutConstraint!
    @IBOutlet weak var vwFavoriteBtns: UIView!
    @IBOutlet weak var vwGetPermitBtn: UIView!
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)

    override func viewDidLoad() {
        setupViews()
        title = "CargoDetails".text
        let panGusture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGusture)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tap)
    }
    
    func setupViews() {
        switch viewModel.detailsMode {
        case .permit:
            vwGetPermitBtn.isHidden = false
            vwFavoriteBtns.isHidden = true
            break
        case .saloon:
            vwGetPermitBtn.isHidden = true
            vwFavoriteBtns.isHidden = false
        }
        lblProductName.text = viewModel.vpsCargo?.cargo ?? ""
        lblCompanyName.text = viewModel.vpsCargo?.company ?? ""
        lblOrigin.text = viewModel.vpsCargo?.loading ?? ""
        lblDistination.text = viewModel.vpsCargo?.distination ?? ""
        lblOriginAddress.text = viewModel.vpsCargo?.distination ?? ""
       // lblDistinationAddress.text = viewModel.vpsCargo
        lblShippingRate.text = viewModel.vpsCargo?.cargoCost.rial() ?? 0.rial()
        lblWeight.text = viewModel.vpsCargo?.weight
        lbltimeOfLoading.text = viewModel.vpsCargo?.endDateTime
        lblRemain.text = "\(viewModel.vpsCargo?.remain ?? 0)"
        lblCargoNumber.text = "\(viewModel.vpsCargo?.masterID ?? 0)"
        lblCargoDescription.text = viewModel.vpsCargo?.description ?? ""
    }
    @objc func handleTapGesture() {
        dismissMe()
    }
    
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    @IBAction func btngetPermitPressed(_ sender: Any) {
        showLoading()
        viewModel.requestToAddPermit(onSuccess: addPermitSuccessfull, onFailure: failure)
    }
    
    @IBAction func btnShowFavoriteCargosPressed(_ sender: Any) {
        let favoritesCargosVc = Storyboards.main.instantiateViewController(withIdentifier: "favoritesCargosVc") as! FavoritesCargosVC
        let mynav = MyNav(rootViewController: favoritesCargosVc, patternNavBar: false)
        present(mynav, animated: true, completion: nil)
        // performSegue(withIdentifier: "showFavoritesCargos", sender: self)
    }
    @IBAction func btnAddToFavoritePressed(_ sender: Any) {
        StoringData.addFavoriteCargos(viewModel.vpsCargo!)
        actShowSnackbar("بار مورد نظر به لیست علاقه مندی شما اضافه شد" , actionTitle: "Close".text)
        dismissMe()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController{
            if let favoritesVC = navVC.childViewControllers[0] as? FavoritesCargosVC{
            }
        }
    }
    func addPermitSuccessfull() {
        hideLoading()
    }
}
