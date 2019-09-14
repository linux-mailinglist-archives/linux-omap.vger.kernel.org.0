Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10927B2CFE
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 23:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfINVDJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 17:03:09 -0400
Received: from muru.com ([72.249.23.125]:32904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfINVDI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Sep 2019 17:03:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 968EE814A;
        Sat, 14 Sep 2019 21:03:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 2/7] hwrng: omap3-rom - Fix missing clock by probing with device tree
Date:   Sat, 14 Sep 2019 14:02:55 -0700
Message-Id: <20190914210300.15836-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190914210300.15836-1-tony@atomide.com>
References: <20190914210300.15836-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 0ed266d7ae5e ("clk: ti: omap3: cleanup unnecessary clock aliases")
removed old omap3 clock framework aliases but caused omap3-rom-rng to
stop working with clock not found error.

Based on discussions on the mailing list it was requested by Tero Kristo
that it would be best to fix this issue by probing omap3-rom-rng using
device tree to provide a proper clk property. The other option would be
to add back the missing clock alias, but that does not help moving things
forward with removing old legacy platform_data.

Let's also add a proper device tree binding and keep it together with
the fix.

Cc: devicetree@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Fixes: 0ed266d7ae5e ("clk: ti: omap3: cleanup unnecessary clock aliases")
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/rng/omap3_rom_rng.txt | 27 +++++++++++++++++++
 arch/arm/boot/dts/omap3-n900.dts              |  6 +++++
 arch/arm/mach-omap2/pdata-quirks.c            | 12 +--------
 drivers/char/hw_random/omap3-rom-rng.c        | 17 ++++++++++--
 4 files changed, 49 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rng/omap3_rom_rng.txt

diff --git a/Documentation/devicetree/bindings/rng/omap3_rom_rng.txt b/Documentation/devicetree/bindings/rng/omap3_rom_rng.txt
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/omap3_rom_rng.txt
@@ -0,0 +1,27 @@
+OMAP ROM RNG driver binding
+
+Secure SoCs may provide RNG via secure ROM calls like Nokia N900 does. The
+implementation can depend on the SoC secure ROM used.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be "nokia,n900-rom-rng"
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the the RNG interface clock
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "ick"
+
+Example:
+
+	rom_rng: rng {
+		compatible = "nokia,n900-rom-rng";
+		clocks = <&rng_ick>;
+		clock-names = "ick";
+	};
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -155,6 +155,12 @@
 		pwms = <&pwm9 0 26316 0>; /* 38000 Hz */
 	};
 
+	rom_rng: rng {
+		compatible = "nokia,n900-rom-rng";
+		clocks = <&rng_ick>;
+		clock-names = "ick";
+	};
+
 	/* controlled (enabled/disabled) directly by bcm2048 and wl1251 */
 	vctcxo: vctcxo {
 		compatible = "fixed-clock";
diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -262,14 +262,6 @@ static void __init am3517_evm_legacy_init(void)
 	am35xx_emac_reset();
 }
 
-static struct platform_device omap3_rom_rng_device = {
-	.name		= "omap3-rom-rng",
-	.id		= -1,
-	.dev	= {
-		.platform_data	= rx51_secure_rng_call,
-	},
-};
-
 static void __init nokia_n900_legacy_init(void)
 {
 	hsmmc2_internal_input_clk();
@@ -285,9 +277,6 @@ static void __init nokia_n900_legacy_init(void)
 			pr_warn("RX-51: Not enabling ARM errata 430973 workaround\n");
 			pr_warn("Thumb binaries may crash randomly without this workaround\n");
 		}
-
-		pr_info("RX-51: Registering OMAP3 HWRNG device\n");
-		platform_device_register(&omap3_rom_rng_device);
 	}
 }
 
@@ -627,6 +616,7 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 	OF_DEV_AUXDATA("ti,davinci_mdio", 0x5c030000, "davinci_mdio.0", NULL),
 	OF_DEV_AUXDATA("ti,am3517-emac", 0x5c000000, "davinci_emac.0",
 		       &am35xx_emac_pdata),
+	OF_DEV_AUXDATA("nokia,n900-rom-rng", 0, NULL, rx51_secure_rng_call),
 	/* McBSP modules with sidetone core */
 #if IS_ENABLED(CONFIG_SND_SOC_OMAP_MCBSP)
 	OF_DEV_AUXDATA("ti,omap3-mcbsp", 0x49022000, "49022000.mcbsp", &mcbsp_pdata),
diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -20,6 +20,8 @@
 #include <linux/workqueue.h>
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #define RNG_RESET			0x01
@@ -86,14 +88,18 @@ static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
 
 static struct hwrng omap3_rom_rng_ops = {
 	.name		= "omap3-rom",
-	.read		= omap3_rom_rng_read,
 };
 
 static int omap3_rom_rng_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 
-	pr_info("initializing\n");
+	omap3_rom_rng_ops.read = of_device_get_match_data(&pdev->dev);
+	if (!omap3_rom_rng_ops.read) {
+		dev_err(&pdev->dev, "missing rom code handler\n");
+
+		return -ENODEV;
+	}
 
 	omap3_rom_rng_call = pdev->dev.platform_data;
 	if (!omap3_rom_rng_call) {
@@ -125,9 +131,16 @@ static int omap3_rom_rng_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id omap_rom_rng_match[] = {
+	{ .compatible = "nokia,n900-rom-rng", .data = omap3_rom_rng_read, },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, omap_rom_rng_match);
+
 static struct platform_driver omap3_rom_rng_driver = {
 	.driver = {
 		.name		= "omap3-rom-rng",
+		.of_match_table = omap_rom_rng_match,
 	},
 	.probe		= omap3_rom_rng_probe,
 	.remove		= omap3_rom_rng_remove,
-- 
2.23.0
