Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0A641E860
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352562AbhJAHgU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352536AbhJAHgT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:36:19 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EEDC06177B;
        Fri,  1 Oct 2021 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3O4R6BZeGP2JNzpOzTMgUeC+5bYWwX/x98EX33QX5CU=; b=aMzIMXwA7cbheobPgZL9SC9Uou
        WyAEwzn2pHjz+KoVsSZ+b+b/+bVnZBAQxN+g2QxXO2k9bq+G1yycZvrpxbulhYW+wd2SogbtSyJDm
        14yMs5cHNe90NvkopbdLAqOw7uH0tlzUORfarqpl6uQgvIFK+Gf0tBV/bEc7C7+INMHI=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3u-000139-0b; Fri, 01 Oct 2021 09:34:30 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3t-00CBfZ-HX; Fri, 01 Oct 2021 09:34:29 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        hns@goldelico.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 3/5] arm: dts: omap3-gta04a5: fix missing sensor supply
Date:   Fri,  1 Oct 2021 09:34:14 +0200
Message-Id: <20211001073416.2904733-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001073416.2904733-1-andreas@kemnade.info>
References: <20211001073416.2904733-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add mandatory supply properties. The supply is always on, so it is just
a syntax issue, no functional change.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap3-gta04a5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts b/arch/arm/boot/dts/omap3-gta04a5.dts
index 9ce8d81250aa..a2ba4030cf27 100644
--- a/arch/arm/boot/dts/omap3-gta04a5.dts
+++ b/arch/arm/boot/dts/omap3-gta04a5.dts
@@ -133,5 +133,7 @@ bmc150@12 {
 	bme280@76 {
 		compatible = "bosch,bme280";
 		reg = <0x76>;
+		vdda-supply = <&vio>;
+		vddd-supply = <&vio>;
 	};
 };
-- 
2.30.2

