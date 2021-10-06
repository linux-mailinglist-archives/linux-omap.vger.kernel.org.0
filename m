Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70C4423ADF
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 11:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237825AbhJFJvP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 05:51:15 -0400
Received: from muru.com ([72.249.23.125]:41442 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237996AbhJFJvP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 05:51:15 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 47E1A80E7;
        Wed,  6 Oct 2021 09:49:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/9] ARM: OMAP2+: Drop unused PRM defines for am3
Date:   Wed,  6 Oct 2021 12:49:11 +0300
Message-Id: <20211006094915.15339-6-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006094915.15339-1-tony@atomide.com>
References: <20211006094915.15339-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These are unused and should be handled by drivers/soc/ti/omap_prm.c
driver nowadays.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/prm33xx.h | 40 -----------------------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/arm/mach-omap2/prm33xx.h b/arch/arm/mach-omap2/prm33xx.h
--- a/arch/arm/mach-omap2/prm33xx.h
+++ b/arch/arm/mach-omap2/prm33xx.h
@@ -35,63 +35,27 @@
 #define AM33XX_PRM_GFX_MOD		0x1100
 #define AM33XX_PRM_CEFUSE_MOD		0x1200
 
-/* PRM */
-
-/* PRM.OCP_SOCKET_PRM register offsets */
-#define AM33XX_REVISION_PRM_OFFSET		0x0000
-#define AM33XX_REVISION_PRM			AM33XX_PRM_REGADDR(AM33XX_PRM_OCP_SOCKET_MOD, 0x0000)
-#define AM33XX_PRM_IRQSTATUS_MPU_OFFSET		0x0004
-#define AM33XX_PRM_IRQSTATUS_MPU		AM33XX_PRM_REGADDR(AM33XX_PRM_OCP_SOCKET_MOD, 0x0004)
-#define AM33XX_PRM_IRQENABLE_MPU_OFFSET		0x0008
-#define AM33XX_PRM_IRQENABLE_MPU		AM33XX_PRM_REGADDR(AM33XX_PRM_OCP_SOCKET_MOD, 0x0008)
-#define AM33XX_PRM_IRQSTATUS_M3_OFFSET		0x000c
-#define AM33XX_PRM_IRQSTATUS_M3			AM33XX_PRM_REGADDR(AM33XX_PRM_OCP_SOCKET_MOD, 0x000c)
-#define AM33XX_PRM_IRQENABLE_M3_OFFSET		0x0010
-#define AM33XX_PRM_IRQENABLE_M3			AM33XX_PRM_REGADDR(AM33XX_PRM_OCP_SOCKET_MOD, 0x0010)
-
 /* PRM.PER_PRM register offsets */
-#define AM33XX_RM_PER_RSTCTRL_OFFSET		0x0000
-#define AM33XX_RM_PER_RSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_PER_MOD, 0x0000)
 #define AM33XX_PM_PER_PWRSTST_OFFSET		0x0008
 #define AM33XX_PM_PER_PWRSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_PER_MOD, 0x0008)
 #define AM33XX_PM_PER_PWRSTCTRL_OFFSET		0x000c
 #define AM33XX_PM_PER_PWRSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_PER_MOD, 0x000c)
 
 /* PRM.WKUP_PRM register offsets */
-#define AM33XX_RM_WKUP_RSTCTRL_OFFSET		0x0000
-#define AM33XX_RM_WKUP_RSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_WKUP_MOD, 0x0000)
 #define AM33XX_PM_WKUP_PWRSTCTRL_OFFSET		0x0004
 #define AM33XX_PM_WKUP_PWRSTCTRL		AM33XX_PRM_REGADDR(AM33XX_PRM_WKUP_MOD, 0x0004)
 #define AM33XX_PM_WKUP_PWRSTST_OFFSET		0x0008
 #define AM33XX_PM_WKUP_PWRSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_WKUP_MOD, 0x0008)
-#define AM33XX_RM_WKUP_RSTST_OFFSET		0x000c
-#define AM33XX_RM_WKUP_RSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_WKUP_MOD, 0x000c)
 
 /* PRM.MPU_PRM register offsets */
 #define AM33XX_PM_MPU_PWRSTCTRL_OFFSET		0x0000
 #define AM33XX_PM_MPU_PWRSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_MPU_MOD, 0x0000)
 #define AM33XX_PM_MPU_PWRSTST_OFFSET		0x0004
 #define AM33XX_PM_MPU_PWRSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_MPU_MOD, 0x0004)
-#define AM33XX_RM_MPU_RSTST_OFFSET		0x0008
-#define AM33XX_RM_MPU_RSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_MPU_MOD, 0x0008)
 
 /* PRM.DEVICE_PRM register offsets */
 #define AM33XX_PRM_RSTCTRL_OFFSET		0x0000
 #define AM33XX_PRM_RSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x0000)
-#define AM33XX_PRM_RSTTIME_OFFSET		0x0004
-#define AM33XX_PRM_RSTTIME			AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x0004)
-#define AM33XX_PRM_RSTST_OFFSET			0x0008
-#define AM33XX_PRM_RSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x0008)
-#define AM33XX_PRM_SRAM_COUNT_OFFSET		0x000c
-#define AM33XX_PRM_SRAM_COUNT			AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x000c)
-#define AM33XX_PRM_LDO_SRAM_CORE_SETUP_OFFSET	0x0010
-#define AM33XX_PRM_LDO_SRAM_CORE_SETUP		AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x0010)
-#define AM33XX_PRM_LDO_SRAM_CORE_CTRL_OFFSET	0x0014
-#define AM33XX_PRM_LDO_SRAM_CORE_CTRL		AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x0014)
-#define AM33XX_PRM_LDO_SRAM_MPU_SETUP_OFFSET	0x0018
-#define AM33XX_PRM_LDO_SRAM_MPU_SETUP		AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x0018)
-#define AM33XX_PRM_LDO_SRAM_MPU_CTRL_OFFSET	0x001c
-#define AM33XX_PRM_LDO_SRAM_MPU_CTRL		AM33XX_PRM_REGADDR(AM33XX_PRM_DEVICE_MOD, 0x001c)
 
 /* PRM.RTC_PRM register offsets */
 #define AM33XX_PM_RTC_PWRSTCTRL_OFFSET		0x0000
@@ -102,12 +66,8 @@
 /* PRM.GFX_PRM register offsets */
 #define AM33XX_PM_GFX_PWRSTCTRL_OFFSET		0x0000
 #define AM33XX_PM_GFX_PWRSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_GFX_MOD, 0x0000)
-#define AM33XX_RM_GFX_RSTCTRL_OFFSET		0x0004
-#define AM33XX_RM_GFX_RSTCTRL			AM33XX_PRM_REGADDR(AM33XX_PRM_GFX_MOD, 0x0004)
 #define AM33XX_PM_GFX_PWRSTST_OFFSET		0x0010
 #define AM33XX_PM_GFX_PWRSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_GFX_MOD, 0x0010)
-#define AM33XX_RM_GFX_RSTST_OFFSET		0x0014
-#define AM33XX_RM_GFX_RSTST			AM33XX_PRM_REGADDR(AM33XX_PRM_GFX_MOD, 0x0014)
 
 /* PRM.CEFUSE_PRM register offsets */
 #define AM33XX_PM_CEFUSE_PWRSTCTRL_OFFSET	0x0000
-- 
2.33.0
