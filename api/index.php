<?php

/**
 * ABABU VETERINARIO - VERCEL ENTRY POINT
 * =====================================
 * 
 * Este archivo es el punto de entrada para Vercel.
 * Redirige todas las solicitudes a Laravel.
 */

// Configurar rutas para Vercel
$_SERVER['DOCUMENT_ROOT'] = __DIR__ . '/../public';

// Cargar autoloader de Composer
require __DIR__ . '/../vendor/autoload.php';

// Configurar aplicación Laravel
$app = require_once __DIR__ . '/../bootstrap/app.php';

// Crear kernel
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);

// Procesar solicitud
$request = Illuminate\Http\Request::capture();
$response = $kernel->handle($request);

// Enviar respuesta
$response->send();

// Terminar aplicación
$kernel->terminate($request, $response);