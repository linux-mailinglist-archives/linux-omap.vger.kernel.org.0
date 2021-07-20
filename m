Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10A23CF645
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 10:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbhGTH7W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 03:59:22 -0400
Received: from mail-eopbgr110132.outbound.protection.outlook.com ([40.107.11.132]:42540
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232349AbhGTH7M (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 20 Jul 2021 03:59:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGMPL2EedS1QUgCjjQQ68Tdu9Zh7HUFB9qSm2QCN/pyGwGHoDbtq3ORu+iLOR8OhZA+pDJtjgrUVE9RTxPI0viVkKu/COgkeT88QTCAOhM2pTVSUCDk/jMh6wwH2DYuBAyQ4iOSRJ5cSaysUicDNmxZlUTrBnpfvUpB/p/q6qlBV4Xj/fcPvdh4C6db4WSm8+Hj+mtiOebVNX14ZVnobvwSkm4gyRMIJFcYsekrEnaJ0ued0fNuMAYR6bEOLit2Ea+ohcODob5UVYK6wMMmzAKKBYti6363JRoNp0QCMWOQNJrmbb2uGeumQGzpVNqPILELaJMhLum8Ai60lGgQtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV93Ia0bWHpNLv6yHgQgjONNcH8CaoFHryhZf+dctZY=;
 b=fvvy/TT3hiCdQ2pc7/wpJi7XyEMgSRMdM+uWFDWIkgVm/n131MfksLFI21Qorn8B0KcPs3g+LFEeALpHkhxq2jXNS4QdNmIz9G88VvT+786j88yEuFDvrgmcM/BL154J7nG4cnWyP2HdIPTReBqNzKUqt3WkESxscDMxjJe05TQklJRzGNldh5L58HU98iK5/YhnzsE9NdQ/L+HaJe/N/cRApThuUxyHxkvVm7s4KyASNxYcp5jZ35kM3DDx6md/sFbQLoBYWuxRHRA74Tvdo13e+vv0boJGJpgAnVyP5aHh2rSTdHfwEtp/1wqQKJHG3qZLLKiIhGuGrZ8B1ZF5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV93Ia0bWHpNLv6yHgQgjONNcH8CaoFHryhZf+dctZY=;
 b=OMXh/Pt0eoOKClqRxhKCgV9mao3vr90IzHBptF9EsNzf8/pId3P9FHbyyrrxB9XD2S92gFrq4Q0LunM6+2WW40FbJyhhj9OLhM5wna8REgeLFgsYevx8L/nj7fdolFviBMlB5HRIS0hJBDSEwLIzIKyUkaWVwXaEN7oXuABRQ9M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:39:46 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:39:46 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: dts: am335x-sancloud-bbe: Extract common code
Date:   Tue, 20 Jul 2021 09:39:26 +0100
Message-Id: <20210720083928.10404-3-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210720083928.10404-1-paul.barker@sancloud.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7223; h=from:subject; bh=PcmRvGrNadWL1qcMB64++AZJHrA2DwgcWBhSkI1B3Yw=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAnfuncbCwbeb/ybNWk9q5hE6Ja7mQUXxTc+D+57zyNzOmbd x7+pHaUsDGIcDLJiiiy7Z++6fP3Bkq29N6SDYeawMoEMYeDiFICJ/O9i+MX8VmvOy81rFsd5GIiV7J 220a2tO+ftYu0gyzPrLx6648fEyLBztbq+wNGbmpkSxoJdvU8P77Flt0pnVeguSOlpvBfhxwEA
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a6::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26 via Frontend Transport; Tue, 20 Jul 2021 08:39:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1997acb-f164-40b2-8727-08d94b59ed9e
X-MS-TrafficTypeDiagnostic: CWLP123MB3764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP123MB376460E8BD6F526884D3B1B093E29@CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5iF+fBb44oa6XHZYCYKa70Cmozq5E5QSTdGpMc+OlQUL/LZVONk9pKwgnlRoOnNRnjp+3rPmWPBJiF57vKHCAkUG8FkoP+9AA5r36uhN+afeHpSyBEXvLptE69jF+mUKrNsHfs55MWxXtn+lGZlFWr66e9O0raXhDJSQ6l3zfED1q/NuvTS4V3cOZckN1rJfM52qdYjjtKBDN+5rNOsOZsJgPSvfbNuRYbsykLUIK01BzfYvevAaE/CQsuKoD79QZ6ZaWpYJ0rbDTe2sPOKC/Wpr/dlSR0JZiTBQRChHJ64P6pHUTAamAuEWtubKVq3Utxd06oNlPmXV1Z/1jem9b9YIYHpHcOCuVyk1dvYKmwBaJ2BR+r73W3wSRQiCtJO2fx5oPzj1vhr8v18AWTVVBmsuVCDcgit+22Sf2bFpCR01kzUUIvG7yJPwNSU//sPWMX4Sy6asyBMK7bpSqwj9vsgE2fRmgB7U/SDKgINcUkv4djx7W1ejfOnrjXmjtW2EJeOsDbpsGS68jfG6qcofYWRTUnAtDVYMNoYvPJ6xlZqa4iT2mGFTm/DANkqs4jcc2jvyPSyc0MIfqitPw0buO1DtPmbw+ywdicKdeqbl8ENMMgRAQ9HNIYxfz1fKuk45m/IjMB3SoE592SADwb58rRtyeeGTNOXvwun7STdvmoN7Z8tVdwXe5j5QhW3ToGO51LnyHKLn22xuyXUEPBN+zbK4B/1IGWCACrliVabdCsbv9goM+clc2hBPqyN2ODX1GC1QdQMB8W1DwLjH4qbQ13S60onLnv2RGZZAZoqEzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(136003)(396003)(376002)(366004)(346002)(966005)(52116002)(956004)(6506007)(478600001)(5660300002)(2616005)(36756003)(86362001)(2906002)(44832011)(1076003)(6666004)(8676002)(6486002)(66946007)(110136005)(26005)(4326008)(83380400001)(8936002)(6512007)(66476007)(316002)(66556008)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mBAiLo/nsAq60sIJCEReSq8GimDjvRqNrGq+i8svKPXl/ZhW2vRFwsp1NKEU?=
 =?us-ascii?Q?y/JsrayEEEgBiqB1VCsGWnu/E5lOhTW0KKMrP0XVxtL/CavQxJVa9xX+AG4b?=
 =?us-ascii?Q?XDw01i9ty9JLxQXZQuOLTcufK7M2Lap4LCehSUJtNk1dut/53p6Hg0QrhPzS?=
 =?us-ascii?Q?LCJqahnHp2ZhljRkiZ/ge7HvY2yXyQuN/Jjl0MVJFN12jplvAGC/pZscmzL1?=
 =?us-ascii?Q?27n3N6UBoFPOQ1iDikn3YGP0IWWAh21iZuztYf92bdIui1zQsgA9isK06php?=
 =?us-ascii?Q?kPIC6YvKofjG1OIsOgwGayYhaztFLvxpYf7B7bAldaG2qUlr+F8rkB/4v6IY?=
 =?us-ascii?Q?90GzGJf3t8s5iyIC8qxAGetYEj89HbHYlt8B/gZbJr0nPtwHUT3kRrAcTuhZ?=
 =?us-ascii?Q?DJRRVQcW8oyTVj2Zz2zMvucpSjukogiOkJ4eZi9DSNDacfvqvtjdWDzL06vq?=
 =?us-ascii?Q?+D7ScA9hBtKsARcEbbjbcf4AuK6nyJVfGtcF1xI5hM6ab1sq3MXXvVRP3tTY?=
 =?us-ascii?Q?GVuOMgY9I5/R0LSyREJA8zoHFMKYDlg8M3eZcvplVth1wJ6PtvRslPX+QoJc?=
 =?us-ascii?Q?Ddm7RrH7zLLPFZwSiIJv6J+IOeJh3RwlF+Wx03APw50BttMo2jXxTGgZIQbC?=
 =?us-ascii?Q?93YjYqrnmiiVNqLgS0SYOnGFMKWnind6cXK/tPyXwXy3SeKRBayqXB1y/yMr?=
 =?us-ascii?Q?rjEyHB1b0jTrr7eNmomM8WdplfHX66Ov94Kfw5BZbTyJG5xIu9bZ54tSF7bF?=
 =?us-ascii?Q?HkLPPqU3oeaqI71ymPk5LYi0bNQtTDVtVV1fjPynEVGKRxCY5TEppCR8XrGl?=
 =?us-ascii?Q?KM8oU/fSFZWFLrOEXNj15px90dtRfEqyk79+uYa1rSZm7inW2g5D0fflb6lF?=
 =?us-ascii?Q?9kBddAgcTJ47tGlFsYUTZBmCLUuz7net+9KPl7aMXhY5YK+cj3GcTQPvOrEq?=
 =?us-ascii?Q?+iSHwBxQjbVU1XYJ/FQaKaQXKtPjqopgTIFP+DKFmsZgayvQ/o1O00u9Tq5L?=
 =?us-ascii?Q?i/RzBL2c4UEzmyx1LwiKlpjBnATjgji8icr2NyQ/Sg4TevkzLOL3eIPOE95W?=
 =?us-ascii?Q?Gqrz8sHYs4xWoN4rzO3fyZCSS3Oz79r3L5m2a9Y81jVt6cPSRzgCGVcHR0Lt?=
 =?us-ascii?Q?xJx3tgqk0qkVcfbhenTtL6v7GNXRXWENOGQI4zfZR1+CfwyDh/GKpRotM6x8?=
 =?us-ascii?Q?n8XGKSO+SANPl8enynfyXGBp499YKXQdnNuEsey8/GFASn9huIkB0UuwL69E?=
 =?us-ascii?Q?H26vsAY5YCSBF+E88JCnnMF2fo8pOMDBX3gaS/sBB3azTD676fK3A+sREmzk?=
 =?us-ascii?Q?lPQzpauOlp8n5g9SCIXxROae?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1997acb-f164-40b2-8727-08d94b59ed9e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:39:46.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQb12uW3U7dLSXD3yaldZ3iUwS4vwrb16CCf5bCe5/HQlxfBRp8CoFQPB0NalWNofRgbXBy2P3qsZQUr04igWyAFDpntnqFFpWwdAnmHu5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3764
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Sancloud BBE, BBE Lite and BBE Extended+WiFi share a common hardware
base so we can avoid duplication via a dtsi file.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 ...be.dts => am335x-sancloud-bbe-common.dtsi} | 42 ---------
 arch/arm/boot/dts/am335x-sancloud-bbe.dts     | 91 +------------------
 2 files changed, 1 insertion(+), 132 deletions(-)
 copy arch/arm/boot/dts/{am335x-sancloud-bbe.dts => am335x-sancloud-bbe-common.dtsi} (76%)

diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
similarity index 76%
copy from arch/arm/boot/dts/am335x-sancloud-bbe.dts
copy to arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
index c82295654bdd..bd9c21813192 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-common.dtsi
@@ -2,22 +2,8 @@
 /*
  * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
-/dts-v1/;
-
-#include "am33xx.dtsi"
-#include "am335x-bone-common.dtsi"
-#include "am335x-boneblack-common.dtsi"
-#include "am335x-boneblack-hdmi.dtsi"
-#include <dt-bindings/interrupt-controller/irq.h>
-
-/ {
-	model = "SanCloud BeagleBone Enhanced";
-	compatible = "sancloud,am335x-boneenhanced", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
-};
 
 &am33xx_pinmux {
-	pinctrl-names = "default";
-
 	cpsw_default: cpsw_default {
 		pinctrl-single,pins = <
 			/* Slave 1 */
@@ -75,18 +61,6 @@ usb_hub_ctrl: usb_hub_ctrl {
 			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_OUTPUT_PULLUP, MUX_MODE7)     /* rmii1_refclk.gpio0_29 */
 		>;
 	};
-
-	mpu6050_pins: pinmux_mpu6050_pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_INPUT, MUX_MODE7)    /* uart0_ctsn.gpio1_8 */
-		>;
-	};
-
-	lps3331ap_pins: pinmux_lps3331ap_pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT, MUX_MODE7)     /* gpmc_a10.gpio1_26 */
-		>;
-	};
 };
 
 &mac {
@@ -113,22 +87,6 @@ &cpsw_emac0 {
 };
 
 &i2c0 {
-	lps331ap: barometer@5c {
-		compatible = "st,lps331ap-press";
-		st,drdy-int-pin = <1>;
-		reg = <0x5c>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <26 IRQ_TYPE_EDGE_RISING>;
-	};
-
-	mpu6050: accelerometer@68 {
-		compatible = "invensense,mpu6050";
-		reg = <0x68>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <2 IRQ_TYPE_EDGE_RISING>;
-		orientation = <0xff 0 0 0 1 0 0 0 0xff>;
-	};
-
 	usb2512b: usb-hub@2c {
 		compatible = "microchip,usb2512b";
 		reg = <0x2c>;
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index c82295654bdd..2a0ac9f5dda7 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -8,6 +8,7 @@
 #include "am335x-bone-common.dtsi"
 #include "am335x-boneblack-common.dtsi"
 #include "am335x-boneblack-hdmi.dtsi"
+#include "am335x-sancloud-bbe-common.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
@@ -16,66 +17,6 @@ / {
 };
 
 &am33xx_pinmux {
-	pinctrl-names = "default";
-
-	cpsw_default: cpsw_default {
-		pinctrl-single,pins = <
-			/* Slave 1 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* mii1_txen.rgmii1_tctl */
-			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* mii1_rxdv.rgmii1_rctl */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* mii1_txd3.rgmii1_td3 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* mii1_txd2.rgmii1_td2 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* mii1_txd1.rgmii1_td1 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* mii1_txd0.rgmii1_td0 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE2)	/* mii1_txclk.rgmii1_tclk */
-			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* mii1_rxclk.rgmii1_rclk */
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* mii1_rxd3.rgmii1_rd3 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* mii1_rxd2.rgmii1_rd2 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* mii1_rxd1.rgmii1_rd1 */
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE2)	/* mii1_rxd0.rgmii1_rd0 */
-		>;
-	};
-
-	cpsw_sleep: cpsw_sleep {
-		pinctrl-single,pins = <
-			/* Slave 1 reset value */
-			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
-		>;
-	};
-
-	davinci_mdio_default: davinci_mdio_default {
-		pinctrl-single,pins = <
-			/* MDIO */
-			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLUP | SLEWCTRL_FAST, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_OUTPUT_PULLUP, MUX_MODE0)
-		>;
-	};
-
-	davinci_mdio_sleep: davinci_mdio_sleep {
-		pinctrl-single,pins = <
-			/* MDIO reset value */
-			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLDOWN, MUX_MODE7)
-			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_INPUT_PULLDOWN, MUX_MODE7)
-		>;
-	};
-
-	usb_hub_ctrl: usb_hub_ctrl {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_OUTPUT_PULLUP, MUX_MODE7)     /* rmii1_refclk.gpio0_29 */
-		>;
-	};
-
 	mpu6050_pins: pinmux_mpu6050_pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_INPUT, MUX_MODE7)    /* uart0_ctsn.gpio1_8 */
@@ -89,29 +30,6 @@ AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT, MUX_MODE7)     /* gpmc_a10.gpio1_
 	};
 };
 
-&mac {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&cpsw_default>;
-	pinctrl-1 = <&cpsw_sleep>;
-	status = "okay";
-};
-
-&davinci_mdio {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&davinci_mdio_default>;
-	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
-
-	ethphy0: ethernet-phy@0 {
-		reg = <0>;
-	};
-};
-
-&cpsw_emac0 {
-	phy-handle = <&ethphy0>;
-	phy-mode = "rgmii-id";
-};
-
 &i2c0 {
 	lps331ap: barometer@5c {
 		compatible = "st,lps331ap-press";
@@ -128,11 +46,4 @@ mpu6050: accelerometer@68 {
 		interrupts = <2 IRQ_TYPE_EDGE_RISING>;
 		orientation = <0xff 0 0 0 1 0 0 0 0xff>;
 	};
-
-	usb2512b: usb-hub@2c {
-		compatible = "microchip,usb2512b";
-		reg = <0x2c>;
-		reset-gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
-		/* wifi on port 4 */
-	};
 };
-- 
2.26.2

