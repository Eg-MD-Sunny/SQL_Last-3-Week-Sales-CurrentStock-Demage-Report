select  w.metropolitanAreaId,
        s.WarehouseId,
	    w.Name warehosue,
		pv.id,
		pv.Name Product,
		Count(tr.salePrice) Sale_Qty,
		Sum(tr.salePrice) Sale_Price


from ThingRequest tr
join Shipment s on s.id=tr.ShipmentId
join ProductVariant pv on pv.id=tr.ProductVariantId
join Warehouse w on w.id=s.WarehouseId
where s.ReconciledOn is not null
and s.ReconciledOn>= '2022-05-24 00:00 +06:00'
and s.ReconciledOn< '2022-06-14 00:00 +06:00'
and IsCancelled=0
and IsReturned=0
and HasFailedBeforeDispatch=0
and IsMissingAfterDispatch=0
and pv.DistributionNetworkId = 1
and pv.id in (13687,13516,35004)

group by w.metropolitanAreaId,
        s.WarehouseId,
	    w.Name ,
		pv.id,
		pv.Name