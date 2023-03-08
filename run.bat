@echo off

mklink /H %cd%\demo1\local-site-packages\demo_win.py %cd%\site-packages\demo-1.0.0\demo.py 2>nul
mklink /H %cd%\demo2\local-site-packages\demo_win.py %cd%\site-packages\demo-2.0.0\demo.py 2>nul

set PYTHONPATH=demo1\local-site-packages
python -c "import demo_win"

set PYTHONPATH=demo2\local-site-packages
python -c "import demo_win"
