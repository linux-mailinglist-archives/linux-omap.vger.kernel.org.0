Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74910330D5F
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 13:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhCHMV5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 07:21:57 -0500
Received: from muru.com ([72.249.23.125]:40814 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231834AbhCHMVj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 07:21:39 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 83E11819C;
        Mon,  8 Mar 2021 12:22:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 4/4] bus: ti-sysc: Check for old incomplete dtb
Date:   Mon,  8 Mar 2021 14:21:18 +0200
Message-Id: <20210308122118.62460-5-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122118.62460-1-tony@atomide.com>
References: <20210308122118.62460-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's be nice and show an error on the SoCs about old imcomplete devicetree
if the dtb is still using "simple-bus" instead of "simple-pm-bus" for the
root OCP node.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2858,6 +2858,7 @@ static int sysc_init_soc(struct sysc *ddata)
 	const struct soc_device_attribute *match;
 	struct ti_sysc_platform_data *pdata;
 	unsigned long features = 0;
+	struct device_node *np;
 
 	if (sysc_soc)
 		return 0;
@@ -2878,6 +2879,21 @@ static int sysc_init_soc(struct sysc *ddata)
 	if (match && match->data)
 		sysc_soc->soc = (int)match->data;
 
+	/*
+	 * Check and warn about possible old incomplete dtb. We now want to see
+	 * simple-pm-bus instead of simple-bus in the dtb for genpd using SoCs.
+	 */
+	switch (sysc_soc->soc) {
+	case SOC_AM3:
+	case SOC_AM4:
+		np = of_find_node_by_path("/ocp");
+		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
+			  "ti-sysc: Incomplete old dtb, please update\n");
+		break;
+	default:
+		break;
+	}
+
 	/* Ignore devices that are not available on HS and EMU SoCs */
 	if (!sysc_soc->general_purpose) {
 		switch (sysc_soc->soc) {
-- 
2.30.1
