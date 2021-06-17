Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3C3AAFD4
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 11:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhFQJgA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 05:36:00 -0400
Received: from mail-eopbgr100128.outbound.protection.outlook.com ([40.107.10.128]:44672
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231490AbhFQJf7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 05:35:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1wI7J2DAXiun1BlXYhu2yFQyds3I4JXpNkCnAQWb4Qc0fXsz3bqOM/vH20G9SPN2YmpOfpYDwIyWx2sYV9VDeTBUz9ZFeylvaYEW7PYTXuEqG73zNyy0joy4L8TBtCG5bE1qmBRBBI288rC+iP2uAMsp6D5eX67e3RhZPhv514d+lVSdhOMiaK7Exu0e0IoRjE6H4UK2VBpxSFFyC8IxovglfTI33Tdbp29lUR5QDzpWiQbOW6KSIPoM8iPt5PASiAM3W2OKKaz5llqbD6gGk9NwzQNhKpZG3uBGYB0c+08vDZxMPjCptzDfD8c3zJKawoW5RgYIEmRxD1FfVc00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiUjNzRe9UrPK1cKZ/FgTreN5ruXEQUtXCvpOqsCFKQ=;
 b=Sjq1SkQM1KXD4px1tg53Zx4ux3RBTdrLJA5Z1SSZCWTTgMWDOtyebCvBiUzIZN4K9utIYujQ5nAhEjPZB9Rdd2vbnrOr5HTHMeSUGhut5CKTSdjh3ts3DWtMeCrUmthSzolyDGXY24xEsu6rfzbC9rU5RnyTCAGb5XyVP/Yz2TbNshK232bcOId98kxS95s3gRh1MRzgw9Pfn+LSirAZ6aB2KrfwoAnRqK2Zb3g8RIk+QcilazeCfOdnuCtsfHM8xed2bPYpSgq8QBXtytHtkn7e9i6hkkIA70KqTbscL/wlakDSPJlDoaK71v/TUp6sZNrwria0v6IIP5tIY8malg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiUjNzRe9UrPK1cKZ/FgTreN5ruXEQUtXCvpOqsCFKQ=;
 b=Uw+WFM6guhXGY6BqArDbtWCrNOophD7L+C4dgc4n4SPRIxR0gMp8t5JMWAvxOWeosqC7QzL+YN1OQu00w1uxkgn0FdcApQvMg7+kaJ8h6j9lAVMG8Jcwv2bZY3N+Vd5dqrSlwixgv6Jkc+TuHek7egkBP+uKTDE8G0zM73tf+EQ=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:114::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 09:33:50 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5%6]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 09:33:50 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy <marc.murphy@sancloud.com>
Subject: [PATCH 1/4] ARM: dts: am335x-boneblack: Extract HDMI config
Date:   Thu, 17 Jun 2021 10:33:27 +0100
Message-Id: <20210617093330.9179-2-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617093330.9179-1-paul.barker@sancloud.com>
References: <20210617093330.9179-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=8763; h=from:subject; bh=Of10ALXPiF9J4gZskns8pnQgKaaTmEldv0aQV9cBH/I=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmnxZ7MWST7+OAlc9czv4MfVYXf+RTy+vG30zkdTxtXq131 jZz5vKOUhUGMg0FWTJFl9+xdl68/WLK194Z0MMwcViaQIQxcnAIwETZXRoZvZ2W/r3mtt3lP0UUpWY 15dROKazof7p10X3LKQbtGw7LNDH/F5+3/JuXDeFm2MKn6vUfQpUo1P6XEp87H28NWX7hjacAJAA==
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [80.7.160.81]
X-ClientProxiedBy: LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::35) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 09:33:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a21fe57-769d-4fbb-c3fb-08d931730370
X-MS-TrafficTypeDiagnostic: CWXP123MB4855:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB485531B35DA7D3E9EDCD8D9E930E9@CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OEVLYqtNUD9EY3eXYsEgnWM2pHlv85zOJYlgpfGOPXr9ormgdKOHqPQaUPtFO6lQMRuQjLm3q+PSjHEnQSjwccUiFitrG1L2khB1yM3gOFnD7qV5BMUjbj9buAyxIxHI0BTyWQvxVzgMkfvwWTI41LCc6L0v7JBjsawP09AAXLrL8+5rqO6TcE3tyXUakFMNcktDFjb6a538YvwKVKSezIsijCTFwozPe5Q9214AV8gKBuEx4yB52/u/NP4dK9t72NKL/89uoOFtcmc0QAfMG8wyxwe8yIuxzva3vlNVCcnVZYq/sWTgSUvgouekPhiXJ2TEsbvPQYwygW1ZYJ90rSfYBZSmRAbjpotbDmqPUGSTvsn12lgSodekyA92v+V9HFTdrN4/sTda3Gq18SpM4OMJ4awJX3TFKVhL8QjcfVQ5oUtS+tkSxyt8bcla1mot0P02FhgUiSQyPalqPqUaSbuUj9vpkulauJP2EBgo1pP9vK2cAIMA1OmCLsB3YmqsrJVpyNGVaB77sugP+jbowZy47OPAmDdHRwwCxydK/QngXKlPCMUkGlROCJKPHSm/ZTzl6L/1l/N08wCNe6jDQWGar0+K6zwTdUW/yIECXrNBzTe7CtVySysxdYP6euy36tjhmsk5JftSj94wuNDWAYiri+1BRinEHncF40o/I6w5LzxTwi+VDb50P68sY5oXtTwTm7C8MGUY7mEoAMlD67SjudLfcXsmD4ctuDxewe0k3oFo+DGg68oBh10qxpPxW+XZGUMiIzNKVo5lwU/gGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39830400003)(66476007)(66556008)(66946007)(966005)(36756003)(316002)(478600001)(16526019)(107886003)(1076003)(86362001)(6666004)(6506007)(8936002)(4326008)(38100700002)(186003)(8676002)(956004)(6486002)(2616005)(110136005)(54906003)(6512007)(2906002)(83380400001)(52116002)(26005)(44832011)(38350700002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ReHJK0xaI389us9nEeAWEEAG8J6DDw17jKFagE+qUb4GcaWVONOauzAwq6by?=
 =?us-ascii?Q?JpEvWn5ikuXhwJBC221GaB/JIJ2Bu7d5WjkK+LBLuNoa1RGZGJSU36ssm5Oc?=
 =?us-ascii?Q?z9vRBouqXkcGTVKjp2NjCnhzXcSmMCqNkVUM1u3l+HOmg4EvdSujIJtYCCTS?=
 =?us-ascii?Q?jarLkDbhaJByckjRSdZAa6djac7DDLVjzhxV1KQRn99YvvQ2pQvr7cJ0vjLs?=
 =?us-ascii?Q?gZ2w3SyxMzFgE1icdoTK3Pu1Vvum4NVmud1s114tjopVTSx/Pni1V9mIFVA5?=
 =?us-ascii?Q?/LsFK/OE6U7bVPK0z5A/NYhH4LRvfPSUZXkbn7QSqPN9WayxgJBj49debUlr?=
 =?us-ascii?Q?XaQrBJ/inJLgE5MwxqFiEWRaEmzDdK/TxBklD0wqVcmkxIl7GO+Av+YrwnUy?=
 =?us-ascii?Q?eQ9LLs5T/S+rAx9qkW8KzfZF2OPTgGloxaWVT2mTQdKGGBXgNtp6Dupzw00Y?=
 =?us-ascii?Q?CJQ/1KweXGsgfquwD/kzLDP1S22nMXG5rEcWbYeagTQyvHuyody4ssUcfWHQ?=
 =?us-ascii?Q?H8VDrP8u8MHXtltOc2hl1Jjv8wXuKPaidyxR4n4R9r1ZXCO5rmjze/3h4QXn?=
 =?us-ascii?Q?radL119wsXvZWofKr+ZgbAbiBc6GbGNISL7i+/3k4fyH3MdKaDzy5+ttqaMq?=
 =?us-ascii?Q?3SMx+wlnXzoehrEriItL7ZBQf6fs/gWl3dx9Kx5TeiqU9rPltb+NFCSQ4+qT?=
 =?us-ascii?Q?ij6M/5izygTyowwvSlCcWDne2Pn1Q3n+lUzHiUZkZd4UayxcCRbVCpJNkn13?=
 =?us-ascii?Q?yzy2M1MMLylqlIDjj1DYQOp5mlEstpA/KBsvaPU5aMT6iVZ0YpFHpfXqkGhi?=
 =?us-ascii?Q?1SNbH91/3xzknhhJmx3nLyU9lKCjZiQaHJWD9d6+6dAOEqsataKJnhsEQ0BK?=
 =?us-ascii?Q?5aCVC0qaIodiY2qtxLY6D3AHIjBF5pAy35i+oeQexZvTSWwBB0ICnKJCwMR1?=
 =?us-ascii?Q?j+SA53E9qRnQa4UqRUXM6ob0CYx/ReLTZMcc5zPRGKcngJYm7AO3HCec7pSC?=
 =?us-ascii?Q?LeEhXbH1lUCXljLzzxWTzbvbp7SlrfYwMbWGJDcq+pU0A3Kk+8kFytq/vHg7?=
 =?us-ascii?Q?RPLuXMc8MNbKB5HPbezUcXdF943IPWIlBRoiR/bY0U97DRdp5ZBDPWnjlFCY?=
 =?us-ascii?Q?Mnwrqgiz2UMstm9Pkn4AiOymGkEiki8eDBGwnuBL+NzOTI760qhaE6jMqvEP?=
 =?us-ascii?Q?j51U9llKyuxn5SstIK7IP1GdkfVjaGhdDwgxEE0ezDOfq67GyLwHOsC/ockQ?=
 =?us-ascii?Q?257gDZJOd4ATlpZ+eBUhSztFPofouC8dPh/q+39RRdEieQp7EPqJSS8Lqaex?=
 =?us-ascii?Q?2Ci65j+PtjEQw9W5d2c6ojkg?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a21fe57-769d-4fbb-c3fb-08d931730370
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:33:49.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mW6vtrsGtgCtoroNIAo+2uvzL3lQbyhzZO0mEc7RfmT6I3HN5dYGJgQvMS/1Kt/q689u3hNOV+9mzdYVlIKYV7Plb8TBbhhqE1FgT/Ipu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4855
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
index 86cad9912906..2bec2287fefe 100644
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

