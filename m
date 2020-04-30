Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440F21C041F
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 19:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgD3Rqj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 13:46:39 -0400
Received: from muru.com ([72.249.23.125]:52352 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726850AbgD3Rqf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 13:46:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CCA0E81B3;
        Thu, 30 Apr 2020 17:47:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 6/6] ARM: dts: omap4-droid4: Configure modem for serdev-ngsm
Date:   Thu, 30 Apr 2020 10:46:15 -0700
Message-Id: <20200430174615.41185-7-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's enable the TS 27.010 /dev/gsmmux* interfaces via Linux n_gsm that
can be used for voice calls and SMS with commands using a custom Motorola
format.

And let's also enable the kernel GNSS driver via serdev-ngsm that uses a
dedicated TS 27.010 channel.

Note that voice call audio mixer is not supported yet.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -702,6 +702,20 @@ &uart1 {
 			       &omap4_pmx_core 0x110>;
 	uart-has-rtscts;
 	current-speed = <115200>;
+
+	modem {
+		compatible = "motorola,mapphone-mdm6600-serial";
+		ttymask = <0 0x00001fee>;
+		phys = <&fsusb1_phy>;
+		phy-names = "usb";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gnss@4 {
+			compatible = "motorola,mapphone-mdm6600-gnss";
+			reg = <4>;
+		};
+	};
 };
 
 &uart3 {
-- 
2.26.2
