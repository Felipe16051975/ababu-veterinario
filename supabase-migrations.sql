-- ABABU VETERINARIO - SCRIPT DE MIGRACIONES PARA SUPABASE
-- ========================================================
-- Ejecuta este SQL en Supabase SQL Editor para crear todas las tablas

-- 1. Crear tabla migrations (Laravel tracking)
CREATE TABLE IF NOT EXISTS migrations (
    id SERIAL PRIMARY KEY,
    migration VARCHAR(255) NOT NULL,
    batch INTEGER NOT NULL
);

-- 2. Crear tabla users
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    email_verified_at TIMESTAMP NULL,
    password VARCHAR(255) NOT NULL,
    remember_token VARCHAR(100) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- 3. Crear tabla password_resets
CREATE TABLE IF NOT EXISTS password_resets (
    email VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL
);

CREATE INDEX IF NOT EXISTS password_resets_email_index ON password_resets (email);

-- 4. Crear tabla failed_jobs
CREATE TABLE IF NOT EXISTS failed_jobs (
    id BIGSERIAL PRIMARY KEY,
    connection TEXT NOT NULL,
    queue TEXT NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- 5. Crear tabla locales
CREATE TABLE IF NOT EXISTS locales (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- 6. Crear tabla countries
CREATE TABLE IF NOT EXISTS countries (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- 7. Crear tabla clinics
CREATE TABLE IF NOT EXISTS clinics (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NULL,
    phone VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    country_id BIGINT NULL,
    locale_id BIGINT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (locale_id) REFERENCES locales(id)
);

-- 8. Crear tabla roles
CREATE TABLE IF NOT EXISTS roles (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- 9. Crear tabla role_user (pivot)
CREATE TABLE IF NOT EXISTS role_user (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    clinic_id BIGINT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (clinic_id) REFERENCES clinics(id) ON DELETE CASCADE
);

-- 10. Crear tabla owners
CREATE TABLE IF NOT EXISTS owners (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    address TEXT NULL,
    clinic_id BIGINT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (clinic_id) REFERENCES clinics(id) ON DELETE CASCADE
);

-- 11. Crear tabla animalia
CREATE TABLE IF NOT EXISTS animalia (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

-- 12. Crear tabla species
CREATE TABLE IF NOT EXISTS species (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    animal_id BIGINT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (animal_id) REFERENCES animalia(id) ON DELETE CASCADE
);

-- 13. Crear tabla pets
CREATE TABLE IF NOT EXISTS pets (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NULL,
    gender VARCHAR(10) NULL,
    color VARCHAR(255) NULL,
    microchip VARCHAR(255) NULL,
    notes TEXT NULL,
    owner_id BIGINT NOT NULL,
    species_id BIGINT NOT NULL,
    clinic_id BIGINT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (clinic_id) REFERENCES clinics(id) ON DELETE CASCADE
);

-- Insertar registros en la tabla migrations para que Laravel sepa que están aplicadas
INSERT INTO migrations (migration, batch) VALUES 
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_08_19_000000_create_failed_jobs_table', 1),
('2020_05_08_140623_create_locales_table', 1),
('2020_05_08_140624_create_countries_table', 1),
('2020_05_08_140625_create_clinics_table', 1),
('2020_05_08_230639_create_roles_table', 1),
('2020_05_08_230840_create_role_user_table', 1),
('2020_06_10_000000_create_owners_table', 1),
('2020_06_10_000001_create_animalia_table', 1),
('2020_06_10_000002_create_species_table', 1),
('2020_06_10_130407_create_pets_table', 1)
ON CONFLICT DO NOTHING;

-- Script completado
SELECT 'Ababu Veterinario - Migraciones completadas exitosamente!' AS resultado;