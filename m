Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7ED15D7E3
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 14:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbgBNNBK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 08:01:10 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:59484 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726191AbgBNNBK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 08:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ZstIGWVDJVfKLbnwGou4mM1u+YojrQNl9t84LNG+qvs=; b=YyqWrLlO4Pw1Bo1BPrPfJahbn4
        FWoAFeV0G9lBis41bm4fI2izTEumjDwgwRB/TSUFdf3bNpPm8gk6pOp4uoBHRoViSSJEeRxlTorA/
        eBLiFr6ERintYnJl+FoeYzms2Y4RRm3YQfn1MwJMSYULlC2inJNlnC5O5tMaT0jBIB8etuBLJwLkH
        uq7w9nrQf8aaRuLypz/f7QZUfbdPbJBRYelsyR8JS2YfIC82SFao0fl98UJzhaogZhkSu30RtCl6r
        cKF4IlQq/O9wtG1RBTR7ciSMs83mfD3XXJgFK9rjFYHImTjd129i0VIrqOlhuZKJnZTVijMv7d8yI
        BujPJoLA==;
Received: from kgpe-d16.fritz.box ([192.168.178.22])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j2aac-0002df-6c; Fri, 14 Feb 2020 13:01:02 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     merlijn@wizzup.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [RFC PATCH 2/2] ARM: dts: n900: remove mmc1 card detect gpio
Date:   Fri, 14 Feb 2020 14:02:48 +0100
Message-Id: <20200214130249.6845-3-merlijn@wizzup.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200214130249.6845-1-merlijn@wizzup.org>
References: <20200214130249.6845-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Instead, expose the key via the input framework, as SW_MACHINE_COVER
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

