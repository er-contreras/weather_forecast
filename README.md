## Instructions

1. Clone this repository.
2. Copy the next environment variables in a .env file:

   `DATABASE_HOST=postgres`

   `DATABASE_USERNAME=postgres`

   `DATABASE_PASSWORD=postgres`

    `WEATHER_API_KEY=0eebd1fcf852d29ca0340c5c451d4c9a`

3. Open Docker and run the following command in the terminal:
    * If you don't have installed Docker, you can download it from [here](https://www.docker.com/products/docker-desktop) its free.

   ```bash
   docker-compose up
   ```
   *Wait until the server is running. You will see a message like this:

   ```bash
   => Booting Puma
   => Rails 7.1.3.2 application starting in development
   => Run `bin/rails server --help` for more startup options
   Puma starting in single mode...
   * Puma version: 6.4.2 (ruby 3.2.2-p53) ("The Eagle of Durango")
   *  Min threads: 5
   *  Max threads: 5
   *  Environment: development
   *          PID: 1
   * Listening on http://0.0.0.0:3000
   Use Ctrl-C to stop
   ```
   
4. Open your browser and go to http://localhost:3000/search
5. You can search for a city and see the weather forecast for the next 5 days.

6. Enjoy!
![Screenshot 2024-02-28 at 15 48 14](https://github.com/er-contreras/weather_forecast/assets/67211919/388e060c-bfd6-4cd5-8932-47601125eb11)

