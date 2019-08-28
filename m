Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2A8A066A
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 17:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfH1Pex (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 11:34:53 -0400
Received: from muru.com ([72.249.23.125]:58960 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbfH1Pex (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 11:34:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3D2DF80C5;
        Wed, 28 Aug 2019 15:35:21 +0000 (UTC)
Date:   Wed, 28 Aug 2019 08:34:48 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Allow 350mA current for USB
 peripherals
Message-ID: <20190828153448.GC52127@atomide.com>
References: <20190828151706.32643-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828151706.32643-1-tony@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190828 08:17]:
> Looks like we can use some USB Ethernet dongles for example if we increase
> the allowed power limit.
> 
> A similar PMIC MC13783 documents maximum current limit as 350 mA in in
> "Table 10-3. VUSB Regulator Main Characteristics". Since we have no
> other documentation, let's use that value as the limit.

Oops, that's too much, it's not VUSB regulator but VBUS regulator
that lists 300 mA max instead of 350 mA for VUSB regulator.

Updated patch below.

Regards,

Tony

8< ------------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Wed, 28 Aug 2019 08:11:26 -0700
Subject: [PATCH] ARM: dts: omap4-droid4: Allow 300mA current for USB
 peripherals

Looks like we can use some USB Ethernet dongles for example if we increase
the allowed power limit.

A similar PMIC MC13783 documents maximum current limit as 300 mA in in
"Table 10-4. VBUS Regulator Main Characteristics". Since we have no
other documentation, let's use that value as the limit.

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -781,7 +781,12 @@
 &usb_otg_hs {
 	interface-type = <1>;
 	mode = <3>;
-	power = <50>;
+
+	/*
+	 * Max 300 mA steps based on similar PMIC MC13783UG.pdf "Table 10-4.
+	 * VBUS Regulator Main Characteristics". Binding uses 2 mA units.
+	 */
+	power = <150>;
 };
 
 &i2c4 {
-- 
2.23.0
