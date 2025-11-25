<?php

/**
 * ABABU VETERINARIO - VERCEL ENTRY POINT (Simplified)
 * ===================================================
 */

// Parche de compatibilidad para PHP 8.1+ en Vercel
// Evita que los avisos de depreciación (ReturnTypeWillChange) rompan la app
error_reporting(E_ALL ^ E_DEPRECATED);

// Configurar rutas básicas
$_SERVER['DOCUMENT_ROOT'] = __DIR__ . '/../public';
$_SERVER['SCRIPT_FILENAME'] = __DIR__ . '/../public/index.php';

// Redirigir a la aplicación Laravel principal