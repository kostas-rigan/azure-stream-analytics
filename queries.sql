/*
 Query 1:
 Show the total “Amount” of “Type = 0” transactions at “ATM Code = 21” of the last 10 minutes. Repeat as new events
 keep flowing in (use a sliding window).
 */
SELECT Type,
    ATMCode,
    SUM(Amount) as Total_Amount
FROM [input] TIMESTAMP BY EventEnqueuedUtcTime
GROUP BY Type,
    ATMCode,
    SlidingWindow(minute, 10)
HAVING Type = 0
    AND ATMCode = 21;
/*
 Query 2:
 Show the total “Amount” of “Type = 1” transactions at “ATM Code = 21” of the last hour. Repeat once every hour
 (use a tumbling window).
 */
/*
 Query 3:
 Show the total “Amount” of “Type = 1” transactions at “ATM Code = 21” of the last hour. Repeat once every 30 minutes
 (use a hopping window).
 */
SELECT Type,
    ATMCode,
    SUM(Amount) as Total_Amount
FROM [input] TIMESTAMP BY EventEnqueuedUtcTime
GROUP BY Type,
    ATMCode,
    HoppingWindow(Duration(hour, 1), Hop(minute, 30))
HAVING Type = 1
    AND ATMCode = 21;
/*
 Query 4:
 Show the total “Amount” of “Type = 1” transactions per “ATM Code” of the last one hour (use a sliding window).
 */
/*
 Query 5:
 Show the total “Amount” of “Type = 1” transactions per “Area Code” of the last hour. Repeat once every hour (use a
 tumbling window)
 */
SELECT atm.area_code as Area_Code,
    SUM(input.Amount) as Total_Amount
FROM [input] TIMESTAMP BY EventEnqueuedUtcTime
    LEFT JOIN [atm] ON input.ATMCode = atm.atm_code
GROUP BY input.Type,
    atm.area_code,
    TumblingWindow(hour, 1)
HAVING input.Type = 1;
/*
 Query 6:
 Show the total “Amount” per ATM’s “City” and Customer’s “Gender” of the last hour. Repeat once every hour (use a
 tumbling window).
 */
/*
 Query 7:
 Alert (SELECT “1”) if a Customer has performed two transactions of “Type = 1” in a window of an hour (use a sliding
 window)
 */
SELECT customer.card_number as Customer_Card_Number,
    1 as Alert
FROM [input] TIMESTAMP BY EventEnqueuedUtcTime
    LEFT JOIN [customer] ON input.CardNumber = customer.card_number
WHERE input.type = 1
GROUP BY customer.card_number,
    SlidingWindow(hour, 1)
HAVING COUNT(input.EventEnqueuedUtcTime) >= 2;
/*
 Query 8:
 Alert (SELECT “1”) if the “Area Code” of the ATM of the transaction is not the same as the “Area Code” of the “Card
 Number” (Customer’s Area Code) - (use a sliding window)
 */