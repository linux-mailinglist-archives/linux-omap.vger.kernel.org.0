Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CF81F781F
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jun 2020 14:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgFLMxY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Jun 2020 08:53:24 -0400
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:52324 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726085AbgFLMxY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Jun 2020 08:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=/oDe5myc/Ti4esVHRdNG0fK0PcMUaPBw4fimceYfdN4=; b=DMMaGp+kni2FpKPElUqBNLHjTg
        GTB1aW+e1IiFfdnITjlbm0YPGo8GcLJKZvg5v75gXHMSvQa9ea/+rFMxZGXEdnkzGKMQnf6dix78w
        MySNiAfbTYSNn9tc0nfxjiVWkP7jEdlfiPQsAwHYPzUZ4hBWc/7o9o62ZoWTtPJC1pWoQNW6/gbQY
        Z+/Fndi7mhzNLHj7lDuybsySkzg2HqrQJL9eQkBSrcB1I90DkQUelgjs0JnGseEhj1ZhFoaNxJY17
        5pAlLHrrAkWeUfiH/LoZpOfRDDUrCtGx+9UE3JZY69E7XrlZ5WhF22QrdtIAPPvBRR/8oxd5uzzMT
        HcH9H4SA==;
Received: from kgpe-d16.fritz.box ([192.168.178.62])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1jjjBI-0007uZ-9c; Fri, 12 Jun 2020 12:53:12 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     pavel@ucw.cz, Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Mark Gross <mgross@linux.intel.com>,
        linux-omap@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        devicetree@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        linux-kernel@vger.kernel.org (open list),
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...)
Subject: [PATCH 2/2] ARM: dts: n900: remove mmc1 card detect gpio
Date:   Fri, 12 Jun 2020 14:53:59 +0200
Message-Id: <20200612125402.18393-3-merlijn@wizzup.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612125402.18393-1-merlijn@wizzup.org>
References: <20200612125402.18393-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Instead, expose the key via the input framework, as SW_MACHINE_COVER

The chip-detect GPIO is actually detecting if the cover is closed.
Technically it's possible to use the SD card with open cover. The
only downside is risk of battery falling out and user being able
to physically remove the card.

The behaviour of SD card not being available when the device is
open is unexpected and creates more problems than it solves. There
is a high chance, that more people accidently break their rootfs
by opening the case without physically removing the card.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Merlijn Wajer <merlijn@wizzup.org>
---
 arch/arm/boot/dts/omap3-n900.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 4089d97405c9..3dbcae3d60d2 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -105,6 +105,14 @@ proximity_sensor {
 			linux,code = <SW_FRONT_PROXIMITY>;
 			linux,can-disable;
 		};
+
+		machine_cover {
+			label = "Machine Cover";
+			gpios = <&gpio6 0 GPIO_ACTIVE_LOW>; /* 160 */
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_MACHINE_COVER>;
+			linux,can-disable;
+		};
 	};
 
 	isp1707: isp1707 {
@@ -819,10 +827,6 @@ &mmc1 {
 	pinctrl-0 = <&mmc1_pins>;
 	vmmc-supply = <&vmmc1>;
 	bus-width = <4>;
-	/* For debugging, it is often good idea to remove this GPIO.
-	   It means you can remove back cover (to reboot by removing
-	   battery) and still use the MMC card. */
-	cd-gpios = <&gpio6 0 GPIO_ACTIVE_LOW>; /* 160 */
 };
 
 /* most boards use vaux3, only some old versions use vmmc2 instead */
-- 
2.24.1

