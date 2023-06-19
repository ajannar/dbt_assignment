
{% docs orders_status %}

Orders can be in one of the following statuses:

| status         | description                                                               |
|----------------|---------------------------------------------------------------------------|
| created        | Order has been created but has not yet left the warehouse                 |
| shipped        | Order has been shipped to the customer and is currently in transit         |
| delivered      | Order has been received by the customer                                   |
| approved       | Order has been approved but has not yet left the warehouse                |
| canceled       | Order has been canceled by customer or seller                             |
| invoiced       | Invoice has been generated for the order                                  |
| processing     | Order approval is in process                                              |
| unavailable    | Status of order is not available                                          |
| returned       | The order has been returned by the customer and received at the warehouse |


{% enddocs %}


