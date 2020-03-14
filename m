Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FA9185903
	for <lists+linux-omap@lfdr.de>; Sun, 15 Mar 2020 03:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbgCOC31 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Mar 2020 22:29:27 -0400
Received: from muru.com ([72.249.23.125]:60438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727665AbgCOC30 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Mar 2020 22:29:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2C709827D;
        Sat, 14 Mar 2020 21:44:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/7] ARM: omap2plus_defconfig: Enable McPDM optional PMIC clock as modules
Date:   Sat, 14 Mar 2020 14:43:26 -0700
Message-Id: <20200314214328.13342-5-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200314214328.13342-1-tony@atomide.com>
References: <20200314214328.13342-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The McPDM module is only usable on hardware where it's module clock
is wired to the PMIC. Let's enable the optional PMIC module clocks
for this so boards can use McPDM.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -488,6 +488,8 @@ CONFIG_RTC_DRV_PALMAS=m
 CONFIG_RTC_DRV_OMAP=m
 CONFIG_RTC_DRV_CPCAP=m
 CONFIG_DMADEVICES=y
+CONFIG_CLK_TWL6040=m
+CONFIG_COMMON_CLK_PALMAS=m
 CONFIG_OMAP_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_OMAP_REMOTEPROC=m
-- 
2.25.1
