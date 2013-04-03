select p.productid, p.casecount, o_p.productprice, o.organizationid,
sum(IFNULL(ot_p.unitcount,0)) as totalproductunitcount,
(casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)) as requiredextraunits,
((casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)) + sum(IFNULL(ot_p.unitcount,0))) as newproducttotal,
IF(sum(IFNULL(ot_p.unitcount,0))>0,(((casecount - MOD(sum(IFNULL(ot_p.unitcount,0)),p.casecount)) + sum(IFNULL(ot_p.unitcount,0))) / p.casecount),0) as totalcases
from product p, organization_product o_p, organization_productset o_ps, ordertaker_product ot_p,
organization o, productset ps, ordertaker ot
where o.organizationid = o_p.fk_organizationid
and ot_p.fk_ordertakerid = ot.ordertakerid
and ot_p.fk_productid = p.productid
and o_ps.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = ps.productsetid
and o_ps.fk_productsetid = p.fk_productsetid
and o_ps.fk_organizationid = o_p.fk_organizationid
and p.fk_productsetid = ps.productsetid
and o_p.fk_productid = p.productid
and o.organizationid = 9 
group by p.productid


select sum(ot_p.unitcount) as totalproductunits
from section s, ordertaker_product ot_p, ordertaker ot
where ot.fk_sectionid = s.sectionid
and ot_p.fk_ordertakerid = ot.ordertakerid
and s.sectionid = 4
and ot_p.fk_productid = 6
