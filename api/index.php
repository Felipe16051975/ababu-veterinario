<?php

/**
 * ABABU VETERINARIO - VERCEL ENTRY POINT
 * ======================================
 * This file serves as the entry point for Vercel serverless functions
 * and properly routes requests to the Laravel application
 */

// Ensure we're sending the correct content type header
header('Content-Type: text/html; charset=UTF-8');

// Set up the correct server variables for Laravel
$_SERVER['DOCUMENT_ROOT'] = __DIR__ . '/../public';
$_SERVER['SCRIPT_FILENAME'] = __DIR__ . '/../public/index.php';
$_SERVER['SCRIPT_NAME'] = '/index.php';

// Handle the REQUEST_URI properly for Vercel
if (!isset($_SERVER['REQUEST_URI'])) {
    $_SERVER['REQUEST_URI'] = $_SERVER['PATH_INFO'] ?? '/';
}

// Ensure proper working directory
chdir(__DIR__ . '/../public');

// Bootstrap the Laravel application
require __DIR__ . '/../public/index.php';