Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4AB3CF643
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 10:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhGTH7Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 03:59:16 -0400
Received: from mail-eopbgr110132.outbound.protection.outlook.com ([40.107.11.132]:42540
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232210AbhGTH7J (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 20 Jul 2021 03:59:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lqjdr7f+bXCM2u/nxRZ+fUTLKsZHBdn9A+5UaESgyBL3/2OsbRzREw/PkjE8dUBWKdpgCyPs8lSwgNC3PYDKCr9W8uihL5RdfsgfDRxuOBB2BxcFaCmULopSpu4H+OBg3ScczO122l6bMQ6W7WOl0NJfcVO0fDVrPz5sc3/VyaucD4YyScQPYFsmAIfD0p42Ah+MvffA9IQMnl/hR9ifEXznciZeJmsn4QTwcdYRkNsvCzkGAhgZInumD4tTENAklOEZ1wtw6uv3tYeepZnJNGW2XDqQOV1mNyXnfETfpC41xxObFm1y0bwYw261vjR+m0MYehYIh9icnaUNvSvFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbvxlDbpi5kowjYNbJI0jGbm9chGg40nj9faVBJGHR4=;
 b=Sy3xiFHMm2SLUAoYC822qagNLEQpKRvzlr7bSPwo4A61saWFhJcJkCQlz56rtioytumAIFdXdSZBhbtzE7rX4LYWM2zf6WM04zswnA4Vx8GFrigBJtzyg9kZ4QneTXOZzYb6aXcewvSz5LfhMI5rHiMEF1XGJtsfNR5b7Qv0Siwxiya2owDNsWRY/teE7ui/q++jf2zag3X5bCJXXPpm55XDfwkCfJkbuzjvPVlNmV7uxA1W0KQfSCkVrACrvpasRMfxaDzUiS6m4axN7dEtJhq5BDnRLDOBj85st38JGWe/ZZ5mZOHSv8gusYVzkEGqUj8YVibPtoPkImPGFr6Aog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbvxlDbpi5kowjYNbJI0jGbm9chGg40nj9faVBJGHR4=;
 b=QW194oO+eXFbSdvXa/X7jKNa0jRBWMetIA+KXMfD08d+IHNR2KnIjMVH6QT6MyObT1oI2jp4ntFJ2PqoB5UNEDLErtMJhUAUV0jsSrZNHzh3q7AajQYgZvmhbJYJ2h98/LUSIkWXBT1mkO9JnjOMpOc+9TAFp1qxle04SDTi5JA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:39:45 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:39:45 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: dts: am335x-boneblack: Extract HDMI config
Date:   Tue, 20 Jul 2021 09:39:25 +0100
Message-Id: <20210720083928.10404-2-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210720083928.10404-1-paul.barker@sancloud.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=8763; h=from:subject; bh=+VxrGMNXeLaQQLL5Stua8Z7iZ9LlTobtVpndTZWIunQ=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAnfunc/VDj6ckn80RUpxi/yL4aJM226+FY9Q7AtXDArxvne 4qaHHaUsDGIcDLJiiiy7Z++6fP3Bkq29N6SDYeawMoEMYeDiFICJJG1n+J+3Y5LSFVuRE8dstZRS1p /7ZvcpvrCrI6/3ksHC/uM3Pj1i+O/HFLFw4XLZabyHYzau2H2p+vuV7U+zWk9e4Nd77tW9bhIjAA==
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
X-MS-Office365-Filtering-Correlation-Id: e41384a3-d405-4dc2-9905-08d94b59ed59
X-MS-TrafficTypeDiagnostic: CWLP123MB3764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP123MB3764A120526BAF02A774053F93E29@CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEAPvfvCAjWbWP18oR/dmSbCiDvKkOLDRYRaoK9IecSYq0O3rG5RGMV5xXhtoJHSXZRrpXcKVa3bjEQuWIKHfzr5V3JF1Cf2rHtOOCOwjBIgtqme+I8M7Es9xRSu/YkuhJuJbIDovpp83Higjtho6/OHIZtwnIigKFp3IzKydRyfFA1fsuRX9+YCU6R07av21VD4qIopzLWLoaRKP8sUvkBF06XGAtTRzbUsmZlDhW7Gauh8ggVuLovluC1YUFq52bdOgpvR7JllxVMUwpHJZ93qKUgJKlfPoTOYbJFzEqSfHg5n1eZBd4Qvt/eBrhq8a1aFBOgJluSiaTbnt7lIRdBBcd2lp6TPdCUvSuY1bwFzianb0Rf9G+jtexoYj/mGsL938kaneoJhjRFL/daFvtiNvGwax9Iy6E46HmhZiaILTn4RWPMGNPkCj6q1cRMvZTRjsuknxNpqb6vbxHiyRze57Hkh2k0f0zQxLOTwphwO126DUjMyiqFWVbGNae4++NN36T9k1dZMVjsFQT/a5S7b7l/qyvrgSsXiUvypdAEDEIwi/Jwue+s6AWU7dm/kX8SQ+ieOZ6gR3Xdl3RIrR8RaX0VGVq4IbMWKDtvemERZ6tn5eBwuhB4MghSIKs9020LS8pDbKC247WVmx4gthgKNcBGo36bMVuYxTBKhtrBYUQvHHktjzuasJCXDPpiEqEO3bojiNIKTrzelMJkHkPNg3ebj1XOnK1vHA5mNrEs9z7dDcmZy6gGkToICBrS0XOx/AqiQQfdEmOS2Zvfzp2ypgILYm5ZGb4QWVStK/Ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(136003)(396003)(376002)(366004)(346002)(966005)(52116002)(956004)(6506007)(478600001)(5660300002)(2616005)(36756003)(86362001)(2906002)(44832011)(1076003)(6666004)(8676002)(6486002)(66946007)(110136005)(26005)(4326008)(83380400001)(8936002)(6512007)(66476007)(316002)(66556008)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QxvGHu+avwxqDMGwp19W7Yndezu7XNBsl3fsD4HXT3gp58uzceSfZJhsLmJt?=
 =?us-ascii?Q?uRRC9m1HPrQ4e1q3k2gyi6mSu+dGqf2DaBtNCWsuUEF9xN57q9IyfY0DZKpk?=
 =?us-ascii?Q?BlhJCyfLu1S7zu5PWkbJLgpAgpjLtIyOM2d3OyX+4CCcnT+Iq6BL2U2iqSRa?=
 =?us-ascii?Q?rKnI6e9It5Wq2f2i3ihWcH7YVwgGG6fmkteYNloLsbGJU4JaHPh30YlNa/6r?=
 =?us-ascii?Q?DzlqbIbLS4mR3bXdNADhyYMU6ruDNn72E7xh16kCB0zDkY2XpKEbCqqS2ZH9?=
 =?us-ascii?Q?KBzcaNmaw3QS9bZwuq6vKgAyufZ9ANZpZwUBhpxggC+FRMGVwwFPzdRSWIy4?=
 =?us-ascii?Q?pkXyYI7YdRznyomAESVvkpw70jIx22IZm90h7kAiiQzPqQ5maBCclLX5Gc6d?=
 =?us-ascii?Q?rmDgvamFyXxt5/BW3AuBda8Csbi1fIaUYy5uB6WvbCy2PmSlHx06o9imXnxE?=
 =?us-ascii?Q?ON84Lw8tYGWF+/36KC3uZGL0g2LeN6XqFt7kzMyNimVouwK2nrJ8mD4uNmVl?=
 =?us-ascii?Q?e0VWUNEqAYWWhrHcUYRYuUH9lWkleLYKj8WGpOrEWOieL1qPkZxQn6Tyrxga?=
 =?us-ascii?Q?JDkH7udjEyGkKfGTHhsxX2UCcUYbTafGTF+XhI1SbEjmydYXf7gD/rIlMnId?=
 =?us-ascii?Q?gz7Y3bTkwM+W3MLjYJ3hjsk6huZ6QI/kjJ7CQEC1ReowKuh6WuA1glfYtK//?=
 =?us-ascii?Q?bZbMj0aJZ7NoOShMcbfOIp3VWEdFxbb3khuLbhPIssnfqVH+LHFDZbwLtGcP?=
 =?us-ascii?Q?7YX2o3P/E9OfTqFpljsjihgjl/T6IRPrV29WRm6MezvnAWQgUNEnMOAP6d0p?=
 =?us-ascii?Q?afSfc1u0tnETvqLVGvCBoJyGSYlSg/+X/hKfI4lQQL555OA24CJ/TpTyKmrS?=
 =?us-ascii?Q?5BhtbeWa1RTGp+K0QZZEs7D4spPS+v6DRU3wQt1SUW8iSAHWYOX3bkr6yV/j?=
 =?us-ascii?Q?8DsWERy3Z9PMXiwGvauhH3sTMhmLNNdk5xY4+g0UCZPBqsPms+VUumLPN8Dd?=
 =?us-ascii?Q?itdvbYtdTV6NRjWuDDqgtLr9yWhv9dNdIxj/J58ZO5RyZk04aA/xZYoq0klE?=
 =?us-ascii?Q?W5NJiUcLy5WB5hiebe/5Ll0lOhs3TfWv9Pg3Fimtc5Y5O6xfSoBdmOLrDPPB?=
 =?us-ascii?Q?OnNBa36jqPC1HCEupPCJIfhPjP87ROIDV2Cu3e1BDXVG1iEJ0WzYsNb7hNSO?=
 =?us-ascii?Q?fdMexFGaN1A2DpMjg2p995taUTraqtuHZ7vSfJ/uDB/YQlvrBkwoZc5Y45io?=
 =?us-ascii?Q?jrYp3V5lyHqNjvObRN6lKfPvuaRp1EqNizi68C9l5ApPvG5fLakR4xInUX28?=
 =?us-ascii?Q?HAVcaqUL85UXX5pighNBjjky?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41384a3-d405-4dc2-9905-08d94b59ed59
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:39:45.7079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCYo4AI527nxQ7nMxom9AIVy1aUES7w6USur2HjNrWzGEgyKKzhDsGCMpGmydjKuoipnOP3OGwfvkklmrXySzTNvR+Y0xaAFcRx+NJ5cPqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3764
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move the HDMI hardware configuration for the BeagleBone Black out of the
boneblack common dtsi file and into its own separate dtsi file. This
allows the devicetree for BeagleBone Black derivatives which lack the
hdmi encoding hardware to include the common dtsi file without needing
to duplicate configuration or override the status of all hdmi-related
nodes.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 .../arm/boot/dts/am335x-boneblack-common.dtsi | 135 ------------------
 ...common.dtsi => am335x-boneblack-hdmi.dtsi} |  28 ----
 .../boot/dts/am335x-boneblack-wireless.dts    |   1 +
 arch/arm/boot/dts/am335x-boneblack.dts        |   1 +
 arch/arm/boot/dts/am335x-sancloud-bbe.dts     |   1 +
 5 files changed, 3 insertions(+), 163 deletions(-)
 copy arch/arm/boot/dts/{am335x-boneblack-common.dtsi => am335x-boneblack-hdmi.dtsi} (90%)

diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
index 64c3e9269f40..10494c4431b9 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
@@ -3,9 +3,6 @@
  * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
-#include <dt-bindings/display/tda998x.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-
 &ldo3_reg {
 	regulator-min-microvolt = <1800000>;
 	regulator-max-microvolt = <1800000>;
@@ -25,145 +22,13 @@ &mmc2 {
 	non-removable;
 };
 
-&am33xx_pinmux {
-	nxp_hdmi_bonelt_pins: nxp_hdmi_bonelt_pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-		>;
-	};
-
-	nxp_hdmi_bonelt_off_pins: nxp_hdmi_bonelt_off_pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
-		>;
-	};
-
-	mcasp0_pins: mcasp0_pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLUP, MUX_MODE0) /* mcasp0_ahcklx.mcasp0_ahclkx */
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT_PULLDOWN, MUX_MODE2) /* mcasp0_ahclkr.mcasp0_axr2*/
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLUP, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_OUTPUT_PULLDOWN, MUX_MODE7) /* gpmc_a11.GPIO1_27 */
-		>;
-	};
-};
-
-&lcdc {
-	status = "okay";
-
-	/* If you want to get 24 bit RGB and 16 BGR mode instead of
-	 * current 16 bit RGB and 24 BGR modes, set the propety
-	 * below to "crossed" and uncomment the video-ports -property
-	 * in tda19988 node.
-	 */
-	blue-and-red-wiring = "straight";
-
-	port {
-		lcdc_0: endpoint@0 {
-			remote-endpoint = <&hdmi_0>;
-		};
-	};
-};
-
-&i2c0 {
-	tda19988: tda19988@70 {
-		compatible = "nxp,tda998x";
-		reg = <0x70>;
-		nxp,calib-gpios = <&gpio1 25 0>;
-		interrupts-extended = <&gpio1 25 IRQ_TYPE_LEVEL_LOW>;
-
-		pinctrl-names = "default", "off";
-		pinctrl-0 = <&nxp_hdmi_bonelt_pins>;
-		pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
-
-		/* Convert 24bit BGR to RGB, e.g. cross red and blue wiring */
-		/* video-ports = <0x234501>; */
-
-		#sound-dai-cells = <0>;
-		audio-ports = <	TDA998x_I2S	0x03>;
-
-		ports {
-			port@0 {
-				hdmi_0: endpoint@0 {
-					remote-endpoint = <&lcdc_0>;
-				};
-			};
-		};
-	};
-};
-
 &rtc {
 	system-power-controller;
 };
 
-&mcasp0	{
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcasp0_pins>;
-	status = "okay";
-	op-mode = <0>;	/* MCASP_IIS_MODE */
-	tdm-slots = <2>;
-	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
-			0 0 1 0
-		>;
-	tx-num-evt = <32>;
-	rx-num-evt = <32>;
-};
-
 / {
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>; /* 512 MB */
 	};
-
-	clk_mcasp0_fixed: clk_mcasp0_fixed {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <24576000>;
-	};
-
-	clk_mcasp0: clk_mcasp0 {
-		#clock-cells = <0>;
-		compatible = "gpio-gate-clock";
-		clocks = <&clk_mcasp0_fixed>;
-		enable-gpios = <&gpio1 27 0>; /* BeagleBone Black Clk enable on GPIO1_27 */
-	};
-
-	sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "TI BeagleBone Black";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,bitclock-master = <&dailink0_master>;
-		simple-audio-card,frame-master = <&dailink0_master>;
-
-		dailink0_master: simple-audio-card,cpu {
-			sound-dai = <&mcasp0>;
-			clocks = <&clk_mcasp0>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&tda19988>;
-		};
-	};
 };
diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
similarity index 90%
copy from arch/arm/boot/dts/am335x-boneblack-common.dtsi
copy to arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
index 64c3e9269f40..7cfddada9348 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
@@ -6,25 +6,6 @@
 #include <dt-bindings/display/tda998x.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
-&ldo3_reg {
-	regulator-min-microvolt = <1800000>;
-	regulator-max-microvolt = <1800000>;
-	regulator-always-on;
-};
-
-&mmc1 {
-	vmmc-supply = <&vmmcsd_fixed>;
-};
-
-&mmc2 {
-	vmmc-supply = <&vmmcsd_fixed>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&emmc_pins>;
-	bus-width = <8>;
-	status = "okay";
-	non-removable;
-};
-
 &am33xx_pinmux {
 	nxp_hdmi_bonelt_pins: nxp_hdmi_bonelt_pins {
 		pinctrl-single,pins = <
@@ -113,10 +94,6 @@ hdmi_0: endpoint@0 {
 	};
 };
 
-&rtc {
-	system-power-controller;
-};
-
 &mcasp0	{
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
@@ -132,11 +109,6 @@ &mcasp0	{
 };
 
 / {
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x80000000 0x20000000>; /* 512 MB */
-	};
-
 	clk_mcasp0_fixed: clk_mcasp0_fixed {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
diff --git a/arch/arm/boot/dts/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
index 80116646a3fe..8b2b24c80670 100644
--- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
@@ -7,6 +7,7 @@
 #include "am33xx.dtsi"
 #include "am335x-bone-common.dtsi"
 #include "am335x-boneblack-common.dtsi"
+#include "am335x-boneblack-hdmi.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index e2ee8b8c07bc..9312197316f0 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -7,6 +7,7 @@
 #include "am33xx.dtsi"
 #include "am335x-bone-common.dtsi"
 #include "am335x-boneblack-common.dtsi"
+#include "am335x-boneblack-hdmi.dtsi"
 
 / {
 	model = "TI AM335x BeagleBone Black";
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index 275ba339adf4..c82295654bdd 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -7,6 +7,7 @@
 #include "am33xx.dtsi"
 #include "am335x-bone-common.dtsi"
 #include "am335x-boneblack-common.dtsi"
+#include "am335x-boneblack-hdmi.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-- 
2.26.2

