Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABBE185900
	for <lists+linux-omap@lfdr.de>; Sun, 15 Mar 2020 03:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgCOC31 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Mar 2020 22:29:27 -0400
Received: from muru.com ([72.249.23.125]:60440 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727671AbgCOC30 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Mar 2020 22:29:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 79A438385;
        Sat, 14 Mar 2020 21:44:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] ARM: omap2plus_defconfig: Update for moved and dropped options
Date:   Sat, 14 Mar 2020 14:43:28 -0700
Message-Id: <20200314214328.13342-7-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200314214328.13342-1-tony@atomide.com>
References: <20200314214328.13342-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like CONFIG_MTD_M25P80 no longer exists and the others just
move around the existing options. This makes it easier to create
patches against omap2plus_defconfig.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -142,7 +142,6 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_M25P80=m
 CONFIG_MTD_ONENAND=y
 CONFIG_MTD_ONENAND_VERIFY_WRITE=y
 CONFIG_MTD_ONENAND_OMAP2=y
@@ -191,10 +190,10 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_AT803X_PHY=y
 CONFIG_DP83848_PHY=y
 CONFIG_DP83867_PHY=y
 CONFIG_MICREL_PHY=y
+CONFIG_AT803X_PHY=y
 CONFIG_SMSC_PHY=y
 CONFIG_PPP=m
 CONFIG_PPP_BSDCOMP=m
@@ -363,13 +362,13 @@ CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
 CONFIG_DRM_OMAP_PANEL_DSI_CM=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_PANEL_SIMPLE=m
-CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_PANEL_LG_LB035Q02=m
 CONFIG_DRM_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
 CONFIG_DRM_PANEL_SONY_ACX565AKM=m
 CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
 CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
+CONFIG_DRM_TI_TFP410=m
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
@@ -563,10 +562,10 @@ CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
 CONFIG_PRINTK_TIME=y
+# CONFIG_DEBUG_BUGVERBOSE is not set
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_INFO_SPLIT=y
 CONFIG_DEBUG_INFO_DWARF4=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_SCHEDSTATS=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
-- 
2.25.1
