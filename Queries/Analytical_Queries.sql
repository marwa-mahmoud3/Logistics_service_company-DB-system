select PRODUCTS.ProductName,PRODUCTS.Price from PRODUCTS INNER JOIN PRODUCT_SHIPMENT ON PRODUCTS.ID = PRODUCT_SHIPMENT.Product_ID and PRODUCT_SHIPMENT.Shipment_ID = 1 ;

select COMPANY_NAME from SHIPMENT where SHIPMENT_WEIGHT > 30;

select DISTINCT STORE_NAME , Product_Classification from STORAGE where examination = 'unpass';

select TRANSPORT.operation_name,TRANSPORT_TYPE.transport_type from TRANSPORT INNER JOIN TRANSPORT_TYPE ON TRANSPORT.transport_type = TRANSPORT_TYPE.ID and TRANSPORT.coordination_and_monitoring = 'Pass';
