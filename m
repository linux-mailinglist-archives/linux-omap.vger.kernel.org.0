Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31FA16071E0
	for <lists+linux-omap@lfdr.de>; Fri, 21 Oct 2022 10:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiJUIQt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Oct 2022 04:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiJUIQp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Oct 2022 04:16:45 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20061.outbound.protection.outlook.com [40.107.2.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A38E24AE2C;
        Fri, 21 Oct 2022 01:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXT9btaxtSPV7u4qv4+hNMHDN6kq4ZJ8O6438piotpHbBI+4I2ISbO/UakGjxJjp9yI9X+ZUlLDvjTn3Dm5bhtBTnwU7lXWgt87A/zTv5GcnQBpVUVtcADgKqZP7+nthWToevSZUFW36bS9vDWjF1k8Sv7fQrrZ7JCy2UfHI1HKDpaEGvMLPIB+clUuWno7wN7lzzqpHb1toyYGGmnhzuwF/vVmsWK8MU8MPIBcgrOwuw9sDi2NTb2yrwqICkD4R+fv9qM68G6DaEU9Ps39aykcsHN82T9g+HPAX3ch/MbT0Zq6K4KAsQ70myQq79mbrr1Xnr+m1NfODEBhdMUyvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPki7imowBjW67BCCbTyO/BfusSA9stThqJbJdXYjXI=;
 b=ZurgFfBoH5trTJEEDDtDErYMpczKdvCkpQaSdi5KFol1dLVY22BajGmqVjjqhWtQjZk14AKkqk6una7okRzeZNlyCWWV9a917IEAwZEGG30cmUWSi0Xocrb8PbP4x40UOJ/2sW4wh8a5t3fFsRf+7XsIFjJVHuvkCLh4GHw8XCq98YEeTMtgyJxfUPBleAUE6u7VtalWqbidz56isOjGJUMJZ8uOXcW165opm7If6UQSjCpoztnFi574Zvrjp1ZLPY3bYUxDEcbSqyWERpWEVWHOy8cyVXDFdz7AJViKUdOoPainI1rAkkrCiGF4wZmDvoP4bouhRxtS3EdOnkdesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPki7imowBjW67BCCbTyO/BfusSA9stThqJbJdXYjXI=;
 b=QjGiqQ1kHuq9ksBGxXp9ti3royy72bbG+rOtcgcl5u3wZfpXkJqdJUK4Xv3+JilqG3yHtc0NKXFPbPDP2uNxABohF/8E9uLsp+2l49peCgtzUd679OyjV1mGf+GgTtCjJZYs3qhMhu8+G0Pu+hXrAYTcl6WE4U8kJ5KjaZ/KZW8UCfO8rXD4fCdTm4YwwaeiI8RFnOcvEXT1QenxpcsZV+Q0R6Wfdx05gvuXSIpoEX63dh+5/R8zXT3ca7XECIHKsjZpyLluxlXuQ/uvqiqxjI6VSOupkilunvjo9tca8sTJXVBe8r0Qi3BKAz6ZBsH5rcPneEO0PldkytZ5MUxy9Q==
Received: from GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::31) by
 AS1PR10MB5532.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:477::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.21; Fri, 21 Oct 2022 08:16:30 +0000
Received: from HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::d2) by GV3P280CA0118.outlook.office365.com
 (2603:10a6:150:8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 08:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=siemens.com;
Received-SPF: Fail (protection.outlook.com: domain of siemens.com does not
 designate 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.75) by
 HE1EUR01FT015.mail.protection.outlook.com (10.152.0.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:16:30 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Fri, 21 Oct 2022 10:16:28 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.65) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Fri, 21 Oct 2022 10:16:22 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH 1/2] memory: omap-gpmc: wait pin additions
Date:   Fri, 21 Oct 2022 10:16:11 +0200
Message-ID: <20221021081612.591613-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
References: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.65]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT015:EE_|AS1PR10MB5532:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3f88fa-9b74-4c99-a403-08dab33c8eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7+vuPJYFx2vBayjXpxFyAg+F1p1hJCnksAZ9WeKEHrj9838OieEDBxqMzrjNK90c82Xfu2EPCZLeamdI9sRGqngp0GmkzswFDQw5dx1G1R4HgV7eDpdLSUjMGAaU5u0/co8jagUKgEaLp5yvq7ZE04P/+du9eWSToIlixxa1hTO3Y8ZGdFT8iaLLDB7ZuF+TMibp+SoLDefRvv73KFtG4yGNqE8dEpzwH4uT6rdyviVUpD7BRStA4lWZrM6KQzF+H6hbBHXUI+WPnDaFdiH3nafXm2YHeD/hXLK5re7AYg0tSomtqiQ276abTCGGXLZC/SwGfjwgyOL45R/o1Se/QJTEv6UM9JTfvHOk6UlOK42zdLUsp5kJ3SN1ySOglKGQr666G8elPBHP0ymgt38nU+XeJqnm9KXG7DdMCEcgKSAmeeDPufccyfsGKvt10g+nR5BpqROH69DvQqkTaY+SnsMH2U6JNHqAksT7iVmgBAIIdKoqpnTb1ehOSUaefwf5q0lfO//5b+3XLVihP33WYhoMJCMkvY1sn641JqVs/bS19rDwYZdJ4a4WylMMwiD52xW40eCUtjlT0z5zIJ5X9eZc9yKOGAdMQXDpvbOu/jweuUSLPSuITnXtRx2q01rDywr4QsBLFAKfEMg4M91CsSj0w0GrzVmOmYs4dD9PGf/gshTZrWV51i0FYSjPlRQa/hb+LTSgElnsAbjtocmJWspztkNNHFrgCO/PX6VdDykz8Q/ie+948Xl06mkh72fPvqfkOgklc5dI4G8FFxNooXlDN3AxaLNL7WEnSNUFCyXOVDe8ENC2y2Fh1w4szJIXomGiAYTFPfOxK1rCINClw==
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(86362001)(478600001)(82310400005)(70206006)(316002)(54906003)(41300700001)(4326008)(8676002)(110136005)(40480700001)(356005)(81166007)(34020700004)(82960400001)(82740400003)(36860700001)(40460700003)(186003)(1076003)(16526019)(956004)(2616005)(6666004)(26005)(336012)(83380400001)(70586007)(47076005)(2906002)(36756003)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:16:30.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3f88fa-9b74-4c99-a403-08dab33c8eee
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5532
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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
index d9bf1c2ac319..34a80c23a84a 100644
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
@@ -1030,6 +1038,62 @@ void gpmc_cs_free(int cs)
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
@@ -1881,6 +1945,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 
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
 
@@ -1980,7 +2055,25 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
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
@@ -2085,7 +2178,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	const char *name;
 	int ret, cs;
 	u32 val;
-	struct gpio_desc *waitpin_desc = NULL;
 	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
 
 	if (of_property_read_u32(child, "reg", &cs) < 0) {
@@ -2214,17 +2306,9 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 
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
@@ -2268,7 +2352,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
 	ret = -ENODEV;
 
 err_cs:
-	gpiochip_free_own_desc(waitpin_desc);
+	gpmc_free_waitpin(gpmc, gpmc_s.wait_pin);
 err:
 	gpmc_cs_free(cs);
 
@@ -2395,7 +2479,7 @@ static int gpmc_gpio_init(struct gpmc_device *gpmc)
 
 static int gpmc_probe(struct platform_device *pdev)
 {
-	int rc;
+	int rc, i;
 	u32 l;
 	struct resource *res;
 	struct gpmc_device *gpmc;
@@ -2455,6 +2539,15 @@ static int gpmc_probe(struct platform_device *pdev)
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
 
@@ -2505,8 +2598,11 @@ static int gpmc_probe(struct platform_device *pdev)
 
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

