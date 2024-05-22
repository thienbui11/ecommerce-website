Cấu trúc của project

eCommerceWebsite

├── db

│   ├── Nhom8_TMDT.sql                                 (Chứa database)

├── src

│   ├── main

│   │   ├── java                                       (Controller & Model layer)

│   │   │   ├── com.ecommerce.controller

│   │   │   │   └── com.ecommerce.controller.admin     (Controller của admin)

│   │   │   │   │   └── category

│   │   │   │   │   └── customer

│   │   │   │   │   └── email

│   │   │   │   │   └── order

│   │   │   │   │   └── product

│   │   │   │   │   └── review

│   │   │   │   │   └── user

│   │   │   │   └── com.ecommerce.controller.common    

│   │   │   │   │   └── filter                         (Chứa các filter kiểm tra quyền truy cập từ các URL cụ thể)

│   │   │   │   │   └── error                          (Chứa các navigation servlets để xử lý lỗi)

│   │   │   │   └── com.ecommerce.controller.shop      (Controller của shop pages)

│   │   │   │   │   └── cart

│   │   │   │   │   └── customer

│   │   │   │   │   └── order

│   │   │   │   │   └── payment

│   │   │   │   │   └── product

│   │   │   │   │   └── review

│   │   │   ├── com.ecommerce.model

│   │   │   │   └── dao                                (Các Classes kết nối với database)

│   │   │   │   └── domain                             (Bao gồm các classes của domain)

│   │   │   │   └── entity                             (Bao gồm các Entity access classes)

│   │   │   ├── com.ecommerce.service                  (Handle business logic for controller)

│   │   │   ├── com.ecommerce.utility                  (For common extracted method)

│   │   ├── resources                                  (Contains connections to model layer)

│   │   │   ├── META-INF

│   │   │   │   └── persistence.xml

│   │   │   └── hibernate.cfg.xml                      

│   │   ├── webapp                                     (Kết nối đến tầng Views)

│   │   │   ├── admin                                  (Chứa các file jsp của admin page)

│   │   │   ├── assets

│   │   │   │   └── bootstrap

│   │   │   │   └── css

│   │   │   │   └── fonts

│   │   │   │   └── img

│   │   │   │   └── js

│   │   │   │   └── sass

│   │   │   │   └── scss

│   │   │   ├── common                                 (Chứa các file JSP chứa các lỗi thường gặp)

│   │   │   ├── shop                                   (Chứa các file jsp của shop page)

│   │   │   ├── WEB-INF

│   │   │   │   └─── web.xml

│   ├── test

│   │   ├── com.ecommerce.model          

│   │   │   └── com.ecommerce.model.dao   

│   │   │   └── com.ecommerce.model.domain   

│   │   ├── com.ecommerce.utility      

├── pom.xml


Cách chạy chương trình:
1)Tải xuống và setup IntelliJ IDEA Ultimate qua đường link
https://phanmem123.com/download-intellij-idea-ultimate-2023/

2)Tải xuống và setup MySQL Community Server và MySQL Workbench.

3) Mở MySQL Workbench:
MySQL Workbench -> Server -> Data Import -> Import from Self-Contained File -> ... -> Chọn Database Nhom8_TMDT để Import -> Choose Dump Structure and Data -> Start Import.

4)Mở IntelliJ. Đợi Maven được tải xuống và setup dependencies.

5)Thiết lập Apache Tomcat.

Ghi chú:

Thay đổi MySQL connection trong file persistence.xml và hibernate.cfg.xml tương ứng trong MySQL.

Mật khẩu của user và khách hàng được mã hóa bằng MD5. Các tài khoản sau để đăng nhập:

Quản trị viên: admin@gmail.com | admin

Khách hàng: quangthien112003@gmail.com | 123456











