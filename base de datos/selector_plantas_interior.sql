-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2024 a las 15:11:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `selector_plantas_interior`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `id_producto`, `cantidad`, `precio`, `direccion`) VALUES
(4, 14, 1, 1, 8.25, 'dsfsdfsdf'),
(6, 14, 1, 12, 8.25, 'dsfdsfsd'),
(7, 15, 1, 1, 8.25, 'dsfdsfds'),
(8, 15, 1, 1, 8.25, 'dsfdsfds'),
(9, 15, 1, 1, 8.25, 'dsfdsfds'),
(10, 15, 1, 1, 8.25, 'dsfdsfds'),
(11, 15, 1, 1, 8.25, 'dsfdsfds'),
(12, 15, 1, 1, 8.25, 'dsfdsfds'),
(13, 15, 1, 1, 8.25, 'dsfdsfds'),
(14, 15, 1, 1, 8.25, 'dsfdsfds'),
(15, 14, 1, 1, 8.25, 'dsfdsfdsfsd'),
(16, 14, 1, 1, 8.25, 'dsfdsfdsfsd'),
(17, 14, 1, 1, 8.25, 'dsfdsfdsfsd'),
(18, 14, 1, 1, 8.25, 'dsfdsfdsfsd'),
(19, 14, 1, 1, 8.25, 'dsfdsfdsfsd'),
(20, 14, 1, 1, 8.25, 'dsfdsfds'),
(21, NULL, 100, 1, 0.00, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_Producto` int(11) NOT NULL,
  `Especie` varchar(50) DEFAULT NULL,
  `Nombre_comun` varchar(50) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Familia` varchar(50) DEFAULT NULL,
  `Procedencia` varchar(50) DEFAULT NULL,
  `Zona_A` tinyint(1) DEFAULT NULL,
  `Zona_B` tinyint(1) DEFAULT NULL,
  `Zona_C` tinyint(1) DEFAULT NULL,
  `ValorReferencia_11` int(11) NOT NULL,
  `ValorReferencia_12` int(11) NOT NULL,
  `ValorReferencia_13` int(11) NOT NULL,
  `ValorReferencia_14` int(11) NOT NULL,
  `ValorReferencia_15` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_Producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia`, `Zona_A`, `Zona_B`, `Zona_C`, `ValorReferencia_11`, `ValorReferencia_12`, `ValorReferencia_13`, `ValorReferencia_14`, `ValorReferencia_15`, `precio`) VALUES
(1, 'Hippeastrum sp.', 'Amarilis', 'Herbacea', 'Amaryllidaceae', 'Mexico y America del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, 8.25),
(2, 'Hosta kikutii', 'Hosta', 'Herbacea', 'Asparagaceae', 'Atruea / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(3, 'Iretruene herbstii', 'Iretruene', 'Herbacea', 'Amaranthaceae', 'Bratruel / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(4, 'Scilla bifolia', 'Estrella azul', 'Herbacea', 'Asparagaceae', 'Atruea y Europa / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(5, 'Lythrum salicaria', 'Salicaria', 'Herbacea', 'Lythraceae', 'Cosmopolita / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(6, 'Melianthus major', 'Melianto', 'Herbacea', 'Francoaceae', 'Africa y Oceania / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(7, 'Mitraria sp.', 'Mitraria', 'Herbacea', 'Gesneriaceae', 'Chile y Argentina / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(8, 'Nematanthus gregarius', 'Nematanthus', 'Herbacea', 'Gesneriaceae', 'Bratruel / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(9, 'Nerine sarnientrues', 'Azucena  ', 'Herbacea', 'Amaryllidaceae', 'Africa del Sur / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(10, 'Ornithogalum arabicum', 'Ornitólago', 'Herbacea', 'Asparagaceae', 'Mediterraneo / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(11, 'Pachysandra terminalis', 'Pachisandra japonesa', 'Herbacea', 'Buxaceae', 'China y Japon / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(12, 'Plectranthus australis', 'Planta del dinero', 'Herbacea', 'Lamiaceae', 'Africa / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(13, 'Plectranthus X hybrida', 'Cóleo ', 'Herbacea', 'Lamiaceae', 'Hibrido / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(14, 'Plectranthus verticillatus', 'Planta del dinero', 'Herbacea', 'Lamiaceae', 'Africa / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(15, 'Saxifraga stolonifera', 'Madre de cientos', 'Herbacea', 'Saxifragaceae', 'Atruea / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(16, 'Scutellaria costaricana', 'Escutelaria', 'Herbacea', 'Lamiaceae', 'Costa Rica / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(17, 'Selaginella denticulata', 'Musgo', 'Herbacea', 'Selaginellaceae', 'Cosmopolita / Altura', 0, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(18, 'Shibataea kumasasa', 'Bambú ruscus', 'Herbacea', 'Poaceae', 'Atruea y Africa / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(19, 'Sprekelia formotruestruema', 'Amarilis', 'Herbacea', 'Amaryllidaceae', 'Mexico / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(20, 'Stachytarpheta jamaicentrues', 'Verbena', 'Herbacea', 'Verbenaceae', 'America del Sur / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(21, 'Tradescantia truellamontana', 'Tradescantia  ', 'Herbacea', 'Commelinaceae', 'Mexico / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(22, 'Tradescantia virginiana', 'Tradescantia azul', 'Herbacea', 'Commelinaceae', 'America del falserte / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(23, 'Veltheimia bracteata', 'Lirio de bosque', 'Herbacea', 'Asparagaceae', 'Africa del Sur / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(24, 'Vinca major', 'Vinca mayor', 'Herbacea', 'Apocynaceae', 'Mediterraneo / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(25, 'Vinca mifalser', 'Vinca', 'Herbacea', 'Apocynaceae', 'Europa / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(26, 'Aporocactus flagelliformis', 'Cola de Zorro', 'Suculenta', 'Cactaceae', 'Mexico / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(27, 'Gasteria sp.', 'Gasteria', 'Suculenta', 'Xanthorrhoeaceae', 'Africa del Sur / Altura', 1, 1, 0, 700, 1350, 2200, 1350, 700, NULL),
(28, 'Sansevieria trifasciata', 'Sanseviera', 'Suculenta', 'Asparagaceae', 'Africa / Altura', 1, 1, 0, 700, 1350, 2200, 1350, 700, NULL),
(29, 'Sedum morganianum', 'Trenza', 'Suculenta', 'Crassulaceae', 'Mexico y America Central / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(30, 'Sedum rubrotinctum', 'Gomifalsela', 'Suculenta', 'Crassulaceae', 'Mexico / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(31, 'Selenicereus sp.', 'Selenicereus', 'Suculenta', 'Cactaceae', 'Mexico / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(32, 'Aristolochia grandiflora', 'Aristoloquia gigante', 'Trepadora', 'Aristolochiaceae', 'America Central / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(33, 'Asparagus plumosus', 'Esparraguera', 'Trepadora', 'Asparagaceae', 'falserte de Africa / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(34, 'Canarina canarientrues', 'Bicacarera', 'Trepadora', 'Campanulaceae', 'Islas Canarias / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(35, 'Cissus antarctica', 'Cisus', 'Trepadora', 'Vitaceae', 'Australia / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(36, 'Cobaea scandens', 'Yedra morada', 'Trepadora', 'Polemoniaceae', 'Mexico / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(37, 'Jasminum nitidum', 'Jazmín estrella', 'Trepadora', 'Oleaceae', 'Pacifico / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(38, 'Jasminum sambac', 'Sampaguita', 'Trepadora', 'Oleaceae', 'Filipinas / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(39, 'Pastrueflora caerulea', 'Patrueonaria', 'Trepadora', 'Pastruefloraceae', 'America del Sur / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(40, 'Petrea volubilis', 'Santa Lucía', 'Trepadora', 'Verbenaceae', 'Mexico y America Central / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(41, 'Pyrostegia venusta', 'Pyrostegia', 'Trepadora', 'Bigfalseniaceae', 'America del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(42, 'Quisqualis indica', 'Piscuala', 'Trepadora', 'Combretaceae', 'Atruea / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(43, 'Senecio confusus', 'Senecio', 'Trepadora', 'Asteraceae', 'Mexico / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(44, 'Thunbergia grandiflora', 'Tumbergia', 'Trepadora', 'Acanthaceae', 'Atruea / Altura', 1, 1, 0, 700, 1350, 2200, 1350, 700, NULL),
(45, 'Vigna caracalla', 'Vigna', 'Trepadora', 'Fabaceae', 'America Central y del Sur / Altura', 1, 1, 0, 700, 1350, 2200, 1350, 700, NULL),
(46, 'x Fatshedera lizei', 'Hiedra', 'Trepadora', 'Araliaceae', 'Hibrido / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(47, 'Schefflera arboricola', 'Sheflera', 'Frondosa ', 'Araliaceae', 'China y Taiwan / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(48, 'Howea forsteriana', 'Kentia', 'Palmera', 'Arecaceae', 'Australia / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(49, 'Rhapis excelsa', 'Rapis', 'Palmera', 'Arecaceae', 'Atruea / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(50, 'Allamanda schottii', 'Alamanda', 'Arbusto ', 'Apocynaceae', 'Bratruel / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(51, 'Boronia heterophylla', 'Boronia', 'Arbusto ', 'Rutaceae', 'Australia / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(52, 'Caesalpinia pulcherrima', 'Ponciana', 'Arbusto ', 'Fabaceae', 'America del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(53, 'Camellia japonica', 'Camelia', 'Arbusto ', 'Theaceae', 'China y Japon / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(54, 'Cestrum falsecturnum', 'Galán de falseche', 'Arbusto ', 'Solanaceae', 'Caribe / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(55, 'Cordyline fruticosa', 'Cordiline', 'Arbusto ', 'Asparagaceae', 'Atruea y Oceania / Altura', 1, 1, 0, 700, 1350, 2200, 1350, 700, NULL),
(56, 'Eranthemum sp.', 'Eratemun', 'Arbusto ', 'Acanthaceae', 'Atruea / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(57, 'Fuchtruea boliviana', 'Árbol de los Andes', 'Arbusto ', 'Onagraceae', 'America del Sur / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(58, 'Heliotropium arborescens', 'Heliotropium', 'Arbusto ', 'Boraginaceae', 'America del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(59, 'Juanulloa mexicana', 'Juanulloa', 'Arbusto ', 'Solanaceae', 'America Central y del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(60, 'Mackaya bella', 'Arbusto de campana', 'Arbusto ', 'Acanthaceae', 'Africa del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(61, 'Manihot glaziovii', 'Maniot', 'Arbusto ', 'Euphorbiaceae', 'Bratruel / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(62, 'Murraya paniculata', 'Murraya', 'Arbusto ', 'Rutaceae', 'Atruea / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(63, 'Pisonia umbellifera', 'Pisonia', 'Arbusto ', 'Nyctaginaceae', 'Indico y Pacifico / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(64, 'Rondeletia odorata', 'Rondeletia', 'Arbusto ', 'Rubiaceae', 'Cuba y Panama / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(65, 'Senecio petatruetis', 'Roldana', 'Arbusto ', 'Asteraceae', 'Mexico / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(66, 'Tecomaria capentrues', 'Tecoma', 'Arbusto ', 'Bigfalseniaceae', 'Africa del Sur / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(67, 'Tibouchina sp.', 'Tibouchina', 'Arbusto ', 'Melastomataceae', 'America Central y del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(68, 'Asplenium bulbiferum', 'Asplenium', 'Helecho ', 'Aspleniaceae', 'Nueva Zelanda / Altura', 0, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(69, 'Blechnum gibbum', 'Blechun', 'Helecho ', 'Blechnaceae', 'Pacifico Sur / Altura', 0, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(70, 'Dicksonia antarctica', 'Helecho arbóreo', 'Helecho ', 'Dicksoniaceae', 'Australia / Altura', 0, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(71, 'Niphidium crastruefolium', 'Polipodio', 'Helecho ', 'Polypodiaceae', 'America del Sur / Altura', 0, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(72, 'Polystichum sp.', 'Helecho polistichum', 'Helecho ', 'Dryopteridaceae', 'Cosmopolita / Altura', 0, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(73, 'Thelypteris palustris', 'Helecho de los Pantafalses', 'Helecho ', 'Thelypteridaceae', 'Hemisferio falserte / Altura', 0, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(74, 'Acalypha reptans', 'Acalifa rastrera', 'Herbacea', 'Euphorbiaceae', 'India / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(75, 'Acanthus mollis', 'Acanto', 'Herbacea', 'Acanthaceae', 'Mediterraneo / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(76, 'Adefalsestyles alliariae', 'Adefalsestiles del pirineo', 'Herbacea', 'Asteroideae', 'Europa / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(77, 'Ajuga reptans', 'Búgula', 'Herbacea', 'Lamiaceae', 'Europa / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(78, 'Alpinia zerumbet', 'gengibre concha', 'Herbacea', 'Zingiberaceae', 'Atruea / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(79, 'Anemone blanda', 'Anémona azul', 'Herbacea', 'Ranunculaceae', 'Europa / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(80, 'Asclepias curassavica', 'Asclepias', 'Herbacea', 'Apocynaceae', 'America del Sur / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(81, 'Aubrieta x cultorum', 'Aubrietia', 'Herbacea', 'Brastruecaceae', 'Atruea y Europa / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(82, 'Begonia rex', 'Begonia', 'Herbacea', 'Begoniaceae', 'Atruea / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(83, 'Billbergia nutans', 'Bromelia', 'Herbacea', 'Bromeliaceae', 'America del Sur / Altura', 0, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(84, 'Billbergia pyramidalis', 'Bromelia', 'Herbacea', 'Bromeliaceae', 'America del Sur / Altura', 0, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(85, 'Bromelia sp.', 'Bromelia', 'Herbacea', 'Bromeliaceae', 'Continente americafalse / Altura', 0, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(86, 'Calla palustris', 'Cala', 'Herbacea', 'Araceae', 'Cosmopolita / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(87, 'Cleome hassleriana', 'Flor araña', 'Herbacea', 'Cleomaceae', 'America del Sur / Altura', 1, 1, 1, 700, 1350, 2200, 1350, 700, NULL),
(88, 'Clivia sp.', 'Clivia', 'Herbacea', 'Amaryllidaceae', 'Africa / Altura', 1, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(89, 'Colocatruea esculenta', 'Colocatruea', 'Herbacea', 'Araceae', 'Papua Nueva Guinea / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(90, 'Convallaria majalis', 'Convalaria', 'Herbacea', 'Asparagaceae', 'Europa / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(91, 'Crinum atrueaticum', 'Crium', 'Herbacea', 'Amaryllidaceae', 'Atruea / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(92, 'Cymbopogon citratus', 'Cedrón', 'Herbacea', 'Poaceae', 'Atruea / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(93, 'Cyperus papyrus', 'Papiro', 'Herbacea', 'Cyperaceae', 'Mediterraneo / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(94, 'Danae racemosa', 'Danae', 'Herbacea', 'Asparagaceae', 'Mediterraneo / Altura', 1, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(95, 'Dichorisandra thyrtrueflora', 'Dichorisandra', 'Herbacea', 'Commelinaceae', 'America del Sur / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(96, 'Drimioptrues maculata', 'Piel de leopardo', 'Herbacea', 'Asparagaceae', 'Africa del Sur / Altura', 1, 1, 1, 750, 1500, 2500, 1500, 750, NULL),
(97, 'Gunnera manicata', 'Ruibarbo gigante', 'Herbacea', 'Gunneraceae', 'Bratruel / Altura', 1, 1, 0, 1325, 2250, 3000, 2250, 1325, NULL),
(98, 'Gynura aurantiaca', 'Planta terciopelo', 'Herbacea', 'Asteraceae', 'Atruea / Altura', 0, 1, 0, 750, 1500, 2500, 1500, 750, NULL),
(99, 'Hedychium coronarium', 'Mariposa blanca', 'Herbacea', 'Zingiberaceae', 'India y Nepal / Altura', 0, 1, 1, 1325, 2250, 3000, 2250, 1325, NULL),
(100, 'Hedychium dentrueflorum', 'Lirio de gengibre', 'Herbacea', 'Zingiberaceae', 'Atruea / Altura', 0, 1, 1, 750, 1500, 2500, 1500, 750, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(10) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `password`, `email`) VALUES
(14, '1234', '$2y$10$EaecyJrmGAoNRIwP4BPZluupyRkPGQYXTJMWiYcXEISOWRC2wE6q2', 'hjghj@fdgdfg'),
(15, 'prueba', '$2y$10$3x2zs2OzkK8a3w2jJCrX5e0Dyfr8ek6gPbWQIdoTwCUPfjey/m53G', 'hjghj@fdgdfg'),
(16, 'sdfdsfsd', '$2y$10$X0XKh8LUqkif4ui0EfDgyO7XU6JSaYningyGwUUTkGBQNEZ9fsunS', 'hjghj@fdgdfg'),
(17, '32423', '$2y$10$LOcUXLIU3/A3oZb19QqCUuhCkp7gEQF8SuFkOLocSUiMQIHn9It.O', 'hjghj@fdgdfg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `pedidos_ibfk_1` (`id_usuario`),
  ADD KEY `pedidos_ibfk_2` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_Producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
