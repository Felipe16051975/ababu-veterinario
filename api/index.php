<?php

/**
 * ABABU VETERINARIO - VERCEL ENTRY POINT (Simplified)
 * ===================================================
 */

// Configurar rutas básicas
$_SERVER['DOCUMENT_ROOT'] = __DIR__ . '/../public';
$_SERVER['SCRIPT_FILENAME'] = __DIR__ . '/../public/index.php';

// Redirigir a la aplicación Laravel principal
require __DIR__ . '/../public/index.php';