Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7384A72EDD
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfGXM3j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 08:29:39 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:60519 "EHLO mx2.freebsd.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbfGXM3i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Jul 2019 08:29:38 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jul 2019 08:29:36 EDT
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mx1.freebsd.org", Issuer "Let's Encrypt Authority X3" (verified OK))
        by mx2.freebsd.org (Postfix) with ESMTPS id 58B996BAB9;
        Wed, 24 Jul 2019 12:23:44 +0000 (UTC)
        (envelope-from manu@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         server-signature RSA-PSS (4096 bits)
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "smtp.freebsd.org", Issuer "Let's Encrypt Authority X3" (verified OK))
        by mx1.freebsd.org (Postfix) with ESMTPS id AED8D77C79;
        Wed, 24 Jul 2019 12:23:43 +0000 (UTC)
        (envelope-from manu@freebsd.org)
Received: from localhost.localdomain (ip-9.net-89-3-105.rev.numericable.fr [89.3.105.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        (Authenticated sender: manu)
        by smtp.freebsd.org (Postfix) with ESMTPSA id 9E65A2BB04;
        Wed, 24 Jul 2019 12:23:42 +0000 (UTC)
        (envelope-from manu@freebsd.org)
From:   Emmanuel Vadot <manu@freebsd.org>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH 1/1] ARM: dts: am335x: Fix UARTs length
Date:   Wed, 24 Jul 2019 14:23:29 +0200
Message-Id: <20190724122329.21231-2-manu@freebsd.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724122329.21231-1-manu@freebsd.org>
References: <20190724122329.21231-1-manu@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AED8D77C79
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.94 / 15.00];
         TAGGED_RCPT(0.00)[dt];
         local_wl_from(0.00)[freebsd.org];
         NEURAL_HAM_SHORT(-0.94)[-0.940,0];
         NEURAL_HAM_MEDIUM(-1.00)[-1.000,0];
         ASN(0.00)[asn:11403, ipnet:96.47.64.0/20, country:US];
         NEURAL_HAM_LONG(-1.00)[-1.000,0]
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As seen on the AM335x TRM all the UARTs controller only are 0x1000 in size.
Fix this in the DTS.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index ced1a19d5f89..a20b04b72be4 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -185,7 +185,7 @@
 			uart0: serial@0 {
 				compatible = "ti,am3352-uart", "ti,omap3-uart";
 				clock-frequency = <48000000>;
-				reg = <0x0 0x2000>;
+				reg = <0x0 0x1000>;
 				interrupts = <72>;
 				status = "disabled";
 				dmas = <&edma 26 0>, <&edma 27 0>;
@@ -934,7 +934,7 @@
 			uart1: serial@0 {
 				compatible = "ti,am3352-uart", "ti,omap3-uart";
 				clock-frequency = <48000000>;
-				reg = <0x0 0x2000>;
+				reg = <0x0 0x1000>;
 				interrupts = <73>;
 				status = "disabled";
 				dmas = <&edma 28 0>, <&edma 29 0>;
@@ -966,7 +966,7 @@
 			uart2: serial@0 {
 				compatible = "ti,am3352-uart", "ti,omap3-uart";
 				clock-frequency = <48000000>;
-				reg = <0x0 0x2000>;
+				reg = <0x0 0x1000>;
 				interrupts = <74>;
 				status = "disabled";
 				dmas = <&edma 30 0>, <&edma 31 0>;
@@ -1614,7 +1614,7 @@
 			uart3: serial@0 {
 				compatible = "ti,am3352-uart", "ti,omap3-uart";
 				clock-frequency = <48000000>;
-				reg = <0x0 0x2000>;
+				reg = <0x0 0x1000>;
 				interrupts = <44>;
 				status = "disabled";
 			};
@@ -1644,7 +1644,7 @@
 			uart4: serial@0 {
 				compatible = "ti,am3352-uart", "ti,omap3-uart";
 				clock-frequency = <48000000>;
-				reg = <0x0 0x2000>;
+				reg = <0x0 0x1000>;
 				interrupts = <45>;
 				status = "disabled";
 			};
@@ -1674,7 +1674,7 @@
 			uart5: serial@0 {
 				compatible = "ti,am3352-uart", "ti,omap3-uart";
 				clock-frequency = <48000000>;
-				reg = <0x0 0x2000>;
+				reg = <0x0 0x1000>;
 				interrupts = <46>;
 				status = "disabled";
 			};
-- 
2.22.0

