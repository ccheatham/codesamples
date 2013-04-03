select s.sectionid, 
p.productid, p.casecount, o_p.productprice, o.organizationid, ot_p.unitcount, 
sum(ot_p.unitcount) as totalproductunitcount,
(casecount - MOD(sum(ot_p.unitcount),p.casecount)) as requiredextraunits,
((casecount - MOD(sum(ot_p.unitcount),p.casecount)) + sum(ot_p.unitcount)) as newproducttotal,
(((casecount - MOD(sum(ot_p.unitcount),p.casecount)) + sum(ot_p.unitcount)) / p.casecount) as totalcases
from product p, organization_product o_p, organization_productset o_ps, ordertaker_product ot_p,
organization o, productset ps, section s
where o.organizationid = o_p.fk_organizationid
and s.fk_organizationid = o.organizationid
and ot_p.fk_productid = p.productid
and o_ps.fk_organizationid = o.organizationid
and o_ps.fk_productsetid = ps.productsetid
and o_ps.fk_productsetid = p.fk_productsetid
and o_ps.fk_organizationid = o_p.fk_organizationid

and p.fk_productsetid = ps.productsetid
and o_p.fk_productid = p.productid 
and s.sectionid = 7 
group by p.productid