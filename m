Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0142E1E9A24
	for <lists+linux-omap@lfdr.de>; Sun, 31 May 2020 21:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgEaTkS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 31 May 2020 15:40:18 -0400
Received: from muru.com ([72.249.23.125]:56430 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728374AbgEaTkQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 31 May 2020 15:40:16 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3060481C2;
        Sun, 31 May 2020 19:41:06 +0000 (UTC)
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
Subject: [PATCH 4/5] bus: ti-sysc: Fix uninitialized framedonetv_irq
Date:   Sun, 31 May 2020 12:39:40 -0700
Message-Id: <20200531193941.13179-5-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531193941.13179-1-tony@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are currently only setting the framedonetv_irq disabled for the SoCs
that don't have it. But we are never setting it enabled for the SoCs that
have it. Let's initialized it to true by default.

Fixes: 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset quirk")
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1553,7 +1553,7 @@ static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
 	bool lcd_en, digit_en, lcd2_en = false, lcd3_en = false;
 	const int lcd_en_mask = BIT(0), digit_en_mask = BIT(1);
 	int manager_count;
-	bool framedonetv_irq;
+	bool framedonetv_irq = true;
 	u32 val, irq_mask = 0;
 
 	switch (sysc_soc->soc) {
@@ -1570,6 +1570,7 @@ static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
 		break;
 	case SOC_AM4:
 		manager_count = 1;
+		framedonetv_irq = false;
 		break;
 	case SOC_UNKNOWN:
 	default:
-- 
2.26.2
