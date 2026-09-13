@echo off
:: Administrator huquqlarini tekshirish va olish
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :admin
) else (
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:admin
title ULTRA GAMING MODE & CS2 LAUNCHER
color 0A
cls
echo ========================================================
echo        WINDOWS 11 ULTRA GAMING REJIMINI YOQISH          
echo ========================================================
echo.

echo [1/5] Ortiqcha foniy dasturlarni majburiy yopish...
:: Avast va Lively Wallpaper
taskkill /f /im afwServ.exe /t >nul 2>&1
taskkill /f /im AvastUI.exe /t >nul 2>&1
taskkill /f /im Lively.exe /t >nul 2>&1
taskkill /f /im Lively.UI.WinUI.exe /t >nul 2>&1
taskkill /f /im mpv.exe /t >nul 2>&1

:: O'yin paytida RAMni yeydigan boshqa dasturlar va brauzerlar
taskkill /f /im chrome.exe /t >nul 2>&1
taskkill /f /im msedge.exe /t >nul 2>&1
taskkill /f /im opera.exe /t >nul 2>&1
taskkill /f /im discord.exe /t >nul 2>&1
taskkill /f /im spotify.exe /t >nul 2>&1
taskkill /f /im telegram.exe /t >nul 2>&1
taskkill /f /im Widgets.exe /t >nul 2>&1
echo [+] Foniy dasturlar o'chirildi.
echo.

echo [2/5] Windows Telemetriya va kuzatuv xizmatlarini to'xtatish...
:: Windows diagnostika va kuzatuvlarini o'chirish (RAM va CPU yukini kamaytiradi)
sc stop DiagTrack >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc stop WerSvc >nul 2>&1
sc stop OneSyncSvc >nul 2>&1
echo [+] Telemetriya va hisobot xizmatlari vaqtincha to'xtatildi.
echo.

echo [3/5] RAM va Kesh xotirani optimizatsiya qilish...
:: Tarmoq keshini tozalash va DNSni yangilash
ipconfig /flushdns >nul 2>&1
:: Windows Explorer keshini yangilash
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
timeout /t 2 >nul
echo [+] RAM va tizim keshi tozalandi.
echo.

echo [4/5] Windows Quvvat rejimini "Maksimal unumdorlik"ga o'tkazish...
:: Protsessor bor kuchi bilan ishlashi uchun quvvat rejimini o'zgartiradi
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo [+] Quvvat rejimi: "Maksimal unumdorlik" (High Performance).
echo.

echo [5/5] CS2 ni Yuqori Prioritet bilan ishga tushirish...
echo ========================================================
echo        TIZIM OPTIMIZATSIYA BO'LDI! O'YIN BOSHLANMOQDA...
echo ========================================================
:: Steam orqali o'yinni ochish
start steam://rungameid/730

:: O'yin yuklanishi uchun 15 soniya kutadi va unga protsessorda eng yuqori ustunlikni beradi
timeout /t 15 >nul
wmic process where name="cs2.exe" CALL setpriority "high" >nul 2>&1

echo [Muvaffaqiyatli] Skript ishini yakunladi. O'yin ichida FPS ko'tarilishi kerak.
timeout /t 3 >nul
exit
