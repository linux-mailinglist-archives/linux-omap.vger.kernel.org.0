Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A80141E863
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352571AbhJAHgV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352535AbhJAHgT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:36:19 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EAFC06177A;
        Fri,  1 Oct 2021 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dtTEwgP5Hrzc/KMh5UJ8m9SluQDmyqBBkmKLF0MZ14g=; b=CIOSQgVzJAl0zldyz4aU6JCajl
        I4VxS1dpRLfmTQBhVKwwrOYOEl9U0hvjH3tn3WkY4s1Q6BoBandE27QElpRPk52J8xq58yjbmGQz4
        rJS/8W3l/2JfYRKlz7rCJfYq3UsfEL2g63/em5WNT2d60qhoH/7FyUYTWr3ZBcZuA0CQ=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3u-00013J-By; Fri, 01 Oct 2021 09:34:30 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3t-00CBfc-TI; Fri, 01 Oct 2021 09:34:29 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        hns@goldelico.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 4/5] arm: dts: omap3-gta04a4: accelerometer irq fix
Date:   Fri,  1 Oct 2021 09:34:15 +0200
Message-Id: <20211001073416.2904733-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001073416.2904733-1-andreas@kemnade.info>
References: <20211001073416.2904733-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix typo in pinctrl. It did only work because the bootloader
seems to have initialized it.

Fixes: ee327111953b ("ARM: dts: omap3-gta04: Define and use bma180 irq pin")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index ca6c95b432b5..61c0667864b3 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -517,7 +517,7 @@ bma180@41 {
 		compatible = "bosch,bma180";
 		reg = <0x41>;
 		pinctrl-names = "default";
-		pintcrl-0 = <&bma180_pins>;
+		pinctrl-0 = <&bma180_pins>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <19 IRQ_TYPE_LEVEL_HIGH>; /* GPIO_115 */
 	};
-- 
2.30.2

