#! /usr/local/bin/jq -s -f

.[]
|
group_by(."Exchange")[]
    |
    {
        Exchange: .[0].Exchange,
        BuyOrders: [.[]|select(.OrderType=="LIMIT_BUY")]|length,
        SellOrders: [.[]|select(.OrderType=="LIMIT_SELL")]|length
    }
