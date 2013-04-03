select o_p.fk_productid
from organization_product o_p, organization_productset o_ps
where o_ps.fk_organizationid = o_p.fk_organizationid
and o_p.fk_organizationid = 9
and o_ps.fk_productsetid = 2

select ot.name, ot_p.unitcount, s.name as sectionname
from ordertaker ot, ordertaker_product ot_p, section s 
where ot.fk_sectionid = s.sectionid
and ot_p.fk_ordertakerid = ot.ordertakerid
and s.sectionid = 1
order by ordertakerid desc

truncate table `ordertaker`
truncate table `ordertaker_product`