Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99891CB543
	for <lists+linux-omap@lfdr.de>; Fri,  8 May 2020 18:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEHQ5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 May 2020 12:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgEHQ5h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 May 2020 12:57:37 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66276C05BD43
        for <linux-omap@vger.kernel.org>; Fri,  8 May 2020 09:57:35 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k12so10862512wmj.3
        for <linux-omap@vger.kernel.org>; Fri, 08 May 2020 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=vT+RaDMcO0E5H+TlMRiVwoNXnA2sts99E5j6V+Tg8As=;
        b=UPug7ezRRUUHdTzqSRfoxD2Iq04xZBfodbQycTm0KgfLU4x6z6TU9TmT6ufh9kG2W+
         loyuu1DiSpCnOt94ZBBvIo76ANg/RXeU9jr/A+Hk5+vMDVTh2utNwAqIgE22iIHIqADO
         ASluyrzSegNku2TaY6GbVfKGfu9//p49URGrn1K15ILRiySiNHzL/mSVBRhdIiC0F9aN
         XdVBj8oSrlVIhl4jkPKl5cGD8SYmbw0mOGGkA77hGMV9UwO2DnCvsQS6Aa2BdY5ngrUn
         yed1HaWUXlcoNMu+qjVUYQWCjSBaaNv2T91VYVxDNfpFTQMOrn1lwMTuKgOf3M7nQ94V
         PZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=vT+RaDMcO0E5H+TlMRiVwoNXnA2sts99E5j6V+Tg8As=;
        b=aAEqYbF0mFyjs29I7I+LXwiT5YCdiJT+4zJMdl1KulhGVfIZRUdShB+b3+2UJ0t10S
         5dBOqHkgkJIg002BWYZDbhSm84Q+Yb/iApeTKIO38uiCBqDIR0JpX3BXWy5iYtX/Ubro
         6+JZKSNRG1rTqM97Yk8TVwtJSDzP2pgj7JIQOEp/ecSC+LaeQ0T33c5m3GodklANFQwK
         keHSWksPZ6C6gtdbM5wAo2ywlfRCvVN/lGN3Q8eLVwFzu26X1oUjpoDt/x59LkNQad0A
         zPdYDWch/hk/SklogLqPJq3bUg/6jDaI/9bcF+oXkNefSeDr/UXo8D2z2K90eEoBAr4n
         Xl4A==
X-Gm-Message-State: AGi0PuZ9oNlk6uDU+yRZHPeqMLQevaw3dMdiu1zQoVeM40HqHPedPxgg
        CyEcpxe4otW9r44A50D3tHNE1A==
X-Google-Smtp-Source: APiQypKna+L9sCld26+Mf5vcDVlbO1sRL+4elnUNWXQ4zRpPTP7NgoDgERq7nVdBXn2PiaNnaKdKnQ==
X-Received: by 2002:a05:600c:201:: with SMTP id 1mr621236wmi.155.1588957053999;
        Fri, 08 May 2020 09:57:33 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id x24sm4147295wrd.51.2020.05.08.09.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 09:57:33 -0700 (PDT)
Date:   Fri, 8 May 2020 18:58:21 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
Message-ID: <20200508165821.GA14555@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add gpio-line-names properties to the gpio controller nodes.
BeagleBone boards have P8 and P9 headers [0] which expose many the
AM3358 SoC balls to stacking expansion boards called "capes", or to
other external connections like jumper wires to a breadboard.

Many of the P8/P9 header pins can muxed to a gpio line.  The
gpio-line-names describe which P8/P9 pin that line goes to and the
default mux for that P8/P9 pin.  Some lines are not routed to the
P8/P9 headers, but instead are dedicated to some functionality such as
status LEDs.  The line name will indicate this.  Some line names are
left empty as the corresponding AM3358 balls are not connected.

The goal is to make it easier for a user viewing the output of gpioinfo
to determine which P8/P9 pin is connected to a line.  The output of
gpioinfo on a BeagleBone Black will now look like this:

gpiochip0 - 32 lines:
	line   0:   "ethernet"       unused   input  active-high
	line   1:   "ethernet"       unused   input  active-high
	line   2: "P9_22 spi0_sclk" unused input active-high
	line   3: "P9_21 spi0_d0" unused input active-high
	line   4: "P9_18 spi0_d1" unused input active-high
	line   5: "P9_17 spi0_cs0" unused input active-high
	line   6:    "sd card"         "cd"   input   active-low [used]
	line   7: "P9_42A ecappwm0" unused input active-high
	line   8: "P8_35 hdmi"       unused   input  active-high
	line   9: "P8_33 hdmi"       unused   input  active-high
	line  10: "P8_31 hdmi"       unused   input  active-high
	line  11: "P8_32 hdmi"       unused   input  active-high
	line  12: "P9_20 i2c2_sda" unused input active-high
	line  13: "P9_19 i2c2_scl" unused input active-high
	line  14: "P9_26 uart1_rxd" unused input active-high
	line  15: "P9_24 uart1_txd" unused input active-high
	line  16:   "ethernet"       unused   input  active-high
	line  17:   "ethernet"       unused   input  active-high
	line  18:        "usb"       unused   input  active-high
	line  19:       "hdmi"       unused   input  active-high
	line  20: "P9_41B gpio" unused input active-high
	line  21:   "ethernet"       unused   input  active-high
	line  22: "P8_19 ehrpwm2a" unused input active-high
	line  23: "P8_13 ehrpwm2b" unused input active-high
	line  24:      unnamed       unused   input  active-high
	line  25:      unnamed       unused   input  active-high
	line  26: "P8_14 gpio"       unused   input  active-high
	line  27: "P8_17 gpio"       unused   input  active-high
	line  28:   "ethernet"       unused   input  active-high
	line  29:   "ethernet"       unused   input  active-high
	line  30: "P9_11 uart4_rxd" unused input active-high
	line  31: "P9_13 uart4_txd" unused input active-high
gpiochip1 - 32 lines:
	line   0: "P8_25 emmc"       unused   input  active-high
	line   1:       "emmc"       unused   input  active-high
	line   2:  "P8_5 emmc"       unused   input  active-high
	line   3:  "P8_6 emmc"       unused   input  active-high
	line   4: "P8_23 emmc"       unused   input  active-high
	line   5: "P8_22 emmc"       unused   input  active-high
	line   6:  "P8_3 emmc"       unused   input  active-high
	line   7:  "P8_4 emmc"       unused   input  active-high
	line   8:      unnamed       unused   input  active-high
	line   9:      unnamed       unused   input  active-high
	line  10:      unnamed       unused   input  active-high
	line  11:      unnamed       unused   input  active-high
	line  12: "P8_12 gpio"       unused   input  active-high
	line  13: "P8_11 gpio"       unused   input  active-high
	line  14: "P8_16 gpio"       unused   input  active-high
	line  15: "P8_15 gpio"       unused   input  active-high
	line  16: "P9_15A gpio" unused input active-high
	line  17: "P9_23 gpio"       unused   input  active-high
	line  18: "P9_14 ehrpwm1a" unused input active-high
	line  19: "P9_16 ehrpwm1b" unused input active-high
	line  20:       "emmc"       unused   input  active-high
	line  21:   "usr0 led" "beaglebone:green:heart" output active-high [used]
	line  22:   "usr1 led" "beaglebone:green:mmc0" output active-high [used]
	line  23:   "usr2 led" "beaglebone:green:usr2" output active-high [used]
	line  24:   "usr3 led" "beaglebone:green:usr3" output active-high [used]
	line  25:       "hdmi"  "interrupt"   input  active-high [used]
	line  26:        "usb"       unused   input  active-high
	line  27: "hdmi audio"     "enable"  output  active-high [used]
	line  28: "P9_12 gpio"       unused   input  active-high
	line  29: "P8_26 gpio"       unused   input  active-high
	line  30: "P8_21 emmc"       unused   input  active-high
	line  31: "P8_20 emmc"       unused   input  active-high
gpiochip2 - 32 lines:
	line   0: "P9_15B gpio" unused input active-high
	line   1: "P8_18 gpio"       unused   input  active-high
	line   2:  "P8_7 gpio"       unused   input  active-high
	line   3:  "P8_8 gpio"       unused   input  active-high
	line   4: "P8_10 gpio"       unused   input  active-high
	line   5:  "P8_9 gpio"       unused   input  active-high
	line   6: "P8_45 hdmi"       unused   input  active-high
	line   7: "P8_46 hdmi"       unused   input  active-high
	line   8: "P8_43 hdmi"       unused   input  active-high
	line   9: "P8_44 hdmi"       unused   input  active-high
	line  10: "P8_41 hdmi"       unused   input  active-high
	line  11: "P8_42 hdmi"       unused   input  active-high
	line  12: "P8_39 hdmi"       unused   input  active-high
	line  13: "P8_40 hdmi"       unused   input  active-high
	line  14: "P8_37 hdmi"       unused   input  active-high
	line  15: "P8_38 hdmi"       unused   input  active-high
	line  16: "P8_36 hdmi"       unused   input  active-high
	line  17: "P8_34 hdmi"       unused   input  active-high
	line  18:   "ethernet"       unused   input  active-high
	line  19:   "ethernet"       unused   input  active-high
	line  20:   "ethernet"       unused   input  active-high
	line  21:   "ethernet"       unused   input  active-high
	line  22: "P8_27 hdmi"       unused   input  active-high
	line  23: "P8_29 hdmi"       unused   input  active-high
	line  24: "P8_28 hdmi"       unused   input  active-high
	line  25: "P8_30 hdmi"       unused   input  active-high
	line  26:       "emmc"       unused   input  active-high
	line  27:       "emmc"       unused   input  active-high
	line  28:       "emmc"       unused   input  active-high
	line  29:       "emmc"       unused   input  active-high
	line  30:       "emmc"       unused   input  active-high
	line  31:       "emmc"       unused   input  active-high
gpiochip3 - 32 lines:
	line   0:   "ethernet"       unused   input  active-high
	line   1:   "ethernet"       unused   input  active-high
	line   2:   "ethernet"       unused   input  active-high
	line   3:   "ethernet"       unused   input  active-high
	line   4:   "ethernet"       unused   input  active-high
	line   5:       "i2c0"       unused   input  active-high
	line   6:       "i2c0"       unused   input  active-high
	line   7:        "emu"       unused   input  active-high
	line   8:        "emu"       unused   input  active-high
	line   9:   "ethernet"       unused   input  active-high
	line  10:   "ethernet"       unused   input  active-high
	line  11:      unnamed       unused   input  active-high
	line  12:      unnamed       unused   input  active-high
	line  13:        "usb"       unused   input  active-high
	line  14: "P9_31 spi1_sclk" unused input active-high
	line  15: "P9_29 spi1_d0" unused input active-high
	line  16: "P9_30 spi1_d1" unused input active-high
	line  17: "P9_28 spi1_cs0" unused input active-high
	line  18: "P9_42B ecappwm0" unused input active-high
	line  19: "P9_27 gpio"       unused   input  active-high
	line  20: "P9_41A gpio" unused input active-high
	line  21: "P9_25 gpio"       unused   input  active-high
	line  22:      unnamed       unused   input  active-high
	line  23:      unnamed       unused   input  active-high
	line  24:      unnamed       unused   input  active-high
	line  25:      unnamed       unused   input  active-high
	line  26:      unnamed       unused   input  active-high
	line  27:      unnamed       unused   input  active-high
	line  28:      unnamed       unused   input  active-high
	line  29:      unnamed       unused   input  active-high
	line  30:      unnamed       unused   input  active-high
	line  31:      unnamed       unused   input  active-high

[0] https://beagleboard.org/Support/bone101
[1] https://beagleboard.org/capes

Reviewed-by: Jason Kridner <jason@beagleboard.org>
Reviewed-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am335x-bone-common.dtsi | 144 ++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 6c9187bc0f17..defdf68edb58 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -397,3 +397,147 @@
 	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
+
+&gpio0 {
+	gpio-line-names =
+		"ethernet",
+		"ethernet",
+		"P9_22 spi0_sclk",
+		"P9_21 spi0_d0",
+		"P9_18 spi0_d1",
+		"P9_17 spi0_cs0",
+		"sd card",
+		"P9_42A ecappwm0",
+		"P8_35 hdmi",
+		"P8_33 hdmi",
+		"P8_31 hdmi",
+		"P8_32 hdmi",
+		"P9_20 i2c2_sda",
+		"P9_19 i2c2_scl",
+		"P9_26 uart1_rxd",
+		"P9_24 uart1_txd",
+		"ethernet",
+		"ethernet",
+		"usb",
+		"hdmi",
+		"P9_41B gpio",
+		"ethernet",
+		"P8_19 ehrpwm2a",
+		"P8_13 ehrpwm2b",
+		"",
+		"",
+		"P8_14 gpio",
+		"P8_17 gpio",
+		"ethernet",
+		"ethernet",
+		"P9_11 uart4_rxd",
+		"P9_13 uart4_txd";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"P8_25 emmc",
+		"emmc",
+		"P8_5 emmc",
+		"P8_6 emmc",
+		"P8_23 emmc",
+		"P8_22 emmc",
+		"P8_3 emmc",
+		"P8_4 emmc",
+		"",
+		"",
+		"",
+		"",
+		"P8_12 gpio",
+		"P8_11 gpio",
+		"P8_16 gpio",
+		"P8_15 gpio",
+		"P9_15A gpio",
+		"P9_23 gpio",
+		"P9_14 ehrpwm1a",
+		"P9_16 ehrpwm1b",
+		"emmc",
+		"usr0 led",
+		"usr1 led",
+		"usr2 led",
+		"usr3 led",
+		"hdmi",
+		"usb",
+		"hdmi audio",
+		"P9_12 gpio",
+		"P8_26 gpio",
+		"P8_21 emmc",
+		"P8_20 emmc";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"P9_15B gpio",
+		"P8_18 gpio",
+		"P8_7 gpio",
+		"P8_8 gpio",
+		"P8_10 gpio",
+		"P8_9 gpio",
+		"P8_45 hdmi",
+		"P8_46 hdmi",
+		"P8_43 hdmi",
+		"P8_44 hdmi",
+		"P8_41 hdmi",
+		"P8_42 hdmi",
+		"P8_39 hdmi",
+		"P8_40 hdmi",
+		"P8_37 hdmi",
+		"P8_38 hdmi",
+		"P8_36 hdmi",
+		"P8_34 hdmi",
+		"ethernet",
+		"ethernet",
+		"ethernet",
+		"ethernet",
+		"P8_27 hdmi",
+		"P8_29 hdmi",
+		"P8_28 hdmi",
+		"P8_30 hdmi",
+		"emmc",
+		"emmc",
+		"emmc",
+		"emmc",
+		"emmc",
+		"emmc";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"ethernet",
+		"ethernet",
+		"ethernet",
+		"ethernet",
+		"ethernet",
+		"i2c0",
+		"i2c0",
+		"emu",
+		"emu",
+		"ethernet",
+		"ethernet",
+		"",
+		"",
+		"usb",
+		"P9_31 spi1_sclk",
+		"P9_29 spi1_d0",
+		"P9_30 spi1_d1",
+		"P9_28 spi1_cs0",
+		"P9_42B ecappwm0",
+		"P9_27 gpio",
+		"P9_41A gpio",
+		"P9_25 gpio",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
-- 
2.20.1

