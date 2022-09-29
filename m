Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1EC5EF5D4
	for <lists+linux-omap@lfdr.de>; Thu, 29 Sep 2022 14:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbiI2M4z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Sep 2022 08:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbiI2M4x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Sep 2022 08:56:53 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FCF15102A;
        Thu, 29 Sep 2022 05:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jobutWL/JDL6bdVAb3kkex7g7jovOAFP8pjvzmW3P8E9to1/LwcTCH2yKhVWJ3jgCnblRnNKNtHqee5L0JQyghXfVvvGwOojFhSZLFwi3bwRuMlTWt/h9OCLSUmdmDYuTl5leaaXuo8ZtklHojpYDF/EnsKyJPyHzKsN8XdZdw7TLHiTbG7I6zr1JzbleY8+3lm7AZI2vhJawnAJj7/br+0Z5zOJd242XwlhDL0ORG2VEy2jYJWeYsUvrlJ1EUwkkk273N9vkbW51a6UNCu3Fv5w6D3TwP2ZGx5zc/oEH6fUsAf6ERVSAYjGK3jm9OMdnfaSlY41X2luOIk8jE9NSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2zQsyLrm9JBWU2AAqb5h3NJzTDqenK6OdUU3zQygT0=;
 b=l+6ZLt9n9/aGHgFS9n0EoviXhAjMEJUl0pqTorP+gGtrRU1iV16CAEJLL8CV/jCb1zChU8lHzhaDlrScClOmmVxP4kqN5Fjg/a8Qq/GBLnRdYDDuRd0pAS5XEup80fAca6E+dDOlQzx0tLk17JXifTIetJsIrTARyJFlSCEvxsgQpIJsUyBl6Wkshaa6LtnSCyQHVmFcRr04pfkCKe259zV3p2838pB/4yrpzP3hlo4a3AChcP8HBO/B8vhi1JWHOFnf4osxJxd/dj+Z1tjVEi2ZJzWULf/DuZLwdx+/xztWu+WtXgd5vVf92i5nZDYdvhOPgzKE8TdU7/b4yKlLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2zQsyLrm9JBWU2AAqb5h3NJzTDqenK6OdUU3zQygT0=;
 b=wXHUr93HlE2gyKxiSdxz51sBy1gbrgnE8lyJDzqe2lrvN3/EmfDtf0YGLmsJ6sA2U8F7NjqgTiQ+HN7Q2cX8VOcbUd9mUVv3gFjk57qZz8Lm7HXutN0onA4e+FnRNi4kvREBvqU1sfVot3Grmdh/a13WgU4Teo+MHY1DYOWf/BcAXZDLG1nEpS0SmTu8qE8C6fi1GtyDpPocw4mmno8JIxMacUgrTr6T6gxYaIQwxZvgYvtAJ48YwyG/W75BgnHYDj/QqS53AemAgu3Vzdi6HB5nfjdkOIP9MXwtGt/inbM4YnLzZlwt94HdgpXjiOMBqzQYrGgsQrc+PugHfgUnkA==
Received: from DU2P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::26)
 by DB8PR10MB3290.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 12:56:49 +0000
Received: from DB5EUR01FT075.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::f0) by DU2P251CA0019.outlook.office365.com
 (2603:10a6:10:230::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 12:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT075.mail.protection.outlook.com (10.152.5.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Thu, 29 Sep 2022 12:56:49 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Thu, 29 Sep 2022 14:56:48 +0200
Received: from bennie-lenovo.ad001.siemens.net (139.23.126.196) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Thu, 29 Sep 2022 14:56:48 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v6 1/2] memory: omap-gpmc: wait pin additions
Date:   Thu, 29 Sep 2022 14:56:38 +0200
Message-ID: <20220929125639.143953-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.23.126.196]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT075:EE_|DB8PR10MB3290:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5c7753-3f25-4dee-9139-08daa21a12c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AT2VnfCXuiarkGOLLM2ZMJJw5wqAJ1sEn0up9jQMPyapN3t4KCN+vN1VVvg2Di0llL4uHFG0nE05gDsJbZb8RCrhJ56PfAnKKA2crUWLsmKjO1uI5t03+fg0S561mZlB2MTI7XocVjHu5ZCJ24xZu0Vzr0nFry4h6Jj1QNyPCRWnKUTFtzFhwvolDO8+9DatvGH7XCxR4OnY8SwOKCe63WE2KwcVgvk7R5znbLbP/ZtZ6dsl51ueihSolhjaZFTnjG3VgF7T26kyHbHlPArNbbIpvISAyt7G9+yzY3hYTomVBgpR4s/B4a8pqD3ClbuZw49SitgZfAG6VdQfw0tlRseKf8+nwSSsQlL7D/P3HgoSxDRMOR2/oC0oWwF8TqAx2LGQ/utkFchKoPfr6Pe2mNmwgFGUKrE59Cno2Vl0fohEHiKWdNZ4uRQV6zMYIXd5zvgKxdtvW6zSOjt2XRUF4k3k7UupL8Y3nAfGGMYu5Oiyli9SGvrp+vfwhByMReIWBK/ws+DUzyRV7/CkL2fNgT+IK2hOTeDzp42e6CohkNKcDuG8TIR+Efzkeyxd3IDEgpDpesQ47J19X9+FS+/f74aMaqMR8JPbNePXL3cajuq9IocuYAGUoLYyQhVq0GbeQsWgKsER3eyRFZGtsW0+6kSI7EO5d5krYL4s+BMVzdkN/ad6sFpA1ORqFtnzahy2B1pUViBcguKdriDBvtBt+IJkU/KC2iW6fJ9wl3vEyeBScpY1SuUq1aiV1Mxd7dkxEmhlymonVQSTQ1afyt2k3hLFgY1F5Z9fj06vB6KJjo4=
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(336012)(47076005)(82310400005)(356005)(81166007)(26005)(5660300002)(41300700001)(8676002)(6666004)(4326008)(82740400003)(82960400001)(36756003)(40480700001)(40460700003)(86362001)(83380400001)(186003)(16526019)(956004)(2616005)(2906002)(1076003)(36860700001)(316002)(478600001)(54906003)(110136005)(8936002)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:56:49.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5c7753-3f25-4dee-9139-08daa21a12c8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT075.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3290
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

This patch introduces support for setting the wait-pin polarity as well
as using the same wait-pin for different CS regions.

The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
in the GPMC_CONFIG register. This is currently not supported by the
driver. This patch adds support for setting the required register bits
with the "gpmc,wait-pin-polarity" dt-property.

The wait-pin can also be shared between different CS regions for special
usecases. Therefore gpmc must keep track of wait-pin allocations, so it
knows that either gpmc itself or another driver has the ownership.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c              | 115 +++++++++++++++++++++---
 include/linux/platform_data/gpmc-omap.h |   8 ++
 2 files changed, 111 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index d9bf1c2ac319..24510d19a564 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -132,6 +132,7 @@
 #define GPMC_CONFIG_DEV_SIZE	0x00000002
 #define GPMC_CONFIG_DEV_TYPE	0x00000003
 
+#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
 #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
 #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
 #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
@@ -227,11 +228,18 @@ struct omap3_gpmc_regs {
 	struct gpmc_cs_config cs_context[GPMC_CS_NUM];
 };
 
+struct gpmc_waitpin {
+	u32 pin;
+	u32 polarity;
+	struct gpio_desc *desc;
+};
+
 struct gpmc_device {
 	struct device *dev;
 	int irq;
 	struct irq_chip irq_chip;
 	struct gpio_chip gpio_chip;
+	struct gpmc_waitpin *waitpins;
 	int nirqs;
 	struct resource *data;
 };
@@ -1030,6 +1038,59 @@ void gpmc_cs_free(int cs)
 }
 EXPORT_SYMBOL(gpmc_cs_free);
 
+static bool gpmc_is_valid_waitpin(u32 waitpin)
+{
+	return waitpin >= 0 && waitpin < gpmc_nr_waitpins;
+}
+
+static int gpmc_alloc_waitpin(struct gpmc_device *gpmc,
+			      struct gpmc_settings *p)
+{
+	int ret;
+	struct gpmc_waitpin *waitpin;
+	struct gpio_desc *waitpin_desc;
+
+	if (!gpmc_is_valid_waitpin(p->wait_pin))
+		return -EINVAL;
+
+	waitpin = &gpmc->waitpins[p->wait_pin];
+
+	waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
+						 p->wait_pin, "WAITPIN",
+						 GPIO_ACTIVE_HIGH,
+						 GPIOD_IN);
+
+	ret = PTR_ERR(waitpin_desc);
+	if (IS_ERR(waitpin_desc) && ret != -EBUSY)
+		return ret;
+
+	/* Shared wait pin */
+	if (waitpin && waitpin->desc) {
+		/* Must use the same properties than previous allocation */
+		if (p->wait_pin_polarity != waitpin->polarity ||
+		    p->wait_pin != waitpin->pin) {
+			dev_err(gpmc->dev,
+				"shared-wait-pin: invalid configuration\n");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	waitpin->desc = waitpin_desc;
+	waitpin->pin = p->wait_pin;
+	waitpin->polarity = p->wait_pin_polarity;
+	dev_info(gpmc->dev, "shared wait-pin: %d\n", waitpin->pin);
+
+	return 0;
+}
+
+static void gpmc_free_waitpin(struct gpmc_device *gpmc,
+			      int wait_pin)
+{
+	if (gpmc_is_valid_waitpin(wait_pin))
+		gpiochip_free_own_desc(gpmc->waitpins[wait_pin].desc);
+}
+
 /**
  * gpmc_configure - write request to configure gpmc
  * @cmd: command type
@@ -1881,6 +1942,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 
 	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
 
+	if (p->wait_pin_polarity != GPMC_WAITPINPOLARITY_DEFAULT) {
+		config1 = gpmc_read_reg(GPMC_CONFIG);
+
+		if (p->wait_pin_polarity == GPMC_WAITPINPOLARITY_ACTIVE_LOW)
+			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+		else if (p->wait_pin_polarity == GPMC_WAITPINPOLARITY_ACTIVE_HIGH)
+			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
+
+		gpmc_write_reg(GPMC_CONFIG, config1);
+	}
+
 	return 0;
 }
 
@@ -1980,7 +2052,25 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
 				__func__);
 	}
 
+	p->wait_pin = GPMC_WAITPIN_DEFAULT;
+	p->wait_pin_polarity = GPMC_WAITPINPOLARITY_DEFAULT;
+
 	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
+		if (!gpmc_is_valid_waitpin(p->wait_pin)) {
+			pr_err("%s: Invalid wait-pin (%d)\n", __func__, p->wait_pin);
+			p->wait_pin = GPMC_WAITPIN_DEFAULT;
+		}
+
+		if (!of_property_read_u32(np, "gpmc,wait-pin-polarity",
+					  &p->wait_pin_polarity)) {
+			if (p->wait_pin_polarity != GPMC_WAITPINPOLARITY_ACTIVE_HIGH &&
+			    p->wait_pin_polarity != GPMC_WAITPINPOLARITY_ACTIVE_LOW) {
+				pr_err("%s: Invalid wait-pin-polarity (%d)\n",
+				       __func__, p->wait_pin_polarity);
+				p->wait_pin_polarity = GPMC_WAITPINPOLARITY_DEFAULT;
+				}
+		}
+
 		p->wait_on_read = of_property_read_bool(np,
 							"gpmc,wait-on-read");
 		p->wait_on_write = of_property_read_bool(np,
@@ -2085,7 +2175,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	const char *name;
 	int ret, cs;
 	u32 val;
-	struct gpio_desc *waitpin_desc = NULL;
 	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
 
 	if (of_property_read_u32(child, "reg", &cs) < 0) {
@@ -2214,17 +2303,9 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 
 	/* Reserve wait pin if it is required and valid */
 	if (gpmc_s.wait_on_read || gpmc_s.wait_on_write) {
-		unsigned int wait_pin = gpmc_s.wait_pin;
-
-		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
-							 wait_pin, "WAITPIN",
-							 GPIO_ACTIVE_HIGH,
-							 GPIOD_IN);
-		if (IS_ERR(waitpin_desc)) {
-			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
-			ret = PTR_ERR(waitpin_desc);
+		ret = gpmc_alloc_waitpin(gpmc, &gpmc_s);
+		if (ret < 0)
 			goto err;
-		}
 	}
 
 	gpmc_cs_show_timings(cs, "before gpmc_cs_program_settings");
@@ -2268,7 +2349,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	ret = -ENODEV;
 
 err_cs:
-	gpiochip_free_own_desc(waitpin_desc);
+	gpmc_free_waitpin(gpmc, gpmc_s.wait_pin);
 err:
 	gpmc_cs_free(cs);
 
@@ -2278,6 +2359,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 static int gpmc_probe_dt(struct platform_device *pdev)
 {
 	int ret;
+	struct gpmc_device *gpmc =  platform_get_drvdata(pdev);
 	const struct of_device_id *of_id =
 		of_match_device(gpmc_dt_ids, &pdev->dev);
 
@@ -2305,6 +2387,12 @@ static int gpmc_probe_dt(struct platform_device *pdev)
 		return ret;
 	}
 
+	gpmc->waitpins = devm_kzalloc(&pdev->dev,
+				      gpmc_nr_waitpins * sizeof(struct gpmc_waitpin),
+				      GFP_KERNEL);
+	if (!gpmc->waitpins)
+		return -ENOMEM;
+
 	return 0;
 }
 
@@ -2505,8 +2593,11 @@ static int gpmc_probe(struct platform_device *pdev)
 
 static int gpmc_remove(struct platform_device *pdev)
 {
+	int i;
 	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
 
+	for (i = 0; i < gpmc_nr_waitpins; i++)
+		gpmc_free_waitpin(gpmc, i);
 	gpmc_free_irq(gpmc);
 	gpmc_mem_exit();
 	pm_runtime_put_sync(&pdev->dev);
diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
index c9cc4e32435d..40481dbf793d 100644
--- a/include/linux/platform_data/gpmc-omap.h
+++ b/include/linux/platform_data/gpmc-omap.h
@@ -136,6 +136,13 @@ struct gpmc_device_timings {
 #define GPMC_MUX_AAD			1	/* Addr-Addr-Data multiplex */
 #define GPMC_MUX_AD			2	/* Addr-Data multiplex */
 
+/* Wait pin polarity values */
+#define GPMC_WAITPINPOLARITY_DEFAULT -1
+#define GPMC_WAITPINPOLARITY_ACTIVE_LOW 1
+#define GPMC_WAITPINPOLARITY_ACTIVE_HIGH 0
+
+#define GPMC_WAITPIN_DEFAULT -1
+
 struct gpmc_settings {
 	bool burst_wrap;	/* enables wrap bursting */
 	bool burst_read;	/* enables read page/burst mode */
@@ -149,6 +156,7 @@ struct gpmc_settings {
 	u32 device_width;	/* device bus width (8 or 16 bit) */
 	u32 mux_add_data;	/* multiplex address & data */
 	u32 wait_pin;		/* wait-pin to be used */
+	u32 wait_pin_polarity;
 };
 
 /* Data for each chip select */
-- 
2.25.1

