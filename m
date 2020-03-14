Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C701858FD
	for <lists+linux-omap@lfdr.de>; Sun, 15 Mar 2020 03:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCOC30 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Mar 2020 22:29:26 -0400
Received: from muru.com ([72.249.23.125]:60446 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727693AbgCOC30 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Mar 2020 22:29:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C84168202;
        Sat, 14 Mar 2020 21:44:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] ARM: omap2plus_defconfig: Enable zram as loadable modules
Date:   Sat, 14 Mar 2020 14:43:24 -0700
Message-Id: <20200314214328.13342-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200314214328.13342-1-tony@atomide.com>
References: <20200314214328.13342-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Enable zram as loadable modules. This allows mounting some part of
memory as swap on low memory devices.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -78,6 +78,8 @@ CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
 CONFIG_CMA=y
+CONFIG_ZSMALLOC=m
+CONFIG_PGTABLE_MAPPING=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -150,6 +152,8 @@ CONFIG_MTD_NAND_OMAP2=y
 CONFIG_MTD_NAND_OMAP_BCH=y
 CONFIG_MTD_SPI_NOR=m
 CONFIG_MTD_UBI=y
+CONFIG_ZRAM=m
+CONFIG_ZRAM_WRITEBACK=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=16384
-- 
2.25.1
