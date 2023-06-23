/* 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự */

SELECT 
    *
FROM
    staff
WHERE
    (SUBSTRING_INDEX(name, ' ', - 1) LIKE 'h%')
        OR (SUBSTRING_INDEX(name, ' ', - 1) LIKE 't%')
        OR (SUBSTRING_INDEX(name, ' ', - 1) LIKE 'k%');


/* 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị” */

SELECT 
    id,
    name,
    TIMESTAMPDIFF(YEAR,
        date_of_birth,
        CURDATE()) AS age,
    phone_number,
    address
FROM
    customer
WHERE
    TIMESTAMPDIFF(YEAR,
        date_of_birth,
        CURDATE()) >= 18
        AND TIMESTAMPDIFF(YEAR,
        date_of_birth,
        CURDATE()) <= 50
        AND ((address LIKE '%đà nẵng')
        OR (address LIKE '%quảng trị'));


/* 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”*/

SELECT 
    customer.id,
    customer.name,
    COUNT(contract.id) AS booking_count
FROM
    customer
        LEFT JOIN
    contract ON customer.id = contract.customer_id
        LEFT JOIN
    customer_type ON customer.customer_type_id = customer_type.id
WHERE
    customer_type.id = 1
GROUP BY customer.id
ORDER BY booking_count;

/* 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
(Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). */

SELECT 
    customer.id AS ID,
    customer.name AS 'Name',
    customer_type.name AS 'Rank',
    contract.id AS 'Contract ID',
    service.name AS 'Service',
    contract.begin_date AS 'Begin Date',
    contract.end_date AS 'Finish Date',
    SUM(service.cost + IFNULL(contract_detail.quantity * accompanied_service.price,
            0)) AS 'Total'
FROM
    customer
        LEFT JOIN
    customer_type ON customer.customer_type_id = customer_type.id
        LEFT JOIN
    contract ON contract.customer_id = customer.id
        LEFT JOIN
    service ON contract.service_id = service.id
        LEFT JOIN
    contract_detail ON contract.id = contract_detail.contract_id
        LEFT JOIN
    accompanied_service ON contract_detail.accompanied_service_id = accompanied_service.id
GROUP BY customer.id, contract.id;

/* 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng 
thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)*/

SELECT 
    service.id 'ID',
    service.name AS 'Service Name',
    service.area AS 'Area',
    service.cost AS 'Cost',
    service_type.name AS 'Service Type'
FROM
    service
        JOIN
    contract ON service.id = contract.service_id
        JOIN
    service_type ON service.service_type_id = service_type.id
WHERE
    service.id NOT IN (SELECT 
            service.id
        FROM
            service
                LEFT JOIN
            contract ON service.id = contract.service_id
                LEFT JOIN
            service_type ON service.service_type_id = service_type.id
        WHERE
            MONTH(contract.begin_date) = 1
                OR MONTH(contract.begin_date) = 2
                OR MONTH(contract.begin_date) = 3
                AND YEAR(contract.begin_date) = 2021)
GROUP BY service.id;
 
/* 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các dịch vụ 
đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021 */

SELECT 
    service.id AS 'ID',
    service.name AS 'Service Name',
    service.area AS 'Area',
    service.maximum_capacity AS 'Max Capacity',
    service.cost AS 'Cost',
    service_type.name
FROM
    service
        JOIN
    contract ON service.id = contract.service_id
        JOIN
    service_type ON service.service_type_id = service_type.id
WHERE
    YEAR(contract.begin_date) = 2020
        AND service.id NOT IN (SELECT 
            service.id
        FROM
            service
                JOIN
            contract ON contract.service_id = service.id
        WHERE
            YEAR(contract.begin_date) = 2021)
GROUP BY service.id;

/* 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên. */

-- First Solution
SELECT DISTINCT
    name
FROM
    customer;

-- display names is repeated 
SELECT 
    name
FROM
    customer
GROUP BY name
HAVING COUNT(name) > 1;

-- Second Solution

SELECT 
    name
FROM
    customer
GROUP BY name;

-- Third Solution
SELECT 
    name
FROM
    customer 
UNION SELECT 
    name
FROM
    customer;


/* 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. */

SELECT 
    contract.id,
    contract.end_date,
    contract.deposit,
    contract.customer_id,
    contract.service_id,
    MONTH(contract.end_date) AS month,
    service.cost,
    (service.cost - contract.deposit) AS Revenue
FROM
    contract
        JOIN
    service ON contract.service_id = service.id
WHERE
    YEAR(contract.end_date) = 2021;

SELECT 
    COUNT(customer_id) AS customer_count,
    MONTH(contract.end_date) AS month,
    SUM((service.cost - contract.deposit)) AS Revenue
FROM
    contract
        JOIN
    service ON contract.service_id = service.id
WHERE
    YEAR(contract.end_date) = 2021
GROUP BY MONTH(contract.end_date)
ORDER BY MONTH(contract.end_date);





/* 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm: 
ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 */

SELECT 
    contract.id,
    contract.begin_date,
    contract.end_date,
    contract.deposit,
    abc.sum as sum
FROM
    contract
        LEFT JOIN
    (SELECT 
        contract_detail.contract_id AS id,
            SUM(contract_detail.quantity) AS sum
    FROM
        contract_detail
    GROUP BY contract_detail.contract_id) abc ON contract.id = abc.id;

    

/* 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”. */


SELECT 
    accompanied_service.id, accompanied_service.name
FROM
    accompanied_service
        JOIN
    contract_detail ON accompanied_service.id = contract_detail.accompanied_service_id
        JOIN
    contract ON contract.id = contract_detail.contract_id
        JOIN
    customer ON contract.customer_id = customer.id
        JOIN
    customer_type ON customer.customer_type_id = customer_type.id
WHERE
    customer.address LIKE '%Vinh'
        OR customer.address LIKE '%Quảng Ngãi'
        AND customer_type.id = 1;



/* 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
 so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
 đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.*/

SELECT 
    contract.id,
    staff.name,
    customer.name,
    customer.phone_number,
    service.id,
    service.name,
    sum(contract_detail.quantity) as sum,
    contract.deposit
FROM
    service
        LEFT JOIN
    contract ON service.id = contract.service_id
        LEFT JOIN
    staff ON contract.staff_id = staff.id
        LEFT JOIN
    customer ON contract.customer_id = customer.id
        LEFT JOIN
    contract_detail ON contract.id = contract_detail.contract_id
WHERE
    MONTH(contract.begin_date) = 10
        OR MONTH(contract.begin_date) = 11
        OR MONTH(contract.begin_date) = 12
        AND YEAR(contract.begin_date) = 2020
        AND service.id NOT IN (SELECT 
            service.id
        FROM
            service
                JOIN
            contract ON service.id = contract.service_id
        WHERE
            MONTH(contract.begin_date) = 1
                OR MONTH(contract.begin_date) = 2
                OR MONTH(contract.begin_date) = 3
                OR MONTH(contract.begin_date) = 4
                OR MONTH(contract.begin_date) = 5
                OR MONTH(contract.begin_date) = 6
                AND YEAR(contract.begin_date) = 2020)
GROUP BY contract.id;




/* 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
(Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/


SELECT 
    accompanied_service.id,
    accompanied_service.name,
    SUM(contract_detail.quantity) AS count
FROM
    accompanied_service
        JOIN
    contract_detail ON contract_detail.accompanied_service_id = accompanied_service.id
GROUP BY accompanied_service.id
HAVING count = (SELECT 
        MAX(abc.sum)
    FROM
        (SELECT 
            accompanied_service_id, SUM(quantity) AS sum
        FROM
            contract_detail
        GROUP BY accompanied_service_id) abc);


/* 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm
ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem). */

SELECT 
    contract.id,
    service_type.name,
    accompanied_service.name,
    abc.count
FROM
    (SELECT 
        accompanied_service_id AS id,
            COUNT(accompanied_service_id) AS count
    FROM
        contract_detail
    GROUP BY accompanied_service_id
    HAVING count = 1) abc
        LEFT JOIN
    contract_detail ON contract_detail.accompanied_service_id = abc.id
        LEFT JOIN
    contract ON contract.id = contract_detail.contract_id
        LEFT JOIN
    accompanied_service ON contract_detail.accompanied_service_id = accompanied_service.id
        LEFT JOIN
    service ON contract.service_id = service.id
        LEFT JOIN
    service_type ON service.service_type_id = service_type.id
HAVING count = 1
ORDER BY id;


/* 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021. */


SELECT 
    staff.id,
    staff.name,
    level.name,
    department.name,
    staff.phone_number,
    staff.address
FROM
    (SELECT 
        staff_id AS id, COUNT(staff_id) AS count
    FROM
        contract
    GROUP BY staff_id
    HAVING count <= 3) result
        JOIN
    staff ON staff.id = result.id
        JOIN
    level ON staff.level_id = level.id
        JOIN
    department ON staff.department_id = department.id;



/* 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021. */
DELETE FROM staff 
WHERE
    staff.id NOT IN (SELECT DISTINCT
        staff_id
    FROM
        contract
    
    WHERE
        YEAR(begin_date) = 2019
        OR YEAR(begin_date) = 2020
        OR YEAR(begin_date) = 2021);

/* 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. */


UPDATE customer 
SET 
    customer_type_id = 1
WHERE
    customer.id IN (SELECT 
            result.id
        FROM
            (SELECT 
                customer.id AS id,
                    customer.name AS 'Name',
                    customer_type.name AS 'Rank',
                    SUM(service.cost + IFNULL(accompanied_service.price * contract_detail.quantity, 0)) AS total
            FROM
                customer
            LEFT JOIN contract ON contract.customer_id = customer.id
            LEFT JOIN contract_detail ON contract_detail.contract_id = contract.id
            LEFT JOIN service ON contract.service_id = service.id
            LEFT JOIN accompanied_service ON contract_detail.accompanied_service_id = accompanied_service.id
            LEFT JOIN customer_type ON customer.customer_type_id = customer_type.id
            GROUP BY customer.id
            HAVING customer_type.name = 'Platinum'
                AND total >= 10000000
            ORDER BY customer.id) result); 



/* 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng). */
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer 
WHERE
    customer.id IN (SELECT 
        customer_id
    FROM
        contract
    
    WHERE
        end_date < '2021-01-01');
SET FOREIGN_KEY_CHECKS=1;


/* 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi. */

UPDATE accompanied_service 
SET 
    price = price * 2
WHERE
    accompanied_service.id IN (SELECT 
            result.id
        FROM
            (SELECT 
                accompanied_service_id AS id, SUM(quantity) AS sum
            FROM
                contract_detail
            GROUP BY accompanied_service_id
            HAVING sum >= 10) result);


/* 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi */


SELECT 
    id, name, email, phone_number, date_of_birth, address
FROM
    staff 
UNION ALL SELECT 
    id, name, email, phone_number, date_of_birth, address
FROM
    customer;