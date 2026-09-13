# Shome – Smart Home IoT

Hệ thống **nhà thông minh IoT**: bảng điều khiển trực tuyến để **giám sát cảm biến** và **điều khiển thiết bị bằng giọng nói tiếng Việt**. Dữ liệu truyền qua **MQTT** và được lưu lịch sử vào **MySQL/MariaDB**.

## Tính năng

- **Giám sát**: thời tiết (dự báo từ Google), nhiệt độ, độ ẩm, mức sáng, chuyển động tầng hầm, khí gas, mực nước bồn, trạng thái báo động an ninh.
- **Điều khiển**: máy lạnh, máy tạo độ ẩm, đèn ngoài, vòi nước, cửa, đèn — kèm chế độ tự động cho máy lạnh / độ ẩm / đèn ngoài.
- **Ra lệnh bằng giọng nói tiếng Việt** (Web Speech API) — yêu cầu trình duyệt Chrome.
- **Lịch sử thiết bị**: bảng log tự động cập nhật mỗi 5 giây từ database.

## Công nghệ & kiến trúc

| Thành phần | Công nghệ |
|---|---|
| Giao diện web | HTML, CSS, Bootstrap 5, jQuery |
| Kết nối realtime | MQTT (Paho) — broker công cộng `broker.emqx.io` |
| Nhận dạng giọng nói | Web Speech API (`webkitSpeechRecognition`) |
| Backend | PHP 8 (mysqli) |
| Cơ sở dữ liệu | MySQL / MariaDB — database `shome`, bảng `data` |
| Cầu nối Python | `paho-mqtt`, `beautifulsoup4`, `requests`, `fake-useragent`, `mysql-connector-python` |

### Sơ đồ hoạt động

```
Cảm biến / thiết bị IoT ──MQTT──▶ broker.emqx.io ──MQTT──▶ shome_bridge.py (Python)
                                                                 │
                                                                 ▼
Trình duyệt (index.html) ◀──MQTT (WebSocket)── broker.emqx.io   MySQL `shome`
        │                                                             ▲
        └──────────── PHP (php/logdata.php) ──────── Lịch sử ────────┘
```

### MQTT topics

**Subscribe** (nhận dữ liệu từ thiết bị / cầu nối):

| Topic | Nội dung |
|---|---|
| `Shome_DHT` | `nhiệt độ,độ ẩm` (DHT) |
| `Shome_Photoresistor` | mức sáng (lux) |
| `Shome_Motion` | `on` / `off` — chuyển động |
| `Shome_Gas` | `warn` / bình thường — khí gas |
| `Shome_Security` | `warn` / bình thường — báo động |
| `Shome_Water` | mực nước (cm) + `on`/`off` vòi nước |
| `Shome_Light`, `Shome_Led`, `Shome_Door` | `on` / `off` / `onat` / `offat` |
| `Shome_Air`, `Shome_Humi` | `on` / `off` / `onat` / `offat` |
| `Shome_ReciveWeather` | `thông tin,nhiệt độ,độ ẩm,tốc độ gió` |

**Publish** (gửi lệnh điều khiển):

| Topic | Nội dung |
|---|---|
| `Shome_ReciveAir`, `Shome_ReciveHumi`, `Shome_ReciveLight` | `on` / `off` / `onat` / `offat` |
| `Shome_ReciveLed`, `Shome_ReciveDoor` | `on` / `off` |
| `Shome_ReciveSensor` | `on` / `off` — vòi nước |
| `Shome_ReciveSecNone` | `none` — tắt báo động |

## Phần cứng mô phỏng (Wokwi)

Phần thiết bị / cảm biến có thể chạy giả lập trực tuyến trên **ESP32 Simulator** bằng link; trong link trên Wokwi đã setup ESP32 kết nối MQTT `broker.emqx.io` để đọc cảm biến (DHT22, PIR, quang trở...) và gửi lên các topic:

- **Mô phỏng thiết bị:** https://wokwi.com/projects/384558529519353857

> Mẹo: Khi demo trong phòng không có phần cứng thật, mở tab Wokwi này song song với dashboard `Shome` để xem thiết bị gửi dữ liệu cảm biến / nhận lệnh điều khiển qua MQTT.

## Cấu trúc thư mục

```
Shome/
├── index.html           # Bảng điều khiển chính
├── shome.sql            # Database dump (bảng `data`)
├── shome_bridge.py      # Cầu nối MQTT → MySQL + dự báo thời tiết
├── css/                 # Bootstrap + style.css
├── js/                  # bootstrap.bundle.js
└── php/
    ├── db_con.php       # Kết nối MySQL
    └── logdata.php      # API lấy lịch sử thiết bị
```

## Yêu cầu hệ thống

- **XAMPP / WAMP** (Apache + PHP 8 + MySQL/MariaDB)
- **Python 3.8+**
- Trình duyệt **Chrome** (cho tính năng giọng nói)
- Kết nối Internet (broker MQTT + dự báo thời tiết)

## Cài đặt

1. **Import database**: mở phpMyAdmin → Import file `shome.sql` → tạo database `shome` với bảng `data`.
2. **Đưa project vào web server**: vd copy thư mục vào `htdocs` của XAMPP, ví dụ `C:\xampp\htdocs\Shome`.
3. **Kiểm tra kết nối DB**: mở `php/db_con.php` — mặc định là `localhost` / user `root` / mật khẩu trống. Nếu máy bạn khác thì sửa lại.
4. **Cài thư viện Python**:

   ```bash
   pip install paho-mqtt beautifulsoup4 requests fake-useragent mysql-connector-python
   ```

5. **Chạy cầu nối MQTT → DB** (chạy phía máy chứa MySQL):

   ```bash
   python shome_bridge.py
   ```

6. **Mở web trên trình duyệt**:

   ```
   http://localhost/Shome
   ```
   Tùy vào cài đặt htdocs.


## Sử dụng & khẩu lệnh giọng nói

Bấm nút **MICRO** dưới màn hình rồi nói:

| Lĩnh vực | Khẩu lệnh |
|---|---|
| Máy lạnh | "nhà thông minh bật/tắt máy lạnh" |
| Máy lạnh tự động | "nhà thông minh máy lạnh tự động bật/tắt" |
| Máy tạo độ ẩm | "nhà thông minh bật/tắt độ ẩm" |
| Độ ẩm tự động | "nhà thông minh độ ẩm tự động bật/tắt" |
| Đèn ngoài | "nhà thông minh bật/tắt đèn ngoài" |
| Đèn ngoài tự động | "nhà thông minh đèn ngoài tự động bật/tắt" |
| Vòi nước | "nhà thông minh bật/tắt vòi nước" |
| Đèn | "nhà thông minh bật/tắt đèn" |
| Cửa | "nhà thông minh mở/đóng cửa" |
| Báo động | "nhà thông minh tắt báo động" |

Ngoài ra có thể bấm tay trực tiếp trên các ô điều khiển trong modal của từng thiết bị.

## Tùy chỉnh

- **Thành phố dự báo thời tiết**: sửa `find_weather("Vĩnh Long")` trong `shome_bridge.py`.
- **MQTT broker**: đổi broker + port ở `index.html` (WebSocket, port `8083`, cho web) và `shome_bridge.py` (TCP, port `1883`, cho cầu nối).
- **Tần suất lưu log**: đổi `time.sleep(5)` trong `shome_bridge.py`.

## Lưu ý

- Phải mở web **qua Apache** (`http://localhost/...`) cho PHP (`php/logdata.php`).
- Web Speech API chỉ hoạt động trên **Chrome**.
- Broker MQTT công cộng (`broker.emqx.io`) không bảo mật — chỉ cho demo.