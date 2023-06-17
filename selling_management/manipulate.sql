-- insert

insert into customer_info
values 
(1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);

insert into order_info
values 
(1,1,"2006-01-21",null),
(2,2,"2006-03-23",null),
(3,1,"2006-03-16",null);

insert into product_info
values
(1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Hoa",7),
(4,"Quat",1),
(5,"Bep Dien",2);

insert into order_detail
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);


/*SELECT
Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng order*/

SELECT 
    order_id, order_date, order_total_price
FROM
    order_info;

--/*Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách*/

SELECT 
    c.customer_id, c.customer_name, c.customer_age
FROM
    order_info o
        JOIN
    customer_info c ON o.customer_id = c.customer_id
GROUP BY c.customer_id;

/*Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào*/

SELECT 
    *
FROM
    customer_info c
        LEFT JOIN
    order_info o ON c.customer_id = o.customer_id
WHERE
    o.order_id <=> NULL;

/*Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
(Giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)*/

SELECT 
    oi.order_id,
    oi.order_date,
    p.product_name,
    p.product_price * od.order_detail_quantity AS total
FROM
    order_detail od
        JOIN
    product_info p ON od.product_id = p.product_id
        JOIN
    order_info oi ON od.order_id = oi.order_id


