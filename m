Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E5A303768
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 08:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbhAZHk4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 02:40:56 -0500
Received: from muru.com ([72.249.23.125]:52924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732915AbhAZHkb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 02:40:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A7B6B81A3;
        Tue, 26 Jan 2021 07:28:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] bus: ti-sysc: Fix initializing module_pa for modules without sysc register
Date:   Tue, 26 Jan 2021 09:28:33 +0200
Message-Id: <20210126072835.26551-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126072835.26551-1-tony@atomide.com>
References: <20210126072835.26551-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have interconnect target modules with no known registers using only
clocks and resets, but we still want to detect them based on the module
IO range. So let's call sysc_parse_and_check_child_range() earlier so we
have module_pa properly initialized.

Fixes: 2928135c93f8 ("bus: ti-sysc: Support modules without control registers")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -856,15 +856,15 @@ static int sysc_map_and_check_registers(struct sysc *ddata)
 	struct device_node *np = ddata->dev->of_node;
 	int error;
 
-	if (!of_get_property(np, "reg", NULL))
-		return 0;
-
 	error = sysc_parse_and_check_child_range(ddata);
 	if (error)
 		return error;
 
 	sysc_check_children(ddata);
 
+	if (!of_get_property(np, "reg", NULL))
+		return 0;
+
 	error = sysc_parse_registers(ddata);
 	if (error)
 		return error;
-- 
2.30.0
