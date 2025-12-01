# Celestial-Bodies-Database

A relational database project for freeCodeCamp's Relational Database Certification.

## Description

This PostgreSQL database models a universe with galaxies, stars, planets, moons, and constellations. It demonstrates proper database design with primary keys, foreign keys, and various data types.

## Database Structure

- **galaxy**: Contains information about galaxies (type, age, rotation speed)
- **star**: Stars within galaxies with planet counts
- **planet**: Planets orbiting stars (includes life detection, moon counts)
- **moon**: Natural satellites orbiting planets (shape, diameter)
- **constellation**: Star patterns across galaxies

## Features

- Foreign key relationships connecting all tables
- Mix of data types (INT, NUMERIC, VARCHAR, TEXT, BOOLEAN)
- UNIQUE and NOT NULL constraints
- Auto-incrementing SERIAL primary keys
- Sample data from our solar system and beyond

## Restore Database

To rebuild this database:
```bash
psql -U postgres < universe.sql
```

---

**Project completed as part of [freeCodeCamp](https://www.freecodecamp.org/) Relational Database Certification.**
