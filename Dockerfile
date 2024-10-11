# Usar la última versión de Ubuntu como imagen base
FROM ubuntu:latest

# Actualizar el sistema e instalar herramientas necesarias
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    && rm -rf /var/lib/apt/lists/*

# Eliminar el contenido predeterminado de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Clonar el repositorio de la aplicación web estática
RUN git clone https://github.com/josejuansanchez/2048.git /usr/share/nginx/html/

# Exponer el puerto 80
EXPOSE 80

# Comando para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]