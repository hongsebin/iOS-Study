let starbucks = 별다방()
starbucks.open()

let sangGab = Customer(name: "sangGab", money: 10000)

let menu = sangGab.bringMenu(store: starbucks)[0]

let personalOption: [PersonalOption] = [.espresso(1),
                                        .ice(.normal),
                                        .water(.more),
                                        .whipping(.none)]

let coffee = starbucks.order(orderSheet: 별다방.OrderSheet(customer: sangGab,
                                                        coffee: menu,
                                                        isHot: true,
                                                        coffeeSize: .grande,
                                                        cupType: .disposable,
                                                        personalOption: personalOption))

coffee?.personalOptions


sangGab.drink(drink: coffee)

