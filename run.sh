ln -s `pwd`/site-packages/demo-1.0.0/demo.py `pwd`/demo1/local-site-packages/demo.py 2>/dev/null
ln -s `pwd`/site-packages/demo-2.0.0/demo.py `pwd`/demo2/local-site-packages/demo.py 2>/dev/null

export PYTHONPATH=demo1/local-site-packages
python -c "import demo"

export PYTHONPATH=demo2/local-site-packages
python -c "import demo"
