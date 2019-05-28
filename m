Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41ADD2BF4E
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfE1GYf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:35 -0400
Received: from muru.com ([72.249.23.125]:51402 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbfE1GYe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:34 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A9F2B8123;
        Tue, 28 May 2019 06:24:52 +0000 (UTC)
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
Subject: [PATCH 06/13] bus: ti-sysc: Handle clockactivity for enable and disable
Date:   Mon, 27 May 2019 23:24:07 -0700
Message-Id: <20190528062414.27192-7-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Modules with clockactivity need it configured during enable.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -845,6 +845,7 @@ static void sysc_show_registers(struct sysc *ddata)
 }
 
 #define SYSC_IDLE_MASK	(SYSC_NR_IDLEMODES - 1)
+#define SYSC_CLOCACT_ICK	2
 
 /* Caller needs to manage sysc_clkdm_deny_idle() and sysc_clkdm_allow_idle() */
 static int sysc_enable_module(struct device *dev)
@@ -860,6 +861,12 @@ static int sysc_enable_module(struct device *dev)
 	regbits = ddata->cap->regbits;
 	reg = sysc_read(ddata, ddata->offsets[SYSC_SYSCONFIG]);
 
+	/* Set CLOCKACTIVITY, we only use it for ick */
+	if (regbits->clkact_shift >= 0 &&
+	    (ddata->cfg.quirks & SYSC_QUIRK_USE_CLOCKACT ||
+	     ddata->cfg.sysc_val & BIT(regbits->clkact_shift)))
+		reg |= SYSC_CLOCACT_ICK << regbits->clkact_shift;
+
 	/* Set SIDLE mode */
 	idlemodes = ddata->cfg.sidlemodes;
 	if (!idlemodes || regbits->sidle_shift < 0)
-- 
2.21.0
