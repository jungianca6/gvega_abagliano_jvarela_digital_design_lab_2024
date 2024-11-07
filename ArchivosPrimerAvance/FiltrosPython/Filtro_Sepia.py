def aplicar_filtro_sepia(imagen_entrada, imagen_salida):
    with open(imagen_entrada, 'rb') as archivo:
        # Leer el encabezado BMP (cabecera del archivo)
        encabezado = archivo.read(54)  # El encabezado BMP tiene 54 bytes
        
        # Leer el tamaño de la imagen
        archivo.seek(18)  # Desplazarse a la posición donde se especifica el ancho y alto
        ancho = int.from_bytes(archivo.read(4), byteorder='little')
        alto = int.from_bytes(archivo.read(4), byteorder='little')
        
        # Leer el resto del encabezado necesario para el formato BMP
        archivo.seek(28)  # Ir a la posición donde se encuentra el número de bits por píxel
        bits_por_pixel = int.from_bytes(archivo.read(2), byteorder='little')

        # Asegúrate de que la imagen tiene 24 bits por píxel (formato BMP estándar RGB)
        if bits_por_pixel != 24:
            raise ValueError("La imagen no es de 24 bits por píxel")

        # Calcular el tamaño de cada fila (considerando padding)
        fila_size = (ancho * 3 + 3) // 4 * 4  # Asegurarse de que el tamaño de fila es múltiplo de 4
        padding = fila_size - (ancho * 3)  # Relleno de bytes para completar el tamaño de fila

        # Leer los datos de píxeles
        archivo.seek(54)  # Volver a la posición de los datos de píxeles
        datos = archivo.read()

    # Convertir los datos de la imagen en una lista de píxeles
    píxeles = []
    for y in range(alto):
        for x in range(ancho):
            i = (y * fila_size) + (x * 3)
            b = datos[i]
            g = datos[i + 1]
            r = datos[i + 2]
            píxeles.append((r, g, b))  # Guardar en formato RGB

    # Aplicar el filtro sepia a cada píxel
    píxeles_sepia = []
    for (r, g, b) in píxeles:
        tr = int(0.393 * r + 0.769 * g + 0.189 * b)
        tg = int(0.349 * r + 0.686 * g + 0.168 * b)
        tb = int(0.272 * r + 0.534 * g + 0.131 * b)

        # Asegurarse de que los valores estén en el rango [0, 255]
        tr = min(255, tr)
        tg = min(255, tg)
        tb = min(255, tb)

        píxeles_sepia.append((tb, tg, tr))  # BMP usa el orden BGR

    # Crear una nueva imagen con los píxeles modificados
    with open(imagen_salida, 'wb') as archivo_salida:
        # Escribir el encabezado original
        archivo_salida.write(encabezado)

        # Escribir los datos de los píxeles modificados, manejando el padding
        for y in range(alto):
            for x in range(ancho):
                i = (y * ancho + x)  # Calcular la posición del píxel
                b, g, r = píxeles_sepia[i]
                archivo_salida.write(bytes([b, g, r]))  # Escribir los píxeles en formato BGR

            # Escribir el padding si es necesario
            archivo_salida.write(b'\x00' * padding)

# Usar la función
aplicar_filtro_sepia('D:\\TEC\\2Semestre2024\\TallerDD\\Proyecto\\mario.bmp', 'D:\\TEC\\2Semestre2024\\TallerDD\\Proyecto\\mario_sepia.bmp')





