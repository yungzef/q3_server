# Використовуємо базовий образ з Gradle
FROM gradle:7.5.1-jdk11 AS build

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо всі файли проєкту в контейнер
COPY . .

# Збираємо проект, щоб створити .kexe файл
RUN ./gradlew linkReleaseExecutableNative

# Створюємо новий образ для запуску
FROM ubuntu:20.04

# Встановлюємо необхідні залежності для запуску .kexe файлу
RUN apt-get update && apt-get install -y libncurses5 libstdc++6

# Копіюємо зібраний .kexe файл з попереднього етапу
COPY --from=build /app/build/bin/native/releaseExecutable/q3_server.kexe /app/q3_server.kexe

# Встановлюємо робочу директорію
WORKDIR /app

# Надаємо виконувальні права .kexe файлу
RUN chmod +x /app/q3_server.kexe

# Вказуємо команду для запуску .kexe файлу
CMD ["./q3_server.kexe"]