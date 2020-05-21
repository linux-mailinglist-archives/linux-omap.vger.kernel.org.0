Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693361DD809
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 22:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgEUUJb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 16:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgEUUJb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 16:09:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51C8C061A0E
        for <linux-omap@vger.kernel.org>; Thu, 21 May 2020 13:09:30 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w7so7859421wre.13
        for <linux-omap@vger.kernel.org>; Thu, 21 May 2020 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=nIi6lwLSxjJ5QkgFDXr2TxVuxE7BfvuRKJAHB9bCUhE=;
        b=lPO9+h0uF90mMuu+7Ks7x+tx7hvAwlhKx6PNgyT+nuhGHmrmCk4vXy7CJRjXDvSImW
         u//+6q++02Zs5TUrVg24r3yvQrA7YJr2xtOMjWgffGsnrK7Yxt4LYIJIkIRNb6z26de1
         qzmZpMi4j5HIbfcL7NfvWXwK03vngzRiwZSXBOze8ikLiFmJSFVhAIMHkjd9GjDPd/gy
         M4qrQBtz1+hLGnHt0R6vhQdrcRTBZ/HsE/mrImsQ1QdXQB9tv6l324+yyT8J3hbhmjKk
         X3TBb5wxGFzilkv0Xf+e80zhd7g2y8xCf2b4G9vTeHErD3QDna2n/pE+0/WxCUvmuBih
         OhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=nIi6lwLSxjJ5QkgFDXr2TxVuxE7BfvuRKJAHB9bCUhE=;
        b=pJSKwqmPeDTnCho/a6X7khvFbJWSLtTPfg8to67PuZ7M74sVV/zkM/W4iHKA2eMNld
         UONZGc4g3HF+0/miP2wpdDFEzzX0PKUf/+02/NvjKk3oKTHp+xCeL9y1HgC1jOaplZZd
         gEG/tc2nt/4AT/H5sXKTTNy65RQ6NWhIJjErnK8+UogutqXhh7y1JJUALRxpJHvR+Ble
         ecgYWy58G/IT7rTlpgKz1rjv+sVRCV4tWSzJpyHL2qsMGmlwmYDfBC3lW0VdhHRgacrG
         6hmQ1cEY7lGlB+lWL7zOH9uFaxG5kt3171XclN3zbpEaIXvt5elyOKxStWpaoefCxVrA
         gKsw==
X-Gm-Message-State: AOAM530oci0xciBpFvwQxPGVnH9gMDfuXGbeh9dw59O5O6xNgWGw9BGd
        Zwx14eFoGqIyB4EWBRnqt8jo8A==
X-Google-Smtp-Source: ABdhPJz5V8+RxoTitrxUx4g+Dm+HehlBrZ7KN6GLOPhuTNIQyj3sElLDMfFNGer09LfiJPWaN6BnBQ==
X-Received: by 2002:a5d:408b:: with SMTP id o11mr221928wrp.97.1590091769423;
        Thu, 21 May 2020 13:09:29 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z7sm7440143wrl.88.2020.05.21.13.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 13:09:28 -0700 (PDT)
Date:   Thu, 21 May 2020 22:09:26 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: [PATCH v2] arm: dts: am335x-boneblack: add gpio-line-names
Message-ID: <20200521200926.GC429020@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The BeagleBone Black has P8 and P9 headers [0] which expose many of the
AM3358 ZCZ SoC balls to stacking expansion boards called "capes", or to
other external connections like jumper wires connected to a breadboard.
BeagleBone users will often refer to the "Cape Exanpsion Headers" pin
diagram [1] as it is in the "Bone101" getting started tutorial. [2]

Most of the P8 and P9 header pins can muxed to a GPIO line.  The
gpio-line-names describe which P8 or P9 pin that line goes to and the
default mux for that P8 or P9 pin if it is not GPIO.

For example, gpiochip 1 line 0 is connected to P8 header pin 25 (P8_25)
however the default device tree has the corresponding BGA ball (ZCZ U7)
muxed to mmc1_dat0 as it is used for the on-board eMMC chip.  For that
GPIO line to be used, one would need to modify the device tree to
disable the eMMC and change the pin mux for that ball to GPIO mode.

Some of the AM3358 ZCZ balls corresponding to GPIO lines are not routed
to a P8 or P9 header, but are instead wired to some peripheral device
like on-board eMMC, HDMI framer IC, or status LEDs.  Those names are in
brackets to denote those GPIO lines can not be used.

Some GPIO lines are named "[NC]" as the corresponding balls are not
routed to anything on the PCB.

The goal for these names is to make it easier for a user viewing the
output of gpioinfo to determine which P8 or P9 pin is connected to a
GPIO line.  The output of gpioinfo on a BeagleBone Black would be:

gpiochip0 - 32 lines:
	line   0: "[ethernet]"       unused   input  active-high 
	line   1: "[ethernet]"       unused   input  active-high 
	line   2: "P9_22 [spi0_sclk]" unused input active-high 
	line   3: "P9_21 [spi0_d0]" unused input active-high 
	line   4: "P9_18 [spi0_d1]" unused input active-high 
	line   5: "P9_17 [spi0_cs0]" unused input active-high 
	line   6:  "[sd card]"         "cd"   input   active-low [used]
	line   7: "P9_42A [ecappwm0]" unused input active-high 
	line   8: "P8_35 [hdmi]" unused input active-high 
	line   9: "P8_33 [hdmi]" unused input active-high 
	line  10: "P8_31 [hdmi]" unused input active-high 
	line  11: "P8_32 [hdmi]" unused input active-high 
	line  12: "P9_20 [i2c2_sda]" unused input active-high 
	line  13: "P9_19 [i2c2_scl]" unused input active-high 
	line  14: "P9_26 [uart1_rxd]" unused input active-high 
	line  15: "P9_24 [uart1_txd]" unused input active-high 
	line  16: "[ethernet]"       unused   input  active-high 
	line  17: "[ethernet]"       unused   input  active-high 
	line  18:      "[usb]"       unused   input  active-high 
	line  19:     "[hdmi]"       unused   input  active-high 
	line  20:     "P9_41B"       unused   input  active-high 
	line  21: "[ethernet]"       unused   input  active-high 
	line  22: "P8_19 [ehrpwm2a]" unused input active-high 
	line  23: "P8_13 [ehrpwm2b]" unused input active-high 
	line  24:       "[NC]"       unused   input  active-high 
	line  25:       "[NC]"       unused   input  active-high 
	line  26:      "P8_14"       unused   input  active-high 
	line  27:      "P8_17"       unused   input  active-high 
	line  28: "[ethernet]"       unused   input  active-high 
	line  29: "[ethernet]"       unused   input  active-high 
	line  30: "P9_11 [uart4_rxd]" unused input active-high 
	line  31: "P9_13 [uart4_txd]" unused input active-high 
gpiochip1 - 32 lines:
	line   0: "P8_25 [emmc]" unused input active-high 
	line   1:     "[emmc]"       unused   input  active-high 
	line   2: "P8_5 [emmc]" unused input active-high 
	line   3: "P8_6 [emmc]" unused input active-high 
	line   4: "P8_23 [emmc]" unused input active-high 
	line   5: "P8_22 [emmc]" unused input active-high 
	line   6: "P8_3 [emmc]" unused input active-high 
	line   7: "P8_4 [emmc]" unused input active-high 
	line   8:       "[NC]"       unused   input  active-high 
	line   9:       "[NC]"       unused   input  active-high 
	line  10:       "[NC]"       unused   input  active-high 
	line  11:       "[NC]"       unused   input  active-high 
	line  12:      "P8_12"       unused   input  active-high 
	line  13:      "P8_11"       unused   input  active-high 
	line  14:      "P8_16"       unused   input  active-high 
	line  15:      "P8_15"       unused   input  active-high 
	line  16:     "P9_15A"       unused   input  active-high 
	line  17:      "P9_23"       unused   input  active-high 
	line  18: "P9_14 [ehrpwm1a]" unused input active-high 
	line  19: "P9_16 [ehrpwm1b]" unused input active-high 
	line  20:     "[emmc]"       unused   input  active-high 
	line  21: "[usr0 led]" "beaglebone:green:heartbeat" output active-high [used]
	line  22: "[usr1 led]" "beaglebone:green:mmc0" output active-high [used]
	line  23: "[usr2 led]" "beaglebone:green:usr2" output active-high [used]
	line  24: "[usr3 led]" "beaglebone:green:usr3" output active-high [used]
	line  25:     "[hdmi]"  "interrupt"   input  active-high [used]
	line  26:      "[usb]"       unused   input  active-high 
	line  27: "[hdmi audio]" "enable" output active-high [used]
	line  28:      "P9_12"       unused   input  active-high 
	line  29:      "P8_26"       unused   input  active-high 
	line  30: "P8_21 [emmc]" unused input active-high 
	line  31: "P8_20 [emmc]" unused input active-high 
gpiochip2 - 32 lines:
	line   0:     "P9_15B"       unused   input  active-high 
	line   1:      "P8_18"       unused   input  active-high 
	line   2:       "P8_7"       unused   input  active-high 
	line   3:       "P8_8"       unused   input  active-high 
	line   4:      "P8_10"       unused   input  active-high 
	line   5:       "P8_9"       unused   input  active-high 
	line   6: "P8_45 [hdmi]" unused input active-high 
	line   7: "P8_46 [hdmi]" unused input active-high 
	line   8: "P8_43 [hdmi]" unused input active-high 
	line   9: "P8_44 [hdmi]" unused input active-high 
	line  10: "P8_41 [hdmi]" unused input active-high 
	line  11: "P8_42 [hdmi]" unused input active-high 
	line  12: "P8_39 [hdmi]" unused input active-high 
	line  13: "P8_40 [hdmi]" unused input active-high 
	line  14: "P8_37 [hdmi]" unused input active-high 
	line  15: "P8_38 [hdmi]" unused input active-high 
	line  16: "P8_36 [hdmi]" unused input active-high 
	line  17: "P8_34 [hdmi]" unused input active-high 
	line  18: "[ethernet]"       unused   input  active-high 
	line  19: "[ethernet]"       unused   input  active-high 
	line  20: "[ethernet]"       unused   input  active-high 
	line  21: "[ethernet]"       unused   input  active-high 
	line  22: "P8_27 [hdmi]" unused input active-high 
	line  23: "P8_29 [hdmi]" unused input active-high 
	line  24: "P8_28 [hdmi]" unused input active-high 
	line  25: "P8_30 [hdmi]" unused input active-high 
	line  26:     "[emmc]"       unused   input  active-high 
	line  27:     "[emmc]"       unused   input  active-high 
	line  28:     "[emmc]"       unused   input  active-high 
	line  29:     "[emmc]"       unused   input  active-high 
	line  30:     "[emmc]"       unused   input  active-high 
	line  31:     "[emmc]"       unused   input  active-high 
gpiochip3 - 32 lines:
	line   0: "[ethernet]"       unused   input  active-high 
	line   1: "[ethernet]"       unused   input  active-high 
	line   2: "[ethernet]"       unused   input  active-high 
	line   3: "[ethernet]"       unused   input  active-high 
	line   4: "[ethernet]"       unused   input  active-high 
	line   5:     "[i2c0]"       unused   input  active-high 
	line   6:     "[i2c0]"       unused   input  active-high 
	line   7:      "[emu]"       unused   input  active-high 
	line   8:      "[emu]"       unused   input  active-high 
	line   9: "[ethernet]"       unused   input  active-high 
	line  10: "[ethernet]"       unused   input  active-high 
	line  11:       "[NC]"       unused   input  active-high 
	line  12:       "[NC]"       unused   input  active-high 
	line  13:      "[usb]"       unused   input  active-high 
	line  14: "P9_31 [spi1_sclk]" unused input active-high 
	line  15: "P9_29 [spi1_d0]" unused input active-high 
	line  16: "P9_30 [spi1_d1]" unused input active-high 
	line  17: "P9_28 [spi1_cs0]" unused input active-high 
	line  18: "P9_42B [ecappwm0]" unused input active-high 
	line  19:      "P9_27"       unused   input  active-high 
	line  20:     "P9_41A"       unused   input  active-high 
	line  21:      "P9_25"       unused   input  active-high 
	line  22:       "[NC]"       unused   input  active-high 
	line  23:       "[NC]"       unused   input  active-high 
	line  24:       "[NC]"       unused   input  active-high 
	line  25:       "[NC]"       unused   input  active-high 
	line  26:       "[NC]"       unused   input  active-high 
	line  27:       "[NC]"       unused   input  active-high 
	line  28:       "[NC]"       unused   input  active-high 
	line  29:       "[NC]"       unused   input  active-high 
	line  30:       "[NC]"       unused   input  active-high 
	line  31:       "[NC]"       unused   input  active-high 

[0] https://git.io/JfgOd
[1] https://beagleboard.org/capes
[1] https://beagleboard.org/Support/bone101
[2] https://beagleboard.org/static/images/cape-headers.png

Reviewed-by: Jason Kridner <jason@beagleboard.org>
Reviewed-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
V2 change:
- include output of gpioinfo to illustrate how the gpio-line-names
will appear. My apologies for forgetting to include in V1.

V1 note:
I had posted a patch with these line names for am335x-bone-common.dtsi
but Grygorii Strashko pointed out that the names are not applicable to
all BeagleBone models.  Thus I have created this patch to add these
names just for the BeagleBone Black.

 arch/arm/boot/dts/am335x-boneblack.dts | 144 +++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index d3928662aed4..5f31e832eb82 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -23,3 +23,147 @@ oppnitro-1000000000 {
 		opp-supported-hw = <0x06 0x0100>;
 	};
 };
+
+&gpio0 {
+	gpio-line-names =
+		"[ethernet]",
+		"[ethernet]",
+		"P9_22 [spi0_sclk]",
+		"P9_21 [spi0_d0]",
+		"P9_18 [spi0_d1]",
+		"P9_17 [spi0_cs0]",
+		"[sd card]",
+		"P9_42A [ecappwm0]",
+		"P8_35 [hdmi]",
+		"P8_33 [hdmi]",
+		"P8_31 [hdmi]",
+		"P8_32 [hdmi]",
+		"P9_20 [i2c2_sda]",
+		"P9_19 [i2c2_scl]",
+		"P9_26 [uart1_rxd]",
+		"P9_24 [uart1_txd]",
+		"[ethernet]",
+		"[ethernet]",
+		"[usb]",
+		"[hdmi]",
+		"P9_41B",
+		"[ethernet]",
+		"P8_19 [ehrpwm2a]",
+		"P8_13 [ehrpwm2b]",
+		"[NC]",
+		"[NC]",
+		"P8_14",
+		"P8_17",
+		"[ethernet]",
+		"[ethernet]",
+		"P9_11 [uart4_rxd]",
+		"P9_13 [uart4_txd]";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"P8_25 [emmc]",
+		"[emmc]",
+		"P8_5 [emmc]",
+		"P8_6 [emmc]",
+		"P8_23 [emmc]",
+		"P8_22 [emmc]",
+		"P8_3 [emmc]",
+		"P8_4 [emmc]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"P8_12",
+		"P8_11",
+		"P8_16",
+		"P8_15",
+		"P9_15A",
+		"P9_23",
+		"P9_14 [ehrpwm1a]",
+		"P9_16 [ehrpwm1b]",
+		"[emmc]",
+		"[usr0 led]",
+		"[usr1 led]",
+		"[usr2 led]",
+		"[usr3 led]",
+		"[hdmi]",
+		"[usb]",
+		"[hdmi audio]",
+		"P9_12",
+		"P8_26",
+		"P8_21 [emmc]",
+		"P8_20 [emmc]";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"P9_15B",
+		"P8_18",
+		"P8_7",
+		"P8_8",
+		"P8_10",
+		"P8_9",
+		"P8_45 [hdmi]",
+		"P8_46 [hdmi]",
+		"P8_43 [hdmi]",
+		"P8_44 [hdmi]",
+		"P8_41 [hdmi]",
+		"P8_42 [hdmi]",
+		"P8_39 [hdmi]",
+		"P8_40 [hdmi]",
+		"P8_37 [hdmi]",
+		"P8_38 [hdmi]",
+		"P8_36 [hdmi]",
+		"P8_34 [hdmi]",
+		"[ethernet]",
+		"[ethernet]",
+		"[ethernet]",
+		"[ethernet]",
+		"P8_27 [hdmi]",
+		"P8_29 [hdmi]",
+		"P8_28 [hdmi]",
+		"P8_30 [hdmi]",
+		"[emmc]",
+		"[emmc]",
+		"[emmc]",
+		"[emmc]",
+		"[emmc]",
+		"[emmc]";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"[ethernet]",
+		"[ethernet]",
+		"[ethernet]",
+		"[ethernet]",
+		"[ethernet]",
+		"[i2c0]",
+		"[i2c0]",
+		"[emu]",
+		"[emu]",
+		"[ethernet]",
+		"[ethernet]",
+		"[NC]",
+		"[NC]",
+		"[usb]",
+		"P9_31 [spi1_sclk]",
+		"P9_29 [spi1_d0]",
+		"P9_30 [spi1_d1]",
+		"P9_28 [spi1_cs0]",
+		"P9_42B [ecappwm0]",
+		"P9_27",
+		"P9_41A",
+		"P9_25",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]",
+		"[NC]";
+};
-- 
2.25.1

