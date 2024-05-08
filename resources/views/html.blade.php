<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel</title>
        @vite('resources/css/base/global.css')
        @vite('resources/js/base/global.js')
    </head>
    <body class="bg-red-300">
        Hello World!
    @include('test')
    </body>
</html>
