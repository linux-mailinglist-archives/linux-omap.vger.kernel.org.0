Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8E31DD796
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 21:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbgEUTud (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 15:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbgEUTud (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 15:50:33 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC87DC061A0F
        for <linux-omap@vger.kernel.org>; Thu, 21 May 2020 12:50:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so6657637wrw.1
        for <linux-omap@vger.kernel.org>; Thu, 21 May 2020 12:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=W0bmmrcfoMMLY53+q+PM9oHmwAiHFiyVtLVqP+FNgI0=;
        b=pdzOstKGZ1qMN+Pt/TsxJHH8iZB55xatp5okzckH9uMnliXxBzJ9d0Dl9uBJ2qEw9R
         7PTdcGlnFcOu+873UWzw/00aGEtsuyvlAJ7ZFQpy5TP4vD2NyfcKQKtrD9Ck7iQd2NkI
         6Ng7TcezZa+S8AV4dIUNdC13V8LwS/Vfi4jGHA+K14GOcFaDrGoZDhHZYKyW2U5fLupK
         ObdGJ7gdJpQwB7rewEDpX+h3vVGjeepFL58TpAGyAJOf5F8CjhUnRqtwFmi3aEy4lD/M
         LoC1VKlwtJvVcmWpthwx0VwlfA/PwebI1aTE6ljjX7R7Mk+e6inPHbpSTFiu8/My8QCT
         voxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=W0bmmrcfoMMLY53+q+PM9oHmwAiHFiyVtLVqP+FNgI0=;
        b=deDpIrJ9qRBOc0azxUhfWg9jM+E0r2/HPYIS1+1ncgLlR2ThyPj9pfPP5OLdjayyn7
         bYBKxv9D6pHIf2NAQIc6I04I7W7EYAX+21UKxPbX9m2FEJ3dSakgp+ySRGw1DgQBXYcS
         yoavpWLhgpVS+M5eNYhCj3Ra4rqL/T7zWhGTmrwfglrXR+9EzRQDhXYalbsaxZR+u6m6
         DbbSVQI4G40njDwn/4j3mmNUyiRLf0JM8Rb4YorADf2I6Fkim+QpgfzOaYjTifojSjR5
         /6VfiQvDD+LQnEnr4LDYK0ONy09MopnBwGgIvJbPejg+/rUaaf9936Bf7IS5NFVtV0Tl
         IpFA==
X-Gm-Message-State: AOAM531Sl/HNssHNPzwzzDBu1ZtBXISfJqrypcd/LtOtoFew5OUavkPh
        31luIsPHxI5d0eZzsDmPyu2jFA==
X-Google-Smtp-Source: ABdhPJxI5+4zP6A4maoDpeagfmZeWogan+Aicw3eNBXaIjNm2V8HkzqxiSDUki2DMSG365TA15J5jQ==
X-Received: by 2002:a5d:6806:: with SMTP id w6mr207199wru.324.1590090631449;
        Thu, 21 May 2020 12:50:31 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id 18sm7329042wmj.19.2020.05.21.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:50:30 -0700 (PDT)
Date:   Thu, 21 May 2020 21:50:28 +0200
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
Subject: [PATCH] arm: dts: am335x-boneblack: add gpio-line-names
Message-ID: <20200521195028.GB429020@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add gpio-line-names properties to the GPIO controller nodes.

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

[0] https://git.io/JfgOd
[1] https://beagleboard.org/capes
[1] https://beagleboard.org/Support/bone101
[2] https://beagleboard.org/static/images/cape-headers.png

Reviewed-by: Jason Kridner <jason@beagleboard.org>
Reviewed-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
V1 note:
I had posted a patch with these line names for am335x-bone-common.dtsi
but Grygorii Strashko pointed out that the names are not applicable to
all BeagleBone models.  Thus is have created this patch to add these
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

