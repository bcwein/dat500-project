import numpy as np
from PIL import Image
import happybase


image = Image.open('/home/ubuntu/diabetic-retinopathy/sample/10_left.jpeg')
data = np.asarray(image)

connection = happybase.Connection('hadoop-master', port=9090)

table = connection.table('diabetic-retinopathy')

table.put(0, {'image': data, 'label': 1})
