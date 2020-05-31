Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27471E9A26
	for <lists+linux-omap@lfdr.de>; Sun, 31 May 2020 21:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEaTkY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 31 May 2020 15:40:24 -0400
Received: from muru.com ([72.249.23.125]:56440 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgEaTkS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 31 May 2020 15:40:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0121B81DD;
        Sun, 31 May 2020 19:41:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] ARM: OMAP2+: Fix legacy mode dss_reset
Date:   Sun, 31 May 2020 12:39:41 -0700
Message-Id: <20200531193941.13179-6-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531193941.13179-1-tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We must check for "dss_core" instead of "dss" to avoid also matching
also "dss_dispc". This only matters for the mixed case of data
configured in device tree but with legacy booting ti,hwmods property
still enabled.

Fixes: 8b30919a4e3c ("ARM: OMAP2+: Handle reset quirks for dynamically allocated modules")
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -3489,7 +3489,7 @@ static const struct omap_hwmod_reset dra7_reset_quirks[] = {
 };
 
 static const struct omap_hwmod_reset omap_reset_quirks[] = {
-	{ .match = "dss", .len = 3, .reset = omap_dss_reset, },
+	{ .match = "dss_core", .len = 8, .reset = omap_dss_reset, },
 	{ .match = "hdq1w", .len = 5, .reset = omap_hdq1w_reset, },
 	{ .match = "i2c", .len = 3, .reset = omap_i2c_reset, },
 	{ .match = "wd_timer", .len = 8, .reset = omap2_wd_timer_reset, },
-- 
2.26.2
