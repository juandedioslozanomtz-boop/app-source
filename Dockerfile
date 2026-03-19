FROM nginx:alpine

# Agregamos nuestra página web
RUN echo "<h1>Hola from OpenShift CI/CD Pipeline JDD!</h1>" > /usr/share/nginx/html/index.html

# Dar permisos a los directorios que NGINX necesita modificar
RUN chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /etc/nginx/conf.d

# Cambiar la configuración por defecto de NGINX para que escuche en el puerto 8080 (no privilegiado)
RUN sed -i 's/listen  *80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Exponemos el nuevo puerto
EXPOSE 8080
