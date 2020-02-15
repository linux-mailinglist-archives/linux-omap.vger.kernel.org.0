Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECAA15FF5D
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2020 18:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgBORAe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Feb 2020 12:00:34 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:45180 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726143AbgBORAe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Feb 2020 12:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=5mloNwlHrXdn4IwVWhbhGXhiCRauDyoDgJnxMxS8A3Y=; b=ONIshqSGcrrUtCYNbDJGk63TWb
        FSLz2TT8D24qgDUtIGDPmVXp9BxfwjjprtJXuZZPOL+4uSrSFWijbiHMao5rScoEfvNkI631I8w6S
        +eQtNwMg0WfBM9nTe1V9V1IkE/l9MFObWuiVtJfZpMMVMdzQT78Znc/QaavJd38moOGzyIZy4PJUM
        +SzifJhAL4Vy78nBHWuFYDwSWmAFokD7K7Bt4wArYXWZt83viyKbe5gnu59dwks1Adla/Nkv1lZCk
        Dc+4JlmVOOZCFd+ZjLeNcqmQJZ/8CVD0an2XxZPdMRxaEYPxir0xaDpRXVI6seNnLwKpHZejhKoBd
        7sX48b7w==;
Received: from kgpe-d16.fritz.box ([192.168.178.22])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j30nj-00037p-C4; Sat, 15 Feb 2020 17:00:19 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: n900: remove mmc1 card detect gpio
Date:   Sat, 15 Feb 2020 18:02:15 +0100
Message-Id: <20200215170216.14397-3-merlijn@wizzup.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200215170216.14397-1-merlijn@wizzup.org>
References: <20200215170216.14397-1-merlijn@wizzup.org>
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

Signed-off-by: Merlijn Wajer <merlijn@wizzup.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/boot/dts/omap3-n900.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
index 7028a7cb2849..ed773e1609a5 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -108,6 +108,14 @@
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
@@ -805,10 +813,6 @@
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
2.23.0

