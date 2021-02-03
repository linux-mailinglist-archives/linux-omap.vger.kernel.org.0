Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D192A30D900
	for <lists+linux-omap@lfdr.de>; Wed,  3 Feb 2021 12:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhBCLmc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Feb 2021 06:42:32 -0500
Received: from vm6.ganeti.dyne.org ([195.169.149.119]:57762 "EHLO
        vm6.ganeti.dyne.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234410AbhBCLmQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 3 Feb 2021 06:42:16 -0500
X-Greylist: delayed 383 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Feb 2021 06:42:16 EST
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: parazyd@dyne.org)
        with ESMTPSA id 16073F60C45
From:   Ivan Jelincic <parazyd@dyne.org>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Ivan Jelincic <parazyd@dyne.org>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
Date:   Wed,  3 Feb 2021 12:34:26 +0100
Message-Id: <20210203113426.18964-2-parazyd@dyne.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203113426.18964-1-parazyd@dyne.org>
References: <20210203113426.18964-1-parazyd@dyne.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on tupac3.dyne.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update omap2plus_defconfig for options that have been dropped:

- SIMPLE_PM_BUS no longer selected.
- MICREL_PHY no longer selected.

Signed-off-by: Ivan Jelincic <parazyd@dyne.org>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: parazyd <parazyd@dyne.org>
---
 arch/arm/configs/omap2plus_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 9847502d2c97..ac13cab9f69d 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -286,7 +286,6 @@ CONFIG_PCI_EPF_TEST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_OMAP_OCP2SCP=y
-CONFIG_SIMPLE_PM_BUS=y
 CONFIG_CONNECTOR=m
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
@@ -344,7 +343,6 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_MICREL_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_SMSC_PHY=y
 CONFIG_DP83848_PHY=y
-- 
2.30.0

