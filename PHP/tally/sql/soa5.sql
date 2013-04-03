select ot.name, 
(select @totalunits :=(select sum(unitcount) from ordertaker_product where fk_ordertakerid = ot.ordertakerid)) as totalunits,
(select @totalproductsproduct :=(select sum((ot_p.unitcount * o_p.productprice))from ordertaker_product ot_p, organization_product o_p, organization o where ot_p.fk_productid = o_p.fk_productid and o.organizationid = o_p.fk_organizationid and ot_p.fk_ordertakerid = 1 and o.organizationid = 9)) as totalproductsproduct
from ordertaker ot, section s
where ot.fk_sectionid = s.sectionid


