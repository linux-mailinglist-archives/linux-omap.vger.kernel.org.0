Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11259CA7A6
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 18:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391665AbfJCQzo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 12:55:44 -0400
Received: from muru.com ([72.249.23.125]:35240 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393170AbfJCQzn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Oct 2019 12:55:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 618E3809B;
        Thu,  3 Oct 2019 16:56:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: omap2plus_defconfig: Fix selected panels after generic panel changes
Date:   Thu,  3 Oct 2019 09:55:39 -0700
Message-Id: <20191003165539.50318-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The old omapdrm panels got removed for v5.4 in favor of generic panels,
and the Kconfig options changed. Let's update omap2plus_defconfig
accordingly so the same panels are still enabled.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/configs/omap2plus_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
 CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
 CONFIG_DRM_OMAP_PANEL_DPI=m
 CONFIG_DRM_OMAP_PANEL_DSI_CM=m
-CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
-CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
-CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=m
-CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
-CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
-CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_LG_LB035Q02=m
+CONFIG_DRM_PANEL_NEC_NL8048HL11=m
+CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
+CONFIG_DRM_PANEL_SONY_ACX565AKM=m
+CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
+CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
-- 
2.23.0
