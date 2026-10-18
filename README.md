# Data Modeling Projects

Relational database design practice by **Jorge Luis Gonzalez Perez** — Data Analyst.

Two entity-relationship (ER) exercises designed to practice normalization, primary/foreign
key relationships and schema design for transactional systems.

## 1. Hotel Reservation System (`hoteldb`)

A relational schema for a hotel booking system, including guests, employees, rooms,
reservations, payments, seasonal pricing and optional services.

- **Diagram:** [`diagrams/hoteldb_er_diagram.png`](diagrams/hoteldb_er_diagram.png)
- **SQL script:** [`hoteldb_schema.sql`](hoteldb_schema.sql) — MySQL Workbench forward-engineered
  DDL script. Creates the `hoteldb` schema with 7 tables, primary keys, foreign keys and
  indexes.

**Tables:** `cliente`, `empleado`, `habitacion`, `pagos`, `reserva`, `reserva_servicio`,
`servicio_adicional`, `temporada_tarifa`.

**How to run it:**

```sql
-- In MySQL Workbench or the MySQL CLI
SOURCE hoteldb_schema.sql;
```

## 2. Flight Reservation System (Flybondi)

A relational schema modeling an airline's reservation system: passengers, flights,
reservations, origin/destination airports and a modification history log.

- **Diagram:** [`diagrams/flybondi_er_diagram.png`](diagrams/flybondi_er_diagram.png)

**Tables:** `Pasajeros`, `Reservas`, `Vuelos`, `Origen`, `Destino`, `Historico de Modificacion`.

---

## About

Part of my data analytics portfolio: [jorgegonzalez.dev](#) <!-- replace with the real portfolio URL once deployed -->

**Tools:** MySQL Workbench, SQL (DDL), entity-relationship modeling.
