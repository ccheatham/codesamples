select p.productid, p.name as productname, p.sku, ps.name as productsetname, o.*, o_p.productprice
from product p, productset ps, organization o, organization_productset o_ps, organization_product o_p
where o_ps.fk_productsetid = ps.productsetid
and o.organizationid = o_ps.fk_organizationid
and o_p.fk_productid = p.productid
and o_p.fk_organizationid = o.organizationid
and p.fk_productsetid = ps.productsetid
and organizationid = 9