select p.productid, p.name as productname, p.sku, o.company as organizationname
from product p, productset ps, organization o, organization_productset o_p
where o_p.fk_productsetid = ps.productsetid
and o.organizationid = o_p.fk_organizationid
and p.fk_productsetid = ps.productsetid
and organizationid = 9