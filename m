Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEA7298B6C
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772482AbgJZLLP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:11:15 -0400
Received: from muru.com ([72.249.23.125]:46554 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773143AbgJZLLM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:11:12 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3BC7B80AA;
        Mon, 26 Oct 2020 11:11:14 +0000 (UTC)
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 4/9] bus: ti-sysc: Support modules without control registers
Date:   Mon, 26 Oct 2020 13:10:44 +0200
Message-Id: <20201026111049.54835-5-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Some modules like MPU have a powerdomain and functional clock but not
necessarily any control registers. Let's allow configuring interconnect
target modules with no control registers.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -850,8 +850,12 @@ static int sysc_ioremap(struct sysc *ddata)
  */
 static int sysc_map_and_check_registers(struct sysc *ddata)
 {
+	struct device_node *np = ddata->dev->of_node;
 	int error;
 
+	if (!of_get_property(np, "reg", NULL))
+		return 0;
+
 	error = sysc_parse_and_check_child_range(ddata);
 	if (error)
 		return error;
@@ -2906,6 +2910,9 @@ static int sysc_probe(struct platform_device *pdev)
 	if (!ddata)
 		return -ENOMEM;
 
+	ddata->offsets[SYSC_REVISION] = -ENODEV;
+	ddata->offsets[SYSC_SYSCONFIG] = -ENODEV;
+	ddata->offsets[SYSC_SYSSTATUS] = -ENODEV;
 	ddata->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ddata);
 
-- 
2.29.1
