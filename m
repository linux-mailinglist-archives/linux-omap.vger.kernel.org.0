Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C5E2C9881
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgLAHrd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:47:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgLAHrc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 02:47:32 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8B8C0613CF;
        Mon, 30 Nov 2020 23:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=shdMYNE0Mq9qFYvxyoeGFa2qNxlUtzdlvQ2JRBwtIgs=; b=lu93fcP9H5sEyrH+ZY6uOUfVQB
        /SMPcunpSi+4ioQUgFSp5XJYFu8ndKSNM9cqgLkVYuiAfCg0CohPYVbxRcl6rzPLK5xT3DqIHETFG
        ET0kSx2vqIHr8+cNKmTL1l0mEu1TW5FKu/V0WoXDWHYK1M6T5bLqHtDP7g7eXhOKDVoE=;
Received: from p200300ccff124e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:4e00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kk0N4-0005jJ-8T; Tue, 01 Dec 2020 08:46:46 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1kk0N3-00057S-Sq; Tue, 01 Dec 2020 08:46:45 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: dts: omap3-gta04: fix twl4030-power settings
Date:   Tue,  1 Dec 2020 08:46:28 +0100
Message-Id: <20201201074628.19628-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Things are wired up for powersaving, so lets use the corresponding
compatible and also update a deprecated property name.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index c8745bc800f7..cbe9ce739170 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -489,8 +489,8 @@
 		};
 
 		twl_power: power {
-			compatible = "ti,twl4030-power";
-			ti,use_poweroff;
+			compatible = "ti,twl4030-power-idle";
+			ti,system-power-controller;
 		};
 	};
 };
-- 
2.20.1

