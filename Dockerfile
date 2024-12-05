FROM openjdk:23-jdk-slim

# Встановіть Xvfb і бібліотеки для підтримки графіки
RUN apt-get update && apt-get install -y \
    xvfb \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libxi-dev \
    && apt-get clean

WORKDIR /app
COPY . .

# Запуск Xvfb та налаштування DISPLAY перед запуском Java
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x16 & export DISPLAY=:99 && sleep 2 && java -cp out main.Main"]

