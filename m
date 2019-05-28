Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A412BF3B
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfE1GYc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:32 -0400
Received: from muru.com ([72.249.23.125]:51394 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727461AbfE1GYb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:31 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8237980F3;
        Tue, 28 May 2019 06:24:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 05/13] bus: ti-sysc: Enable interconnect target module autoidle bit on enable
Date:   Mon, 27 May 2019 23:24:06 -0700
Message-Id: <20190528062414.27192-6-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For interconnect target modules with autoidle bit wired, we need to manage
it for enable and disable.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -879,7 +879,7 @@ static int sysc_enable_module(struct device *dev)
 	/* Set MIDLE mode */
 	idlemodes = ddata->cfg.midlemodes;
 	if (!idlemodes || regbits->midle_shift < 0)
-		return 0;
+		goto set_autoidle;
 
 	best_mode = fls(ddata->cfg.midlemodes) - 1;
 	if (best_mode > SYSC_IDLE_MASK) {
@@ -891,6 +891,14 @@ static int sysc_enable_module(struct device *dev)
 	reg |= best_mode << regbits->midle_shift;
 	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
 
+set_autoidle:
+	/* Autoidle bit must enabled separately if available */
+	if (regbits->autoidle_shift >= 0 &&
+	    ddata->cfg.sysc_val & BIT(regbits->autoidle_shift)) {
+		reg |= 1 << regbits->autoidle_shift;
+		sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
+	}
+
 	return 0;
 }
 
@@ -952,6 +960,9 @@ static int sysc_disable_module(struct device *dev)
 
 	reg &= ~(SYSC_IDLE_MASK << regbits->sidle_shift);
 	reg |= best_mode << regbits->sidle_shift;
+	if (regbits->autoidle_shift >= 0 &&
+	    ddata->cfg.sysc_val & BIT(regbits->autoidle_shift))
+		reg |= 1 << regbits->autoidle_shift;
 	sysc_write(ddata, ddata->offsets[SYSC_SYSCONFIG], reg);
 
 	return 0;
-- 
2.21.0
