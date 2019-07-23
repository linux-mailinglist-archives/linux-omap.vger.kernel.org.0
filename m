Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0807A716FF
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 13:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389382AbfGWL2Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 07:28:25 -0400
Received: from muru.com ([72.249.23.125]:55630 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389379AbfGWL2Z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 07:28:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B6C4881E7;
        Tue, 23 Jul 2019 11:28:49 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] bus: ti-sysc: Fix handling of forced idle
Date:   Tue, 23 Jul 2019 04:28:06 -0700
Message-Id: <20190723112811.44381-4-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190723112811.44381-1-tony@atomide.com>
References: <20190723112811.44381-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For some devices we can get the following warning on boot:

ti-sysc 48485200.target-module: sysc_disable_module: invalid midlemode

Fix this by treating SYSC_IDLE_FORCE like we do for the other bits
for idlemodes mask.

Fixes: d59b60564cbf ("bus: ti-sysc: Add generic enable/disable functions")
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -949,7 +949,7 @@ static int sysc_best_idle_mode(u32 idlemodes, u32 *best_mode)
 		*best_mode = SYSC_IDLE_SMART_WKUP;
 	else if (idlemodes & BIT(SYSC_IDLE_SMART))
 		*best_mode = SYSC_IDLE_SMART;
-	else if (idlemodes & SYSC_IDLE_FORCE)
+	else if (idlemodes & BIT(SYSC_IDLE_FORCE))
 		*best_mode = SYSC_IDLE_FORCE;
 	else
 		return -EINVAL;
-- 
2.21.0
