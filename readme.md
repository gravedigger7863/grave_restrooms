
# Grave Restrooms

## Description
**Grave Restrooms** is a FiveM resource that adds interactive restroom props to your server. Players can use toilets, sinks, and other restroom facilities to manage their hygiene and stress levels, enhancing the roleplay experience.

## Features
- **Interactive Restroom Props:** Toilets, sinks, and other restroom facilities.
- **Hygiene System:** Integrated with a MySQL database to track player hygiene levels.
- **Stress Relief:** Using restroom facilities reduces player stress.
- **Cooldown System:** Prevents spamming of restroom facilities.
- **Customizable Configurations:** Easily adjust prop effects, cooldowns, and animations.

## Dependencies
- `es_extended`
- `ox_lib`
- `ox_target`

## Installation
1. Ensure you have the required dependencies installed on your server.
2. Place the `grave_restrooms` folder into your server's `resources` directory.
3. Add `ensure grave_restrooms` to your `server.cfg` file.

## Configuration
Customize the restroom props and their effects by editing the `config/config.lua` file. You can adjust values for hygiene increase, stress relief, cooldown durations, and associated animations to fit your server's needs.

## Usage
Players can interact with restroom props using the `ox_target` system. When near a configured prop, players will see an interaction option to use the facility. Depending on the prop, this could include using a toilet, washing hands at a sink, etc.

## Database
This resource uses a MySQL database to store and manage player hygiene levels. Ensure that your database is properly set up and that your server is connected to it.

### Database Setup
Run the following SQL command to create the required table:

```sql
CREATE TABLE IF NOT EXISTS player_hygiene (
    identifier VARCHAR(50) PRIMARY KEY,
    hygiene_level INT DEFAULT 100
);
```

## Credits
Created by **GraveDigger7863**

## Version
**1.0.0**

## License
This project is licensed under the [MIT License](LICENSE).
