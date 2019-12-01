Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706C810E2BB
	for <lists+linux-omap@lfdr.de>; Sun,  1 Dec 2019 18:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfLARPE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 1 Dec 2019 12:15:04 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:49546 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfLARPD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 1 Dec 2019 12:15:03 -0500
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 12:15:03 EST
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id EF74C15637; Sun,  1 Dec 2019 17:07:29 +0000 (GMT)
From:   Mans Rullgard <mans@mansr.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: am335x-sancloud-bbe: fix phy mode
Date:   Sun,  1 Dec 2019 17:07:06 +0000
Message-Id: <20191201170706.7173-1-mans@mansr.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The phy mode should be rgmii-id.  For some reason, it used to work with
rgmii-txid but doesn't any more.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/arm/boot/dts/am335x-sancloud-bbe.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index 8678e6e35493..e5fdb7abb0d5 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -108,7 +108,7 @@
 
 &cpsw_emac0 {
 	phy-handle = <&ethphy0>;
-	phy-mode = "rgmii-txid";
+	phy-mode = "rgmii-id";
 };
 
 &i2c0 {
-- 
2.24.0

