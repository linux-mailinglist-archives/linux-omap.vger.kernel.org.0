Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08825AAAEF
	for <lists+linux-omap@lfdr.de>; Fri,  2 Sep 2022 11:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbiIBJKr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Sep 2022 05:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiIBJKq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Sep 2022 05:10:46 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E82650069;
        Fri,  2 Sep 2022 02:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ph6YG4SMNePfUhIfFE2EHWL7zPUABHZLG3Qt0saJ4xWgZLSYU0zahEL49TrJdeQosJk38iOeSijsoRktOx4HijYnSiNIz/U3ZAnfwSDIX/1b37j3GefPLXmS5XeRWU97aJz2KHAZ1goLTmCN7YoMv5sgNyIlTaVL6WxVyOuJhNVh5usX3gQvNDMp+y/g9D+Uiw3JD4Qe5SvGRq1HmqkjH1Z3mmQtgEMzG0c+zGEfhWKKYrHuH3rB6Tsstfq5Ivl68I+aBx7PGWIxy6cBn/0M4RSmaadV/f6L0lKFxxsjUbAnwXWZUwJDfKyRIAT5ZZv8R/8miZj39jjKLetGjuB/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcSPUM7JKx60kqiVPlvPob4IqPGkJo80FpolQhbmIdg=;
 b=d34JzQXSbszcKYdT2BP7wEAOG4XXSK/OOePKj2osAHWYn5Ol0KR7d5Ai6H9WFs+6VFT6BWAfJw2+nMlEpa2QeXl53ijQkrRgyKFokvc4gI8OqtOGIwEMyvgMT5P4MV33e7JA0RITvqdPia1B9GVas6nRJHLhNS0meRhd8KvVKPd+94/tBMWgxPUHmm4YXKyn3uxVLzNnGvCI2HX6c5KDGYTzY10+vsN4clKwfecmJkKWrFatwga97VQw5w9M9pjXETftxG46E2k5L1yhUHloTukKzJzEAJXDWslSztCcx+DW/NtGZhU4u8kC+Uj2Fj52mfXohO1q+sg4JWD4XGqaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcSPUM7JKx60kqiVPlvPob4IqPGkJo80FpolQhbmIdg=;
 b=BthK32XOgk3XYWIYhfD8gfk7Yy4ohGEV7U/H00HGd3I7U+5H/gn2rqCGq+hEZIEy89nNVfQuHhqvznzhMr+Rce0LRomC8/MonjR2eem+zCGLLvzHT/UMd5TkQdy04KXsQs7z+0Zg8fVaroSv52T1hQf04aBzpiTWwqQY8WkQVXxf1/xcrBOALXv/pQE7NP3G8Kc0pdqO5k32dr8YfoCNZR5Uh/5j7QPtsyxfCgFCKtAT2BEy0C87nVPucVVvQw1iOsRDyiuw7M0tGAseFMTKPQjprVIqP+HycYDLnS6VY6FK2HKbLB6paIfKCfUc6ngz31dF0Wb7Srpyl3cU/ieftg==
Received: from DU2PR04CA0302.eurprd04.prod.outlook.com (2603:10a6:10:2b5::7)
 by PR3PR10MB3834.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 09:10:43 +0000
Received: from DB5EUR01FT092.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::ad) by DU2PR04CA0302.outlook.office365.com
 (2603:10a6:10:2b5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Fri, 2 Sep 2022 09:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT092.mail.protection.outlook.com (10.152.4.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 09:10:42 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 2 Sep 2022 11:10:42 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.191) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Fri, 2 Sep 2022 11:10:40 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH v2 2/3] memory: omap-gpmc: add support for wait pin polarity
Date:   Fri, 2 Sep 2022 11:10:27 +0200
Message-ID: <20220902091028.1346952-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
References: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.191]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5415cff9-117a-4128-2e26-08da8cc30370
X-MS-TrafficTypeDiagnostic: PR3PR10MB3834:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8EIlBkrCQHQnLByOfkfAM2w3rZvo6oxNawkSzQ1/xJsLt7L8wwyV11FS32KWoZuzYTIBnCxc5P6I3pvhxcFinWdmtHblFRLC3VBtw3jVkBQ2IXpF68dlblWVm7tIDLFtipsjIcu2z9C0sKaqpEOotATWHRiHX6X6DAspcUcZFgtdLsd6jPwPNbO4RL0c9dfZB/Gb27At0WSC9vxbkjyQORDvwA89OECC+GHCmFNWXG/AqJAQ5NCEGqTZJ9KbziQ/TatB+Rc6LHXhkP1uUPhmGBvTR+OIps2IA0z9RNMrjzBx3jmwO6VZwde1g1TZj2apWgZ00yzxDXhW4C6pnhfHPhwWZPlCbxS+udeIGk6/sg+Z71xcMSjy9a93CCHuIXshTbYwMizfEi6XNdmnZw0z5J21Je1BHg63/NOXmEyiV/bCRZtGqbwhxIsaHBLtvsF7m10mTcicAO1QkLVoTbmL/UwEHZC9XbosUmsztWCT9ZH3NzwEEgjpSasd+r+89vumROnWuT1eTiL58+UFKNLDSnd3ZiCu1Dx4ByLo+/gihy7RnJTUrUnV2S+5PAhw6z4ajf5NaR0gMQm/Buo+hvvc2O5J3lm7MQvEbX8tQtgZdF4fNeyOIweSdl2rFQH4MD+tc432CgBBrgeAf9MImYPXdVEpPMaGBjInHtdjML5Ojcy1dg6kR9Y0R39E7O86ug6exQUsB5FUY4GGGf/IgsdHYr8Z2u455g2V9UMsWqvaNAp2lvlsx3gESpvJsbv7Tv1tMXaLqQyAg//faovurdfdVdGb1RvtUmQqLoTxzkHYEeoXvOGrYU75i7d/N/Mopeq
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(47076005)(26005)(2616005)(186003)(336012)(16526019)(956004)(1076003)(40480700001)(8936002)(5660300002)(36756003)(86362001)(41300700001)(6666004)(478600001)(36860700001)(40460700003)(356005)(83380400001)(4326008)(8676002)(82310400005)(110136005)(54906003)(2906002)(316002)(81166007)(82960400001)(82740400003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 09:10:42.9760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5415cff9-117a-4128-2e26-08da8cc30370
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT092.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3834
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Setting the wait pin polarity from the device tree is currently not
possible. The device tree property "gpmc,wait-pin-polarity" can be used
for that. If this property is missing the previous default value
is used instead, which preserves backwards compatibility.

The wait pin polarity is then set via the gpiochip
direction_input callback function.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c              | 30 ++++++++++++++++++++-----
 include/linux/platform_data/gpmc-omap.h |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 579903457415..be3c35ae9619 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -35,6 +35,8 @@
 
 #include <linux/platform_data/mtd-nand-omap2.h>
 
+#include "../gpio/gpiolib.h"
+
 #define	DEVICE_NAME		"omap-gpmc"
 
 /* GPMC register offsets */
@@ -1980,6 +1982,11 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
 							"gpmc,wait-on-read");
 		p->wait_on_write = of_property_read_bool(np,
 							 "gpmc,wait-on-write");
+		p->wait_pin_polarity = of_property_read_u32(np,
+								 "gpmc,wait-pin-polarity",
+								 &p->wait_pin_polarity);
+		if (p->wait_pin_polarity < 0)
+			p->wait_pin_polarity = GPIO_ACTIVE_HIGH;
 		if (!p->wait_on_read && !p->wait_on_write)
 			pr_debug("%s: rd/wr wait monitoring not enabled!\n",
 				 __func__);
@@ -2210,10 +2217,11 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	if (gpmc_s.wait_on_read || gpmc_s.wait_on_write) {
 		unsigned int wait_pin = gpmc_s.wait_pin;
 
-		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
-							 wait_pin, "WAITPIN",
-							 GPIO_ACTIVE_HIGH,
-							 GPIOD_IN);
+		waitpin_desc =
+			gpiochip_request_own_desc(&gpmc->gpio_chip,
+				wait_pin, "WAITPIN",
+				gpmc_s.wait_pin_polarity ? GPIO_ACTIVE_HIGH : GPIO_ACTIVE_LOW,
+				GPIOD_IN);
 		if (IS_ERR(waitpin_desc)) {
 			ret = PTR_ERR(waitpin_desc);
 			if (ret == -EBUSY) {
@@ -2342,7 +2350,19 @@ static int gpmc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 static int gpmc_gpio_direction_input(struct gpio_chip *chip,
 				     unsigned int offset)
 {
-	return 0;	/* we're input only */
+	u32 reg;
+	struct gpio_desc *desc = gpiochip_get_desc(chip, offset);
+
+	offset += 8;
+	reg = gpmc_read_reg(GPMC_CONFIG);
+
+	if (BIT(FLAG_ACTIVE_LOW) & desc->flags)
+		reg &= ~BIT(offset);
+	else
+		reg |= BIT(offset);
+
+	gpmc_write_reg(GPMC_CONFIG, reg);
+	return 0;
 }
 
 static int gpmc_gpio_direction_output(struct gpio_chip *chip,
diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
index c9cc4e32435d..bf4f2246f31d 100644
--- a/include/linux/platform_data/gpmc-omap.h
+++ b/include/linux/platform_data/gpmc-omap.h
@@ -149,6 +149,7 @@ struct gpmc_settings {
 	u32 device_width;	/* device bus width (8 or 16 bit) */
 	u32 mux_add_data;	/* multiplex address & data */
 	u32 wait_pin;		/* wait-pin to be used */
+	u32 wait_pin_polarity;	/* wait-pin polarity */
 };
 
 /* Data for each chip select */
-- 
2.25.1

