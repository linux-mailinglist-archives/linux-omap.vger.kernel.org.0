Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9707C3AAFD6
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 11:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhFQJgB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 05:36:01 -0400
Received: from mail-eopbgr100128.outbound.protection.outlook.com ([40.107.10.128]:44672
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229714AbhFQJgA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 05:36:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/nVwA4cEEJcIEPmPPKQrYGVPKKaSOYRAIA+sFxgE7OfL+ghsQoFTrOfjPjSVSh7qg6x4GDqcsuKeDZNHDyhuXukRn5HS0WIsVxaY5MhwDmlCObdw8v1/Pqiflj2V4kQnnoaY1AUj1Q6+wDeGxvoaUSwbVGZt6mI8alQpEjIN2+LYMBT2WtjOGxHqxqdAyCE50s+CKuMgH1+8Eo4WdK4yHb78dEbNx8Ck4U30l49jU97Eh2ArxK1+PqP9HdDIFTvCY+LmQhD92JbNK57L/61W4qJnBGErgWXNuiU3ic0E7prgM6JqXSwDdfzKJw0BJxrbDzl3pJxJqn2F+SyvRAXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV93Ia0bWHpNLv6yHgQgjONNcH8CaoFHryhZf+dctZY=;
 b=KiF9VPeStsz2+lpOfd0LoeEPrmT+QvCib9znnUPBlM9q69QDORcjiE5plTyH4X1ZcU6Pm79IammcfCPg0yeCCoYWSP4sn3h82jB4ogWeNHaxpLks08fbY5xEwk23+6C/1GdOCBWSvg0CPCv7i2ZRCAAPiGRhpszoe5FmpgBYQYn9LfXiJlnPqvI/xAciWibm409W4QWGPsXKAd9a9StDMKfbFAvVkjmOBYI6h6jIOX7Tuii7xGhPEs/aqXaV0N4IfMlxhzBzSsOiIku8h1jMttgdw76rSKuo2r3W0/YS3f+VPV4oH8C31y/9rAAtnDg3iX3QsX1HxbqXe3xYSnVPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV93Ia0bWHpNLv6yHgQgjONNcH8CaoFHryhZf+dctZY=;
 b=BQFVyJ3sOJDe4agikH18wupqFkB96xTYy8fhT/tALYyjoC01AhHo2Y52pqN7A3y8zhtbU7dIz2+Jfg6jzpgPXOkDwElxT5gKzvPJcv2M8nbeGn12Ovj9TnZqj9OTUWxHPJaOKPU3IX8og0MbcoifPcHsc/olt/S8MQXibMdhVog=
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
Subject: [PATCH 2/4] ARM: dts: am335x-sancloud-bbe: Extract common code
Date:   Thu, 17 Jun 2021 10:33:28 +0100
Message-Id: <20210617093330.9179-3-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617093330.9179-1-paul.barker@sancloud.com>
References: <20210617093330.9179-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7223; h=from:subject; bh=PcmRvGrNadWL1qcMB64++AZJHrA2DwgcWBhSkI1B3Yw=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmnxZ4YCwbeb/ybNWk9q5hE6Ja7mQUXxTc+D+57zyNzOmbd x7+pHaUsDGIcDLJiiiy7Z++6fP3Bkq29N6SDYeawMoEMYeDiFICJOC5m+MN388KFOVfNruy+4mRQsX SFXL9x0cm/y2edrJ27f2HEP/mpjAyPbuZnb7krrBeppHHQveXO55m9iQ+qwrjvLKmK07rKd4YVAA==
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [80.7.160.81]
X-ClientProxiedBy: LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::35) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P123CA0071.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Thu, 17 Jun 2021 09:33:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18b1244-2264-4a12-2654-08d9317303bf
X-MS-TrafficTypeDiagnostic: CWXP123MB4855:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB485500C97970FD34BD9D03FF930E9@CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: poOB/aKpEJGYN/mAipZWDpNorIp5JWgG1JtnwKwoGEh6vx1M06uM7y6gmTthlMMEYjTth0qoWlMvsrEDCNoDf4JXiABIBeSBk80lYhaTVtwsHDvlXL+VhzKbyCySPj/PX5kxqr2r2F9wmT9dh4Vx0gJ2v56wGK8Z9xr7BN0Y1Jr41WIchdeDObJdBKtZmWBz0ifd8LZZXFrzX7fBSRPbyX5fGXYrVdqNoMZY+1vm6Ypd2uyQ3glBgOGmF9rW8adFIK0NpHGrUoGMn5YI601YWx7Vw4/FXC5EhMXQ475gpiylvQqL+ciWIhaGTbGF6OL5p0UYHow4sWCoPsY3/u+0kKeYBEh+prA0pj99ZEJlSH5Xnhs51ZshoX5Wf5KlJpUSaPAcUWM0yuwBlX+tku771JY6M1nrszLXvcYj0nPhpykZLF5BmUBjoRJGjBp1M++F7GmSFJifffkyLw7+anTHyLOOZwxedz/H1lbKJ+mELiQRfGYG9Nceh4eGJccT8uD5T91LU5tlQz1KUHEgA8D6w8PusNNN1mcQOha8rrRNCmNnYvb4TJndC7cz+Hu+u94HJY7rzgYIJMFxmIWTJqMxSTF6YDxiOgbaCZyqHH4Ti3tnpkobTqUNNa4TRPbTibluC1mgQleHl80HBZUmXuFNA/rFU1MlLObqwAaNEZfi/w2YPD78PuFt9S0wSZkNa/q3hZjq0h9GQC+uny3OS8jRB4GXV1EIxDVhHLDFQjjj3dWiyauWZeVzT2oluUU0Ahsz1v/03JFsaEFNSTxiy8MZvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39830400003)(66476007)(66556008)(66946007)(966005)(36756003)(316002)(478600001)(16526019)(107886003)(1076003)(86362001)(6666004)(6506007)(8936002)(4326008)(38100700002)(186003)(8676002)(956004)(6486002)(2616005)(110136005)(54906003)(6512007)(2906002)(83380400001)(52116002)(26005)(44832011)(38350700002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jWqknezPpzF2oKIB9/pF/KApE6HdzWJuN+OSxF3IjQvpkm415Hsf0+IacLnl?=
 =?us-ascii?Q?5kf5z8SeTiFOD64bz9i3fzkjsdkkIjY6Pf/jJVDesf76GvFLOAjGFJ1iu+th?=
 =?us-ascii?Q?ahdqje2UmSwKJ7IsFceYBtowNok5uexa3c0Eb7TN0twbpDbmageUVHxv9nm3?=
 =?us-ascii?Q?jzfrJXs3/OCf+C3Ef3bZ3zYs0ZqVdz1tC1EX7jZoz4ucwvb4/cubjW99bhSx?=
 =?us-ascii?Q?8KfPr+68vmACvku+OFGqjAER6xeG2U2FlUnr3KpBpTQ4Tmis7BDWuA34zDv4?=
 =?us-ascii?Q?jecRcdZjyspISf1DO0n1eb2jNpORp9p8ikVuJscU+uTKK/nOqYGOJfEklDvo?=
 =?us-ascii?Q?IVKt+sbYW3pfdVCdKcQM9DP7A3ZLGcVlyzYSARoWHM+RSr8+dUVCcd1L0E2b?=
 =?us-ascii?Q?Zq7Z8TPCMWnb0SlH97yjG4mRqheyb6Ks9vYYMBVIw9+DflZZ4C36awz+yTk1?=
 =?us-ascii?Q?o9jBUCxLmOcnPYsUGQ6orAaxuyP/kih0OATUtXRnqVp3Hj+VDyzwsuRA4vs4?=
 =?us-ascii?Q?jYvoCA1brYEtoJEgbMAnsLKY9ezRKsRoDQlNuU0ereDRZti1UzEdGByg+XGZ?=
 =?us-ascii?Q?hk+Gi0FvRrelt9vQbckPwUO0BhLSedjbz7Gwr6DtYG60v4k2Z89Y6Lj/uJhv?=
 =?us-ascii?Q?+mOFx+SFlOxtS+H4LTpaWdEiL7Abyu7Ss9/YjcucHB7CQFPmjohOtx1Du+Iy?=
 =?us-ascii?Q?FCuTNrlXuF+qmEYt4Um6BxK/vdFydkRE4as9uN2WXU1tO23UyJNaRjNdVW28?=
 =?us-ascii?Q?oO0v+a1CvW9zMLyGPbJjjdbzel1Yxcb7j/ByZRSgmCwLKIWAf/1TU5ussDym?=
 =?us-ascii?Q?3IlmXsL86q5YMWG4nBb3/bD14B/IQlPzDhqXKUZf/N/xRKw+RIVY8pCWblPM?=
 =?us-ascii?Q?BwRJDzHU/cY4zsvBScAq2ZJ9FCknb1T7pZyvD0vit8fNZGwvDyIcQMRnExeJ?=
 =?us-ascii?Q?9WJSYkQd4/c9mgZBpLOtvWspCswEuuDIFrYnEN6w9EPhmt1haasZS+tWnvX6?=
 =?us-ascii?Q?t1l8kvdLtEit4ZwVTle2aBy6iFHAFILTEtF0GMKwzOHn+ZneN2lK98o6bexc?=
 =?us-ascii?Q?ZuiOedmDlNQqwK38+N/cpEAhT1EWZKVL+S62YqV2Lr82fixvjUiMSeW9FmOj?=
 =?us-ascii?Q?f18xZnEMe8Hz9RzqE6UZwxUmzxMbJAVZGJ8vxMFQ7lpUJvervVeZwvAOO3Rh?=
 =?us-ascii?Q?1ad3rA8Un+rGBOURG43uhqMQoA/GsKUKLWfM7p9Ajyj78Y31L50745yX2Fvw?=
 =?us-ascii?Q?qB16yXMxyd5FGGftuw5mbI43FkuTzYo/2oPkSNLRrpyZbirM2spsr5TQmNSX?=
 =?us-ascii?Q?o5wJGM1lAMkMP+fGjvz8YVuN?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18b1244-2264-4a12-2654-08d9317303bf
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:33:50.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlQVVOE1h17yx0yyqzL5Eq2ooR2CZ1Bk/mIBjCqZjjP0Cx2lMxtnHCZp2W6bQ+9eGdivJK5L6MpWvMmD7wCPmH5WMkk9GRMb9OUWPCdBrlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4855
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

