Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F422F2BF49
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 08:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbfE1GYZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 02:24:25 -0400
Received: from muru.com ([72.249.23.125]:51370 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727327AbfE1GYZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 02:24:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0642B80F3;
        Tue, 28 May 2019 06:24:43 +0000 (UTC)
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
Subject: [PATCH 02/13] bus: ti-sysc: Support 16-bit writes too
Date:   Mon, 27 May 2019 23:24:03 -0700
Message-Id: <20190528062414.27192-3-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528062414.27192-1-tony@atomide.com>
References: <20190528062414.27192-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to also support 16-bit writes for i2c in addition to the reads
when we start configuring the sysconfig register for reset and idle modes.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -100,6 +100,13 @@ static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
 
 static void sysc_write(struct sysc *ddata, int offset, u32 value)
 {
+	if (ddata->cfg.quirks & SYSC_QUIRK_16BIT) {
+		writew_relaxed(value & 0xffff, ddata->module_va + offset);
+		writew_relaxed(value >> 16, ddata->module_va + offset + 4);
+
+		return;
+	}
+
 	writel_relaxed(value, ddata->module_va + offset);
 }
 
-- 
2.21.0
