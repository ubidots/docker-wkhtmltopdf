
# wkhtmltopdf Docker Image

Container for wkhtmltopdf 0.12.4

[![nodesource/node](http://dockeri.co/image/ubidots/wkhtmltopdf)](https://hub.docker.com/r/ubidots/wkhtmltopdf/)


## Fonts

* Courier
* Arial
* Roboto
* Verdana
* DejaVu
* Inconsolata
* OpenSans


For the full list of fonts:

```
docker run --rm ubidots/wkhtmltopdf fc-list

```

## Usage

The container has a volumen that you can use for put images and other assets that you need to create the PDF _/tmp/assets_

```
echo "<html><body><h1>Hello World</h1></body></html>" \
     | docker run -i --rm -v /tmp/assets:/tmp/assets ubidots/wkhtmltopdf /usr/bin/wkhtmltopdf - - > hello.pdf
````
