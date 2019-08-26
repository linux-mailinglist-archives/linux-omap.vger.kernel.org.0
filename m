Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B069D203
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 16:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbfHZOzg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 10:55:36 -0400
Received: from muru.com ([72.249.23.125]:58640 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732396AbfHZOzg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 10:55:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 96AAC80AA;
        Mon, 26 Aug 2019 14:56:02 +0000 (UTC)
Date:   Mon, 26 Aug 2019 07:55:30 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] ARM: dts: Configure sgx for omap5
Message-ID: <20190826145530.GT52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <20190814131408.57162-5-tony@atomide.com>
 <20190815182348.8A1BA2063F@mail.kernel.org>
 <20190817065615.GI52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190817065615.GI52127@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190817 06:56]:
> * Stephen Boyd <sboyd@kernel.org> [190815 18:24]:
> > Quoting Tony Lindgren (2019-08-14 06:14:06)
> > > diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> > > --- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
> > > +++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
> > > @@ -1146,6 +1146,20 @@
> > >                 };
> > >         };
> > >  
> > > +       gpu_cm: gpu_cm@1500 {
> > 
> > Node names shouldn't have underscores. Maybe clock-controller?
> 
> OK yeah clock-controller sounds good to me.

Below is this one updated to use clock-controller naming.

Regards,

Tony

8< ---------------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Wed, 14 Aug 2019 05:18:16 -0700
Subject: [PATCH] ARM: dts: Configure sgx for omap5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've tested that the interconnect target module enables and idles
just fine when probed with ti-sysc with PM runtime control via sys:

# echo on > $(find /sys -name control | grep \/5600)
# rwmem 0x5600fe00	# OCP Revision
0x5600fe00 = 0x40000000
# echo auto > $(find /sys -name control | grep \/5600)
# rwmem 0x5600fe10
# rwmem 0x56000024

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
 arch/arm/boot/dts/omap5.dtsi           | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -257,6 +257,29 @@
 			ports-implemented = <0x1>;
 		};
 
+		target-module@56000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5600fe00 0x4>,
+			      <0x5600fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x56000000 0x2000000>;
+
+			/*
+			 * Closed source PowerVR driver, no child device
+			 * binding or driver in mainline
+			 */
+		};
+
 		dss: dss@58000000 {
 			compatible = "ti,omap5-dss";
 			reg = <0x58000000 0x80>;
diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -1146,6 +1146,20 @@
 		};
 	};
 
+	gpu_cm: clock-controller@1500 {
+		compatible = "ti,omap4-cm";
+		reg = <0x1500 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1500 0x100>;
+
+		gpu_clkctrl: clk@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x4>;
+			#clock-cells = <2>;
+		};
+	};
+
 	l3init_cm: l3init_cm@1600 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1600 0x100>;
-- 
2.23.0
