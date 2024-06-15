# azure-stream-analytics
Project #3 in Big Data Systems Management

# Contents<a class="anchor" id="Contents"></a>
- [Contents](#Contents)
- [Authors](#Authors)
- [Purpose](#Purpose)
- [Setup of Azure](#Setup_of_Azure)

# Authors<a class="anchor" id="Authors"></a>
> Konstantinos Riganas, Student<br />
> Department of Management Science and Technology <br />
> Athens University of Economics and Business <br />
> t8200145@aueb.gr

> Nikolaos Nikolaidis, Student<br />
> Department of Management Science and Technology <br />
> Athens University of Economics and Business <br />
> t8200120@aueb.gr

# Purpose<a class="anchor" id="Purpose"></a>
<h3>Process a Data Stream of ATM transactions</h3>

- **Query 1:** Show the total “Amount” of “Type = 0” transactions at “ATM Code = 21” of the last 10 minutes. Repeat as new events
 keep flowing in (use a sliding window).

- **Query 2:** Show the total “Amount” of “Type = 1” transactions at “ATM Code = 21” of the last hour. Repeat once every hour
 (use a tumbling window).

- **Query 3:** Show the total “Amount” of “Type = 1” transactions at “ATM Code = 21” of the last hour. Repeat once every 30 minutes
 (use a hopping window).

- **Query 4:** Show the total “Amount” of “Type = 1” transactions per “ATM Code” of the last one hour (use a sliding window).

- **Query 5:** Show the total “Amount” of “Type = 1” transactions per “Area Code” of the last hour. Repeat once every hour (use a
 tumbling window)

- **Query 6:** Show the total “Amount” per ATM’s “City” and Customer’s “Gender” of the last hour. Repeat once every hour (use a tumbling window).

- **Query 7:** Alert (SELECT “1”) if a Customer has performed two transactions of “Type = 1” in a window of an hour (use a sliding
 window)

- **Query 8:** Alert (SELECT “1”) if the “Area Code” of the ATM of the transaction is not the same as the “Area Code” of the “Card
 Number” (Customer’s Area Code) - (use a sliding window)


# Setup of Azure<a class="anchor" id="Setup_of_Azure"></a>

**Stream Demo Overview**
![Stream Demo Overview](Stream.png)

**Running Query 8**
![Running Query 8](Query_8.png)