<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ababu - Sistema de Gestión Veterinaria</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero-section {
            padding: 100px 0;
            color: white;
            text-align: center;
        }
        .welcome-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 40px;
            margin: 30px auto;
            max-width: 800px;
            color: #333;
        }
        .feature-icon {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 20px;
        }
        .btn-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 30px;
            color: white;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin: 10px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            color: white;
            text-decoration: none;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        .stat-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 fw-bold mb-4">
                <i class="fas fa-paw"></i> Ababu
            </h1>
            <p class="lead mb-5">Sistema Profesional de Gestión Veterinaria</p>
            
            <div class="welcome-card">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2 class="h3 mb-4">
                            <i class="fas fa-heart text-danger"></i>
                            Bienvenido al Futuro de la Medicina Veterinaria
                        </h2>
                        
                        <p class="mb-4">
                            Ababu es una plataforma completa diseñada especialmente para clínicas veterinarias modernas. 
                            Gestiona tus pacientes, tratamientos, historiales médicos y mucho más desde una interfaz intuitiva y profesional.
                        </p>

                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="feature-icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <h5>Gestión de Pacientes</h5>
                                <p class="small">Fichas clínicas completas y profesionales</p>
                            </div>
                            <div class="stat-card">
                                <div class="feature-icon">
                                    <i class="fas fa-calendar-alt"></i>
                                </div>
                                <h5>Agenda Digital</h5>
                                <p class="small">Citas y recordatorios automatizados</p>
                            </div>
                            <div class="stat-card">
                                <div class="feature-icon">
                                    <i class="fas fa-pills"></i>
                                </div>
                                <h5>Control Médico</h5>
                                <p class="small">Prescripciones y tratamientos</p>
                            </div>
                            <div class="stat-card">
                                <div class="feature-icon">
                                    <i class="fas fa-chart-line"></i>
                                </div>
                                <h5>Reportes</h5>
                                <p class="small">Análisis y estadísticas avanzadas</p>
                            </div>
                        </div>

                        <div class="mt-5">
                            @guest
                                <a href="{{ route('login') }}" class="btn btn-custom btn-lg">
                                    <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                                </a>
                                <a href="{{ route('register') }}" class="btn btn-custom btn-lg">
                                    <i class="fas fa-user-plus"></i> Registrarse
                                </a>
                            @else
                                <a href="{{ route('home') }}" class="btn btn-custom btn-lg">
                                    <i class="fas fa-home"></i> Ir al Dashboard
                                </a>
                            @endguest
                        </div>

                        <div class="mt-4 pt-4 border-top">
                            <div class="row text-center">
                                <div class="col-md-4">
                                    <small class="text-muted">
                                        <i class="fas fa-shield-alt text-success"></i>
                                        <strong>Seguro</strong><br>
                                        Datos protegidos
                                    </small>
                                </div>
                                <div class="col-md-4">
                                    <small class="text-muted">
                                        <i class="fas fa-language text-primary"></i>
                                        <strong>En Español</strong><br>
                                        Interfaz completamente localizada
                                    </small>
                                </div>
                                <div class="col-md-4">
                                    <small class="text-muted">
                                        <i class="fas fa-mobile-alt text-info"></i>
                                        <strong>Responsive</strong><br>
                                        Funciona en cualquier dispositivo
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="text-center text-white py-4">
        <div class="container">
            <p class="mb-0">
                <small>
                    © {{ date('Y') }} Ababu - Sistema de Gestión Veterinaria | 
                    Hecho con <i class="fas fa-heart text-danger"></i> para veterinarios
                </small>
            </p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
            justify-content: center;
        }

        .position-ref {
            position: relative;
        }

        .top-right {
            position: absolute;
            right: 10px;
            top: 18px;
        }

        .content {
            text-align: center;
        }

        .title {
            font-size: 84px;
        }

        .subtitle {
            font-size: 33px;
        }

        .links>a {
            color: #636b6f;
            padding: 0 25px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: .1rem;
            text-decoration: none;
            text-transform: uppercase;
            text-align: center;
        }

        .m-b-md {
            margin-bottom: 30px;
        }
    </style>
</head>

<body>
    <div class="flex-center position-ref full-height">
        @if (Route::has('login'))
        <div class="top-right links">
            @auth
            <a href="{{ url('/home') }}">Home</a>
            @else
            <a href="{{ route('login') }}">{{ __('translate.login') }}</a>

            @if (Route::has('register'))
            <a href="{{ route('register') }}">{{ __('translate.register') }}</a>
            @endif
            @endauth
        </div>
        @endif

        <div class="content">
            <div class="title m-b-md">
                Ababu <sup class="subtitle m-b-md">beta</sup>
            </div>

            <div class="row">
                <div class="col links">
                    <a href="https://www.youtube.com/watch?v=WnCtKzm65_A" target="_BLANK">
                        <svg style="vertical-align: middle" xmlns="http://www.w3.org/2000/svg" width="16px"
                            height="16px" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
                            <path fill="currentColor"
                                d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104l.022.26l.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105l-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006l-.087-.004l-.171-.007l-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103l.003-.052l.008-.104l.022-.26l.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007l.172-.006l.086-.003l.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
                        </svg>
                        start here with a 3 min quick start video
                    </a>
                </div>
            </div>

        </div>
    </div>
</body>

</html>