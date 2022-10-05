Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1CB5F564A
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 16:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiJEOWk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 10:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiJEOWi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 10:22:38 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3BA786FA;
        Wed,  5 Oct 2022 07:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/xTWJT1DBECsVu0ddtHtPskB0NmGtHsNTNRMAeGeClGgrQZW9Q1Zbx7cmQsPZC+IWQdCR8pSgwE9M2JJU57ivlFqjZztnLS4X6dtaIdpn8OpMOPfC1gM46yERBp4YICOE3BkIN57mVI6Hm5DAOU/2XUH1T5S16fzgTrZkzF89zFS9n3BtjOnJTWqSJII1qW3zgMKTOPX0blQ1boo0qWBtfpTzMSg0kq1fQ/A+IjQ/FCcdHGDjQcbxJaUbJYIt6oEyboVlPxbDRgi7KZPRAax3HFd2BwI4sdX9Oc8U8rlEERmcN2TRvVOqYtOmTWDVtVZnYXCa6u01GRFpr34Re88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3eaEGnI8Lu+uyDfI6rvSMDdWhG67cN8Qw2JQEk0zFI=;
 b=ko3XwSTbS3zgDi+Yu0jt+IQl3Y+dExK6aXOTu5Iy2Gt2dPoB87PN88AX7vQmU/YxMp5KkGTmts0YRNacI7xIQWtoWT+wSxxXFeSg/b3ve+GLayFCmo5XN97NGTOSSDMaiCfOEXVdlSICuITLEtxRbphGd0fpZd8uI3kcF/QpHcODUqpY/5LN41mJkqvP6Y7FCC3chGKb8RqJXDfvNMatOjRQkcn9t/zNg9ZIBKe+1IcK0Tm1pqAprznkUPvpLAjsf+EUZFGuHCe04+OX/fYADwDEJFVVcs513uKxaocc/QJi9vgapkcxJpIzoNv/T/QLHvflJyjXYnd3OuetfwMx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3eaEGnI8Lu+uyDfI6rvSMDdWhG67cN8Qw2JQEk0zFI=;
 b=cQHe9fuI4Q+EVzyOvFlG+c2HC+FUJ7KCPFkXf1iWTP3/HkoNv6HruXrIbzPqITIW16LKexUWCNQp8daIWjeg0pRGaaeeQnNz1OP1PclhQteW/emGTimHIyr5xdNIKkJVpkCt0gubKzzxf3zjy69MwtlEVPt5oMDRlgrmII3R0CoHDMPLBhQRVW9GQWiDKINSEBfVOnzOrP5GGI8jj12+eDYkc9f8BLSCnt2Fb0am271K7u4IF1mTpKhRUWoDsxfiXX5ya+FcAsCEmjkWpVYqInLbPoWpXDrOi0BmGnonjeI963QJZncnAWjrIFhb98eWejAJmBvFu4sDMmseewU/gw==
Received: from DU2P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::34)
 by AM7PR10MB3876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:175::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 5 Oct
 2022 14:22:34 +0000
Received: from DB5EUR01FT040.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::e) by DU2P250CA0029.outlook.office365.com
 (2603:10a6:10:231::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via Frontend
 Transport; Wed, 5 Oct 2022 14:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT040.mail.protection.outlook.com (10.152.5.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 14:22:34 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Wed, 5 Oct 2022 16:22:34 +0200
Received: from bennie-lenovo.fritz.box (144.145.220.67) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.12; Wed, 5 Oct 2022 16:22:33 +0200
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <rogerq@kernel.org>, <tony@atomide.com>
Subject: [PATCH v7 1/2] memory: omap-gpmc: wait pin additions
Date:   Wed, 5 Oct 2022 16:22:23 +0200
Message-ID: <20221005142224.287982-2-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005142224.287982-1-benedikt.niedermayr@siemens.com>
References: <20221005142224.287982-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [144.145.220.67]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--14.897700-8.000000
X-TMASE-MatchedRID: 72LmfBRVXZx9FLoMFmUuDthqUVCOck0ftrzk2ZRuBsoMOWxRtywg+jh4
        aiF3uCM2HWtVZN0asTgf18Czy93s4fathQv6lzDi7uTk+xoYFu6b/N9SeJFyxcmiSRTHZQzXDmT
        V5r5yWnqOGxiV2ubMadskxtNP0r9NefILjeEZ79/vcnIVT5xVcyHhSBQfglfsA9lly13c/gGOVG
        ny5q72hquPvo9L6iaI0zNps+LI1+t2PULLZTziu9tnBGusYR3PDEVT5M0HH4UaPMGCcVm9Diu1T
        i/fdPHBIIvbIEPeuIEccGRhta5Q6rPIKjrFoGoy9plodGf603n/R1NSMc2qCednG4+P1pj7yiKg
        KtIyB4qQc9WQFO7fU1aPo0QygOyiQfigoiUyKIWlBrV+KMJAP0s3SiaAjbkfCWlWR223da4Bmf/
        gD11vZB6njTSt2k4LFQLH9fnGRSfKkzYAd7QJFOxgfj2sQEjggQFyHQeFnIMjRwcsjqWGAjFcf9
        2WG8u/HnddRfSLChTsq4UteQrM5yVYwXvjZbQj9LuVp2lfQNdvpNRj/SLt26oXHZz/dXlx64sVl
        liWKx8fE8yM4pjsDwtuKBGekqUpOlxBO2IcOBZy2vCcLGx/yxtkdA7I+fBMu3uBoKWfQgrma/uS
        mSYR5zSxxGdt3wab
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.897700-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: E0A234761B05804188569D42EA18749983A68489FD577338EC531DF41FA648232000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT040:EE_|AM7PR10MB3876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d95772c-f5e7-4a42-2980-08daa6dd0c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cOUyVD2GF85B8XS0DJZlVR0QUINpO1jz+arrxYlBJ1dPtLDKHqbhmHVmute3XE7nu/7wdflJc8KkmsgJe+6lP3aAtMo4nFfdMwKy8z6ohqZgtEqU9oejyFn1s/mlthJfTMejpoonKykZXjLzuXINLvIIXbKTeoiqgriO0mzGt9VJDXMEi3/hxnN/EV6jlYYX9OjnxM1VrRml5XbThw5pl9LLxKFzjwEaHwXOg/lJTPMyR+ca1gT/9zhaVcTnuKsiHZoA5fLIFf/KqG38911WWbtdo8lC2Afmh6e3bpnEVTgQqLSlCddo19bncChmn4Pdvv9ExNW5y0mAuIaWZ2sdUYBUYQJC0xzbLy1ZTVaAWn67ObDL/4YlnJutu3Frx00rNcbgzfdyVTIuCZsZlEaiC0aQpnuFBZcSoacBPV9e9cv01hLqoS+jx5kIHs8/KdAA6RlifLzNLXzU8n7x3xLqo8R+GWawLt2+nCljuXqMtf/ZG/j0YWC6eFT67KPrP/6yO2fxF3n1As/O8nTEbONyYJA/b1xFzmq1uLlou9CIE/j6AqkaHHV5Q5nz14UEvVkDArT9SZ+c74kMu4TySI+oZAe+LrpBvzIRGusMNqvZRuuUAr3Si/D72J7wTXbWDladLANDHjzopSH9m6PK3KR03ybLDP1VbSzYqjGVkjS7B0+fwWryGUGN4QiyAdoWGvN0QBKuO2A8GYs7WjL9DZRAvxAJZVcJRdoPi6+Ht4qoVlmhvCIIwVH7qp9J36XpdRGaQYxmMo6ctBpjAEq3Zf+QVg==
X-Forefront-Antispam-Report: CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(2906002)(7636003)(356005)(7596003)(36860700001)(478600001)(82310400005)(82740400003)(82960400001)(36756003)(86362001)(70586007)(8676002)(83380400001)(2616005)(16526019)(6666004)(26005)(186003)(316002)(54906003)(40460700003)(956004)(110136005)(5660300002)(41300700001)(4326008)(336012)(47076005)(1076003)(70206006)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 14:22:34.5737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d95772c-f5e7-4a42-2980-08daa6dd0c0d
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT040.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3876
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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
index d9bf1c2ac319..95c4e61753c0 100644
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
+	/* Reserve the GPIO for wait pin usage.
+	 * GPIO polarity doesn't matter here. Wait pin polarity
+	 * is set in GPMC_CONFIG register.
+	 */
+	waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
+						 p->wait_pin, "WAITPIN",
+						 GPIO_ACTIVE_HIGH,
+						 GPIOD_IN);
+
+	ret = PTR_ERR(waitpin_desc);
+	if (IS_ERR(waitpin_desc) && ret != -EBUSY)
+		return ret;
+
+	if (!waitpin->desc) {
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
 
+	p->wait_pin = GPMC_WAITPIN_DEFAULT;
+	p->wait_pin_polarity = GPMC_WAITPINPOLARITY_INVALID;
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
+		gpmc->waitpins[i].pin = GPMC_WAITPIN_DEFAULT;
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
index c9cc4e32435d..9aa47dd9b6c6 100644
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

