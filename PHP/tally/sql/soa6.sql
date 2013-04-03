select ot.name, ot_p.unitcount, s.name as sectionname
from ordertaker ot, ordertaker_product ot_p, section s 
where ot.fk_sectionid = s.sectionid
and ot_p.fk_ordertakerid = ot.ordertakerid
and s.sectionid = 2 order by ordertakerid desc
	
select o.company, p.name, p.sku, p.columncolorcssclass, o_p.productprice
from organization o, product p, organization_product o_p
where o_p.fk_organizationid = o.organizationid
and o_p.fk_productid = p.productid
and o.organizationid = 2

select ot.name, 
(select @totalunits :=(select sum(unitcount) from ordertaker_product where fk_ordertakerid = ot.ordertakerid)) as totalunits,
(select @totalproductsproduct :=(select sum((ot_p.unitcount * o_p.productprice))from ordertaker_product ot_p, organization_product o_p, organization o where ot_p.fk_productid = o_p.fk_productid and o.organizationid = o_p.fk_organizationid and ot_p.fk_ordertakerid = 1 and o.organizationid = 9)) as totalproductsproduct
from ordertaker ot, section s
where ot.fk_sectionid = s.sectionid


select p.productid, p.casecount,


select distinct(p.productid),sum(ot_p.unitcount),ot_p.fk_ordertakerid as ordertakerid,  p.casecount, ot_p.unitcount, o_p.productprice, o.organizationid
from product p, ordertaker_product ot_p, organization_product o_p, organization_productset o_ps, organization o, productset ps, section s, ordertaker ot
where o.organizationid = o_p.fk_organizationid
and s.fk_organizationid = o.organizationid
and ot.fk_sectionid = s.sectionid
and o_ps.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = ps.productsetid
and o_ps.fk_productsetid = p.fk_productsetid
and o_ps.fk_organizationid = o_p.fk_organizationid
and p.fk_productsetid = ps.productsetid
and o_p.fk_productid = p.productid
and o_p.fk_productid = ot_p.fk_productid
and s.sectionid = 2









and ot_p.fk_productid = p.productid
and ot_p.fk_ordertakerid = ot.ordertakerid
and ot_p.fk_ordertakerid = 1

select p.casecount, ot_p.unitcount, o_p.productprice
from product p, ordertaker_product ot_p, organization_product o_p, 