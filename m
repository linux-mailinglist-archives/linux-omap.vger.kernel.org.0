Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77A78E375
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 06:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfHOEPI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 00:15:08 -0400
Received: from muru.com ([72.249.23.125]:57882 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfHOEPI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 15 Aug 2019 00:15:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 118A680C8;
        Thu, 15 Aug 2019 04:15:32 +0000 (UTC)
Date:   Wed, 14 Aug 2019 21:15:02 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        moaz korena <moaz@korena.xyz>, "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap
 variants
Message-ID: <20190815041502.GG52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
 <20190815040248.GF52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190815040248.GF52127@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190815 04:03]:
> * Adam Ford <aford173@gmail.com> [190814 19:14]:
> > I do wonder if an omap34xx or omap36xx should use
> > compatible = "ti,sysc-omap4", "ti,sysc";
> > 
> > should it use an omap3 equivalent?
> 
> We named the old hwmod type1 as ti,sysc-omap2, type2 as ti,sysc-omap4,
> and type3 as ti,sysc-omap4-simple based on where we thought they
> appeared. Based on the sysconfig register bit layout, sgx on omap36xx
> seems to have a subset of ti,sysc-omap4 and we can recycle it. If we
> used a wrong type, the module would not get enabled or disabled as
> the register bits would not match.
> 
> How about let's add a comment like:
> 
> Yes sg has a subset of ti,sysc-omap4 type sysconfig register

Well actually we already have some comments there, I clarified
it a bit more and fixed the typos noted by Andrew. Updated patch
below.

Regards,

Tony

8< ------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Wed, 14 Aug 2019 05:18:16 -0700
Subject: [PATCH] ARM: dts: Configure interconnect target module for omap3
 sgx
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap34xx.dtsi | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/omap36xx.dtsi | 28 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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
+			 * Closed source PowerVR driver, no child device
+			 * binding or driver in mainline
+			 */
+		};
 	};
 
 	thermal_zones: thermal-zones {
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -139,6 +139,34 @@
 				interrupts = <18>;
 			};
 		};
+
+		/*
+		 * Note that the sysconfig register layout is a subset of the
+		 * "ti,sysc-omap4" type register with just sidle and midle bits
+		 * available while omap34xx has "ti,sysc-omap2" type sysconfig.
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
+			 * Closed source PowerVR driver, no child device
+			 * binding or driver in mainline
+			 */
+		};
 	};
 
 	thermal_zones: thermal-zones {
-- 
2.21.0
