select o.company, p.name, p.productid, sum(ot_p.unitcount) as totalproductunits, (sum(ot_p.unitcount) * o_p.productprice) as totalproductmoney ,p.sku, p.columncolorcssclass, o_p.productprice
from organization o, product p, organization_product o_p, ordertaker_product ot_p, ordertaker ot ,section s
where o_p.fk_organizationid = o.organizationid
and o_p.fk_productid = p.productid
and ot_p.fk_productid = o_p.fk_productid
and ot.ordertakerid = ot_p.fk_ordertakerid
and ot.fk_sectionid = s.sectionid
and o.organizationid = 9 
group by p.productid


select o_p.fk_productid as productid, count(o_p.fk_productid)
from organization o, product p, organization_product o_p, productset ps, organization_productset o_ps
where o_p.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = p.fk_productsetid
and o_p.fk_productid = p.productid
and o.organizationid = 9 
group by p.productid
