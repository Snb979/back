-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: fastapi_db
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int DEFAULT NULL,
  `status` enum('Activo','Inactivo') DEFAULT 'Activo',
  PRIMARY KEY (`id`),
  KEY `ix_products_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1874 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1765,'Tenis Rojos','azul',15000,8,'Inactivo'),(1766,'Camiseta Azul','Camiseta de algodón color azul',60000,34,'Activo'),(1767,'Camiseta','azul',10000,4,'Activo'),(1768,'Camiseta Básica','Camiseta de algodón color negro',25000,10,'Activo'),(1769,'Jeans Skinny','Jeans azul ajustado para mujer',85000,5,'Activo'),(1770,'Sudadera Oversize','Sudadera holgada unisex gris',65000,7,'Activo'),(1771,'Chaqueta Rompeviento','Chaqueta ligera impermeable',120000,3,'Activo'),(1772,'Tenis Deportivos','Zapatillas deportivas blancas',150000,12,'Activo'),(1773,'Camiseta Básica','Camiseta de algodón color negro',25000,10,'Activo'),(1774,'Sudadera Oversize','Sudadera holgada unisex gris',65000,7,'Activo'),(1775,'Tenis Deportivos','Zapatillas deportivas blancas',150000,12,'Activo'),(1776,'Blusa Manga Larga','Blusa elegante color beige',40000,9,'Activo'),(1777,'Pantalón Jogger','Pantalón cómodo para uso diario',70000,6,'Activo'),(1778,'Chaqueta de Cuero','Chaqueta negra de cuero sintético',180000,2,'Activo'),(1779,'Falda Plisada','Falda color rosa plisada',55000,8,'Activo'),(1780,'Falda Plisada','Falda color rosa plisada',55000,8,'Activo'),(1781,'Maleta escolar','Mochila grande con compartimentos y dise�o ergon�mico.',120000,19,'Activo'),(1782,'Tenis','Zapatos deportivos ligeros con suela antideslizante.',180000,6,'Activo'),(1783,'Gafas de sol','Lentes polarizados con marco met�lico.',90000,18,'Activo'),(1784,'Jeans Boyfriend','Jeans con un corte relajado y ligeramente oversized',120000,340,'Activo'),(1785,'Pantalon MomJeans','Pantalon de tiro alto, que se ajusta perfectamente a la cintura',90000,100,'Activo'),(1786,'Vestido blanco','Vestido midi de hombros descubiertos para mujer',93000,45,'Activo'),(1787,'Falda Gris','Falda con abertura y cintura alta',45000,30,'Activo'),(1788,'Falda negra','Falda con abertura y cintura alta',45000,35,'Activo'),(1789,'Sueter beige','Sueter con hombros descubiertos y pliegue',110000,20,'Activo'),(1790,'Camiseta Negra','Camiseta de manga corta con cuello redondo',35000,15,'Activo'),(1791,'Gorra deportiva','Gorra ajustable de algod�n con logo bordado.',45000,10,'Activo'),(1792,'Tenis running','Zapatos deportivos ligeros con suela antideslizante.',180000,6,'Activo'),(1793,'lentes','lentes de sol',20000,5,'Activo'),(1794,'Pantalón jeans','Jeans azul oscuro, talla M',80000,75,'Activo'),(1795,'Zapatos deportivos','Zapatos cómodos para correr',120000,50,'Activo'),(1796,'Mochila urbana','Mochila resistente y ligera',150000,40,'Activo'),(1797,'Reloj digital','Reloj resistente al agua',300000,35,'Activo'),(1798,'Auriculares Bluetooth','Sonido estéreo, inalámbricos',250000,80,'Activo'),(1799,'Camisa formal','Camisa blanca para oficina',90000,90,'Activo'),(1800,'Bufanda de lana','Bufanda suave y cálida',55000,60,'Activo'),(1801,'Chaqueta impermeable','Chaqueta para lluvia',180000,30,'Activo'),(1802,'Pantalones cortos','Cortos para verano',70000,110,'Activo'),(1803,'Calcetines deportivos','Pack de 5 pares',30000,150,'Activo'),(1804,'Camiseta deportiva','Tela transpirable',40000,95,'Activo'),(1805,'Sombrero de paja','Ideal para verano',15000,70,'Activo'),(1806,'Sandalias de playa','Cómodas y resistentes',60000,55,'Activo'),(1807,'Cinturón de cuero','Cinturón ajustable',40000,85,'Activo'),(1808,'Guantes térmicos','Para invierno',25000,65,'Activo'),(1809,'Botella de agua','Reutilizable, 1 litro',15000,200,'Activo'),(1810,'Mochila de senderismo','Grande y resistente',100000,25,'Activo'),(1811,'Linterna LED','Compacta y potente',38000,100,'Activo'),(1812,'Sudadera con capucha','Algodón suave',90000,80,'Activo'),(1813,'Pantalón de chándal','Cómodo para hacer deporte',50000,90,'Activo'),(1814,'Gorro de lana','Talla única',40000,120,'Activo'),(1815,'Zapatillas casuales','Para uso diario',110000,75,'Activo'),(1816,'Camiseta gráfica','Diseño moderno',40000,130,'Activo'),(1817,'Pantalón cargo','Con múltiples bolsillos',90000,60,'Activo'),(1818,'Gafas deportivas','Protección y estilo',30000,70,'Activo'),(1819,'Reloj analógico','Correa de cuero',180000,40,'Activo'),(1820,'Bufanda estampada','Colorida y suave',25000,100,'Activo'),(1821,'Camiseta de manga larga','Ideal para otoño',50000,95,'Activo'),(1822,'Zapatillas de running','Amortiguación avanzada',160000,50,'Activo'),(1823,'Pantalones de yoga','Tela elástica y cómoda',55000,80,'Activo'),(1824,'Mochila escolar','Diseño juvenil',100000,100,'Activo'),(1825,'Botas de montaña','Impermeables y resistentes',150000,35,'Activo'),(1826,'Gafas de lectura','Lentes anti-reflejantes',130000,60,'Activo'),(1827,'Camisa de mezclilla','Corte ajustado',70000,70,'Activo'),(1828,'Cinturón deportivo','Ajustable y duradero',54000,90,'Activo'),(1829,'Guantes táctiles','Para usar con pantalla táctil',20000,110,'Activo'),(1830,'Chaqueta softshell','Ligera y resistente al viento',80000,40,'Activo'),(1831,'Camiseta sin mangas','Para entrenamiento',40000,100,'Activo'),(1832,'Pantalones de lino','Frescos para verano',50000,65,'Activo'),(1833,'Sombrero fedora','Estilo elegante',70000,55,'Activo'),(1834,'Sandalias deportivas','Cómodas y duraderas',40000,80,'Activo'),(1835,'Mochila para laptop','Con compartimento acolchado',30000,50,'Activo'),(1836,'Reloj deportivo','Funciones avanzadas',50000,30,'Activo'),(1837,'Camiseta térmica','Mantiene el calor corporal',70000,70,'Activo'),(1838,'Pantalones vaqueros','Ajuste moderno',90000,90,'Activo'),(1839,'Bufanda de algodón','Suave y ligera',30000,120,'Activo'),(1840,'Zapatillas de skate','Suela resistente',110000,40,'Activo'),(1841,'Camisa hawaiana','Diseño colorido y fresco',60000,75,'Activo'),(1842,'Pantalones de vestir','Elegantes para oficina',85000,60,'Activo'),(1843,'Guantes de cuero','Elegantes y duraderos',40000,50,'Activo'),(1844,'Gorro de béisbol','Ajustable',60000,100,'Activo'),(1845,'Botas de cuero','Para uso casual',180000,30,'Activo'),(1846,'Mochila de viaje','Espacio amplio y compartimentos',130000,40,'Activo'),(1847,'Pantalones cortos deportivos','Cómodos para entrenar',60000,70,'Activo'),(1848,'Zapatillas de baloncesto','Amortiguación especial',120000,45,'Activo'),(1849,'Reloj elegante','Diseño minimalista',300000,25,'Activo'),(1850,'Bufanda de cachemir','Suave y cálida',20000,30,'Activo'),(1851,'Camiseta con capucha','Casual y cómoda',45000,90,'Activo'),(1852,'Pantalones de mezclilla','Corte clásico',70000,100,'Activo'),(1853,'Sandalias de cuero','Estilo vintage',90000,55,'Activo'),(1854,'Mochila ecológica','Material reciclado',45000,60,'Activo'),(1855,'Guantes para ciclismo','Con protección',39000,80,'Activo'),(1856,'Pantalones de chándal','Para entrenamiento',60000,95,'Activo'),(1857,'Sombrero para sol','Protección UV',75000,90,'Activo'),(1858,'Reloj digital deportivo','Funciones básicas',140000,50,'Activo'),(1859,'Bufanda reversible','Dos colores',38000,65,'Activo'),(1860,'Camisa de algodón','Transpirable y cómoda',60000,100,'Activo'),(1861,'Sandalias para niños','Cómodas y seguras',60000,100,'Activo'),(1862,'Guantes de invierno','Aislantes y cómodos',47000,60,'Activo'),(1863,'Pantalones deportivos','Tela elástica',60000,85,'Activo'),(1864,'Zapatillas para correr','Ligera y cómoda',140000,40,'Activo'),(1865,'Reloj con correa de acero','Elegante',300000,20,'Activo'),(1866,'Bufanda de punto','Suave y calentita',39000,80,'Activo'),(1867,'Camiseta de manga corta','Para uso diario',50000,120,'Activo'),(1868,'Pantalones vaqueros ajustados','Estilo moderno',90000,90,'Activo'),(1869,'Sandalias cómodas','Para verano',80000,75,'Activo'),(1870,'Guantes para smartphone','Táctiles',35000,100,'Activo'),(1871,'Camisa de lino','Fresca y ligera',40000,70,'Activo'),(1872,'Pantalones cargo','Varios bolsillos',90000,65,'Activo'),(1873,'Zapatillas urbanas','Cómodas y modernas',120000,85,'Activo');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25 14:28:09
