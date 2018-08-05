import { SwaggerUIBundle } from 'swagger-ui-dist'
import 'swagger-ui-dist/swagger-ui.css'

document.addEventListener('DOMContentLoaded', () => {
  const ui = SwaggerUIBundle({
    dom_id: '#swagger-ui',
    deepLinking: true,
    spec: swaggerSpec, // eslint-disable-line
    presets: [
      SwaggerUIBundle.presets.apis
    ],
    layout: 'BaseLayout'
  })
  window.ui = ui
})
