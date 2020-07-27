Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B4B22FB1A
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 23:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgG0VLM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 17:11:12 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38304 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0VLM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jul 2020 17:11:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06RLAL0p078832;
        Mon, 27 Jul 2020 16:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595884221;
        bh=TZF0KLe8ZtYIhI+Y7RD9A3jUdGCFtjvjRXhA9sWCJC0=;
        h=From:To:CC:Subject:Date;
        b=wZllyO6hSWcWeGADNdU65VAmZ/hWgRb5LA0T8CcniqsOwNVZWzlQzvEUNP1TqKKFY
         GLKeXYxvqMyNQmN/8nfYh5rE6tGW5JDR1KD7h1NbjU41DJRuo8bSry/4AvdzByf/ug
         7mIGV1NUoRbnqzfVkJcIhzm/weHyAlDOWsv7CAm8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06RLAKES124003;
        Mon, 27 Jul 2020 16:10:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Jul 2020 16:10:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Jul 2020 16:10:12 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06RLACrN062741;
        Mon, 27 Jul 2020 16:10:12 -0500
Received: from localhost ([10.250.34.248])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 06RLAC26125049;
        Mon, 27 Jul 2020 16:10:12 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [RESEND PATCH v2] mfd: syscon: Use a unique name with regmap_config
Date:   Mon, 27 Jul 2020 16:10:08 -0500
Message-ID: <20200727211008.24225-1-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DT node full name is currently being used in regmap_config
which in turn is used to create the regmap debugfs directories.
This name however is not guaranteed to be unique and the regmap
debugfs registration can fail in the cases where the syscon nodes
have the same unit-address but are present in different DT node
hierarchies. Replace this logic using the syscon reg resource
address instead (inspired from logic used while creating platform
devices) to ensure a unique name is given for each syscon.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Arnd,
Lee is looking for your review on this patch. Can you please
review and provide your comments.

This is a resend of the patch that was posted previously, rebased
now onto latest kernel.

v2: https://patchwork.kernel.org/patch/11353355/
 - Fix build warning reported by kbuild test bot
v1: https://patchwork.kernel.org/patch/11346363/

 drivers/mfd/syscon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 3a97816d0cba..75859e492984 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -101,12 +101,14 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_clk)
 		}
 	}
 
-	syscon_config.name = of_node_full_name(np);
+	syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
+				       (u64)res.start);
 	syscon_config.reg_stride = reg_io_width;
 	syscon_config.val_bits = reg_io_width * 8;
 	syscon_config.max_register = resource_size(&res) - reg_io_width;
 
 	regmap = regmap_init_mmio(NULL, base, &syscon_config);
+	kfree(syscon_config.name);
 	if (IS_ERR(regmap)) {
 		pr_err("regmap init failed\n");
 		ret = PTR_ERR(regmap);
-- 
2.26.0

