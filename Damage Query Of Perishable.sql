-- Damage Query Of Perishable

SELECT max(te.ThingId) MaximumThingId,min(te.ThingId) MinimumThingId
FROM ThingEvent te
JOIN ThingTransaction tt on tt.id = te.ThingTransactionId
WHERE tt.CreatedOn >= '2022-05-24 00:00 +06:00'
AND tt.CreatedOn < '2022-06-14 00:00 +06:00'
AND ToState in ( 8, 32 )

--#########################################################


Select w.MetropolitanAreaId,
	   te.WarehouseId,
	   w.Name [Warehouse],
	   pv.id, 
	   pv.Name, 
	   count(*) Quantity

from thing t
join ThingEvent te on te.ThingId=t.id
join ThingTransaction tt on tt.id=te.ThingTransactionId
join productvariant pv on pv.id=t.ProductVariantId
join Warehouse w on w.Id=te.WarehouseId

where tt.CreatedOn >= '2022-05-24 00:00 +06:00'
and tt.CreatedOn < '2022-06-14 00:00 +06:00'
and ToState in (8,32)
and t.id>=36927122 ------ MinimumThingId
and t.id<=152783301 ------ MaximumThingId
and pv.DistributionNetworkId = 1
and pv.id in (13687,13516,35004)

group by w.MetropolitanAreaId,te.WarehouseId,w.Name,pv.id,pv.name
