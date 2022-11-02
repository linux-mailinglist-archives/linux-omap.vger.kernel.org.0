Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6246163DF
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 14:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbiKBNbL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 09:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbiKBNbJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 09:31:09 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FA42AC75;
        Wed,  2 Nov 2022 06:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOwPDRqgwV7FZxJT4tELwZ4dl+KHjg2X9YDFKjms5zTP3ZqsoPxXaIPWCgh2bqnczaR4BRmSWsd2bIZu5aoiUhZUVrgRkDaO8pzD2KWcNtxp8zVC7TEybf3lu4yVwMcP7AIjfroX1tbFvCxNv2hTn9VUGed1qj//tCikc4+ZDOz3DDZUDsFFOajomR4LT0veVObutHD/KTi3S80OfeH6hOxqSbx8zBN+UqHVSTLfq30/WFezabpSqlySkO/roBkTuOw8cgkQYq72kHqX7qWWjjMBkU/fiOVGnQnKrc9FRUKmy/zWKR2Z42nsWDo8PT2V9oVIlxiWE8gQj7V4gbGo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBd5p0EYwEr7Qd7Tu24RNCHzlFnywa4Gki8cgQGl1HM=;
 b=E+FPEQk/OoUAoLfy/gPqPCvnwwYFaaPvDMjmKWUgxQEMTXnGtC9RJI3H1zmixDiXL3hhXOjCi+bpGa4tGPG9ipsIuHwBDKqYYGccBO6vMbhR+GMvni3Eu06CO1LiKfVS5RjPIT7QNx+jz6Ty165DUijsAU5+C9MvXQuYR0Y2vxfvFnPcIacdp1DfKvsw2wUvfTvP5tlANgbPrQBBsfFLTf8wHFg6cZFmF56IcdwGlUYU+xd954famd9SldOtovKZ36xBb/SNOSL0hKTCecSL7oKk08Kh4sBIR1T+zj3fW49evugQ47TtE5G0ZtM9NAHTFxg7rlEZAoncJBTkJFIrZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBd5p0EYwEr7Qd7Tu24RNCHzlFnywa4Gki8cgQGl1HM=;
 b=ROJAfihcIonhurAK/WBqirHDGg5UtRtgJQNJqflu3pZqtVBV9h7/zs9hCatYCI73kHuo4IIP3WTnUaSBsuUx53qMNG3DM7jxfkQ4bM8ylDklCm8M9esaSgofDDx7/CYCeYtey2eF9tJL4FHE/3mGMFpYT+G5dh+W56qbjN4Gsa4kvGzornMeBW5CL7UfVeX6AP9ZaU1LRnm5nZad+i8/dPvjMyCHd3cLnOgAFKATWjw+cWIZXN5iFs0qiIAqKSgpdNOmdKEBmnUVr5l4wkub6hOKT/TlYRIC3gyrWegjhl+Mf4emiW49ISkf9cbAswRb/Zi59twOoy0sxxbXUZqcWw==
Received: from OS6P279CA0035.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:32::14)
 by PAWPR10MB7913.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:367::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 13:31:05 +0000
Received: from HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:32:cafe::49) by OS6P279CA0035.outlook.office365.com
 (2603:10a6:e10:32::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.21 via Frontend
 Transport; Wed, 2 Nov 2022 13:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT033.mail.protection.outlook.com (10.152.0.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 13:31:04 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Wed, 2 Nov 2022 14:30:58 +0100
Received: from bennie-lenovo.fritz.box (139.21.146.184) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Wed, 2 Nov 2022 14:30:57 +0100
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Date:   Wed, 2 Nov 2022 14:30:46 +0100
Message-ID: <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.184]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT033:EE_|PAWPR10MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa9f382-9cb4-421b-4cf2-08dabcd67e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pWn2VJGI+4DVeo7WFOZlpe+SLMXNSVxVBEHQfub9CQFAY9MeAWpDUZgnKlk+tYaKInEI9+GRe4xH2uy1gf2n7IyunPuspvJNBUVQnjbm6yVnW2Sh+9ckvHSrWOt0RQ+tZ0ccf08zcW68UVCIwgSA+96O1Nh5qZhQrrDUGZ/gDbXRLz0/heiOX2Q56WG2NfxQZhH3ri4SGRbLp2PeIs1MaAj4OqwHOCbhN3wdESqvyDHnC9PDI8WaFdyTz+LRiN/SD2OcV+E8eN/P1KDJgiqeqfm535hIyvV99TjPhTgWQvbIJ9RQNjNPctzUkBf1LEq0YCLWNFl1BzLN86dVZF0bvyU/8DfrbHWSgVJbcd7ngg1zrv/usTXUU88gcaB3+p1889riwAjMcZxfpL7k6yhOEx/pQzJ6Mp0dJi1+sFiuLezk4a9SUTo7uQ2mMg5UN7/sg1XUTTmRJVcTmwiHGUBkjQJWOrjf6boyT76BOYgwXV2li6YDb3XmsnBZ+Q53r73Ovtyo2p8+V4HbHPhOa+ng4yHq+/SYljtEZ4cWE5uYysdzevnuhxPyLynWSATDEulHV4ukArgRxVN7U30vs//+zZbrtzuoj2m8ZBMlccBeKbqDjEURUuRuFu4Sig/0NNQLhrWu1IpMpxbk3SEPmKLlYNQAmcL+wRAbnPyXIsfLIPJiuGIe3cAaIttJdPEi3kJoYwbEvLSjQLeQ73gqf3gvP66caQvBtV7LqtjvqFhyR4U2Xrju54e4TtLIOyuW2uN1mkqKTJoTYRFX9Q/LzzX1vAvCx94Ob5lP7mjFyALMlhiSvyh3IGqY7t1gGBAzGEjR
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(356005)(81166007)(86362001)(36860700001)(2906002)(5660300002)(82960400001)(47076005)(83380400001)(2616005)(956004)(186003)(1076003)(16526019)(40460700003)(336012)(54906003)(6666004)(316002)(478600001)(40480700001)(82740400003)(26005)(110136005)(41300700001)(4326008)(8676002)(8936002)(70206006)(70586007)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 13:31:04.9076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa9f382-9cb4-421b-4cf2-08dabcd67e0d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7913
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
with the "ti,wait-pin-polarity" dt-property.

The wait-pin can also be shared between different CS regions for special
usecases. Therefore GPMC must keep track of wait-pin allocations, so it
knows that either GPMC itself or another driver has the ownership.

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 drivers/memory/omap-gpmc.c              | 122 +++++++++++++++++++++---
 include/linux/platform_data/gpmc-omap.h |   8 ++
 2 files changed, 117 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 2351f2708da2..e427572712e2 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -134,6 +134,7 @@
 #define GPMC_CONFIG_DEV_SIZE	0x00000002
 #define GPMC_CONFIG_DEV_TYPE	0x00000003
 
+#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
 #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
 #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
 #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
@@ -229,6 +230,12 @@ struct omap3_gpmc_regs {
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
@@ -236,6 +243,7 @@ struct gpmc_device {
 	struct gpio_chip gpio_chip;
 	struct notifier_block nb;
 	struct omap3_gpmc_regs context;
+	struct gpmc_waitpin *waitpins;
 	int nirqs;
 	unsigned int is_suspended:1;
 	struct resource *data;
@@ -1035,6 +1043,62 @@ void gpmc_cs_free(int cs)
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
+	if (!waitpin->desc) {
+		/* Reserve the GPIO for wait pin usage.
+		 * GPIO polarity doesn't matter here. Wait pin polarity
+		 * is set in GPMC_CONFIG register.
+		 */
+		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
+							 p->wait_pin, "WAITPIN",
+							 GPIO_ACTIVE_HIGH,
+							 GPIOD_IN);
+
+		ret = PTR_ERR(waitpin_desc);
+		if (IS_ERR(waitpin_desc) && ret != -EBUSY)
+			return ret;
+
+		/* New wait pin */
+		waitpin->desc = waitpin_desc;
+		waitpin->pin = p->wait_pin;
+		waitpin->polarity = p->wait_pin_polarity;
+	} else {
+		/* Shared wait pin */
+		if (p->wait_pin_polarity != waitpin->polarity ||
+		    p->wait_pin != waitpin->pin) {
+			dev_err(gpmc->dev,
+				"shared-wait-pin: invalid configuration\n");
+			return -EINVAL;
+		}
+		dev_info(gpmc->dev, "shared wait-pin: %d\n", waitpin->pin);
+	}
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
@@ -1886,6 +1950,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 
 	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
 
+	if (p->wait_pin_polarity != GPMC_WAITPINPOLARITY_INVALID) {
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
 
@@ -1975,7 +2050,25 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
 				__func__);
 	}
 
+	p->wait_pin = GPMC_WAITPIN_INVALID;
+	p->wait_pin_polarity = GPMC_WAITPINPOLARITY_INVALID;
+
 	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
+		if (!gpmc_is_valid_waitpin(p->wait_pin)) {
+			pr_err("%s: Invalid wait-pin (%d)\n", __func__, p->wait_pin);
+			p->wait_pin = GPMC_WAITPIN_INVALID;
+		}
+
+		if (!of_property_read_u32(np, "ti,wait-pin-polarity",
+					  &p->wait_pin_polarity)) {
+			if (p->wait_pin_polarity != GPMC_WAITPINPOLARITY_ACTIVE_HIGH &&
+			    p->wait_pin_polarity != GPMC_WAITPINPOLARITY_ACTIVE_LOW) {
+				pr_err("%s: Invalid wait-pin-polarity (%d)\n",
+				       __func__, p->wait_pin_polarity);
+				p->wait_pin_polarity = GPMC_WAITPINPOLARITY_INVALID;
+				}
+		}
+
 		p->wait_on_read = of_property_read_bool(np,
 							"gpmc,wait-on-read");
 		p->wait_on_write = of_property_read_bool(np,
@@ -2080,7 +2173,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	const char *name;
 	int ret, cs;
 	u32 val;
-	struct gpio_desc *waitpin_desc = NULL;
 	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
 
 	if (of_property_read_u32(child, "reg", &cs) < 0) {
@@ -2208,17 +2300,9 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 
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
@@ -2260,7 +2344,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	ret = -ENODEV;
 
 err_cs:
-	gpiochip_free_own_desc(waitpin_desc);
+	gpmc_free_waitpin(gpmc, gpmc_s.wait_pin);
 err:
 	gpmc_cs_free(cs);
 
@@ -2489,7 +2573,7 @@ static int omap_gpmc_context_notifier(struct notifier_block *nb,
 
 static int gpmc_probe(struct platform_device *pdev)
 {
-	int rc;
+	int rc, i;
 	u32 l;
 	struct resource *res;
 	struct gpmc_device *gpmc;
@@ -2545,6 +2629,15 @@ static int gpmc_probe(struct platform_device *pdev)
 		gpmc_nr_waitpins = GPMC_NR_WAITPINS;
 	}
 
+	gpmc->waitpins = devm_kzalloc(&pdev->dev,
+				      gpmc_nr_waitpins * sizeof(struct gpmc_waitpin),
+				      GFP_KERNEL);
+	if (!gpmc->waitpins)
+		return -ENOMEM;
+
+	for (i = 0; i < gpmc_nr_waitpins; i++)
+		gpmc->waitpins[i].pin = GPMC_WAITPIN_INVALID;
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
@@ -2598,9 +2691,12 @@ static int gpmc_probe(struct platform_device *pdev)
 
 static int gpmc_remove(struct platform_device *pdev)
 {
+	int i;
 	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
 
 	cpu_pm_unregister_notifier(&gpmc->nb);
+	for (i = 0; i < gpmc_nr_waitpins; i++)
+		gpmc_free_waitpin(gpmc, i);
 	gpmc_free_irq(gpmc);
 	gpmc_mem_exit();
 	pm_runtime_put_sync(&pdev->dev);
diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
index c9cc4e32435d..296b080c5c67 100644
--- a/include/linux/platform_data/gpmc-omap.h
+++ b/include/linux/platform_data/gpmc-omap.h
@@ -136,6 +136,13 @@ struct gpmc_device_timings {
 #define GPMC_MUX_AAD			1	/* Addr-Addr-Data multiplex */
 #define GPMC_MUX_AD			2	/* Addr-Data multiplex */
 
+/* Wait pin polarity values */
+#define GPMC_WAITPINPOLARITY_INVALID -1
+#define GPMC_WAITPINPOLARITY_ACTIVE_LOW 0
+#define GPMC_WAITPINPOLARITY_ACTIVE_HIGH 1
+
+#define GPMC_WAITPIN_INVALID -1
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

