# Указываем базовый образ
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем зависимости проекта в контейнер
COPY requirements.txt .

# Устанавливаем зависимости проекта
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все файлы проекта в контейнер
COPY . .

# Указываем команду, которая будет запущена при старте контейнера
CMD ["python", "app.py"]

# Открываем порт, на который будет проксироваться трафик
EXPOSE 8080

# Настраиваем ENTRYPOINT
ENTRYPOINT python /app/app.py runserver 0.0.0.0:8080
