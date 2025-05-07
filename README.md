
### 🗂️ Database Structure
![image](https://github.com/user-attachments/assets/89281361-7d44-4606-a536-c9119f9832b3)

### 🖼️ Giao Diện Người Dùng

#### Trang Chủ (Home Page)
![image](https://github.com/user-attachments/assets/ff2b28fe-44e3-4cc4-8715-48950522a4b8)
![image](https://github.com/user-attachments/assets/6d2e7bd8-324a-4e52-be82-fca46aeafc9c)


#### Trang Sản Phẩm
![image](https://github.com/user-attachments/assets/7994ab81-1999-4a10-9f82-be153fa6534e)
![image](https://github.com/user-attachments/assets/d2abdd31-bcf8-4331-8e30-1909d7238a57)

#### Trang Chi Tiết Sản Phẩm
![image](https://github.com/user-attachments/assets/8e030c3d-7b50-41a5-8164-1de464acf12d)
![image](https://github.com/user-attachments/assets/a825432a-28ff-4645-b65a-cff39ee7ea06)

#### Giao diện Giỏ Hàng
![image](https://github.com/user-attachments/assets/2e71fef3-83c6-4d05-a475-179f76cc5938)
![image](https://github.com/user-attachments/assets/da7f87d8-51f8-47d1-a235-6a5f8cf1aa09)

#### Trang Thanh Toán
![image](https://github.com/user-attachments/assets/80f1f346-0918-4af7-9390-87b70f8e114c)
![image](https://github.com/user-attachments/assets/78e25d1b-454d-4444-8957-3c4f437a0bcf)
![image](https://github.com/user-attachments/assets/b2562856-0ce4-4f89-a43a-9feca71dafa2)

#### Trang Chi Tiết Đơn Hàng
![image](https://github.com/user-attachments/assets/a30a5e19-c3b1-4f45-95fc-9fe232930e8d)

#### Trang Quản Trị (Admin Dashboard)
![image](https://github.com/user-attachments/assets/915a61fb-20ac-4020-becd-606ef47708e9)
![image](https://github.com/user-attachments/assets/8b58bcd9-5258-49bc-b01c-168bf11feb22)

# 🛒 eCommerce Website

## 📁 Project Structure

```
eCommerceWebsite/
├── db/
│   └── Nhom8_TMDT.sql                     # Chứa database
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com.ecommerce.controller/
│   │   │   │   ├── admin/                 # Controller của admin
│   │   │   │   │   ├── category/
│   │   │   │   │   ├── customer/
│   │   │   │   │   ├── email/
│   │   │   │   │   ├── order/
│   │   │   │   │   ├── product/
│   │   │   │   │   ├── review/
│   │   │   │   │   └── user/
│   │   │   │   ├── common/
│   │   │   │   │   ├── filter/            # Filter kiểm tra quyền truy cập URL
│   │   │   │   │   └── error/             # Navigation servlets xử lý lỗi
│   │   │   │   └── shop/                  # Controller của shop pages
│   │   │   │       ├── cart/
│   │   │   │       ├── customer/
│   │   │   │       ├── order/
│   │   │   │       ├── payment/
│   │   │   │       ├── product/
│   │   │   │       └── review/
│   │   │   ├── com.ecommerce.model/
│   │   │   │   ├── dao/                   # Kết nối DB
│   │   │   │   ├── domain/                # Domain models
│   │   │   │   └── entity/                # Entity access classes
│   │   │   ├── com.ecommerce.service/     # Xử lý business logic
│   │   │   └── com.ecommerce.utility/     # Các phương thức tiện ích dùng chung
│   │   ├── resources/
│   │   │   ├── META-INF/
│   │   │   │   └── persistence.xml
│   │   │   └── hibernate.cfg.xml
│   │   └── webapp/
│   │       ├── admin/                     # JSP cho admin
│   │       ├── assets/
│   │       │   ├── bootstrap/
│   │       │   ├── css/
│   │       │   ├── fonts/
│   │       │   ├── img/
│   │       │   ├── js/
│   │       │   ├── sass/
│   │       │   └── scss/
│   │       ├── common/                    # JSP lỗi thường gặp
│   │       ├── shop/                      # JSP cho người dùng
│   │       └── WEB-INF/
│   │           └── web.xml
│   └── test/
│       ├── com.ecommerce.model/
│       │   ├── dao/
│       │   └── domain/
│       └── com.ecommerce.utility/
├── pom.xml
```

---

## ▶️ Cách chạy chương trình

### 1. Cài đặt phần mềm cần thiết
- Tải và cài đặt **IntelliJ IDEA Ultimate**:
- Tải và cài đặt **MySQL Community Server** và **MySQL Workbench**

---

### 2. Import Database
- Mở **MySQL Workbench**
- Vào: `Server → Data Import`
- Chọn: **Import from Self-Contained File** và chọn `Nhom8_TMDT.sql`
- Chọn: **Dump Structure and Data**
- Bấm **Start Import**

---

### 3. Mở và cấu hình IntelliJ
- Mở project bằng **IntelliJ**
- Đợi Maven tải về và thiết lập dependencies
- Cài đặt **Apache Tomcat** để chạy server

---

### 4. Cập nhật cấu hình MySQL
- Thay đổi thông tin kết nối MySQL trong:
  - `src/main/resources/META-INF/persistence.xml`
  - `src/main/resources/hibernate.cfg.xml`

---

## 🔐 Tài khoản đăng nhập

| Vai trò       | Email                        | Mật khẩu   |
|---------------|------------------------------|------------|
| Quản trị viên | `admin@gmail.com`            | `admin`    |
| Khách hàng    | `quangthien112003@gmail.com` | `123456`   |

> ⚠️ *Mật khẩu được mã hóa bằng MD5*












