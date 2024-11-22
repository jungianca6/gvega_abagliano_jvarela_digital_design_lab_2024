from PIL import Image
import numpy as np

MAX_SIZE = 65536

## Genera el archivo .mif para cargar los datos de la imagen en la ROM
def generate_mif_file(image_array):
    image_width = len(image_array[0])
    image_depth = len(image_array)

    string_datos = "-- Imagen Generada\n\n"
    string_datos += "WIDTH=" + str(32) + ";\n" + "DEPTH=" + str(MAX_SIZE) + ";\n\n"
    string_datos += "ADDRESS_RADIX=UNS;\nDATA_RADIX=HEX;\n\n"

    string_datos += "CONTENT BEGIN\n"

    for i in range(image_depth):
        for j in range(image_width):
            string_datos += str(i * image_width + j) + " : "
            #Formateamos el valor del pixel como un número hexadecimal de 8 dígitos
            #Para imagen RGB, tomamos el valor de los tres canales de color.
            red = image_array[i, j, 0]
            green = image_array[i, j, 1]
            blue = image_array[i, j, 2]
            pixel_value = (red << 16) | (green << 8) | blue  # Combinamos los tres canales en un solo valor de 32 bits
            string_datos += format(int(pixel_value), '08x') + ";\n"
    
    if (image_depth * image_width < MAX_SIZE):
        string_datos += "[" + str(image_depth * image_width) + ".." + str(MAX_SIZE - 1) + "] : 00 ; \n"

    string_datos += "END;\n"

    with open("D:\\TEC\\2Semestre2024\\TallerDD\\Proyecto\\ProyectoPrueba\\sfallas_digital_design_lab_2023-main\\Proyecto\\convertidor_imagenes\\image_hex_data.mif", "w") as mif_file:
        mif_file.write(string_datos)

## Guarda la imagen original como archivo .png
def save_image_as_png(image_array, name):
    image = Image.fromarray(image_array)
    image.save(name + ".png")

## Convierte una imagen a una matriz de numpy (RGB)
def convert(file_name):
    image = Image.open(file_name)
    new_image = image.resize((256, 256))
    image_array = np.array(new_image)
    return image_array
    

# Cargar la imagen desde la nueva ruta y generar archivos
image_array = convert('C:\\Users\\julio\\imagenes\\paisaje.png')

# Guardar la imagen original como archivo .png para ver el contenido
save_image_as_png(image_array, 'D:\\TEC\\2Semestre2024\\TallerDD\\Proyecto\\ProyectoPrueba\\sfallas_digital_design_lab_2023-main\\Proyecto\\convertidor_imagenes\\output_original_image')

# Generar el archivo .mif a partir de la imagen original (sin escala de grises)
generate_mif_file(image_array)
