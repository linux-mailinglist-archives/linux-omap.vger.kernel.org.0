Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C6E5ACCB9
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 09:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbiIEHWB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 03:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236788AbiIEHV1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 03:21:27 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81111402FC;
        Mon,  5 Sep 2022 00:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Madz7Db8aYVbnDJICF6yoKKR7mD2X0LXUxVtwDAt7sDTqUycMJ5aJWCLa7wmklNSH9h3V6Vfbi+gFQ4daOQhFZfzCeB8JvKo1ULs5EOIOpj4IuoBYbyEnVGNIYHWL7xKiMjzYjYO3e6Szq0rtYD+8EK2ipFgLDDJBCesuwHhtAVxbpBmRmkacFjxjBNaK95Jd85/zWBRoq50M0BjwzlEDhMjIGAs0NEvLoWESGlLrIMjaRkbj9puAn4eyqwJ/eHng5SbF/JMHO92C7tQBRF2kg5Pu1zGdTv9HwHZ9O1XLBCK/lhCCPg6rbGrChXkW41+V9j/qWySpiADWB1y59Pwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcSPUM7JKx60kqiVPlvPob4IqPGkJo80FpolQhbmIdg=;
 b=fzf28fcDTxTlQ9qqTXdEKcjNaKjOSwCxKflC0O1jA9v/dpaV54iFzm4cy4iMKftUVNQihPw6nITBh+suecZd0BloxSrHtAM3kqTX5eGF85BBQ8okzTVPwLfwrRIoWrnufvQANgs0Ev/Z8C06aBpEsgpMusVRHOLBhHLry0y3bwikAEwA/DrcIlmYmFElU0Z9P/m/yl+xfhONzlJZE0s/JKzRycamG6bavH3wmbDw+L6NHXJwbb2BiWAJAF1mUNaB/Ev6mxQOdFjhK4qZGY4sYumPILXOLQ4eamDeQMFttNrj6toow5pvYx7lOEWNkohl0XC/q/g318vuCeXd7YIP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcSPUM7JKx60kqiVPlvPob4IqPGkJo80FpolQhbmIdg=;
 b=vuNA4PY7WJS8Zfiz2sbFoeTZB8OHOOohLIgRcVbEph7/5n5cUFn8H+pOumV7DtMj6KmFARb2puSAHqCUChp912Nj6dNayr73xuyLSnCmxkq0GptY2ciSkEgi0x5RixUcKnEIWIElL4GDjrzPAq58bEhb7rtRCHoVKVAN5T9lNW1QASv3rdLgbO0AjNsbKs7wPcBxxN7peVDQHwQmqilHHSLXUTQH4RQwNytTIWcuoThgy/y3FLm9b5nd+9GTUJHkLQk7u3zs6PYvC2NjQCCXZoO5rmo7rxx1uiQfH+LlHTHeAI/jbqixwgUBH0p9RhGp545TbY7HK6UU3hR7Te+kFA==
Received: from OS6P279CA0107.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3c::17)
 by AM7PR10MB3779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:178::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 07:17:30 +0000
Received: from HE1EUR01FT091.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:3c:cafe::74) by OS6P279CA0107.outlook.office365.com
 (2603:10a6:e10:3c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Mon, 5 Sep 2022 07:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT091.mail.protection.outlook.com (10.152.0.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 07:17:29 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 5 Sep 2022 09:17:28 +0200
Received: from bennie-lenovo.fritz.box (139.21.146.182) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Mon, 5 Sep 2022 09:17:27 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rogerq@kernel.org>, <tony@atomide.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>
Subject: [PATCH v2 2/3] memory: omap-gpmc: add support for wait pin polarity
Date:   Mon, 5 Sep 2022 09:17:16 +0200
Message-ID: <20220905071717.1500568-3-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 542e8b72-86b6-43f9-c5d7-08da8f0eb1a9
X-MS-TrafficTypeDiagnostic: AM7PR10MB3779:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24KxJ/BOfR9E+WcGs5JG1m6RItWxuMAbMlJC2t4SVmll4wIZo2BGG6JrikkWtrBl434YWbnZxO24cb2VbX7KixktrTUCikQpmi3fWDOCHR0rHKjB20zvcDZ/fu18NZMHYZ5Zp2qhPKW7THZxP6EkHMED8jyugpfcIttXXXrIiERvWCPpuvYP79MPUdo3fZlzsc6SQGrsTC1nDWdz5EPx40IMRoQPse3fEVH5HZWtePR8eE46wzcXbjh0LKUOqTI8KsCllE8u6HE3msAYym+Bdl1VCZiH+a9QMM3o4DmfhDQTSF+UQJaiGZQm6S7BO4oayhY10wiD/3toZnKoBqF66ZviPHnKObnny4HsrlxlPb4o66VABBYPC2qeEbG+7dW6R0wAxT1MoZxgYj6Ljde9DhE0enLeNRH3mSIp3LFCsZvKwImxHlrWeorUjZg4PhXvvNRiurZ9XkcyRK+9IcrVkl9lHDr8i+r65hJIP7RC2OVXO1nk9+XatV00yHm0+lwh81Ub0uRIX7kQpQOLDHJDXux/sz84JV29m5+l3lB2EYViQp0WdIf2VbkJLSqXAwXW7zqmpmfVktJ3HGRjqhZKp/Jh4q84+mly80UpZbrpw8xqDKw8l97iw/A62SHs9jdTo2b2Yk+gVwyzr8v+s9Cy1aQvmWwS2S1Oh4nmp8igARbczXeVqKie1CHgZFLYOtWY2bj8WEGsxlAjCzWmptydIm91Adapo9rOHV7ne07ztZvr1vuhF2eUprmFf0xsFMVSIXmkqZpp4C3Z31nM0PGQqQDf4BDgVWUH0/eJBPbtpwMeNNOIHnW/C/97ovJ/unfd
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(40470700004)(46966006)(4326008)(83380400001)(8676002)(16526019)(336012)(47076005)(70586007)(70206006)(36860700001)(8936002)(5660300002)(478600001)(26005)(6666004)(41300700001)(1076003)(186003)(2616005)(956004)(86362001)(316002)(54906003)(82310400005)(110136005)(40480700001)(40460700003)(36756003)(81166007)(82740400003)(2906002)(82960400001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 07:17:29.8416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 542e8b72-86b6-43f9-c5d7-08da8f0eb1a9
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT091.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3779
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
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

