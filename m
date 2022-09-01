Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 850EE5A9707
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 14:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbiIAMmC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 08:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbiIAMmA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 08:42:00 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FE13AE70;
        Thu,  1 Sep 2022 05:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng2t0v0EGrjWm3yZzXIkmxylTb75+YuuxwerzuzDH4Tp0LhlpAIqWpy349VX0AYUvC8/1wWKlKl28H1iLaF1VvJW+dvhvFwphEbX1Rc4s3hyYWSHwbybNGU5VwfjSQbJ1/Z5miD909vxMs8iJsPEUnUuYDQRJrhE2hqYXHfHOC1+t1KQS2lZau4T8BFzoedtaTFlAkFPZfzGO7gSfWF7ieI/WXqjPyVCKaBOlQ33lWLXIW9q2+OPmYHe7Tf3TeG59JYJ2qJflY8IbJxv2is7HlKGi3qRfJiYQ7X1TQPhZuEQBoDNx9JZua1MOLwpJgqh2VKtL6v4AusvpR+1CgETiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qLEHN37XFAfXWVALRpoRNJf3m2cNDBuZ9PA7swh7ns=;
 b=EOaU26thiOmJylbiv0z0LUOZbYF+uyn8lMAp/xvr8VuFx0n0BeX90PFNk47J0bDSYairXqZAPl7+NPGAK5hy17SeNRFzO6dVO5+TVyM/czOBrLxtlRpbCm3Jh8uIfl8L+37ZqRQyW/+QcE4rcrBIJbdAX+qagYQnTwQ1URxs81au6HD90334uiTN5tpzdpePloHjyFMUxM/OcvJ/s5Z5gOCmDepR/imoVXxPKPa3zZgIx1nExZu7O1k4roF+5FMoyDBVdJ0f/SbqhZelVkvpAyEAG7mbcZQ3+Og6aHa0hDdvna0+itZqJHnmio7prjEUgE/lZmSmTYO7/se/NztT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qLEHN37XFAfXWVALRpoRNJf3m2cNDBuZ9PA7swh7ns=;
 b=BIeM3jBdxcnbwKY4brQbrkXsL8CFHcOcaD3bfceLar1djFbo3Yo4/kb3ThnHs0YIKJdU8q01Tj3IAfVPloMB04JG2BH8rDhgiaVqaNLEkH84dbidinWeklty6n777mx6DjOC7bgAhSeTUf/CxEKK79/Bn2SrDNKJL2JKJ1ZN1G2qIFhZnvcNVOXCWWn3NPmyilofeuE/+voI5n6EA2jWjjqfs+UnaOAyex33zuCilVAoZRzrNEMF4NmJgW4owbUKtJY9RXDvHvnMS+DOSNs4D1GVXtI5DWLiJy2bGluVK0O/8LrqnWFLarVSAlHPCRxXHVWpC0Y6ZGpX8sbw06I/GQ==
Received: from GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7) by
 AS2PR10MB7081.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 12:41:56 +0000
Received: from HE1EUR01FT010.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:b:cafe::df) by GV3P280CA0011.outlook.office365.com
 (2603:10a6:150:b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 12:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT010.mail.protection.outlook.com (10.152.0.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 12:41:55 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 1 Sep 2022 14:41:55 +0200
Received: from bennie-lenovo.fritz.box (139.23.126.196) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Thu, 1 Sep 2022 14:41:54 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>, <krzk@kernel.org>,
        <robh+dt@kernel.org>
Subject: [PATCH 2/3] memory: omap-gpmc: add support for wait pin polarity
Date:   Thu, 1 Sep 2022 14:41:43 +0200
Message-ID: <20220901124144.1006238-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
References: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e401abb-038e-40a8-0e68-08da8c175ab9
X-MS-TrafficTypeDiagnostic: AS2PR10MB7081:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOsQP/M/+TJlJJWYfguzPUc+tviEooLp/Ky5wajvwYKx8cbxYnsEmUlCS5/WPOgk2+4bmrV6ygeGvOKndRvXyDubJJr5qQuJvr4cPO1vKM8r+faeBuI0gMwgnRd6DEpHGxW/LW1AXFFdsxvXCqUqt+B0wgc1BwoZgk8sloBGqwMSsyazHrqm3RzpH1LXOQqK/njM6mjIizNMpTTR7NS9UusCsQstJegL/wpkky6P0FPNYubE9oSTwoIjSCtAFrWhU0chsdoRKzVIYmsw+VVjGSTaBUl3r8sX0KPR0ojpaqX3AkUSvCVsJ9q4+2Qb07xDe0sHJPLfr9669qRYMJqJ97mj9dHvMBJ6rkMsenY8v/y64t1vDnQfRddul8MLBQ0IkQKvzrWQTx4IsxDfzLvvMkJ0FZ/xMUmawg1jlppgcwhXznkYyzQFcby0rTWlPqIS75GFwSBiDxgA4D6SuPl07ehbS2AR/zQSReinGohGO0BQk1qc+tPUtv3IHEZwydmfXSQe7LfH2IaM4X66oqjvsAHU/FK0gtMU+nMogWD1opZex2Xde5YPYxth3rja+VBJCWWv6Vg8pGSaMfFspXNPRZdDm/sahw7I2DTSfKDN8dDI6ucmlvuNQ+4KDcarazbJYbaVtwKktiSb73eCxfeseNk3zt6efu7evbKGiF97qV6jPW5yTDXDLlZ2VB0s5ugfWlQdHrah1aJZndrJ1T0IO+KLlEZexpQ+y/gCzo91CQWGyIGIee2Ab286+4y8bo8dCEh0dsIfzbIT3yQ2wzmsJcS+Weqg4mRP/EZyJ7ICLSqj/H4dyRsFzOFFsD13rEs7
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(36840700001)(40470700004)(46966006)(26005)(82960400001)(82740400003)(41300700001)(82310400005)(6666004)(86362001)(81166007)(478600001)(40480700001)(36860700001)(40460700003)(47076005)(186003)(70206006)(1076003)(16526019)(4326008)(2616005)(356005)(336012)(83380400001)(956004)(2906002)(8676002)(54906003)(70586007)(110136005)(36756003)(316002)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 12:41:55.9466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e401abb-038e-40a8-0e68-08da8c175ab9
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT010.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7081
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
index e3674a15b934..5d1948179471 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -33,6 +33,8 @@
 
 #include <linux/platform_data/mtd-nand-omap2.h>
 
+#include "../gpio/gpiolib.h"
+
 #define	DEVICE_NAME		"omap-gpmc"
 
 /* GPMC register offsets */
@@ -1985,6 +1987,11 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
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
@@ -2216,10 +2223,11 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
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
@@ -2348,7 +2356,19 @@ static int gpmc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
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

