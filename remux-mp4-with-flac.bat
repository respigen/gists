setlocal enabledelayedexpansion

set "ffmpeg_path=ffmpeg.exe"
set "video_folder=%~dp0"

for %%F in ("%video_folder%\*.flac") do (
    set "flac_file=%%~dpnF.flac"
    set "video_file=%%~dpnF.mp4"
    
    if exist "!video_file!" (
        echo Doing !video_file!
        "%ffmpeg_path%" -i "!video_file!" -i "!flac_file!" -c:v copy -c:a copy -map 0:v -map 1:a -shortest "!video_file!.remuxed.mp4"
        if not errorlevel 1 (
            echo Done !video_file!	
        ) else (
            echo Failed !video_file! !errorlevel!
        )
    ) else (
        echo Failed !flac_file! missing
    )
)

endlocal
