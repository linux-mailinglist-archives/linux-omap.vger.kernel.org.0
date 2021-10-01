Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BAB41E868
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352546AbhJAHgU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhJAHgT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:36:19 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765E7C061775;
        Fri,  1 Oct 2021 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pu9otcE3Tas626r9dpyKMT0j05+0OvEiiyX+m782zl4=; b=CkueNRMqNJ5IJjHB4ptckPwqVe
        MxMPG5Bbx6/FWJPsEezrFaKcWYra4SnsvSs7Ws5deBf6uqaCVgqsEeAsDO3MpjyldotzzPw1xwVRz
        j6RzGdcruN5LczVJ5cOZSgNxQqC4aaDL352XI81wi2zMUU9swPbe0h+MF7jM13w7P6Us=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3u-00013X-Ml; Fri, 01 Oct 2021 09:34:30 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3u-00CBfg-7m; Fri, 01 Oct 2021 09:34:30 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        hns@goldelico.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 5/5] arm: dts: omap3-gta04: cleanup led node names
Date:   Fri,  1 Oct 2021 09:34:16 +0200
Message-Id: <20211001073416.2904733-6-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001073416.2904733-1-andreas@kemnade.info>
References: <20211001073416.2904733-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Change led node names to match schema.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index 61c0667864b3..7e3d8147e2c1 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -542,28 +542,29 @@ tca6507: tca6507@45 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		gta04_led0: red_aux@0 {
+		gta04_led0: led@0 {
 			label = "gta04:red:aux";
 			reg = <0x0>;
 		};
 
-		gta04_led1: green_aux@1 {
+		gta04_led1: led@1 {
 			label = "gta04:green:aux";
 			reg = <0x1>;
 		};
 
-		gta04_led3: red_power@3 {
+		gta04_led3: led@3 {
 			label = "gta04:red:power";
 			reg = <0x3>;
 			linux,default-trigger = "default-on";
 		};
 
-		gta04_led4: green_power@4 {
+		gta04_led4: led@4 {
 			label = "gta04:green:power";
 			reg = <0x4>;
 		};
 
-		wifi_reset: wifi_reset@6 { /* reference as <&tca_gpios 0 0> since it is currently the only GPIO */
+		wifi_reset: led@6 {
+			/* reference as <&tca_gpios 0 0> since it is currently the only GPIO */
 			reg = <0x6>;
 			compatible = "gpio";
 		};
-- 
2.30.2

