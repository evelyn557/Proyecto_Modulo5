# 💳 Proyecto Alke Wallet — Fundamentos de Bases de Datos Relacionales

<p align="center">
  <b>Portafolio de Desarrollo y Diseño de Base de Datos Relacional</b><br>
  <i>Módulo: Fundamentos de Bases de Datos Relacionales</i>
</p>

---

## 📌 Tabla de Contenidos
1. [Lección 1: Fundamentos de Bases de Datos Relacionales](#lección-1-fundamentos-de-bases-de-datos-relacionales)
2. [Lección 2: Consultas a una o varias tablas](#lección-2-consultas-a-una-o-varias-tablas)
3. [Lección 3: Sentencias para la Manipulación de Datos y Transaccionalidad](#lección-3-sentencias-para-la-manipulación-de-datos-y-transaccionalidad)
4. [Lección 4: Sentencias para la Definición de Tablas (DDL)](#lección-4-sentencias-para-la-definición-de-tablas-ddl)
5. [Lección 5: El Modelo Entidad-Relación (DER) y Normalización](#lección-5-el-modelo-entidad-relación-der-y-normalización)

---

## 🚀 Lección 1: Fundamentos de Bases de Datos Relacionales

### 1.1 ¿Qué es una Base de Datos Relacional y ventajas?
Una base de datos relacional es un sistema organizado que almacena información en tablas compuestas por filas y columnas, permitiendo establecer relaciones lógicas entre ellas mediante claves primarias y foráneas. Sus principales ventajas frente a otros modelos incluyen:

* **Inregridad de datos:** Restricciones estrictas que aseguran la validez y precisión de la información.
* **Reducción de redundancia:** Evita la duplicidad innecesaria optimizando el almacenamiento.
* **Transaccionalidad (ACID):** Garantiza operaciones financieras confiables y seguras.
* **Estandarización:** Uso de SQL para consultas complejas y cruces de datos eficientes.

> 📸 [Create Database]<img width="922" height="163" alt="create_batabase" src="https://github.com/user-attachments/assets/9ae1382b-a91e-47df-bb01-ac52ccab4d62" />



### 1.2 Tabla Comparativa: RDBMS Libres vs. Comerciales

| Criterio | RDBMS Libres / Open Source (Ej: MySQL, PostgreSQL, SQLite) | RDBMS Comerciales (Ej: Oracle DB, MS SQL Server) |
| :--- | :--- | :--- |
| **Costo** | Gratuito / Código abierto. | Alto costo de licencias comerciales. |
| **Soporte** | Comunitario y documentación web. | Soporte técnico corporativo 24/7 (SLA). |
| **Escalabilidad** | Alta, ideal para aplicaciones medianas y grandes. | Extrema, optimizada para grandes corporaciones. |

### 1.3 Tarea Plus: Esquema Comparativo (Mundo Real vs. BD Relacional)

| Concepto BD | Analogía del Mundo Real (Libreta de Contactos) | Ejemplo en Alke Wallet |
| :--- | :--- | :--- |
| **Base de Datos** | Un archivador o cajón completo de documentos. | `AlkeWallet` |
| **Tabla** | Una libreta o sección específica de contactos. | Tabla `usuario` |
| **Fila (Tupla)** | Una línea con los datos de una persona específica. | Registro de Evelyn Sepúlveda |
| **Columna (Atributo)** | La categoría o etiqueta (Ej: Teléfono). | `correo_electronico` |

---

## 🔍 Lección 2: Consultas a una o varias tablas

### 2.1 Consultas SQL Implementadas
Se desarrollaron consultas para recuperar información simple, filtros avanzados y uniones mediante `JOIN`:
* **Moneda elegida por un usuario específico** (ej: `user_id = 1`): Cruza las tablas `usuario`, `transaccion` y `moneda`.
* **Todas las transacciones registradas:** Listado general del historial.
* **Transacciones por usuario específico:** Filtra tanto las enviadas como las recibidas (`sender_user_id` o `receiver_user_id`).

> 📸 [Join 1]<img width="1093" height="263" alt="Join" src="https://github.com/user-attachments/assets/12bbcef6-808e-4f29-923c-0783f432695c" />

> 📸 [Join 2]<img width="1092" height="352" alt="join_2" src="https://github.com/user-attachments/assets/ccec7958-3af2-4173-8923-8f09673e35e7" />

> 📸 [Join 3]<img width="1093" height="310" alt="join_3" src="https://github.com/user-attachments/assets/80492917-f75c-4dc1-9e9e-051f1614c2d8" />


### 2.2 Tarea Plus: Creación de Vista Top Usuarios
Se creó una vista SQL (`CREATE VIEW`) para mostrar el top de usuarios con mayor saldo ordenados de forma descendente, optimizando la visualización ejecutiva del balance general.

> 📸 [View top usuarios]<img width="834" height="316" alt="vw_top_usuarios" src="https://github.com/user-attachments/assets/cd3e4a1e-b74a-4dab-82dd-376e516e75b6" />

> 📸 [Ejecución View]<img width="908" height="134" alt="create_view" src="https://github.com/user-attachments/assets/4f1e9458-c317-429a-838a-fbec991244f7" />

---

## ⚙️ Lección 3: Sentencias para la Manipulación de Datos y Transaccionalidad

### 3.1 Inserción, Actualización y Eliminación (DML)

Se realizaron inserciones iniciales en las tablas `moneda`, `usuario` y `transaccion`, además de modificar correos electrónicos y depurar registros de transacciones específicas mediante sentencias `INSERT`, `UPDATE` y `DELETE`.

> 📸 [Eliminar Transacción]<img width="942" height="173" alt="eliminar_transaccion" src="https://github.com/user-attachments/assets/091cbb80-982c-4664-92c4-73960bf1e9a5" />

> 📸 [Insertar Moneda]<img width="1103" height="157" alt="insertar_moneda" src="https://github.com/user-attachments/assets/9cd1cf9f-b182-4f07-8dd8-30c48e910088" />

> 📸 [Insertar Usuario]<img width="1197" height="189" alt="insertar_usuario" src="https://github.com/user-attachments/assets/e2cb7bf1-0acd-4e3a-b3bc-a995bf41e6ee" />

> 📸 [Modificar Correo]<img width="1189" height="151" alt="modificar_correo" src="https://github.com/user-attachments/assets/4cd6bda3-c08e-416a-a886-b5d6782d30bc" />



### 3.2 Propiedades ACID y Transacción Controlada

| Propiedad | Descripción |
| :--- | :--- |
| **Atomicidad** | Todo el bloque se ejecuta o se revierte por completo. |
| **Consistencia** | Respeta todas las reglas e integridad referencial. |
| **Aislamiento** | Las operaciones concurrentes no interfieren entre sí. |
| **Durabilidad** | Los cambios persisten permanentemente tras el `COMMIT`. |

> 📸 [Transacción] <img width="1037" height="284" alt="transaccion" src="https://github.com/user-attachments/assets/36de08f9-00ee-4598-983d-0000e68e8613" />

> 📸 [Commit]<img width="1223" height="337" alt="commit" src="https://github.com/user-attachments/assets/87547a00-e4b2-4986-8f63-275e234564a8" />


---

## 🛠️ Lección 4: Sentencias para la Definición de Tablas (DDL)

### 4.1 Creación de Entidades y Restricciones
Se crearon las tablas `moneda`, `usuario` y `transaccion` implementando claves primarias (`PK`), claves foráneas (`FK`), restricciones `NOT NULL` y un índice compuesto para optimizar búsquedas frecuentes entre usuarios.

> 📸 [Creación de tablas]<img width="890" height="207" alt="create_table_transaccion" src="https://github.com/user-attachments/assets/0c32207a-0467-4027-a46c-148a9b087b68" />


> 📸 [Tabla Moneda]<img width="751" height="194" alt="tabla_moneda" src="https://github.com/user-attachments/assets/5cc6b736-6a34-4823-8689-729254c8cc5c" />


> 📸 [Tabla Usuario]<img width="751" height="194" alt="tabla_usuario" src="https://github.com/user-attachments/assets/f2c4e075-7aa5-44cc-a586-ed3703940335" />


> 📸 [Tabla Transacción] <img width="791" height="181" alt="tabla_transaccion_act" src="https://github.com/user-attachments/assets/4a8926f3-af8b-4559-8d0f-ef421850e6af" />


> 📸 [Indice Compuesto] <img width="1214" height="190" alt="create_index" src="https://github.com/user-attachments/assets/87e42b19-5774-41f0-b349-20361b123648" />


---

## 📊 Lección 5: El Modelo Entidad-Relación (DER) y Normalización

### 5.1 Extracción de Requerimientos y Listado de Entidades
A partir de los requerimientos de **Alke Wallet**, se identificaron y definieron detalladamente las siguientes entidades y sus atributos:

* **Usuario:** Representa a cada cliente individual del sistema de monedero virtual.
  * *Atributos:* `user_id` (PK), `nombre`, `correo_electronico`, `contrasena`, `saldo`, `fecha_creacion`.
* **Moneda:** Representa las diferentes divisas que se pueden utilizar en el monedero.
  * *Atributos:* `currency_id` (PK), `currency_name`, `currency_symbol`.
* **Transacción:** Representa cada movimiento financiero realizado entre los usuarios.
  * *Atributos:* `transaction_id` (PK), `sender_user_id` (FK a Usuario), `receiver_user_id` (FK a Usuario), `importe`, `currency_id` (FK a Moneda), `transaction_date`.

### 5.2 Definición de Cardinalidades y Relaciones
* **Usuario a Transacción (Emisor):** Relación de 1 a N (1:N). Un usuario puede enviar ninguna o múltiples transacciones, pero cada transacción tiene un único emisor.
* **Usuario a Transacción (Receptor):** Relación de 1 a N (1:N). Un usuario puede recibir ninguna o múltiples transacciones, pero cada transacción tiene un único receptor.
* **Moneda a Transacción:** Relación de 1 a N (1:N). Una moneda puede ser utilizada en múltiples transacciones, pero cada transacción se asocia a una única moneda.
* **Relación Usuario y Moneda:** Relación de Muchos a Muchos (N:M) resuelta conceptual y físicamente a través de la entidad intermedia `transaccion`.

### 5.3 Tabla de Correspondencia: Modelo ER a Esquema Relacional

| Entidad Conceptual (ER) | Tabla Relacional | Clave Primaria (PK) | Claves Foráneas (FK) |
| :--- | :--- | :--- | :--- |
| **Usuario** | `usuario` | `user_id` | Ninguna |
| **Moneda** | `moneda` | `currency_id` | Ninguna |
| **Transacción** | `transaccion` | `transaction_id` | `sender_user_id`, `receiver_user_id`, `currency_id` |

### 5.4 Aplicación de Reglas de Normalización (Hasta 3FN)
Para garantizar la calidad de los datos y evitar anomalías, el modelo fue normalizado hasta la Tercera Forma Normal (3FN):
* **Primera Forma Normal (1FN):** Se aseguró que todos los atributos contengan valores atómicos y que no existan grupos repetitivos o listas de valores dentro de una misma celda.
* **Segunda Forma Normal (2FN):** La base de datos se encuentra en 1FN y todos los atributos que no forman parte de la clave principal dependen por completo y funcionalmente de toda la clave primaria.
* **Tercera Forma Normal (3FN):** Se eliminaron las dependencias transitivas. Ningún atributo no clave depende de otro atributo no clave; por ejemplo, la información detallada de las monedas se aisló en su propia tabla y solo se relaciona mediante identificadores numéricos.

### 5.5 Tarea Plus: Diagrama Entidad-Relación y Portafolio
El modelo conceptual se diseñó gráficamente utilizando herramientas especializadas de modelado de bases de datos (`draw.io`), estructurando de forma limpia las entidades junto con sus respectivas opcionalidades y cardinalidades.

> 📸 [Diagrama ERP]<img width="812" height="497" alt="Diagrama AlkeWallet" src="https://github.com/user-attachments/assets/079c6d90-eaf4-4aa4-8a4c-247e41e56d66" />


---
<p align="center">
  <i>Desarrollado como parte del portafolio académico — Alke Wallet © 2026</i>
</p>
