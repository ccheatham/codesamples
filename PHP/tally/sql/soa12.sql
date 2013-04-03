select s.sectionid, 
p.productid, p.casecount, o_p.productprice, o.organizationid,
(o_p.productprice * IFNULL(ot_p.unitcount,0)) as totalproductmoney,
IFNULL(ot_p.unitcount,0) as  totalproductunitcount
from product p, organization_product o_p, organization_productset o_ps, ordertaker_product ot_p,
organization o, productset ps, section s, ordertaker ot
where o.organizationid = o_p.fk_organizationid
and s.fk_organizationid = o.organizationid
and ot.fk_sectionid = s.sectionid
and ot_p.fk_ordertakerid = ot.ordertakerid
and ot_p.fk_productid = p.productid
and o_ps.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = ps.productsetid
and o_ps.fk_productsetid = p.fk_productsetid
and o_ps.fk_organizationid = o_p.fk_organizationid
and p.fk_productsetid = ps.productsetid  
and s.sectionid = 1
group by p.productid