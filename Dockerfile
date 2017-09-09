# -- Python Wheels
FROM python:3 as wheels

COPY packages/foo/requirements.txt /foo/requirements.txt
RUN pip wheel --wheel-dir /wheels -r /foo/requirements.txt

# -- Final Image
FROM python:3

COPY packages/foo /var/foo
COPY --from=wheels /wheels /wheels
RUN cd /var/foo && pip install --no-index --find-links=/wheels -r requirements.txt
RUN cd /var/foo && python setup.py install

COPY packages/foo-bar /var/foo-bar
RUN cd /var/foo-bar && python setup.py install

RUN python -c "import sys; print(sys.path); import foo.plugins"



