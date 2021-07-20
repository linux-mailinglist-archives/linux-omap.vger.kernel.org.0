Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F8A3CF646
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 10:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhGTH7Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 03:59:24 -0400
Received: from mail-eopbgr110132.outbound.protection.outlook.com ([40.107.11.132]:42540
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230161AbhGTH7R (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 20 Jul 2021 03:59:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaJkyszOcUV/oTjTLdy5LMrY+sHygahEqsZuUBn1n8s8rt3qfo+X3ugfzFyNrrdxbGToLIEGgO9+9sBI0V5pTCb7w1HZ5MGXOm7iqCm8i3onqMPRagP5EQR1GKsI+I1HY0FAOO9bhFgIuEIEGMwkUixHalEnYHRA5pZMRsu06ziFJEcbjJKINDKxRTHE4vQuvV2PTOUHDnB7Bs4ohReF7n98AC9GBAtg+vLb6jky+BOj/iJftmM8bwFiPEbGzoe7xXbKPcVtc2RqnFWVHl55OrC9SL4KOvePbozCv+SPeFOnQpAnQo2up5OnW1QuDLwA5Bs8l8vYPuolKn9WkbQMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLYUfC3f6T9871lPgpayKmTbATF2W+ePqmVlzTGupI4=;
 b=fsqVEcsqgVqVipBu70LET+qKD/9abVi+j0hISrG8E9+wLAOncJwHvieOmU1XhHbepePB1KxIQe0X3NY6b7OTau8OP5imBsDk6syJ0pkcCF3PUuxXtvD9mPl5fTGhP90Zaouv7vr1SFbv2K7YESKQIcgEsY/2cp4rrgzDYxPRdVEVno7OL6FaoQfQPSDg7LEkWW3gvnxsJJ2pEAvLRGv+Dq3uwzuCETByTCopbtP0WekJzwjEaJvw9QDy2AsvnkNOWYXgod02gWVxsl619aodD3OMrQSA6/SUmsQuilsbPcHHP/WYVqDgbSbqjsmup8wMaRhmbcxjl42gu22+5UgPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLYUfC3f6T9871lPgpayKmTbATF2W+ePqmVlzTGupI4=;
 b=NsoYBH+RdKMRx3pPAZt7YNAJIr5oe4pOcPHwVZQuIk7IWGGK9+e51AuMfkEHQvL+QOcFSEf03D18BjuQodiF00XWHjIrKSghhIx5feCQEPZPtAzPZFV/O2ZIrFwslSTlhtWGodkMXZ5IRBvOnFf02zTdDByMSmShgmKJl+q9Az4=
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
Subject: [PATCH v2 3/4] ARM: dts: am335x-sancloud-bbe-lite: New devicetree
Date:   Tue, 20 Jul 2021 09:39:27 +0100
Message-Id: <20210720083928.10404-4-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210720083928.10404-1-paul.barker@sancloud.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; h=from:subject; bh=Q0trNpq/LLY03rhJczcGeootKTz5WAzKB5JzKUTCBcM=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAnfunfLzm+V1ZzbyuOm4tHhff33K5GSxdUG9k4XUl8oiWfM 0VPsKGVhEONgkBVTZNk9e9fl6w+WbO29IR0MM4eVCWQIAxenAExktzXD/7wiB/Mtlv5ybJc8n7fz5v 8PWLTZ8m3AcVHXhOeijw803WdkeH8/9jfT37KEE7r7Npy98VYhOrpssh/zu898TQLzlqiV8QIA
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a6::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26 via Frontend Transport; Tue, 20 Jul 2021 08:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d4d26d5-aaee-48e4-5731-08d94b59eddf
X-MS-TrafficTypeDiagnostic: CWLP123MB3764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP123MB376491044078D1F8F447E62193E29@CWLP123MB3764.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyiB6VVchsKS5cLUNGzFz0ZoEzG0yYjkqDBU2T0bg3tv3woF+W/G+Ykm22q76yHvnJrJz89Y4AJ1mkScC95D7d907llY79PpRSMqT68fdDa/kVc2XIgxmT4KGgxFlHdL0oPOyiJCsSM98rFcOjkXLWQ4BAG37qt2/eCBSzr8kfL8YnVujW+6+Le+TYexGO/6HJdYzQM3dCi2Dus1MB6aaR4lfysIc6XZgZyTPVUnl+3i/xtHr/I5JJo4gNcQDVA/otqMZArGdjBZ43LM1ZPVRRh4fdPpvDes4Mi+QhaTZ2GCvgM1Hf3K5Vt8WUPkyOIrnGWQQOBXEFSxAyJ62sppLN0X/g19OTij1hbtRWcIxtihb5LPEqnIPwRp/mSeUDUNH/I+N3E9+veGOtgUSyT77OuLy76ilNFltjBwG+r+hU3Xg+lrhMBXEKiUIh7oYXGhgf/0J9KrmElfuvl2rr0hGV9ih8QHo7tMpNyJdCL0xO7oK7RYDmHFcn8d3HPhZC/sgdMTc4fIy+r8w4HKPHcMRoGja9ly2hawm+lDUbgCAIkMQX2/5GhmX4o+0RnMdSRwLncCcXcE5uugbVZieU/oI26eyzYM1VNc1+HqbA2QOg7ejczBBT4PuUBvfIDJviVWMbkwr0s+oBqgFKC2Wmy3nAgCiL0d2PoPQE9y8Ito1ngkS7H9ISLnIk9EiuOT2q9EoO+L/fgFVNKeKU44FoeE/tsDm/dMJMHUl0/jeCo0FiQpiXPZwMC8Oy2kmzJjnh0z9adTFFuFhqosjGJ9Pt0LIyw+ORuTyLmhdbaaLCk54sA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(136003)(396003)(376002)(366004)(346002)(966005)(52116002)(956004)(6506007)(478600001)(5660300002)(2616005)(36756003)(86362001)(2906002)(44832011)(1076003)(6666004)(8676002)(6486002)(66946007)(110136005)(26005)(4326008)(8936002)(6512007)(66476007)(316002)(66556008)(38100700002)(38350700002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b3Z4vIwaJyQl/ZDfZZMMjGq4XIs/r735tlsuSyKNbR3/VXySayPOieZ/iL4Q?=
 =?us-ascii?Q?jubuyCIGx/gOBChNi1IQ0hbeBgRFfNMoUOq03MMWaazm8CckIVoGcMpinmZH?=
 =?us-ascii?Q?9ASYkQg1wu86vqoL2VxIz4hLWpuublweH90Ou3+tVOj8+eQIzZxdDHkU9Bbq?=
 =?us-ascii?Q?sV0tN8zt3/wnK4ukBC7jYEUByi8WQtBrCdWbzhVp4b9hucvcu0hfO7g2EVDS?=
 =?us-ascii?Q?Dj+BbaagZNG/CeKeSk4LqT/rPEYWF8uXJKJ4yhqyZ29Re91Kf2WK0JtqoRkM?=
 =?us-ascii?Q?Rt1PFwk2t6W3At/WmcZlSxEHRSkBthFYsYeEr7eeBWgNLENsq74owWDZ3rdC?=
 =?us-ascii?Q?cbV+fhUUm6gjlyZ+csTOpww7XnstSMj4WTPNS8YqqIKt4bn/oELvEwWJ3r0n?=
 =?us-ascii?Q?JcGfjXfnF1OYPb/kOxMl0ZROHbkwLMIHgbdS7wUspMEF3W5rZ+APAVrVJr7m?=
 =?us-ascii?Q?Xvp0dj/fdXNY0B+C4OZsqgctKapfTAr4QgRhb9+bLjmCZqA0qJZ6PZqORNwY?=
 =?us-ascii?Q?sfqKEKm6W54Nslal3wnRSHFN5a8e0jv/fQ+1Nbo2a2mW4uNJxb50xhFOusfp?=
 =?us-ascii?Q?J3tHV6dq+wDZPSrkmrsrEiY76wzwUy/f4mrxXQnTN1mTB5ej8CiYe+UQq4c3?=
 =?us-ascii?Q?b3RKr037Dm/0IbTF5ElOVx16ICeMO+gBGcWdJAzcCeSwgt8RvEsgjjTkcJv6?=
 =?us-ascii?Q?Z2ei/Cb2hkTGiq/D5o2O/v/iOq4Wksl6B1plDATTXBN0OBNF3T/XXT7gTslP?=
 =?us-ascii?Q?KAeX3hN58NKxFZ7q4mBYRF1FrBginhhUo1jlo70ZTRQwSN3nsStPiHoBCanI?=
 =?us-ascii?Q?IkkDbTn2AR2xlmY4x4NJbUY9OqBwy1TY7O1nkvJWLqteXnxrmjmVhruSsRgH?=
 =?us-ascii?Q?0yTgHOtFDwKsFBvAQvaWtzpUbRcSvU3f6fLiKsx1ngFixByhtImzh0mHoELO?=
 =?us-ascii?Q?QfS5qoF2SkEEMGUI2Gy71PEmtGDkCEVab4ap1+Dwif3Kfn47JnofrhV6RUiV?=
 =?us-ascii?Q?RnNm3iiGunS7TtTKm3oIQvYcbiVVXLWkqgdAEC7HZpx82h7OGK5gcoGKOFbq?=
 =?us-ascii?Q?ogD5SyBiTv4hGBtPQQeoPlwCjqpPre+7jV4sXbgL2V8ckHoOM0zeLWaFM108?=
 =?us-ascii?Q?TqBkZGpQ8m+gdzlB8PTBEyJwYogZZbthsw6Qa1uxDDRFhAEBlJ0axthcRccT?=
 =?us-ascii?Q?Y95l0e3tdpgAFcbAhPUvImGjNc7eq+cYfWj1TYGq9WMJGu7AEgAcZNt+1MoR?=
 =?us-ascii?Q?WoCtPATnm3cELzb9hManIEJHL1yBqRE2JvsVgpItnbUS22DV0gqvyDpCsLT8?=
 =?us-ascii?Q?FuY/03vLidpuCmVu8AE15AA8?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4d26d5-aaee-48e4-5731-08d94b59eddf
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:39:46.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbXhJznLuaIlv6TiqzWi3XD/LeaOeLZCQBDA1EDIAEfl5dK6K2Wpdghp7J7yZGUT5eAlBUO6Kd0fVwX+XGU2TC9dATdfMeho75ifpHy/r/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3764
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds support for the Sancloud BBE Lite which shares a common
hardware base with the non-Lite version of the BBE.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../arm/boot/dts/am335x-sancloud-bbe-lite.dts | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 863347b6b65e..8da525e7f0ab 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -843,6 +843,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-pocketbeagle.dtb \
 	am335x-regor-rdk.dtb \
 	am335x-sancloud-bbe.dtb \
+	am335x-sancloud-bbe-lite.dtb \
 	am335x-shc.dtb \
 	am335x-sbc-t335.dtb \
 	am335x-sl50.dtb \
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
new file mode 100644
index 000000000000..d6ef19311a91
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2021 SanCloud Ltd
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+#include "am335x-bone-common.dtsi"
+#include "am335x-boneblack-common.dtsi"
+#include "am335x-sancloud-bbe-common.dtsi"
+
+/ {
+	model = "SanCloud BeagleBone Enhanced Lite";
+	compatible = "sancloud,am335x-boneenhanced",
+		     "ti,am335x-bone-black",
+		     "ti,am335x-bone",
+		     "ti,am33xx";
+};
+
+&am33xx_pinmux {
+	bb_spi0_pins: pinmux_bb_spi0_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT, MUX_MODE0)
+		>;
+	};
+};
+
+&spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&bb_spi0_pins>;
+
+	channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		compatible = "micron,spi-authenta";
+
+		reg = <0>;
+		spi-max-frequency = <16000000>;
+		spi-cpha;
+	};
+};
-- 
2.26.2

