
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS FinalProject;
#purchase sales stock

CREATE DATABASE FinalProject CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE FinalProject;
--
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `customerID` varchar(45) NOT NULL,
  `productID` varchar(45) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

/*LOCK TABLES `cart` WRITE;*/
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'1','2',2),(2,'1','1',1),(3,'1','3',1),(4,'1','10',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
/*UNLOCK TABLES;*/

--
-- Table structure for table `inventoryquantity`
--

DROP TABLE IF EXISTS `inventoryquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventoryquantity` (
  `ProductID` int NOT NULL,
  `ProductType` varchar(10) NOT NULL,
  `ProductName` varchar(45) NOT NULL,
  `Price` int NOT NULL,
  `Quantity` int NOT NULL,
  `exp` varchar(10) NOT NULL,
  `LngredientList` varchar(1000) NOT NULL,
  `AllergyList` varchar(100) NOT NULL,
  `ProductDetails` varchar(300) NOT NULL,
  `Producturl` varchar(50),
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryquantity`
--

LOCK TABLES `inventoryquantity` WRITE;
/*!40000 ALTER TABLE `inventoryquantity` DISABLE KEYS */;
INSERT INTO `inventoryquantity` VALUES 
(1,'泡麵','Nongshim 農心 韓國境內版 辛拉麵 5包',125,479,'2024.07.30',
'
小麥粉.馬鈴薯澱粉.棕櫚 油.醋酸澱粉.碳酸鈣(蛋殼).鹽.蔬菜萃取液(香菇.蔥.薑.蘿蔔).碳酸鉀.碳酸鈉，檸檬酸.寡糖綠茶風味液(寡糖.綠茶萃取物).維生素B2. 調味包:牛肉調味粉(牛肉萃取粉. 洋蔥.胡椒.醬油).鹽.辛辣調味粉 (玉米澱粉.辣椒萃取粉.果糖)醬油調味粉(大豆小麥.鹽.糖.胺基乙酸).糖.調味醬粉(玉米糖漿.麵粉.辣椒.糖.鹽).調味牛肉粉(鹽，糖 玉米澱粉.牛肉萃取粉.洋蔥.大蒜).醬油粉(大豆.麥芽糊精).胡椒粉.辣椒風味粉(辣椒，蒜.洋蔥).5-次黃瞟哈校音碳酸二鈉. 5-鳥瞟哈核音磷酸納.琥珀酸二鈉.大豆蛋白.乾燥食材乾 蔥.乾青江菜.乾香菇.乾胡蘿蔔.乾辣椒.牛肉(產地:澳洲)
',
'本產品含有含麩質之穀物、大豆、蛋殼鈣及其製品,不適合對其過敏體質者食用',
'️＼商品介紹／
░純正韓國風味辛湯頭
░搭配帶勁Q彈的麵條
░不容錯過的農心泡麵代表作-辛拉麵
░韓國家家戶戶必備的拉麵
░老饕們可以嘗試看看😋'
,
'
https://i.imgur.com/FuGLtVt.jpeg'),

(2,'泡麵','No Brand 經典炸醬拉麵135g克 X 5 X 1PC包',179,352,'2024.12.04',
'
麵粉、醋酸澱粉、棕櫚油、小麥麩、鹽、大豆卵磷脂、脂肪酸聚合甘油脂、碳酸鉀、碳酸鈉、 磷酸氫二鈉、多磷酸鈉、焦磷酸鈉、關華豆膠、檸檬酸、綠茶風味油(綠茶萃取物,大豆油) 調味醬包-炸醬(小麥粉、焦糖、大豆、鹽)、水、洋蔥、大豆油、糖、麥芽糊精、L-麩酸鈉、普通焦糖色素、牛骨萃取物、大豆蛋白粉、奶精(椰子油、棕櫚仁油、酯肪酸甘油脂、二氧化矽、磷酸鈉)、炸醬粉(小麥粉、焦糖、大豆)、洋蔥粉、鹽、果糖、 調味粉(麥芽糊精、酵母萃取物、糖、5-次黃嘌呤核苷磷酸二鈉、5-鳥嘌呤核苷磷酸二鈉、琥珀酸二鈉、鹽)、5-次黃嘌呤核苷磷酸二鈉、5-鳥嘌呤核苷磷酸二鈉、檸檬酸、酵母粉、維生素B1、大豆蛋白粉、乾燥高麗菜、乾燥洋蔥
',
'本產品含有小麥,大豆,蝦,章魚,蚌類等相關製品,過敏患者請謹慎食用. 本產品與小麥,花生,鯖魚,蝦,蟹,番茄,雞蛋,核桃等製品同一產線生產,過敏患者請謹慎食用',
'商品詳情:
韓國NO BRAND 炸醬麵家庭號
韓國emart 最熱銷的炸醬麵
炸醬是湯汁醬包喔~
料理的時候請注意 韓國拉麵一定要用熱水煮喔!
先用熱水煮麵跟蔬菜包 約三分鐘
再將水撈出 剩一點點即可
把炸醬包倒進去 在拌炒讓炸醬的香味給炒出來
讓麵條吸飽醬汁
拌炒約一分鐘後，醬汁變濃稠即可上菜囉~~
*本產品含有小麥、大豆、堅果等製品，過敏者請謹慎食用*
*本產品與小麥、花生、鯖魚、蝦、蟹、番茄、雞蛋、核桃、雞肉、章魚、等製品同一生產線，過敏者請謹慎食用*
容量：135g*5包入
',
'https://i.imgur.com/kfdfiVq.jpeg'),

(3,'泡麵','OTTOGI 不倒翁 粗麵條版Q拉麵',225,663,'2024.09.20',
'
小麥粉（小麥）、化製澱粉、棕櫚油、精鹽、麩質、品質改良劑（酸度調節劑）、蛋殼粉、蔬菜萃取物、維生素B2、綠茶風味油
',
'本品含有小麥及雞蛋，過敏體質者請斟酌食用',
'️＼商品介紹／
❕商品內容以實物為主圖片僅供參考❗
░商品規格：110gx5入(整袋裝)
░韓國原裝進口
░麵條Q彈耐煮不易軟爛
░韓國家家戶戶必備的拉麵
░Q拉麵 粗麵條版，更Q 更好吃喔~~
',
'https://i.imgur.com/jI7yLcE.png'),
(4,'泡麵','paldo 八道 韓式香辣冷拌麵',330,244,'2024.07.30',
'
麵條：小麥粉,棕櫚油,馬鈴薯澱粉,鹽,乳化劑(葵花籽油,大豆卵磷脂),碳酸鉀,碳酸鈉,磷酸鈉,關華豆膠,芥花油
調味包：糖,水,辣椒醬(辣椒,大豆,小麥,玉米糖漿,鹽),醬油(大豆,小麥,鹽),鹽,辣椒粉,醋,大蒜,大豆油,濃縮蘋果汁,芝麻油,調味粉(麥芽糊精,糖,5-次黃嘌呤核苷磷酸二鈉,5-鳥嘌呤核苷磷酸二鈉),芥末粉,檸檬酸,增味劑(DL-胺基丙酸,氨基乙酸),洋蔥萃取物,酵母萃取物,關華豆膠,辣椒色素,糊精,海帶,芝麻,辣調味粉(葡萄糖,辣椒,鹽),5-次黃嘌呤核苷磷酸二鈉,5-鳥嘌呤核苷磷酸二鈉
',
'本產品含有麩質之穀物,大豆,芝麻,堅果類及其製品，過敏體質者請斟酌食用',
'️數量 3袋
每份重量 130g
每份數量 5包
這款是韓國代表性的冷拌麵第一名，只要是提到冷拌麵，非這款不可了！！含有8%蘋果汁的醬包，嚐起來有蘋果的香甜味，略帶辛辣、酸甜，麵條較薄而柔軟，與韓國道地涼麵如出一徹！！
',
'https://i.imgur.com/3Glkv9R.png'),
(5,'泡麵','OTTOGI 不倒翁 米其林等級炸醬麵725g (5包/袋)',169,384,'2024.09.16',
'
麵：小麥粉（小麥）、馬鈴薯澱粉、棕櫚油、化製澱粉、燕麥膳食纖維、品質改良劑（酸度調節劑）、鹽、乳化油脂、蔬菜風味液、蛋殼粉、調味大蒜萃取液、綠茶風味油、維生素B2／調味包：醇香炸醬粉、糖、植物性油脂、濃醇炸醬粉、炒炸醬粉、蔥風味油、醬油調味粉、調味粉、烘烤洋蔥粉、烤洋蔥粉、洋蔥風味油、鹽、增味劑、洋蔥調味油、炒洋蔥調味粉、植物性奶油、營養強化劑、複方添加劑1（磷酸三鈣、碳酸鈣）、洋蔥調味油、複方添加劑2（酵母萃取物、葵花油）、醇香調味粉、大豆蛋白、乾燥洋蔥、乾燥高麗菜、調味蛋白、炸馬鈴薯塊、乾燥胡蘿蔔
',
' 本品含有小麥、大豆、雞肉、牛奶、牛肉及豬肉，過敏體質者請斟酌食用',
'️商品介紹:
每份重量 145g
每份數量 20包
袋裝:5入
保存期限:    至少為2024/06/16或之後
製造日期:    至少為2023/08/29之後

🍜🤩行銷全世界 韓國市佔率第一泡麵品牌 不倒翁 熱門口味
★ 韓國知名食品品牌不倒翁，推出的人氣新品「米其林等級炸醬麵」
★ 特調炸醬與洋蔥、大蔥、香油的完美組合，突破你對炸醬麵的想像
★ 不僅方便又兼顧美味讓需要節省時間的你也能輕鬆吃到米其林料理
','https://i.imgur.com/kDff18B.jpeg'),
(6,'泡麵','SAMYANG 三養 4種起司風味火辣雞肉風味鐵板炒麵',150,242,'2024.09.22',
'
麵體：小麥粉、醋酸澱粉、棕櫚油、小麥蛋白、鹽、大豆油、卵磷脂、脂肪酸聚合甘油酯、碳酸鈉、關華豆膠、維他命B2、抗氧化劑(維生素E)、綠茶風味油(大豆油、綠茶)、檸檬酸
調味醬包：水、醬油、糖、雞肉萃取物、雞肉香料、辣椒調味粉(辣椒粉、辣椒醬、紅椒粉、糖、黑胡椒粉)、大豆油、洋蔥、辣椒油、紅辣椒粉、酵母調味粉(麥芽糊精、酵母粉、糖、5’-次黃嘌呤核苷磷酸二鈉、5’-鳥嘌呤核苷磷酸二鈉、鹽)、大蒜、修飾澱粉(醋酸澱粉)、辣椒萃取物、紅椒色素、黑胡椒粉、咖哩調味粉(咖哩粉、雞肉萃取物、果糖)、維他命B2

調味粉包：馬茲瑞拉起司粉、芝麻、海苔"       

附加調味料:脫水白菜,脫水香菇,脫水紅蘿蔔,脫水青蔥,紅辣椒。
',
'※ 本產品含有牛奶及其製品不適合其過敏體質者食用。                                
※ 本產品辣度超過4400SHU，請依個人身體狀況食用。
',
'️商品介紹:
每份重量 145g
每份數量 4包
🍜保證新鮮好吃喔😁
⭐️香濃起司 最火紅韓國泡麵 搶購商品
★ 本商品連結所有選項皆不含固態肉類成分、原始型態之蛋類成分、生鮮類型之海鮮成分。
★ 商品內容以實物為主，圖片僅供參考
','https://i.imgur.com/dYDHgjH.jpeg'),
(7,'泡麵','Nongshim 農心 韓國境內版 非油炸辛拉麵  4包入',270,51,'2024.09.30',
'
麵:小麥粉,馬鈴薯澱粉,鹽,品質改良劑(多磷酸鉀,碳酸鉀,碳酸鈉,磷酸二氫鈉),抗氧化劑(維生素E),大豆卵磷脂,營養添加劑(菸鹼醯胺,還原鐵)。
調味包: 調味粉[麥芽糊精,大豆蛋白水解物,酵母抽出物,棕櫚油,醬油(水,大豆,鹽),阿拉伯膠,果糖,大豆,小麥粉,洋蔥抽出物,甘油,葵花油,羥丙基磷酸二澱粉,玉米蛋白水解物,豌豆,香料,米糠油],L-麩酸鈉,5-鳥嘌呤核苷磷酸二鈉,5-次黃嘌呤核苷磷酸二鈉,鹽,香辛料(黑胡椒,紅辣椒,玉米粉,大蒜,辣椒抽出物),糖,葡萄糖,糊化澱粉(鹼處理澱粉),香菇。
調味油包: 調味油(米糠油,油菜籽油,玉米油,紅辣椒籽,洋蔥)。
附加調味料:脫水白菜,脫水香菇,脫水紅蘿蔔,脫水青蔥,紅辣椒。
',
'本產品含有含麩質之穀物及大豆製品',
'️＼商品介紹／
░純正韓國風味辛湯頭
░非油炸的版本很適合健康吃的人
░不容錯過的農心泡麵代表作-辛拉麵
░韓國家家戶戶必備的拉麵
░老饕們可以嘗試看看😋
⭕以實際包裝資訊為主⭕
','https://i.imgur.com/9Fmtwel.jpeg'),
(8,'泡麵','SAMYANG 三養 火辣雞肉風味鐵板炒麵 粉紅醬風味',170,156,'2024.09.15',
'
【麵體】小麥粉,醋酸澱粉,棕櫚油,小麥麵筋,食鹽,甘油熱量532大卡 蛋白質12公克 脂肪16公克 飽和脂肪8公克 反式脂肪0公克 碳水化合物85公克 糖7公克
【調味醬包】水,雞肉風味調味料{炙烤風味調味料[酵母萃取物,玉米糖漿,雞肉香料,調味劑
',
'本產品含有含麩質之穀物及大豆製品',
'️＼商品介紹／
░韓國超經典拉麵
░具有令人上癮的辣味
░辣、鹹、甜三種帶勁滋味結合肉燥香氣，一口接一口、欲罷不能。
░韓國三養食品經典火辣雞肉風味鐵板炒麵，挑戰饕客味蕾
░嗆辣醬汁完美裹附Ｑ彈帶勁麵體，老饕必嘗辣味首選。
⭕以實際包裝資訊為主⭕
','https://i.imgur.com/HMba3kH.png'),
(9,'飲料/酒','LOTTE 樂天 Milkis 優格碳酸飲 250ml',15,324,'2026.02.16',
'
水、白砂糖、二氧化碳、脫脂奶粉、檸檬酸、優格香料、乳清粉、可溶性大豆纖維
',
'※避免高溫、潮濕、陽光直射。
※本產品含有大豆及牛奶，不適合對其過敏體質者飲用。
',
'️＼商品介紹／
夏天即將來臨☀️清涼爽口的
👉🏼「優格風味碳酸飲」👈🏼推薦給您！
酸甜滑順超清爽，無咖因小孩也可飲用
冷藏飲用風味更佳，冰箱必囤個幾罐😋
','https://i.imgur.com/HMe9sXq.jpeg'),
(10,'飲料/酒','韓國LOTTE樂天 七星汽水210ml',20,842,'2026.01.08',
'
水,白砂糖,二氧化碳,檸檬酸,檸檬及萊姆香料
',
'常溫儲存，請置於陰涼乾燥處保存，避免高溫及陽光直射',
'️＼商品介紹／
七星汽水於1950年誕生
在韓國是超老超老牌子
口感喝起來跟雪碧、黑松汽水相似
帶點檸檬味的清新感
到韓國旅遊~必喝飲料之一
','https://i.imgur.com/myVSiPr.jpeg'),
(11,'飲料/酒','韓國進口卡曼橘原液NFC果汁無添加濃縮VC維C原漿100%飲料大容量1L',320,100,'2025.03.26',
'
100%無添加卡曼橘原汁
',
'飲用方式: 
1．由於需要避光，建議晚上🌚喝，效果比較好! 
2．100% 原汁，無加糖! 所以非常酸哦! 👍
      建議用冷水稀釋，熱水會破壞VC哦！一開始比例建議。   
3． 可加氣泡水/果汁/ 汽水 稀釋😋
4．未開封前存放在陰涼乾燥處, 打開後要冷藏! ⛄️
商品 容量：1000ml(1L)
',
'️＼商品介紹／
✨來自東南亞的卡曼橘！是柑橘類水果，是檸檬跟金桔的混種! 
✨爆炸多的VC含量，是檸檬的30倍!! 
✨去黃提亮! 冷白皮請繞道🫣
✨清爽酸甜的卡曼橘沒有添加物,只榨取100%原液，天然無糖低卡🍊🍊🍊
','https://i.imgur.com/9Fei2uH.jpeg'),
(12,'飲料/酒','【韓味不二】香蕉牛奶 (200ml)',25,354,'2025.11.14',
'
牛奶、水、糖、脫脂奶粉、乳清粉、香蕉汁、香蕉香料、香草香料、脂肪酸甘油脂、鹿角菜膠、關華豆膠、食用色素(食用黃色4號、食用黃色5號)、小麥
',
'本產品含有牛奶、麩質之穀物製品，不適合其過敏體質者食用',
'️＼商品介紹／
✨韓國Binggrae保久調味乳來啦✨

👉香甜水果加入牛奶之中，迸出香濃好味道

🍎香蕉牛奶🍎
到韓國旅遊必喝的香蕉牛奶
濃醇又可口，讓人一瓶接一瓶
','https://i.imgur.com/9xbikQj.jpeg'),
(13,'飲料/酒','韓國海太水梨汁238ml',30,264,'2025.8.30',
'
純淨水、果糖糖漿、水梨泥、香料(水梨)、DL-蘋果酸、抗氧化劑(維生素C)
',
'置於乾燥陰涼處',
'️＼商品介紹／
★韓國超人氣暢銷果汁，順口香醇，味道清甜超好喝 
★可以冰箱冷藏後飲用，一飲超暢快的說～ 
★韓國旅遊必喝必買品，韓國水梨製作，喝的到水梨果肉 
★吃過韓國水梨的千萬不能錯過水梨汁！喝過的人都超級推薦！
','https://i.imgur.com/xzwJxVu.jpeg'),
(14,'飲料/酒','韓國 NAMYANG 養樂多碳酸飲 400ml',59,460,'2025.12.11',
'
碳酸水、果糖、乳酸
',
'存放陰涼乾燥的地方，避免陽光直射',
'️＼商品介紹／
🔥韓國現在IG瘋傳打卡的熱門飲料就是他🔥
喝起來清爽可口，冰鎮過後口感更佳。
','https://i.imgur.com/KEVvPEd.png'),
(15,'飲料/酒','韓國無加糖零卡風味氣泡水350ml/罐 (檸檬) ',59,520,'2025.02.28',
'
水,二氧化碳,赤藻糖醇(甜味劑),檸檬酸,複方香料(檸檬香料,天然檸檬香料,橘子香料,丙二醇,酒精,三乙酸甘油酯),DL-蘋果酸,檸檬酸鈉,甜味劑(蔗糖素),甜味劑(醋磺內酯鉀),甜味劑(甜菊醣苷)
',
'避免陽光直射,請存放陰涼乾燥處並,儘快食用完畢',
'️＼商品介紹／

▶ 沒負擔 0Kcal
▶ 香甜清爽水果風味
','https://i.imgur.com/NzzGNph.jpeg'),
(16,'飲料/酒','【真露】青葡萄燒酎360ml，6瓶/組',1190,120,'2025.05.10',
'
酒精度數：13%

主要成分：水、酒精、果糖、砂糖、檸檬酸、蘋果酸、青葡萄香料、青葡萄濃縮液
',
'禁止酒駕．未滿十八歲禁止飲酒',
'️＼商品介紹／
韓國最受歡迎的燒酒品牌
青葡萄果香濃郁芳香
淡甜滋味喝起來口感清爽
非常適合初喝酒的朋友或者喜歡品嘗水果酒的人飲用
','https://i.imgur.com/ehWdVvK.jpeg'),
(17,'零食/糖果','LOTTE 樂天 Zero零糖低卡巧克力派24入',178,438,'2026.01.14',
'
小麥粉（小麥）、D-山梨糖醇17％、聚乙二醇糖漿8％、起酥油I（加工油脂（交酯化棕櫚核仁油）、植物性油脂（棕櫚油）、脂肪酸甘油酯、卵磷脂、混合濃縮生育醇）、起酥油II（加工油脂（交酯化棕櫚核仁油）、食用牛脂、棕櫚油、硬質棕櫚油、卵磷脂）、全蛋液、水、起酥油III（菜籽油、脂肪酸丙二醇酯、脂肪酸甘油酯、卵磷脂、混合濃縮生育醇）、可可塊（可可豆）、小麥蛋白、穀類加工品、其他加工品、複方添加劑I（化製澱粉、糊精）、複方添加劑II（化製澱粉、糊精）、可可粉I、加工起司、酸度調節劑3種、甘油、蛋白粉、可可粉II、食用酒精、果蔬加工品、乳清蛋白粉、奶油、複方添加劑III（食用酒精、水、乳酸、脂肪酸甘油酯、乳酸鈉）、鹽、一般蒸餾酒、香料5種、咖啡、乳化劑2種、香料製劑（丙二醇、N-葡萄糖基乙醇胺、單寧酸、咖啡萃取物、水、N-乳糖基乙醇胺）、甜味劑（蔗糖素、醋磺內酯鉀）、香草醛
',
'本品含有小麥、牛奶、大豆、雞肉及雞蛋，過敏體質者請斟酌食用',
'️＼商品介紹／
░黑巧克力蛋糕 + 巧克力奶油夾心
░吃起來完全不甜膩
░每顆65卡，吃沒有負擔
░擔心糖分攝取太多又怕胖可以嘗試看看
','https://i.imgur.com/ik0Z0Hn.jpeg'),
(18,'零食/糖果','GEMEZ Enaak 韓式小雞麵 雞汁味  盒裝24入',239,438,'2025.04.27',
'
小麥粉，棕欄油，樹薯澱粉，辣椒調味粉（糖，鹽，辣椒粉，L-麩酸鈉，蒜粉，紅椒，二氧化矽），大蒜，醬油［水，鹽，大豆，L-麩酸鈉，小麥，糖，5-次黃嘌呤核苷磷酸二鈉，5-鳥嘌呤核苷磷酸二鈉，防腐劑（苯甲酸鈉川 麩酸鈉，珠蔥，糖，魚醛（鯷魚，鹽，糖，水），鹽，碳酸鈉，關華豆膠，胡椒，多碗酸鈉，甜味劑（蔗糖素
',
'本產品含有小麥、大豆及魚產品，過敏體質者請斟酌食用',
'️＼商品介紹／
░亞洲狂銷熱賣小雞點心麵
░攜帶超方便香脆點心麵
░好吃涮嘴，一口接一口
','https://i.imgur.com/jZd4Lqt.jpeg'),
(19,'零食/糖果','ORION 好麗友 預感非油炸香烤洋芋片 洋蔥口味 2盒 204g',558,213,'2025.03.20',
'
馬鈴薯粉［馬鈴薯、乳化劑（單酸甘油酯）、調味劑（檸檬酸）］、混合植物油軟質棕櫚油、棕櫚油、椰子油、酯化硬質棕櫚油、葵花油）、玉米澱粉、白糖、炒洋蔥風味粉｛調味洋蔥粉（洋蔥、葡萄糖、精製鹽、砂糖、小麥澱粉、洋蔥香料）、乳清粉、酵母抽出物、砂糖、棕櫚油、糊精、品質改良劑（磷酸氫二鉀）、磷酸鈣、L-麩酸鈉、5-次黃嘌呤核苷磷酸二鈉、5-鳥嘌呤核苷磷酸二鈉］、調製洋蔥粉［洋蔥、糊精、食鹽、磷酸鈣、乳糖、乳脂、乾酪素鈉、品質改良劑（磷酸氫二鉀）、洋蔥粉（洋蔥、糊精、葡萄糖）、乾燥洋蔥粉［（洋蔥、乳清粉、二氧化矽、檸檬酸、糊精、甜味劑（阿斯巴甜、甜菊醣苷）、葡萄糖、醋酸］｝、玉米粉、乳製品混和粉［大豆卵磷脂、乳清粉、乳糖、乾酪素鈉、品質改良劑（二氧化矽）］、碳酸氫鈉、磷酸鈣、炸洋蔥（洋蔥、葵花油）、全脂奶粉、食鹽、乾燥蔥片、酵素製劑（甘油、水、天冬醯胺酵素）、香濃馬鈴薯風味粉［果糖、玉米澱粉、葡萄糖粉、乙基麥芽醇（香料）、馬鈴薯香料）
',
'本產品含有小麥、牛奶、大豆及椰子製 品，過敏體質者請斟酌食用。
本產品含阿斯巴甜，苯酮尿患者不宜食用 
',
'️＼商品介紹／
・脆感滿點，爽口不油膩
・鹹甜完美配搭的洋蔥口味
・來自韓國的味覺時尚
','https://i.imgur.com/g5GOK8z.jpeg'),
(20,'零食/糖果','Orion 好麗友 陽光波浪脆餅 大蒜麵包風味',179,135,'2025.10.06',
'
玉米、全麥、植物油（軟質棕櫚油、菜籽油）、米、燕麥粉、大蒜麵包風味調料［白砂糖、防潮糖粉、食鹽、餅乾粉（大蒜粉）、酵母萃取粉、阿斯巴甜（甜味劑／含有苯丙胺酸）］、白砂糖、麵包粉、穀類加工品
',
'本品含有小麥、牛奶及大豆，過敏體質者請斟酌食用',
'️＼商品介紹／
・嚴選原料製成
・穀物自然香氣
・口感香脆難忘
','https://i.imgur.com/rf9UJQ5.jpeg'),
(21,'零食/糖果','Nongshim 農心 原味洋蔥圈(80g)',55,371,'2024.11.27',
'
小麥粉（小麥）、玉米澱粉（玉米）、米糠油、化製澱粉、棕櫚油、洋蔥風味基底粉［砂糖、纖維素粉、精鹽、膳食纖維、洋蔥萃取物粉（洋蔥萃取物基底粉、維生素B2）］、洋蔥濃縮液、洋蔥培根風味調料、馬鈴薯澱粉
',
'本品含有小麥、牛肉、大豆、牛奶、豬肉及貝類，過敏體質者請斟酌食用',
'️＼商品介紹／
韓國洋蔥圈餅乾第一品牌
無與倫比的酥脆口感
居家/辦公/追劇必備零食
','https://i.imgur.com/739pznV.jpeg'),
(22,'零食/糖果',' LOTTE 樂天 青葡萄果汁糖',75,438,'2024.11.01',
'
砂糖、水飴、青葡萄濃縮果汁1.947％（固型粉68％）、酸度調節劑I、酸度調節劑II、合成香料（青葡萄香I、青葡萄香II）、澱粉、複方添加劑（梔子藍色素、薑黃素、丙二醇）、混和食用油
',
'本產品含堅果類（椰子）及其製品，生產製程廠房其設備或生產管線有處理含牛奶，大豆，花生，可能導致過敏症狀。
保存方法：請將產品置於乾涼處，開封後請儘早食用完畢。
',
'️＼商品介紹／
內含10%青葡萄原汁，酸酸甜甜又濃郁的葡萄滋味
超大顆的滿足滋味，每顆足足有8公克，是休閑時的最佳零食
每顆糖果皆採獨立包裝，獨自享用外還可以跟朋友們分享
韓國樂天製菓熱銷的葡萄糖果，韓國旅行必買伴手禮，與Anytime 三層薄荷糖並列Top
','https://i.imgur.com/pMaKNMx.jpeg'),
(23,'零食/糖果','LOTTE 樂天 Anytime 薄荷三層糖',135,269,'2024.012.03',
'
甜味劑（麥芽糖醇糖漿.D-木糖醇.D-山梨醇），複方調味劑（含乳酸，乳酸鈉，水），香料，草本萃取物（含尤加利葉，百里查，鼠尾草，菩提菜，溥荷，大茴香，接骨木花），甜味劑（醋磺內酯鉀，蔗糖素），乳化劑（脂肪酸甘油酯），梔子藍色素
',
'本產品含堅果類（椰子）及其製品，生產製程廠房其設備或生產管線有處理含牛奶，大豆，花生，可能導致過敏症狀。
保存方法：請將產品置於乾涼處，開封後請儘早食用完畢。
',
'️＼商品介紹／
清涼的薄荷糖中間夾著細滑醇厚的奶香
採用木醣醇製作，清新美味又不蛀牙
韓國旅行必買伴手禮，與葡萄糖果並列
','https://i.imgur.com/fjltDQ4.jpeg'),
(24,'零食/糖果','  LOTTE 樂天 Zero零糖低卡水果軟糖',75,213,'2025.02.16',
'
麥芽糖醇糖漿90％、明膠、酸度調節劑3種、複方添加劑I（丙二醇、酒精、香料、水、合成香料、三乙醯甘油）、合成香料、果膠、其他食用油加工品、甜味劑（三氯蔗糖、醋磺內酯鉀）、乳化劑、香料I（水蜜桃香）、香料II（奇異果香）、複方添加劑II（精製加工油脂、合成香料、酒精）
',
'本品含有豬肉及水蜜桃，過敏體質者請斟酌食用',
'️＼商品介紹／
無糖，但很好吃！
無糖&無含糖物質！
保護環境的包裝材質
','https://i.imgur.com/MvRSCRh.jpeg'),
(25,'飲料/酒','TEAZEN 玉米鬚茶','226','175','2025.05.14','玉米、玉米鬚、玉竹、水、碳水化合物、蛋白質。','請參考商品包裝或產品本身','★ 韓國原裝進口。★ 淡淡玄米香~ 清香可口。★ 口感細緻溫順，冷熱飲皆可。','https://i.imgur.com/y9MvQgm.png')
;
/*!40000 ALTER TABLE `inventoryquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `MemberAccount` varchar(45) NOT NULL,
  `MemberPassword` varchar(45) NOT NULL,
  `MemberName` varchar(45) NOT NULL,
  `MemberPhone` varchar(25) DEFAULT NULL,
  `BirthdayDate` DATE DEFAULT NULL,
  `Address` varchar(200) DEFAULT '桃園市中壢區中北路200號',
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `membership` (`MemberID`, `MemberAccount`, `MemberPassword`, `MemberName`, `MemberPhone`, `BirthdayDate`, `Address`) VALUES
(1, '11144139jay@gmail.com', '12345', 'jay', '0906692674', NULL, '台北市信義區永吉路30巷101弄10號'),
(2, '11144154jay@gmail.com', '54321', 'alice', '0901297374', NULL, '桃園市中壢區中北路200號');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `MemberAccount` varchar(45) DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `star` int DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
 KEY `proo_idx` (`ProductID`),
  CONSTRAINT `proo` FOREIGN KEY (`ProductID`) REFERENCES `pro` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--

-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'dipjuolty883@gmail.com',1,4,'好吃');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `reviews`
--

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;#訂單
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `totalprice` int DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `id_idx` (`orderid`),
  KEY `ProductID_idx` (`ProductID`),
  CONSTRAINT `id` FOREIGN KEY (`orderid`) REFERENCES `order` (`MemberID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `pro` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,2,3,850,2550),(2,1,5,3,120,360);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

