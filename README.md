# Movie Analytics Data Pipeline

An end-to-end data engineering project that ingests, transforms, and visualizes 10M+ records from IMDb's public dataset — built to answer real business questions about movies, people, and the entertainment industry.

---

## What This Project Does

Raw IMDb data across 7 datasets arrives as messy, inconsistent TSV files. This pipeline takes that data through a full production-style workflow:

- **Cleans and profiles** it using Alteryx
- **Transforms and models** it inside Databricks following Medallion Architecture (Bronze → Silver → Gold)
- **Serves it** as an interactive Power BI dashboard that answers 14 business questions

The result is a governed, queryable data warehouse with 28 Delta tables and dashboards that let any stakeholder — technical or not — explore the data without writing a single query.

---

## Tech Stack

| Layer                     | Tools                        |
| ------------------------- | ---------------------------- |
| Data Cleaning & Profiling | Alteryx                      |
| Data Modeling             | ER/Studio                    |
| Storage & Transformation  | Databricks, Delta Lake       |
| Visualization             | Power BI (DAX)               |
| Source Data               | IMDb Non-Commercial Datasets |

---

## Pipeline Architecture

```
7 IMDb TSV Files (10M+ records)
        │
        ▼
   Alteryx — profiling, null handling, standardization
        │
        ▼
   Bronze Layer — raw cleaned data loaded into Delta tables
        │
        ▼
   Silver Layer — typed, validated, exploded, join-ready
        │
        ▼
   Gold Layer — star schema (dimensions, facts, bridge tables)
        │
        ▼
   Power BI — 5 dashboard pages, 14 business requirements covered
```

---

## The Data Model

Designed as a Kimball-style star schema with surrogate keys, 2 fact tables, 7 dimensions, and 4 bridge tables to handle multi-valued relationships — a movie can have multiple genres, multiple crew members, and multiple regional releases.

**Facts:** Title Ratings · Episodes

**Dimensions:** Title · Name · Genre · Region · Language · Profession · Crew

**Bridges:** Title↔Genre · Title↔Crew · Person↔Profession · Title↔Region↔Language (Akas)

---

## What the Dashboards Answer

**Movie Insights** — Which genres dominate? How has movie production changed over time? What's the runtime trend by decade?

**Personnel & Professions** — Who holds multiple roles in the industry? What's the distribution of professions across 15M+ people?

**Crew Analysis** — Who are the most prolific directors and writers? How is cast and crew distributed across categories?

**Region & Language** — In how many countries and languages are titles released? Which regions produce the most content?

**TV Series & Episodes** — How do episode counts relate to ratings? How has series production grown over time?

---

## Scale

| Metric                        | Value                         |
| ----------------------------- | ----------------------------- |
| Source records processed      | 96M+ (title.principals alone) |
| Delta tables materialized     | 28                            |
| Business requirements covered | 14                            |
| Distinct regions              | 246                           |
| Distinct languages            | 184                           |
| Total personnel tracked       | 15M+                          |
| Total titles                  | 12M+                          |

---

## Repository Structure

```
movie-analytics-data-pipeline/
├── alteryx/          # Cleaning workflows for all 7 source files
├── databricks/
│   ├── bronze/       # Raw ingestion notebooks
│   ├── silver/       # Type casting, null handling, array explosion
│   └── gold/         # Dimension, fact, and bridge table builds
├── er_studio/        # Dimensional model (.dm1)
├── powerbi/          # Dashboard file (.pbix)
├── mapping_document/ # Source-to-target transformation mapping
└── data_profiling/   # Profiling reports from Alteryx
```

---

## Data Source

[IMDb Non-Commercial Datasets](https://developer.imdb.com/non-commercial-datasets/) — freely available for personal and academic use.
