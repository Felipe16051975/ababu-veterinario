@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2>
                        <i class="fas fa-paw"></i>
                        {{ $pet->name ?? 'Mascota' }} - Ficha Clínica
                    </h2>
                </div>
                <div class="card-body">
                    <div class="alert alert-success">
                        <h4>✅ ¡El sitio está funcionando correctamente!</h4>
                        <p>Esta es una versión simplificada de la ficha clínica para verificar la conectividad.</p>
                        
                        @if(isset($pet))
                            <ul class="list-unstyled mt-3">
                                <li><strong>Nombre:</strong> {{ $pet->name }}</li>
                                <li><strong>Especie:</strong> {{ $pet->species->familiar_name ?? 'N/A' }}</li>
                                <li><strong>Sexo:</strong> {{ $pet->sex }}</li>
                                <li><strong>Propietario:</strong> {{ $pet->owner->fullname ?? 'N/A' }}</li>
                            </ul>
                        @endif
                    </div>
                    
                    <div class="mt-4">
                        <h5>Estado del Sistema</h5>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Servidor Laravel
                                <span class="badge badge-success badge-pill">Funcionando</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Base de Datos
                                <span class="badge badge-success badge-pill">Conectada</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Traducciones
                                <span class="badge badge-success badge-pill">{{ __('translate.active_from') }}</span>
                            </li>
                        </ul>
                    </div>

                    <div class="mt-4">
                        <a href="javascript:history.back()" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Volver
                        </a>
                        <button onclick="testFullVersion()" class="btn btn-primary">
                            <i class="fas fa-sync"></i> Probar versión completa
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function testFullVersion() {
    if(confirm('¿Desea cargar la versión completa de la ficha clínica?')) {
        window.location.reload();
    }
}
</script>
@endsection