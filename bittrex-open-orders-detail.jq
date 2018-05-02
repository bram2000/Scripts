#! /usr/local/bin/jq -s -f

.[]
|
[group_by(."Exchange")[]
    |
    {
        Exchange: .[0].Exchange,
        BuyOrders: [.
            |sort_by(.Limit)
            |.[]
            |select(.OrderType=="LIMIT_BUY")
            |
            {
                Limit: .Limit,
                Quantity: .Quantity
            }],
        SellOrders: [.
            |sort_by(.Limit)
            |.[]
            |select(.OrderType=="LIMIT_SELL")
            |
            {
                Limit: .Limit,
                Quantity: .Quantity
            }]
    }]
