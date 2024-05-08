import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/base/global.css',
                'resources/css/test.css',
                'resources/js/base/global.js',
                'resources/js/test.js'
            ],
            refresh: true,
        }),
    ],
});
