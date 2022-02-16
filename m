Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFF94B85A7
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 11:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbiBPKZD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Feb 2022 05:25:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbiBPKZC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Feb 2022 05:25:02 -0500
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2101.outbound.protection.outlook.com [40.107.11.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CD4206DD6;
        Wed, 16 Feb 2022 02:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOfLgRwFxJ2j6rQPFzabSbMXGQIIXZvqYTRK8I3gcn2nfYpHtnEeEdCC0A+SrKSPUt4/z9nhrWx+0TPD7vqHIrewbVsDGBci3u0ijG/J7mVxHNyiCindcl2NHQ1S2IFaea2jf/rr01QnuhMlrdijtEx7H7Pd1rJGT2K4w6exqs0SKsY2NkcBvUz5qnnAHFaI4CWKBF9P9ytKhspJ3agfmdnOGUCMmoHqCfD/T3+K8IFR/NWMi/m8lXWOPOq5PISgKUeAkq2wm51beHV6CmdOI98XVHuKPb7fuJO3j8dLn3tqZ8zvfJsvWFejO6r4SU0ZkZL0+nQYIM7tzk0zeHv2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj6fDieatrZ10q6rkIjp9tDfxxY5Junk8Xn2hkDqos8=;
 b=bb/sWQroIDyXPJVVosQZGBpBlu7ayFKDWXpluKLgv7L74NjP3kgy5CXEeeoNOu3MnShnKAWDFa5PJHnGto4tCtad2LyDvZIYo6RqwhC0dvHdXtfYLzgiMTdNmhiRNuPTpJ4y0/3by+QTi1wGaon0bgs6VAgJ7r9XxvAj62AIslL3ys0dW8S/atdNQ4v4Y5lZx0LvQjYIzi/Aie19m5rRQWCjWGTlW2GbfiUT+Zol9JdAxC8SNO2DOeApPwIJ0ZpkZ//Naknk6xTzDeo7BrdHMoGx5HRhHnIqppUs0Mf9C9neozSlyo/dEYbZrtjG8vusGp8VHFTOAvHht42BquGmoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj6fDieatrZ10q6rkIjp9tDfxxY5Junk8Xn2hkDqos8=;
 b=e45UmiRvkLbPhbZaDeOvGECygBGMXJMjEA1sxla0p7jARbPd89kWVOKbRZIEkXR9qV6oAli9TSt1kieA4eyhmkLTjRWTjdqEfPao8Ygjbgws1KVfZlIl0hYxN9aj5Pm6I1nK7LCZYfh8uZrxebx9e20jKNCPJ48dhK/SLayNj+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB5940.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 10:24:45 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::554d:d250:a048:97a5]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::554d:d250:a048:97a5%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 10:24:45 +0000
From:   Paul Barker <paul.barker@sancloud.com>
To:     Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Paul Barker <paul.barker@sancloud.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: am335x-sancloud-bbe-extended-wifi: New devicetree
Date:   Wed, 16 Feb 2022 10:24:30 +0000
Message-Id: <20220216102430.500-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.35.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4470; h=from:subject; bh=o21tiFY45D+1FWgXwwIeySLu1akpmxAMdjaLeNeZt1E=; b=owGbwMvMwCV2w7xIXuiX9CvG02pJDEk8F24/FfQ6Mu+ZuF/t1N2cGbWR3xd6nvZQcPVaXStht7Pm xcI5HaUsDGJcDLJiiiy7Z++6fP3Bkq29N6SDYeawMoEMYeDiFICJyC9n+F+ruab826XFuyeV7U8o/3 dhBjdTxvX5sokJ31rDPVSbjyUy/E+JOLVHSJNH84GNvb3u30fq/U9/HGHNlYqrKVE7+HHVRSYA
X-Developer-Key: i=paul.barker@sancloud.com; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9946b848-5ac6-4bc4-b896-08d9f1368d70
X-MS-TrafficTypeDiagnostic: CWLP123MB5940:EE_
X-Microsoft-Antispam-PRVS: <CWLP123MB594039E64B4B609A439B073A93359@CWLP123MB5940.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCyFZMB65p8T830ihybFkfZFRyWLoNlcjJ9XQse7U9KyM+ENl7j/yK8srUR051zVPlytvX366XlslEKXLRHO7f1uFx0V4IGSq28Qlm1aMsv3WvxJAt8jR6ixQrC1+y4fqaY9WOEOlpew8YUXtFGpfhevE4r0msqkb8ywYn9NEq0BTefiYngYDXQmH+oduB7iskcD4EXK7cbTp+J89pILiME/tf1UZ/HTT3CydiMF5C31gle0i7N2zmhAWTcitsxwZYaWOKWUhKSiGyriTOi4xhmueTOQaeG6VeOxuFZ9nM0SFqH5LeLsi47IgWuBeMGwjoILWFEWOgDoIb/EN6teQfmi9236fGVy7Yk1lswGCpZ6sLTcO8oXuJihjg8wGRhG1lBXiSJxvUZY5FIym7TpEJrGooqgdMFuXXlWAoGOIzoR8T0mvpVLO9ljP6FpuYcxI/p8/VsJ4UlzFzFlIuRrSW+BedEokjj3sdmGBAgHzt0HjWN//pc2w0FpAg3kumH360hBYjyWgSb3X5df6XbAjWhC9pLQBxrixSLePFwF6/Rjrkq5CCRbIy5WP7QygtJklFsZUVm/37ad41436SpBIc5PhdV+b7m/SZJezGqcuIom1aB3RkrTLRBi2Ei+Gq6b2n+zBL+L5GrgXLjUFGKqDO8SgreJSpt+968uTHyQmgQN4uMrnL731J96mN5FeLAyIkGE4ffz7VzReT/PcKPs9hz6dbNgM84GC6nFcBaF+MM4Q1i0aZERZawhrM1qiu0JzDhoNZ/mp/DJXEaNyRDIXNeV27nhUK2Aqq6AHR6gU1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(346002)(39830400003)(136003)(366004)(376002)(396003)(8676002)(4326008)(966005)(66476007)(83380400001)(66556008)(36756003)(66946007)(52116002)(6512007)(6506007)(86362001)(2906002)(38100700002)(38350700002)(6666004)(6486002)(5660300002)(44832011)(186003)(2616005)(1076003)(26005)(508600001)(8936002)(316002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AyJnUkA4KQmRZcAF63UrafxgtYqG7FX0Jvc+gIsyoxxVDx4V3KBrZfF8Apw0?=
 =?us-ascii?Q?/jtprJ1Z0V35vg/zJNBdAP2K0XA8EK1PjmtkEPrqONCtM03MIbu9keckGUtJ?=
 =?us-ascii?Q?TzpwvhhGuHY+Q2KCUMWvc22BtgmYFAiIgdmJdCV0GZjAT3GQWLTFCt8PZmam?=
 =?us-ascii?Q?Rp0s6sV/ldeMyCzGsZfCpm9pDOjfCP7uckb1UoA9Jt2znQZCz6nAM4xPmWfb?=
 =?us-ascii?Q?x/mrpCo+ccz4T62+1T9+buKOfMxzf8g3nMaEm/03tjWBC0vFhDuUocFFR9vM?=
 =?us-ascii?Q?XH1PntQpsvW/neqHQzyjEScpIuI8hf2wgaUIcqLjs2pe5Twh8nI83ZamNF0W?=
 =?us-ascii?Q?MZrCvi52rcUV87FiPMnPiaFMWhNt8UWz6M9+RyGSg9XM7DYWz6HNvMDl2o/U?=
 =?us-ascii?Q?cbMAyQMmsZHvePEDWIZQiX2rWNDqx+tFD/4VzfOmoRYfZCaOK5/xb188f/b4?=
 =?us-ascii?Q?7hw7iJ4fFlMYEDJGdwWqu/+sc/1q8VI594xfOQ7iKGsp9tauFk0mpDoloUj7?=
 =?us-ascii?Q?3VSrbKq+/0cD9r5Q3cgKhuNtqZSq+zbvYDAmKuLhLnLv4OM8/vR3IMmNxk/K?=
 =?us-ascii?Q?zOuWZC0jozZMRFUxlNgOILlrqi95x4HOf0K8V+gSG09twz09hVklTd/0YWyM?=
 =?us-ascii?Q?igqEdOHylMCW2i5GGCv0f11jPoxCYrO96k5rn1ig7pE6dQnGTRkXwOH50lYX?=
 =?us-ascii?Q?lmqIlxBBzcMoYYSDfE3QvPhoKx7+WHkihAn2KhEjrrQxLBFaEOY4bbpm0Omj?=
 =?us-ascii?Q?iZnd5TpPjOowku1BFpNUAqb/5Ld0cv3N0ZLtF9by29In5EV7e+aITND0/73Z?=
 =?us-ascii?Q?FTPwjyWGV2mr+pmc+TFu0f2fKw5Dd4LbnuBsThLMWoKoqZkiR95bkWu67MU+?=
 =?us-ascii?Q?QxGLN5srNo/AjBr6zboWUj5vjOdotSDBrTTlY5I2ChRgb4KWh3j7OR8KFUPV?=
 =?us-ascii?Q?9pHpJSvUhOhRoJc9ey6kn4kXD/wqe2Yc19DpM1/+RMJ2vERFvg8TTT1uzHXo?=
 =?us-ascii?Q?AWQCCMkr+EBnHRW8IKLodY4ThdqnAXlFTMozO42eukMF03sJ41YFsZmSF2yO?=
 =?us-ascii?Q?ctSs91sp9ASMhei51L7OVOv3a0LzQ7kfR637uPe8DXE77qXzSuPoK1AAcHGe?=
 =?us-ascii?Q?1pokaXefewxrjFlFaqySmeb6DD0MFSubPZrvY06drgauIqp5TbT5iMLQxu9p?=
 =?us-ascii?Q?00shzsCzd0lPwFfYZXB/aOsHZSyMwXiRc8mHeHda0Gy7plJayGBPaGry/kLi?=
 =?us-ascii?Q?j67Z4jkoyfMTGJjllvby6fL4HajIwUbDZettK1k0kRHtxHwlzPbjYoE+Q8Gp?=
 =?us-ascii?Q?WenTAbN0G4Mm2d85Fd9DSe5HsPBZXF53+OUSpRGj51B+l655yy//6kg/GqkU?=
 =?us-ascii?Q?kenWS2+Yqfc5mh6qKguMUHs3nW61rKMpGk23Qggzhz88G+kjZPocl4+P0UEq?=
 =?us-ascii?Q?442R0LVinN2GjQ/n3J3J6/sYoTRkArBNEvsM7gCHQx2QkffsQYlaW2dXRdKg?=
 =?us-ascii?Q?UxYlsU0KKGLuaw9ByS+Y/dXgcG1WBKnLHP2SY8PYw0TtSbw6hymzc2UBq+97?=
 =?us-ascii?Q?jq7XaYF1sx/7RK4ovRWkZ7YVaSZhYm9pyIHqAxD0V0ve2EXyVnEi0uHH66J8?=
 =?us-ascii?Q?kVmitsTKgJ0fOr1fhGnhL2f5yF1SN7ArJX++tO/tGW7Gfdr7EdO6cETWUr1T?=
 =?us-ascii?Q?suAGOQ=3D=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9946b848-5ac6-4bc4-b896-08d9f1368d70
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:24:45.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV6oar7awi6PMCDp+xC4kqKyrhjnEHAK10w7w5/ssicaeoywk+ErIlEB7qUkxUugEqqTpwqAXKx9UkiSq7fN4lDTKftNpvlt6NSd4XftLXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB5940
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for the SanCloud BBE Extended WiFi board which shares common
hardware with other BBE varients. Compared to the vanilla BBE, this
particular model:

  * adds a WiFi+Bluetooth module connected via SDIO and UART.

  * drops the HDMI encoder, barometer and accelerometer.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/am335x-sancloud-bbe-extended-wifi.dts | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e41eca79c950..fb1f7d1f94a5 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -895,6 +895,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-regor-rdk.dtb \
 	am335x-sancloud-bbe.dtb \
 	am335x-sancloud-bbe-lite.dtb \
+	am335x-sancloud-bbe-extended-wifi.dtb \
 	am335x-shc.dtb \
 	am335x-sbc-t335.dtb \
 	am335x-sl50.dtb \
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts b/arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts
new file mode 100644
index 000000000000..246a1a9b3e44
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe-extended-wifi.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Sancloud Ltd
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ */
+/dts-v1/;
+
+#include "am33xx.dtsi"
+#include "am335x-bone-common.dtsi"
+#include "am335x-boneblack-common.dtsi"
+#include "am335x-sancloud-bbe-common.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "SanCloud BeagleBone Enhanced Extended WiFi";
+	compatible = "sancloud,am335x-boneenhanced",
+		     "ti,am335x-bone-black",
+		     "ti,am335x-bone",
+		     "ti,am33xx";
+
+	wlan_en_reg: fixedregulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us= <100000>;
+	};
+};
+
+&am33xx_pinmux {
+	mmc3_pins: pinmux_mmc3_pins {
+		pinctrl-single,pins = <
+			/* gpmc_a9.gpio1_25: RADIO_EN */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_OUTPUT_PULLUP, MUX_MODE7)
+
+			/* gpmc_ad12.mmc2_dat0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT_PULLUP, MUX_MODE3)
+
+			/* gpmc_ad13.mmc2_dat1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT_PULLUP, MUX_MODE3)
+
+			/* gpmc_ad14.mmc2_dat2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_INPUT_PULLUP, MUX_MODE3)
+
+			/* gpmc_ad15.mmc2_dat3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT_PULLUP, MUX_MODE3)
+
+			/* gpmc_csn3.mmc2_cmd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN3, PIN_INPUT_PULLUP, MUX_MODE3)
+
+			/* gpmc_clk.mmc2_clk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_INPUT_PULLUP, MUX_MODE3)
+		>;
+	};
+
+	bluetooth_pins: pinmux_bluetooth_pins {
+		pinctrl-single,pins = <
+			/* event_intr0.gpio0_19 */
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	uart1_pins: pinmux_uart1_pins {
+		pinctrl-single,pins = <
+			/* uart1_rxd */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT, MUX_MODE0)
+
+			/* uart1_txd */
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_INPUT, MUX_MODE0)
+
+			/* uart1_ctsn */
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT_PULLDOWN, MUX_MODE0)
+
+			/* uart1_rtsn */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+		>;
+	};
+};
+
+&i2c2 {
+	status = "disabled";
+};
+
+&mmc3 {
+	status = "okay";
+	vmmc-supply = <&wlan_en_reg>;
+	bus-width = <4>;
+	non-removable;
+	cap-power-off-card;
+	ti,needs-special-hs-handling;
+	keep-power-in-suspend;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins>;
+	dmas = <&edma_xbar 12 0 1
+		&edma_xbar 13 0 2>;
+	dma-names = "tx", "rx";
+	clock-frequency = <50000000>;
+	max-frequency = <50000000>;
+};
+
+&uart1 {
+	status = "okay";
+
+	bluetooth {
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart1_pins &bluetooth_pins>;
+		compatible = "qcom,qca6174-bt";
+		enable-gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+		clocks = <&l4ls_clkctrl AM3_L4LS_UART2_CLKCTRL 0>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
+	};
+};

base-commit: 754e0b0e35608ed5206d6a67a791563c631cec07
-- 
2.35.1

