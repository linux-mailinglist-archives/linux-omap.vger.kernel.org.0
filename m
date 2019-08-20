Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D9D95E38
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 14:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbfHTMRk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 08:17:40 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37780 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728731AbfHTMRk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 08:17:40 -0400
Received: by mail-io1-f65.google.com with SMTP id q22so11670604iog.4
        for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2019 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rOH9Ec0+JF+kJkeuQgxZatrprm+Jo815HWwd6HWbmmo=;
        b=T8pORjn/EmeBn1lHsZSQXNl/r+XHx365bLX0igMOW3+WykHLczQtoBoPF3RYRq44xf
         axv3TYGiHdvIzYJnrvuCut9h3h85ZRPU2h2i0zjheGAqBVGfVBWUAjIFuqsyg30JQVJO
         qZjkGs0pVqYqvZc4FwDstpyloGCv5D5bUY69Yc1a5pkEfTzxAsuOagLTCxM9cups8IcW
         uIx3CZX4tJwzrN9xqiF3Ldtf/sCwqnohCrbZZFaLeud+KT/Bp6IVFuYRoXf6gy7/ljZr
         +3O2t44Am3W6MzTNtJm9sPbTwpIvObiZW+7DjBBCJFWxQuPTG5QUXl3XzpJmuPB3Cj+2
         HnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rOH9Ec0+JF+kJkeuQgxZatrprm+Jo815HWwd6HWbmmo=;
        b=kONNlbVxYt4nRdMV32wtlYqHYKVBH7RWn4LZ74Xa+7ovCnWEMu0KrQGSTM/SdnrkhP
         z0IynBRcasvBj/WQEAXtisiFTSL7amfbdNIFfinSNwPB/kMsCNmDc+sSly0ocKpaOgqK
         DwmagTZIsdclV4aCtJNVoOBhcw5mo+QCrDP32hi3zHl9TyYOiF4glD3QiV1wd+LHXqyC
         yIl+YGtlX99NS7O+pfmUgpjKSm5mn5MfA+Ogv6wZTKyjQfxtAXk5MUZQkiHMKA8y99Yz
         9vzZXi63XpZLA/HVi1XlkXdTeexgJbebg8GDF8jJN4lBECX80IEBs1Rpj0J4vI/lf/Nj
         3DYA==
X-Gm-Message-State: APjAAAXDR4AirDLqK9P9WlOvhyBQqvGoLmDkPcXyNbnZdHa4g4dETdKR
        /O6d91yJOjczDapu81yfBH4nBhwA
X-Google-Smtp-Source: APXvYqyl5gzbxbNzoR3ZTUWfJjztEiJ9dG84FbIW51/4vud6j6qq+6xjW49CmH/7/kmTa3+SHHBlDg==
X-Received: by 2002:a6b:ea16:: with SMTP id m22mr12758610ioc.115.1566303458350;
        Tue, 20 Aug 2019 05:17:38 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id n203sm15719445iod.28.2019.08.20.05.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 05:17:37 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux
Date:   Tue, 20 Aug 2019 07:17:27 -0500
Message-Id: <20190820121727.3883-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When the pinmux configuration was added, it was accidentally placed into
the omap3_pmx_wkup node  when it should have been placed into the
omap3_pmx_core.  This error was accidentally propagated to stable by
me when I blindly requested the pull after seeing I2C issues without
actually reviewing the content of the pinout.  Since the bootloader
previously muxed these correctly in the past, was a hidden error.

This patch moves the i2c2_pins and i2c3_pins to the correct node
which should eliminate i2c bus errors and timeouts due to the fact
the bootloader uses the save device tree that no longer properly
assigns these pins.

Fixes: 5fe3c0fa0d54 ("ARM: dts: Add pinmuxing for i2c2 and i2c3
for LogicPD SOM-LV") #4.9+

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-som-lv.dtsi b/arch/arm/boot/dts/logicpd-som-lv.dtsi
index 5563ee54c960..b56524cc7fe2 100644
--- a/arch/arm/boot/dts/logicpd-som-lv.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv.dtsi
@@ -228,6 +228,20 @@
 		>;
 	};
 
+	i2c2_pins: pinmux_i2c2_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x21be, PIN_INPUT | MUX_MODE0)	/* i2c2_scl */
+			OMAP3_CORE1_IOPAD(0x21c0, PIN_INPUT | MUX_MODE0)	/* i2c2_sda */
+		>;
+	};
+
+	i2c3_pins: pinmux_i2c3_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x21c2, PIN_INPUT | MUX_MODE0)	/* i2c3_scl */
+			OMAP3_CORE1_IOPAD(0x21c4, PIN_INPUT | MUX_MODE0)	/* i2c3_sda */
+		>;
+	};
+
 	tsc2004_pins: pinmux_tsc2004_pins {
 		pinctrl-single,pins = <
 			OMAP3_CORE1_IOPAD(0x2186, PIN_INPUT | MUX_MODE4)	/* mcbsp4_dr.gpio_153 */
@@ -249,18 +263,6 @@
 			OMAP3_WKUP_IOPAD(0x2a0c, PIN_OUTPUT | MUX_MODE4)	/* sys_boot1.gpio_3 */
 		>;
 	};
-	i2c2_pins: pinmux_i2c2_pins {
-		pinctrl-single,pins = <
-			OMAP3_CORE1_IOPAD(0x21be, PIN_INPUT | MUX_MODE0)	/* i2c2_scl */
-			OMAP3_CORE1_IOPAD(0x21c0, PIN_INPUT | MUX_MODE0)	/* i2c2_sda */
-		>;
-	};
-	i2c3_pins: pinmux_i2c3_pins {
-		pinctrl-single,pins = <
-			OMAP3_CORE1_IOPAD(0x21c2, PIN_INPUT | MUX_MODE0)	/* i2c3_scl */
-			OMAP3_CORE1_IOPAD(0x21c4, PIN_INPUT | MUX_MODE0)	/* i2c3_sda */
-		>;
-	};
 };
 
 &omap3_pmx_core2 {
-- 
2.17.1

