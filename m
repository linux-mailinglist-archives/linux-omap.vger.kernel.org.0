Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EA81E9A28
	for <lists+linux-omap@lfdr.de>; Sun, 31 May 2020 21:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgEaTk2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 31 May 2020 15:40:28 -0400
Received: from muru.com ([72.249.23.125]:56414 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728355AbgEaTkO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 31 May 2020 15:40:14 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6B22E814F;
        Sun, 31 May 2020 19:41:04 +0000 (UTC)
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
Subject: [PATCH 3/5] bus: ti-sysc: Ignore clockactivity unless specified as a quirk
Date:   Sun, 31 May 2020 12:39:39 -0700
Message-Id: <20200531193941.13179-4-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531193941.13179-1-tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We must ignore the clockactivity bit for most modules and not set it
unless specified for the module with SYSC_QUIRK_USE_CLOCKACT. Otherwise
the interface clock can be automatically gated constantly causing
unexpected performance issues.

Fixes: ae9ae12e9daa ("bus: ti-sysc: Handle clockactivity for enable and disable")
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -989,10 +989,13 @@ static int sysc_enable_module(struct device *dev)
 	regbits = ddata->cap->regbits;
 	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
 
-	/* Set CLOCKACTIVITY, we only use it for ick */
+	/*
+	 * Set CLOCKACTIVITY, we only use it for ick. And we only configure it
+	 * based on the SYSC_QUIRK_USE_CLOCKACT flag, not based on the hardware
+	 * capabilities. See the old HWMOD_SET_DEFAULT_CLOCKACT flag.
+	 */
 	if (regbits->clkact_shift >= 0 &&
-	    (ddata->cfg.quirks & SYSC_QUIRK_USE_CLOCKACT ||
-	     ddata->cfg.sysc_val & BIT(regbits->clkact_shift)))
+	    (ddata->cfg.quirks & SYSC_QUIRK_USE_CLOCKACT))
 		reg |= SYSC_CLOCACT_ICK << regbits->clkact_shift;
 
 	/* Set SIDLE mode */
-- 
2.26.2
