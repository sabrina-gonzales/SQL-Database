/*
4.2 Query 2 A subscription kind is identified by its mode and interval.  For a subscription, paymentReceived indicates whether payment has been received
for that subscription. Write a SQL query which finds the phone and name for subscribers who have a subscription whose rate is more than 137.25 and for
which payment has not been received. The rows in your result should appear in alphabetical order by name.  If two result rows have the same name, then
the row with the bigger phone number should appear before the row with the smaller phone number.   No duplicates should appear in your result.
*/


SELECT DISTINCT sr.subscriberPhone, sr.subscriberName
FROM Subscribers sr, Subscriptions sn, SubscriptionKinds sk
WHERE sr.subscriberPhone = sn.subscriberPhone
  AND sn.subscriptionMode = sk.subscriptionMode
  AND sn.subscriptionInterval = sk.subscriptionInterval
  AND sk.rate > 137.25
  AND NOT sn.paymentReceived
ORDER BY sr.subscriberName, sr.subscriberPhone DESC;

-- OR could be

SELECT sr.subscriberPhone, sr.subscriberName
FROM Subscribers sr
WHERE EXISTS ( SELECT *
               FROM Subscriptions sn, SubscriptionKinds sk
               WHERE sr.subscriberPhone = sn.subscriberPhone
                 AND sn.subscriptionMode = sk.subscriptionMode
                 AND sn.subscriptionInterval = sk.subscriptionInterval
                 AND sk.rate > 137.25
                 AND NOT sn.paymentReceived )
ORDER BY sr.subscriberName, sr.subscriberPhone DESC;
