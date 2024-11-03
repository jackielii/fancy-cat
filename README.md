# fancy-cat
A (blazingly-fast) PDF viewer for terminals using the kitty image protocol (written in Zig).

![demo video](https://private-user-images.githubusercontent.com/35976402/382516469-b1eaa602-b77d-4a4a-b68c-b7543e5b621c.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzA2NTI5MzksIm5iZiI6MTczMDY1MjYzOSwicGF0aCI6Ii8zNTk3NjQwMi8zODI1MTY0NjktYjFlYWE2MDItYjc3ZC00YTRhLWI2OGMtYjc1NDNlNWI2MjFjLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDExMDMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMTAzVDE2NTAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTcxMjc3ZmQ1ZDIzMzA2Nzc2NTQ0ODJjNDA2MzlkZDc5NmVmOWM5NTdlOTQ0ZGExYjQ1ZTkyYTgxNWQ0NmFmNTEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.SHyI2MuoxbbPy3glR0nEKXiPOp_N14w9VX5AAvYc36o) [^1]
[^1]: This demo shows me editing a Typst file that automatically compiles with each change, prompting fancy-cat to re-render whenever the PDF updates.
> [!NOTE]  
> This project is under active development
## Instructions
### Requirements
- Terminal emulator with the kitty image protocol (e.g. kitty, ghostty)
- [mupdf](https://mupdf.readthedocs.io/en/latest/quick-start-guide.html)
- [libfswatch](https://github.com/emcrisostomo/fswatch)
- Zig
### Build
> [!IMPORTANT]
> At the moment there is no dependency manager, so you will need to manually install the requirements.
```
zig build run -- <path-to-pdf> <optional-page-number>
```
## Features
- [x] Filewatch
- [x] Navigate pages
- [ ] Zoom
