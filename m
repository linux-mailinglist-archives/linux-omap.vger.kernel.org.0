Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8033AAFD7
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 11:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhFQJgD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 05:36:03 -0400
Received: from mail-eopbgr100128.outbound.protection.outlook.com ([40.107.10.128]:44672
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231649AbhFQJgC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Jun 2021 05:36:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej3X35+ins/ln8oiakbEPSe88CtcZBYpc551xIxoDQOXz04J4tlducdZQtwImY25nFVCykstzuIm8LWXYAu6EgtHWOBYrNEgBEouFu9yjI0HSpnODMac4HKy2UcnbbPxnVHW3EhJTbKd7Fp4Yfg2t14Nc2Z5WdcDR55a92XeNofgbjDfp5yOXnh004dNZYsC/vxgR6vDQv1PSrTJJSpnZRURmrUkguiQtkKaEPZfSdJEyL11rBYeQCZWOEwyVqU71Dti+Twvvomfk1D57rFa7xD7RrDKSv7FjEny0Mj3XXCkr7Sc8aBaqHtKUKnsYmYwcZBXFuZ5WrCRwr+KI2uY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFS4Rjnj80pliKtISMz5NLwTw95TJZnzWxlfrH6wT28=;
 b=HJvBysOPVaiwFDVAuE1MOI2xQi9z7liBdmOXBRjrAw0625cBQA7QuebVnvO6pbvRwYuNp2DKN9sct2tJbUMXXjC2IL09sAj9CTjiKSdUpBx7jiO1NXVwTLuEYnbdAFtLGggxUhTeF2zlURC2YnR8Ew8Tul8xNKzan1O3xx9oYWbOdgEDUwtoXHTlyBdE+1872hh72i0cNEnkQ1klTYdmmqDsA84IDCFcDBg1Ok1Vhuoyf7v3KAZGYOEwHd1UH9h4YADZK31/nDrR5MF2Zai+yNfKS+p+e7BdH1gJKFM7+wXJ7omdJuCOdXWn8kPGWirAXoYG5tKlShDaTEOZ/XVzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFS4Rjnj80pliKtISMz5NLwTw95TJZnzWxlfrH6wT28=;
 b=gjP4BiDi4eWGadR2ZSWppnMk90Sn9kBFccbQkUVM10pzVqlCfk8/uaWot4jfpP9miPwstnSEnhkRyfKGn2hUMfiGty4c3iul5aRe1TyYWE91ny7qcIc3C5aOhJxCG2vfFRPMg3IpQm2TAjLiHPU1VFjOpiL9MjJ4JuJRtvyLpn4=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:114::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 09:33:51 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c84c:4809:6da7:ecf5%6]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 09:33:51 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy <marc.murphy@sancloud.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 3/4] ARM: dts: am335x-sancloud-bbe-lite: New devicetree
Date:   Thu, 17 Jun 2021 10:33:29 +0100
Message-Id: <20210617093330.9179-4-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210617093330.9179-1-paul.barker@sancloud.com>
References: <20210617093330.9179-1-paul.barker@sancloud.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336; h=from:subject; bh=OhxsH61ftfICTch8IFFrnnNGluLzAFO1sk3eBcIlkkM=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmnxZ789m6rDi8TmRGu3jnr9fudvQGrTi+Sv75pUxt/Wtl+ p3lmHaUsDGIcDLJiiiy7Z++6fP3Bkq29N6SDYeawMoEMYeDiFICJVMQzMlzorOZpyz5j9u5B5nE3xa 7djB+OcRXNeRpS1bLxfX/wsecM/wN3H4l0kfUWX2xV8DVqmqlMkqpFZuZVGfmZ96Snti4+yAYA
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
X-MS-Office365-Filtering-Correlation-Id: 72123c53-2324-4341-3572-08d931730418
X-MS-TrafficTypeDiagnostic: CWXP123MB4855:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWXP123MB4855F2450C7BBAD97D63F24A930E9@CWXP123MB4855.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6glqjEJkdfxr8X5xv4u5ijx+EcoeLRFDI4dRKEppvYoZpfXlPMHPxANYt7sDNKcFMxWEEj1CkqLghPWFScD3iKnPBbPYRboPD7ouB0rNSD48KoIxDwqRn5OQf7MSQ9oUg8s2XHEWhCRzEseyseiPWTSnrGiY30mZfhyT+Y3AfxsBasAii9qrrpJRJppZy5Z53OzJ3nbWW/HedeWk4jaAzn14H/imBhnozH0iUp1U1+P7GDRBl3ZL/dOm/yJ8aaNUuxhzUg30vd1HXSJ1GpVsEODVS0NNymPEwg2tCqNK5q+2nzTSknMGEJKunbT6nNg9njVn+EsCFyr1o5MpckdQaYspuUtcXS6vrFHnVsKfhIm8ujhIN2YaCNLOyewlIqNOgN2630jo6CZUPDWlyivqjGUAF+UETMUjBHv74Hq8eLbwW2sgkidOyQOvAsQNA/s44q/EI0FUcxs5JPYVEbLLK7Tmd15R5RscQxxp18oa1uXZKyFrnlcmO2Eo0SKxCfnvJu2OjlZ7oPQKf0cexaxVhk/xDAfBEQFjgtJasFQ0XEU5iw51zXEESuH/Xw2qZgAQJJOMdzhdrpE9puC1kdZOCjJNa5NXiwO4iZOAFReiYGWqudCmkZ6d+7gCjG+YkNoTYuAL049E3sQTOzz7wi44xGh1ki0UNI8+8u/dnSq3pft4h7xpEcTzxu9xk9FYfEMuABUIgRK6wKJedq2miW/Io1VWTS08AOnkiyOlpz9mAc7OChtpnEvcXqeKyAHim4biFT9JiO89iwEVOZ6SPGx3cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(346002)(366004)(39830400003)(66476007)(66556008)(66946007)(966005)(36756003)(316002)(478600001)(16526019)(1076003)(86362001)(6666004)(6506007)(8936002)(4326008)(38100700002)(186003)(8676002)(956004)(6486002)(2616005)(110136005)(54906003)(6512007)(2906002)(52116002)(26005)(44832011)(38350700002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZ/dhx4N3z/WwoDmt93+JLyl/3KTWAWrwplxyry5W2na6OlwVKpBrFWc6elh?=
 =?us-ascii?Q?65+oyZc+O27uFqYXrw0i7HNychzuZWXS2m2RfGe6N5oHASWzct8jVnKqltn4?=
 =?us-ascii?Q?uW/XE9gp33LwT2rydfX92iWsuHykTkSEu+qoZxa51Q9fEr4uYNrWApqpz8ye?=
 =?us-ascii?Q?nrWwt6r7wIiUsSgVeA0SkJRPZrvJjvUDyFgJK4uILze9PrEMR62NUQJXsnJm?=
 =?us-ascii?Q?4lVRfFg01ElnMH1n8s75xtHBaGgrAQoFtXw/AjFB9CrdUd07ANdg4bZjJH6+?=
 =?us-ascii?Q?9R8ixYar2kyyU4T+gFAlvWdhg566bv0kJJMTirU54+LBJJis0uZn3hAHxT/l?=
 =?us-ascii?Q?qeYFvX32DkioQo/fDaz5dpuSXLKkfIWh6/Y5kaS0BVZKNvGy04b/te/3nEY9?=
 =?us-ascii?Q?5ukBJqocCtvLPUZrS/pUunA/eKdgBvrRzy1oGxc/hV2KpQ7gquuGlSVI+wCW?=
 =?us-ascii?Q?tXW6hUUbLcSn5lyTRRlbqLE5swpLkoqTkJrERqAjDY0o4rm5Dkxjz/UXjvTz?=
 =?us-ascii?Q?ntG8VRvmaE6Zq9jUoD75kVIplgJhyr8omgrFqUGR+SuGEaxAr1lHG7WMbzTz?=
 =?us-ascii?Q?NTFZY46qxHyZkwGTfAez7ROhekvkFyFrBfCq6R7BiybsnAKSm2GS/6X7VPRb?=
 =?us-ascii?Q?2FyyRfpPZUYBEeAICBcmztOy6Iy150wkFhUUSDWOdfB5WtyAur8kweVyBMey?=
 =?us-ascii?Q?1qx1vv0gKFrWvd/5dxl9dwUzr71aab6KemzSfDbeyE+8+Oa5au54qg+Uofwr?=
 =?us-ascii?Q?FLHUY/LA0JGlnTP1MAxeMxHBiCcMlqqZr6lSWhqW1wmomx73j4HXQfDkv6PL?=
 =?us-ascii?Q?Y75vk5ek63QmLnqvvdZgb95tRsYX6XoATR7uf7nHZVIHgnckXpY7ULVBixTP?=
 =?us-ascii?Q?tAwpbTLP7Dh2FW85SfXns6jfagCF7zS4vU7qPWAdOPYOtBTRaLJvtSZzowhM?=
 =?us-ascii?Q?1iA8reDsTIEnTQpbwsjAAj0XCx+q4DUwY4autqgYgld+kMpOMKrcjOvGZ/IR?=
 =?us-ascii?Q?MLWY8R+QKQVRFPN7Gu8KEfKwCio9Asl7kvL0VdexQ1PCayVZzYgkHa21kyM8?=
 =?us-ascii?Q?5m+dbVwftA2iR2dSuLwalRyuj7ZNtk4uSfu2AsxOckV7env4vHi42EON+hOm?=
 =?us-ascii?Q?rKc0BQvKovalWvRC/T5quaKOjPUOsceK6pVEC5nk1UbjuyxD/xM/8c6bP9+D?=
 =?us-ascii?Q?eW8Y9BfRrHo6I7VvoNeJ9bL+8/HmXCRR01Sgo6DELOmo7Zd8H9eOZxEkxllv?=
 =?us-ascii?Q?0RUTIW8RiLn9dr2JexyMIX3vt+E8nAXvEHKqAFmyMokX4RlS5PHV1IiwGdTs?=
 =?us-ascii?Q?nPr5mL2Hbp+WzKkZlAXy4a6S?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72123c53-2324-4341-3572-08d931730418
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 09:33:51.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W1Kc1FjjDoANwq5bpJnInfRlZbTdF+LPpMf4OshoXb+5usQQC8XjNit6ZWUJtL0PZFJd+TrKSedx0iCQTkb5R9OkwkE2S/dE4qczjUvszc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4855
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds support for the Sancloud BBE Lite which shares a common
hardware base with the non-Lite version of the BBE.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../arm/boot/dts/am335x-sancloud-bbe-lite.dts | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5066e7..8629c941f573 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -834,6 +834,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-pocketbeagle.dtb \
 	am335x-regor-rdk.dtb \
 	am335x-sancloud-bbe.dtb \
+	am335x-sancloud-bbe-lite.dtb \
 	am335x-shc.dtb \
 	am335x-sbc-t335.dtb \
 	am335x-sl50.dtb \
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
new file mode 100644
index 000000000000..9c311bd106f6
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
@@ -0,0 +1,51 @@
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
+		symlink = "spi/0.0";
+
+		reg = <0>;
+		spi-max-frequency = <16000000>;
+		spi-cpha;
+	};
+};
-- 
2.26.2

