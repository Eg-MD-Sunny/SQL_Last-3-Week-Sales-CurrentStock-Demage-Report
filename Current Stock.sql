
SELECT	w.MetropolitanAreaId [MetropolitanAreaID],
        w.Id [WarehousID],
	    w.Name [Warehouse],
        PV.Id [PVID],
		PV.Name [Product],
	    SUM(cws.Shelved + cws.MarkedForRecall) [AvailableStock]

FROM CurrentWarehouseStock cws
join ProductVariant pv on pv.Id = cws.ProductVariantId 
join Warehouse w on w.Id = cws.WarehouseId 

where ProductVariantId in (13687,13516,35004)
and pv.DistributionNetworkId = 1

GROUP BY w.Id,
	     w.Name,
         PV.Id,
		 PV.Name,
		 cws.RequiredStock,
		 w.MetropolitanAreaId


