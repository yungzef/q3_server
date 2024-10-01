# Використовуємо базовий образ з мінімальним набором інструментів
FROM ubuntu:20.04

# Встановлюємо необхідні залежності для запуску .kexe файлу
RUN apt-get update && apt-get install -y libncurses5 libstdc++6

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо .kexe файл у контейнер
COPY build/bin/native/releaseExecutable/q3_server.kexe /app/q3_server.kexe

# Надаємо виконувальні права .kexe файлу
RUN chmod +x /app/q3_server.kexe

# Вказуємо команду для запуску .kexe файлу
CMD ["/app/q3_server.kexe"]
