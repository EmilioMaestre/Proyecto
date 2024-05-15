-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2024 a las 13:16:34
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
  `Zona_C` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_Producto`, `Especie`, `Nombre_comun`, `Tipo`, `Familia`, `Procedencia`, `Zona_A`, `Zona_B`, `Zona_C`) VALUES
(1, 'Hippeastrum sp.', 'Amarilis', 'Herbacea', 'Amaryllidaceae', 'Mexico y America del Sur / Altura', 1, 1, 1),
(2, 'Hosta kikutii', 'Hosta', 'Herbacea', 'Asparagaceae', 'Atruea / Altura', 1, 1, 1),
(3, 'Iretruene herbstii', 'Iretruene', 'Herbacea', 'Amaranthaceae', 'Bratruel / Altura', 1, 1, 1),
(4, 'Scilla bifolia', 'Estrella azul', 'Herbacea', 'Asparagaceae', 'Atruea y Europa / Altura', 1, 1, 1),
(5, 'Lythrum salicaria', 'Salicaria', 'Herbacea', 'Lythraceae', 'Cosmopolita / Altura', 1, 1, 1),
(6, 'Melianthus major', 'Melianto', 'Herbacea', 'Francoaceae', 'Africa y Oceania / Altura', 1, 1, 1),
(7, 'Mitraria sp.', 'Mitraria', 'Herbacea', 'Gesneriaceae', 'Chile y Argentina / Altura', 1, 1, 0),
(8, 'Nematanthus gregarius', 'Nematanthus', 'Herbacea', 'Gesneriaceae', 'Bratruel / Altura', 1, 1, 0),
(9, 'Nerine sarnientrues', 'Azucena  ', 'Herbacea', 'Amaryllidaceae', 'Africa del Sur / Altura', 1, 1, 0),
(10, 'Ornithogalum arabicum', 'Ornitólago', 'Herbacea', 'Asparagaceae', 'Mediterraneo / Altura', 1, 1, 1),
(11, 'Pachysandra terminalis', 'Pachisandra japonesa', 'Herbacea', 'Buxaceae', 'China y Japon / Altura', 1, 1, 1),
(12, 'Plectranthus australis', 'Planta del dinero', 'Herbacea', 'Lamiaceae', 'Africa / Altura', 1, 1, 1),
(13, 'Plectranthus X hybrida', 'Cóleo ', 'Herbacea', 'Lamiaceae', 'Hibrido / Altura', 1, 1, 1),
(14, 'Plectranthus verticillatus', 'Planta del dinero', 'Herbacea', 'Lamiaceae', 'Africa / Altura', 1, 1, 1),
(15, 'Saxifraga stolonifera', 'Madre de cientos', 'Herbacea', 'Saxifragaceae', 'Atruea / Altura', 1, 1, 0),
(16, 'Scutellaria costaricana', 'Escutelaria', 'Herbacea', 'Lamiaceae', 'Costa Rica / Altura', 1, 1, 1),
(17, 'Selaginella denticulata', 'Musgo', 'Herbacea', 'Selaginellaceae', 'Cosmopolita / Altura', 0, 1, 1),
(18, 'Shibataea kumasasa', 'Bambú ruscus', 'Herbacea', 'Poaceae', 'Atruea y Africa / Altura', 1, 1, 1),
(19, 'Sprekelia formotruestruema', 'Amarilis', 'Herbacea', 'Amaryllidaceae', 'Mexico / Altura', 1, 1, 1),
(20, 'Stachytarpheta jamaicentrues', 'Verbena', 'Herbacea', 'Verbenaceae', 'America del Sur / Altura', 1, 1, 0),
(21, 'Tradescantia truellamontana', 'Tradescantia  ', 'Herbacea', 'Commelinaceae', 'Mexico / Altura', 1, 1, 1),
(22, 'Tradescantia virginiana', 'Tradescantia azul', 'Herbacea', 'Commelinaceae', 'America del falserte / Altura', 1, 1, 1),
(23, 'Veltheimia bracteata', 'Lirio de bosque', 'Herbacea', 'Asparagaceae', 'Africa del Sur / Altura', 1, 1, 1),
(24, 'Vinca major', 'Vinca mayor', 'Herbacea', 'Apocynaceae', 'Mediterraneo / Altura', 1, 1, 1),
(25, 'Vinca mifalser', 'Vinca', 'Herbacea', 'Apocynaceae', 'Europa / Altura', 1, 1, 1),
(26, 'Aporocactus flagelliformis', 'Cola de Zorro', 'Suculenta', 'Cactaceae', 'Mexico / Altura', 1, 1, 1),
(27, 'Gasteria sp.', 'Gasteria', 'Suculenta', 'Xanthorrhoeaceae', 'Africa del Sur / Altura', 1, 1, 0),
(28, 'Sansevieria trifasciata', 'Sanseviera', 'Suculenta', 'Asparagaceae', 'Africa / Altura', 1, 1, 0),
(29, 'Sedum morganianum', 'Trenza', 'Suculenta', 'Crassulaceae', 'Mexico y America Central / Altura', 1, 1, 1),
(30, 'Sedum rubrotinctum', 'Gomifalsela', 'Suculenta', 'Crassulaceae', 'Mexico / Altura', 1, 1, 1),
(31, 'Selenicereus sp.', 'Selenicereus', 'Suculenta', 'Cactaceae', 'Mexico / Altura', 1, 1, 1),
(32, 'Aristolochia grandiflora', 'Aristoloquia gigante', 'Trepadora', 'Aristolochiaceae', 'America Central / Altura', 1, 1, 1),
(33, 'Asparagus plumosus', 'Esparraguera', 'Trepadora', 'Asparagaceae', 'falserte de Africa / Altura', 1, 1, 1),
(34, 'Canarina canarientrues', 'Bicacarera', 'Trepadora', 'Campanulaceae', 'Islas Canarias / Altura', 1, 1, 1),
(35, 'Cissus antarctica', 'Cisus', 'Trepadora', 'Vitaceae', 'Australia / Altura', 1, 1, 0),
(36, 'Cobaea scandens', 'Yedra morada', 'Trepadora', 'Polemoniaceae', 'Mexico / Altura', 1, 1, 1),
(37, 'Jasminum nitidum', 'Jazmín estrella', 'Trepadora', 'Oleaceae', 'Pacifico / Altura', 1, 1, 1),
(38, 'Jasminum sambac', 'Sampaguita', 'Trepadora', 'Oleaceae', 'Filipinas / Altura', 1, 1, 1),
(39, 'Pastrueflora caerulea', 'Patrueonaria', 'Trepadora', 'Pastruefloraceae', 'America del Sur / Altura', 1, 1, 1),
(40, 'Petrea volubilis', 'Santa Lucía', 'Trepadora', 'Verbenaceae', 'Mexico y America Central / Altura', 1, 1, 1),
(41, 'Pyrostegia venusta', 'Pyrostegia', 'Trepadora', 'Bigfalseniaceae', 'America del Sur / Altura', 1, 1, 1),
(42, 'Quisqualis indica', 'Piscuala', 'Trepadora', 'Combretaceae', 'Atruea / Altura', 1, 1, 1),
(43, 'Senecio confusus', 'Senecio', 'Trepadora', 'Asteraceae', 'Mexico / Altura', 1, 1, 1),
(44, 'Thunbergia grandiflora', 'Tumbergia', 'Trepadora', 'Acanthaceae', 'Atruea / Altura', 1, 1, 0),
(45, 'Vigna caracalla', 'Vigna', 'Trepadora', 'Fabaceae', 'America Central y del Sur / Altura', 1, 1, 0),
(46, 'x Fatshedera lizei', 'Hiedra', 'Trepadora', 'Araliaceae', 'Hibrido / Altura', 1, 1, 0),
(47, 'Schefflera arboricola', 'Sheflera', 'Frondosa ', 'Araliaceae', 'China y Taiwan / Altura', 1, 1, 0),
(48, 'Howea forsteriana', 'Kentia', 'Palmera', 'Arecaceae', 'Australia / Altura', 1, 1, 0),
(49, 'Rhapis excelsa', 'Rapis', 'Palmera', 'Arecaceae', 'Atruea / Altura', 1, 1, 0),
(50, 'Allamanda schottii', 'Alamanda', 'Arbusto ', 'Apocynaceae', 'Bratruel / Altura', 1, 1, 0),
(51, 'Boronia heterophylla', 'Boronia', 'Arbusto ', 'Rutaceae', 'Australia / Altura', 1, 1, 1),
(52, 'Caesalpinia pulcherrima', 'Ponciana', 'Arbusto ', 'Fabaceae', 'America del Sur / Altura', 1, 1, 1),
(53, 'Camellia japonica', 'Camelia', 'Arbusto ', 'Theaceae', 'China y Japon / Altura', 1, 1, 1),
(54, 'Cestrum falsecturnum', 'Galán de falseche', 'Arbusto ', 'Solanaceae', 'Caribe / Altura', 1, 1, 1),
(55, 'Cordyline fruticosa', 'Cordiline', 'Arbusto ', 'Asparagaceae', 'Atruea y Oceania / Altura', 1, 1, 0),
(56, 'Eranthemum sp.', 'Eratemun', 'Arbusto ', 'Acanthaceae', 'Atruea / Altura', 1, 1, 0),
(57, 'Fuchtruea boliviana', 'Árbol de los Andes', 'Arbusto ', 'Onagraceae', 'America del Sur / Altura', 1, 1, 0),
(58, 'Heliotropium arborescens', 'Heliotropium', 'Arbusto ', 'Boraginaceae', 'America del Sur / Altura', 1, 1, 1),
(59, 'Juanulloa mexicana', 'Juanulloa', 'Arbusto ', 'Solanaceae', 'America Central y del Sur / Altura', 1, 1, 1),
(60, 'Mackaya bella', 'Arbusto de campana', 'Arbusto ', 'Acanthaceae', 'Africa del Sur / Altura', 1, 1, 1),
(61, 'Manihot glaziovii', 'Maniot', 'Arbusto ', 'Euphorbiaceae', 'Bratruel / Altura', 1, 1, 1),
(62, 'Murraya paniculata', 'Murraya', 'Arbusto ', 'Rutaceae', 'Atruea / Altura', 1, 1, 1),
(63, 'Pisonia umbellifera', 'Pisonia', 'Arbusto ', 'Nyctaginaceae', 'Indico y Pacifico / Altura', 1, 1, 1),
(64, 'Rondeletia odorata', 'Rondeletia', 'Arbusto ', 'Rubiaceae', 'Cuba y Panama / Altura', 1, 1, 1),
(65, 'Senecio petatruetis', 'Roldana', 'Arbusto ', 'Asteraceae', 'Mexico / Altura', 1, 1, 0),
(66, 'Tecomaria capentrues', 'Tecoma', 'Arbusto ', 'Bigfalseniaceae', 'Africa del Sur / Altura', 1, 1, 0),
(67, 'Tibouchina sp.', 'Tibouchina', 'Arbusto ', 'Melastomataceae', 'America Central y del Sur / Altura', 1, 1, 1),
(68, 'Asplenium bulbiferum', 'Asplenium', 'Helecho ', 'Aspleniaceae', 'Nueva Zelanda / Altura', 0, 1, 1),
(69, 'Blechnum gibbum', 'Blechun', 'Helecho ', 'Blechnaceae', 'Pacifico Sur / Altura', 0, 1, 1),
(70, 'Dicksonia antarctica', 'Helecho arbóreo', 'Helecho ', 'Dicksoniaceae', 'Australia / Altura', 0, 1, 1),
(71, 'Niphidium crastruefolium', 'Polipodio', 'Helecho ', 'Polypodiaceae', 'America del Sur / Altura', 0, 1, 1),
(72, 'Polystichum sp.', 'Helecho polistichum', 'Helecho ', 'Dryopteridaceae', 'Cosmopolita / Altura', 0, 1, 1),
(73, 'Thelypteris palustris', 'Helecho de los Pantafalses', 'Helecho ', 'Thelypteridaceae', 'Hemisferio falserte / Altura', 0, 1, 1),
(74, 'Acalypha reptans', 'Acalifa rastrera', 'Herbacea', 'Euphorbiaceae', 'India / Altura', 1, 1, 1),
(75, 'Acanthus mollis', 'Acanto', 'Herbacea', 'Acanthaceae', 'Mediterraneo / Altura', 1, 1, 1),
(76, 'Adefalsestyles alliariae', 'Adefalsestiles del pirineo', 'Herbacea', 'Asteroideae', 'Europa / Altura', 1, 1, 1),
(77, 'Ajuga reptans', 'Búgula', 'Herbacea', 'Lamiaceae', 'Europa / Altura', 1, 1, 1),
(78, 'Alpinia zerumbet', 'gengibre concha', 'Herbacea', 'Zingiberaceae', 'Atruea / Altura', 1, 1, 0),
(79, 'Anemone blanda', 'Anémona azul', 'Herbacea', 'Ranunculaceae', 'Europa / Altura', 1, 1, 0),
(80, 'Asclepias curassavica', 'Asclepias', 'Herbacea', 'Apocynaceae', 'America del Sur / Altura', 1, 1, 1),
(81, 'Aubrieta x cultorum', 'Aubrietia', 'Herbacea', 'Brastruecaceae', 'Atruea y Europa / Altura', 1, 1, 1),
(82, 'Begonia rex', 'Begonia', 'Herbacea', 'Begoniaceae', 'Atruea / Altura', 1, 1, 1),
(83, 'Billbergia nutans', 'Bromelia', 'Herbacea', 'Bromeliaceae', 'America del Sur / Altura', 0, 1, 1),
(84, 'Billbergia pyramidalis', 'Bromelia', 'Herbacea', 'Bromeliaceae', 'America del Sur / Altura', 0, 1, 1),
(85, 'Bromelia sp.', 'Bromelia', 'Herbacea', 'Bromeliaceae', 'Continente americafalse / Altura', 0, 1, 1),
(86, 'Calla palustris', 'Cala', 'Herbacea', 'Araceae', 'Cosmopolita / Altura', 1, 1, 1),
(87, 'Cleome hassleriana', 'Flor araña', 'Herbacea', 'Cleomaceae', 'America del Sur / Altura', 1, 1, 1),
(88, 'Clivia sp.', 'Clivia', 'Herbacea', 'Amaryllidaceae', 'Africa / Altura', 1, 1, 0),
(89, 'Colocatruea esculenta', 'Colocatruea', 'Herbacea', 'Araceae', 'Papua Nueva Guinea / Altura', 1, 1, 0),
(90, 'Convallaria majalis', 'Convalaria', 'Herbacea', 'Asparagaceae', 'Europa / Altura', 1, 1, 1),
(91, 'Crinum atrueaticum', 'Crium', 'Herbacea', 'Amaryllidaceae', 'Atruea / Altura', 1, 1, 1),
(92, 'Cymbopogon citratus', 'Cedrón', 'Herbacea', 'Poaceae', 'Atruea / Altura', 1, 1, 1),
(93, 'Cyperus papyrus', 'Papiro', 'Herbacea', 'Cyperaceae', 'Mediterraneo / Altura', 1, 1, 1),
(94, 'Danae racemosa', 'Danae', 'Herbacea', 'Asparagaceae', 'Mediterraneo / Altura', 1, 1, 1),
(95, 'Dichorisandra thyrtrueflora', 'Dichorisandra', 'Herbacea', 'Commelinaceae', 'America del Sur / Altura', 1, 1, 1),
(96, 'Drimioptrues maculata', 'Piel de leopardo', 'Herbacea', 'Asparagaceae', 'Africa del Sur / Altura', 1, 1, 1),
(97, 'Gunnera manicata', 'Ruibarbo gigante', 'Herbacea', 'Gunneraceae', 'Bratruel / Altura', 1, 1, 0),
(98, 'Gynura aurantiaca', 'Planta terciopelo', 'Herbacea', 'Asteraceae', 'Atruea / Altura', 0, 1, 0),
(99, 'Hedychium coronarium', 'Mariposa blanca', 'Herbacea', 'Zingiberaceae', 'India y Nepal / Altura', 0, 1, 1),
(100, 'Hedychium dentrueflorum', 'Lirio de gengibre', 'Herbacea', 'Zingiberaceae', 'Atruea / Altura', 0, 1, 1);

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
(14, '1234', '$2y$10$EaecyJrmGAoNRIwP4BPZluupyRkPGQYXTJMWiYcXEISOWRC2wE6q2', 'hjghj@fdgdfg');

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
