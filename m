Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C55C78D460
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbfHNNOb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:14:31 -0400
Received: from muru.com ([72.249.23.125]:57678 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbfHNNOa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:14:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 745F58176;
        Wed, 14 Aug 2019 13:14:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 5/6] ARM: dts: Configure interconnect target module for omap3 sgx
Date:   Wed, 14 Aug 2019 06:14:07 -0700
Message-Id: <20190814131408.57162-6-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814131408.57162-1-tony@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like omap34xx OCP registers are not readable unlike on omap36xx.
We use SGX revision register instead of the OCP revision register for
34xx and do not configure any SYSCONFIG register unlike for 36xx.

I've tested that the interconnect target module enables and idles
just fine with PM runtime control via sys:

# echo on > $(find /sys -name control | grep \/5000); rwmem 0x5000fe10
# rwmem 0x50000014	# SGX revision register on 36xx
0x50000014 = 0x00010205
# echo auto > $(find /sys -name control | grep \/5000)
# rwmem 0x5000fe00
And when idled, it will produce "Bus error" as expected.

Cc: Adam Ford <aford173@gmail.com>
Cc: Filip Matijević <filip.matijevic.pz@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: moaz korena <moaz@korena.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philipp Rossak <embed3d@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap34xx.dtsi | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/omap36xx.dtsi | 27 +++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -100,6 +100,32 @@
 				interrupts = <18>;
 			};
 		};
+
+		/*
+		 * On omap34xx the OCP registers do not seem to be accessible
+		 * at all unlike on 36xx. Maybe SGX is permanently set to
+		 * "OCP bypass mode", or maybe there is OCP_SYSCONFIG that is
+		 * write-only at 0x50000e10. We detect SGX based on the SGX
+		 * revision register instead of the unreadable OCP revision
+		 * register. Also note that on early 34xx es1 revision there
+		 * are also different clocks, but we do not have any dts users
+		 * for it.
+		 */
+		sgx_module: target-module@50000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x50000014 0x4>;
+			reg-names = "rev";
+			clocks = <&sgx_fck>, <&sgx_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50000000 0x4000>;
+
+			/*
+			 * Closed source PowerVR driver, no cnhild device
+			 * binding or driver in mainline
+			 */
+		};
 	};
 
 	thermal_zones: thermal-zones {
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -139,6 +139,33 @@
 				interrupts = <18>;
 			};
 		};
+
+		/*
+		 * The OCP register layout seems to be a subset of the
+		 * "ti,sysc-omap4" with just sidle and midle bits.
+		 */
+		sgx_module: target-module@50000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5000fe00 0x4>,
+			      <0x5000fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&sgx_fck>, <&sgx_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50000000 0x2000000>;
+
+			/*
+			 * Closed source PowerVR driver, no cnhild device
+			 * binding or driver in mainline
+			 */
+		};
 	};
 
 	thermal_zones: thermal-zones {
-- 
2.21.0
