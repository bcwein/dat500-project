import numpy as np
from PIL import Image, ImageFile
import happybase
from os.path import basename, splitext

connection = happybase.Connection('hadoop-master', port=9090)


def put(image_path, label, image_size=(224, 224)):
    image = Image.open(image_path)
    ImageFile.LOAD_TRUNCATED_IMAGES = True
    image = image.resize(image_size)    # Resize image to reduce space
    data = image.tobytes()              # Turn image into bytes

    row_index = basename(image_path)    # Using filename as row key
    row_index = splitext(row_index)[0]

    table = connection.table('diabetic-retinopathy')
    table.put(row_index, {'data:image': data, 'data:level': bytes(str(label), encoding='utf-8')})
