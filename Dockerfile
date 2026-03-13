FROM python:3.10-slim

# تنصيب محرك قراءة الصور Tesseract
RUN apt-get update && apt-get install -y tesseract-ocr tesseract-ocr-eng

# تحديد مجلد العمل
WORKDIR /app

# نسخ ملف المكتبات وتنصيبها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي الملفات (البوت والواجهة)
COPY . .

# أمر تشغيل البوت
CMD ["sh", "-c", "python -m http.server 10000 & python bot.py"]
