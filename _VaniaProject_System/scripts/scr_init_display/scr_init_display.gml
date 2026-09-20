function fix_display_resolution(_width = 1280, _height = 720) {
    // 1. Activar y configurar la Vista 0 para la sala actual
    view_enabled = true;
    view_visible[0] = true;
    
    // 2. Definir dimensiones de la cámara y el puerto de vista
    camera_set_view_size(view_camera[0], _width, _height);
    view_set_wport(0, _width);
    view_set_hport(0, _height);
    
    // 3. Redimensionar la superficie de aplicación (evita el fallo en la esquina)
    surface_resize(application_surface, _width, _height);
    
    // 4. Ajustar la ventana de Windows
    window_set_size(_width, _height);
}