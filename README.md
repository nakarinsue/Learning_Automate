# Learning_Automate

โปรเจกต์นี้เป็นชุดการทดสอบด้วย Robot Framework บน Python

## Python ที่แนะนำ
- ใช้ Python 3.11.x หรือ 3.12.x
- ถ้าใช้ Windows ให้ดาวน์โหลดจาก https://www.python.org/downloads/windows/
- ต้องเลือก "Add Python to PATH" ในหน้าติดตั้ง

## การติดตั้ง dependencies
1. เปิด PowerShell หรือ Command Prompt
2. เข้าไปที่โฟลเดอร์โปรเจกต์:
   ```powershell
   cd D:\Automate\Learning_Automate
   ```
3. สร้าง virtual environment:
   ```powershell
   python -m venv .venv
   ```
4. เปิดใช้งาน virtual environment:
   ```powershell
   .\.venv\Scripts\Activate.ps1
   ```
   ถ้าใช้ Command Prompt ให้ใช้:
   ```cmd
   .\.venv\Scripts\activate.bat
   ```
5. อัปเกรด pip และติดตั้งแพ็กเกจทั้งหมด:
   ```powershell
   python -m pip install --upgrade pip
   pip install -r requirements.txt
   ```

## การรันแบบ dry-run ด้วย pabot
`pabot` จะช่วยรัน Robot Framework แบบขนานได้ และ `--dryrun` จะตรวจสอบไฟล์โดยไม่รันจริง

ตัวอย่างคำสั่ง:
```powershell
pabot --dryrun testcases\assign_3_2_1.robot
```
หรือรันทุกไฟล์ในโฟลเดอร์ testcases:
```powershell
pabot --dryrun testcases\*.robot
```

## การรันจริงด้วย pabot
ถ้าต้องการรันจริง ไม่ใช่ dry-run ให้ใช้:
```powershell
pabot testcases\*.robot
```

## ตรวจสอบเวอร์ชัน
ตรวจสอบ Python:
```powershell
python --version
```
ตรวจสอบ pabot:
```powershell
pabot --version
```

## หมายเหตุ
- ไฟล์ dependencies อยู่ใน `requirements.txt`
- ไฟล์ทดสอบหลักอยู่ในโฟลเดอร์ `testcases`
- `pabot` ถูกติดตั้งแล้วจาก `robotframework-pabot` ใน `requirements.txt`
