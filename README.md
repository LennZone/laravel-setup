# laravel-setup
This is a setup repo. When you clone (and have docker/docker compose installed) just run 
```bash
docker compose build
```

```bash
docker compose up -d
```

If you want to install some new packages go into the container with:

```bash
docker exec -it [appName] bash
```

and install all libraries you want. <br> If you are in the container already, you can run the following command to start the local webserver with Vite:

```bash
npm run dev
```

This command will automatically run the Vite JS and CSS compile and also the Tailwind compiler.

## Tailwind
You should write your CSS mainly in Tailwind. All Tailwind utility classes are stored in the "global.css". If you have to make some more specific CSS rules, you can add default CSS files in the "resources/css" folder. If you want to use those specific CSS files only in a blade component, you can add this with the "@vite(...)" (Same for JS).
