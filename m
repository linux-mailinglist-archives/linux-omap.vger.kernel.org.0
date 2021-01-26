Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B1E303CE6
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 13:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404605AbhAZMXJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:23:09 -0500
Received: from muru.com ([72.249.23.125]:53302 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404743AbhAZMWp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 07:22:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B99A7814C;
        Tue, 26 Jan 2021 12:22:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options
Date:   Tue, 26 Jan 2021 14:21:58 +0200
Message-Id: <20210126122158.33761-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126122158.33761-1-tony@atomide.com>
References: <20210126122158.33761-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update omap2plus_defconfig for the following options that got dropped:

- We have now default y for MEMCG_SWAP and SECCOMP with the options
  already in omap2plus_defconfig

- The ZBOOT_ROM values now default to 0

- ARM_TI_CPUFREQ no longer exists and we're using the generic driver
  now that selects DT_IDLE_STATES

- POWER_AVS option no longer exists

- The MEDIA and VIDEO related options are now selected when we have
  CONFIG_MEDIA_SUPPORT_FILTER not set

- CEC_PLATFORM_DRIVERS no longer exists

- MEDIA_SUBDRV_AUTOSELECT is not selected by default

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -10,7 +10,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
@@ -40,9 +39,6 @@ CONFIG_ARM_THUMBEE=y
 CONFIG_ARM_ERRATA_411920=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
-CONFIG_SECCOMP=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
@@ -54,10 +50,8 @@ CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPUFREQ_DT=m
 # CONFIG_ARM_OMAP2PLUS_CPUFREQ is not set
-CONFIG_ARM_TI_CPUFREQ=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
-CONFIG_DT_IDLE_STATES=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_PM_DEBUG=y
 CONFIG_ARM_CRYPTO=y
@@ -296,7 +290,6 @@ CONFIG_GPIO_TWL4030=y
 CONFIG_W1=m
 CONFIG_HDQ_MASTER_OMAP=m
 CONFIG_W1_SLAVE_DS250X=m
-CONFIG_POWER_AVS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_BQ27XXX=m
@@ -354,14 +347,8 @@ CONFIG_IR_RX51=m
 CONFIG_IR_GPIO_TX=m
 CONFIG_IR_PWM_TX=m
 CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_MEDIA_CEC_SUPPORT=y
-CONFIG_MEDIA_CONTROLLER=y
-CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_OMAP3=m
-CONFIG_CEC_PLATFORM_DRIVERS=y
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_TVP5150=m
 CONFIG_VIDEO_MT9P031=m
 CONFIG_DRM=m
-- 
2.30.0
