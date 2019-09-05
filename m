Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1CAAAEEF
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 01:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbfIEXEt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 19:04:49 -0400
Received: from muru.com ([72.249.23.125]:59894 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbfIEXEt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Sep 2019 19:04:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0A27C810D;
        Thu,  5 Sep 2019 23:05:16 +0000 (UTC)
Date:   Thu, 5 Sep 2019 16:04:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, pali.rohar@gmail.com, t-kristo@ti.com,
        aaro.koskinen@iki.fi, adam.ford@logicpd.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Message-ID: <20190905230443.GA52127@atomide.com>
References: <20190828150037.2640-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828150037.2640-1-aford173@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [190828 15:01]:
> The datasheet for the AM3517 shows the RNG is connected to L4.
> It shows the module address for the RNG is 0x480A0000, and it
> matches the omap2.dtsi description.  Since the driver can support
> omap2 and omap4, it seems reasonable to assume the omap3 would
> use the same core for the RNG.
> 
> This RFC, mimics much of the omap2 hwmods on the OMAP3. It
> also adds the necessary clock for driving the RNG.  Unfortunately,
> it appears non-functional.  If anyone has any suggestions on how
> to finish the hwmod (or port it to the newer l4 device tree
> format), feedback is requested.

Yup I'll take the bait :) The patch below seems to do the trick
for me on dm3730 based on translating your patch to probe with
ti-sysc.

Not sure about 34xx, it seems we're missing rng_clk? Care
to give it a try and attempt simlar patches for 34xx and
3517?

At least I'm not needing the "ti,no-reset-on-init" property
that your patch has a comment for. Maybe that's needed on
some other omap3.

Oh and this needs to default to status = "disabled" for
HS devices like n900 as it needs to use the omap3-rom-rng.

Regards,

Tony

8< -----------------------
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -140,6 +140,29 @@
 			};
 		};
 
+		rng_target: target-module@480a0000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480a003c 0x4>,
+			      <0x480a0040 0x4>,
+			      <0x480a0044 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>;
+			ti,syss-mask = <1>;
+			clocks = <&rng_ick>;
+			clock-names = "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x480a0000 0x2000>;
+
+			rng: rng@0 {
+				compatible = "ti,omap2-rng";
+				reg = <0x0 0x2000>;
+				interrupts = <52>;
+			};
+		};
+
 		/*
 		 * Note that the sysconfig register layout is a subset of the
 		 * "ti,sysc-omap4" type register with just sidle and midle bits
