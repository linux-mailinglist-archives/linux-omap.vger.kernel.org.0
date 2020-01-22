Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B335145D1E
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2020 21:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgAVU2m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jan 2020 15:28:42 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37594 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgAVU2m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jan 2020 15:28:42 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MKRnCR003143;
        Wed, 22 Jan 2020 14:27:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579724869;
        bh=2FU5P01ZY091ON2H2bygulCb7TKRy/uYmsXy0jOAaA4=;
        h=From:To:CC:Subject:Date;
        b=ib6J3evVtYL8rgaM4RnzZ51gqsNYuhWPmtrnak8O4DC4ESrKjqStAq7vmLtIF2mRm
         UIz1ug8fLZ4QP2GWbJJG3PNXL/sRXA2fKqK73LZEFAFccDPbM9L+98UDMMR54Oo0B2
         77DbH170Dctx7eWvcxXeGXpxKz4cGVKZiXqy7bSw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MKRnsi088602
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jan 2020 14:27:49 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 14:27:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 14:27:49 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MKRnEr096008;
        Wed, 22 Jan 2020 14:27:49 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 00MKRm304964;
        Wed, 22 Jan 2020 14:27:48 -0600 (CST)
From:   Suman Anna <s-anna@ti.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH] mfd: syscon: Use a unique name with regmap_config
Date:   Wed, 22 Jan 2020 14:27:46 -0600
Message-ID: <20200122202746.30703-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
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
Hi Lee,

I ran into this issue while trying to add multiple different instances
of the same IP using the ti-sysc node hierarchy on OMAP.

Not sure if you prefer to consider this as a fix or as an improvement.
So, haven't added a Fixes tag.

regards
Suman

 drivers/mfd/syscon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index e22197c832e8..8915b35eef4f 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -101,12 +101,13 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_clk)
 		}
 	}
 
-	syscon_config.name = of_node_full_name(np);
+	syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np, res.start);
 	syscon_config.reg_stride = reg_io_width;
 	syscon_config.val_bits = reg_io_width * 8;
 	syscon_config.max_register = resource_size(&res) - reg_io_width;
 
 	regmap = regmap_init_mmio(NULL, base, &syscon_config);
+	kfree(syscon_config.name);
 	if (IS_ERR(regmap)) {
 		pr_err("regmap init failed\n");
 		ret = PTR_ERR(regmap);
-- 
2.23.0

