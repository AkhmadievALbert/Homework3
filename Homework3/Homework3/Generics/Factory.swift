//
//  Factory.swift
//  Homework3
//
//  Created by a.akhmadiev on 24.10.2021.
//

import UIKit

protocol Factory {
    associatedtype Context
    associatedtype Result

    func build(with context: Context) -> Result
}

/// Type Erasure of Factory protocol
struct AnyFactory<Context, Result>: Factory {
    private let factoryBuild: (Context) -> Result

    public init<F: Factory>(_ factory: F) where F.Context == Context, F.Result == Result {
        self.factoryBuild = factory.build
    }

    public func build(with context: Context) -> Result {
        factoryBuild(context)
    }
}

final class ViewFactory: Factory {
    struct Context {
        let color: UIColor
    }

    func build(with context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = context.color
        return view
    }
}
