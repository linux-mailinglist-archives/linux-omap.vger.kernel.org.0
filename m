Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A519307A4C
	for <lists+linux-omap@lfdr.de>; Thu, 28 Jan 2021 17:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhA1QHi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Jan 2021 11:07:38 -0500
Received: from unicorn.mansr.com ([81.2.72.234]:50400 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231328AbhA1QHi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 Jan 2021 11:07:38 -0500
X-Greylist: delayed 574 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Jan 2021 11:07:36 EST
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:8d8e::3])
        by unicorn.mansr.com (Postfix) with ESMTPS id 4363815360;
        Thu, 28 Jan 2021 15:56:53 +0000 (GMT)
Received: by raven.mansr.com (Postfix, from userid 51770)
        id 3427121A3C6; Thu, 28 Jan 2021 15:56:53 +0000 (GMT)
From:   Mans Rullgard <mans@mansr.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: am33xx: add aliases for mmc interfaces
Date:   Thu, 28 Jan 2021 15:56:44 +0000
Message-Id: <20210128155644.6553-1-mans@mansr.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Without DT aliases, the numbering of mmc interfaces is unpredictable.
Adding them makes it possible to refer to devices consistently.  The
popular suggestion to use UUIDs obviously doesn't work with a blank
device fresh from the factory.

See fa2d0aa96941 "mmc: core: Allow setting slot index via device tree
alias" for more discussion.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 4c2298024137..f09a61cac2dc 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -40,6 +40,9 @@ aliases {
 		ethernet1 = &cpsw_emac1;
 		spi0 = &spi0;
 		spi1 = &spi1;
+		mmc0 = &mmc1;
+		mmc1 = &mmc2;
+		mmc2 = &mmc3;
 	};
 
 	cpus {
-- 
2.30.0

