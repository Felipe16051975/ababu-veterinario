FROM php:8.1-apache
# Build: 2025-11-26 01:50 - Shell script approach v3

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_pgsql zip gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Habilitar mod_rewrite de Apache
RUN a2enmod rewrite

# Configurar DocumentRoot
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copiar código de la aplicación
WORKDIR /var/www/html
COPY . .

# Copiar .env para Railway (sin comillas problemáticas)
COPY .env.railway .env

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar dependencias de PHP (ignorar temporalmente requisito de GD durante build)
RUN composer install --no-dev --optimize-autoloader --no-interaction --ignore-platform-req=ext-gd

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Configurar ServerName para Apache (eliminar warning)
RUN echo "ServerName ababu-veterinario.railway.app" >> /etc/apache2/apache2.conf

# Copiar y configurar script de inicio
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Healthcheck para verificar estado de la aplicación
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# Exponer puerto 80
EXPOSE 80

# Comando de inicio
CMD ["/usr/local/bin/startup.sh"]



