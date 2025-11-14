@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-success text-white">
                    <h4>🏠 Dashboard - Ababu Veterinaria</h4>
                </div>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="alert alert-info">
                        <h5>✅ ¡Bienvenido a Ababu!</h5>
                        <p>El sistema está funcionando correctamente.</p>
                    </div>

                    @if(Auth::check())
                        <div class="row">
                            <div class="col-md-6">
                                <h6>👤 Usuario logueado:</h6>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <strong>Nombre:</strong> {{ Auth::user()->name }}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>Email:</strong> {{ Auth::user()->email }}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>Clínicas:</strong> 
                                        @if(Auth::user()->clinics && Auth::user()->clinics->count() > 0)
                                            {{ Auth::user()->clinics->count() }}
                                        @else
                                            0 (Sin clínicas)
                                        @endif
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6>🏥 Acciones disponibles:</h6>
                                @if(Auth::user()->clinics && Auth::user()->clinics->count() > 0)
                                    <div class="list-group">
                                        @foreach (Auth::user()->clinics as $clinic)
                                            <a href="{{ route('clinics.show', $clinic) }}" class="list-group-item list-group-item-action">
                                                <strong>{{ $clinic->name }}</strong>
                                                <br>
                                                <small>{{ $clinic->country->name ?? 'País no especificado' }}</small>
                                            </a>
                                        @endforeach
                                    </div>
                                @else
                                    <div class="text-center">
                                        <p>No tienes clínicas registradas.</p>
                                        <a href="{{ route('clinics.create') }}" class="btn btn-primary btn-lg mb-2">
                                            🏗️ Crear Nueva Clínica
                                        </a>
                                        <br>
                                        <small class="text-muted">Crea tu propia clínica veterinaria</small>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @else
                        <div class="alert alert-warning">
                            <p>No estás logueado. <a href="{{ route('login') }}">Inicia sesión aquí</a></p>
                        </div>
                    @endif

                    <hr>
                    <div class="text-center">
                        <small class="text-muted">
                            Sistema Ababu - Gestión Veterinaria © {{ date('Y') }}
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection