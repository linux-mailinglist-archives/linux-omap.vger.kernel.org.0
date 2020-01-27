Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D095814AC71
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jan 2020 00:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgA0XNR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jan 2020 18:13:17 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42686 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgA0XNR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jan 2020 18:13:17 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RNCMVA097212;
        Mon, 27 Jan 2020 17:12:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580166742;
        bh=bKQSCmNpSLcE+a5C2ZLhKG/0UmrBoP1GypsxyYXuj6o=;
        h=From:To:CC:Subject:Date;
        b=wbmiqAwK/RYRFGbmeyGO2i6ZipRj4UABdpPRWkv98e5q4wSzSSmjFox3hMVM7roM2
         wghxQBV+MwUT6h3Rb2qu1p82nMLxxdaF3uELj05R+UciqXilxMgNUZzz6aUbmZm6vG
         f1ubK0U/Yw8okG0unma1/WIxcy6WJo0skGqocAMo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RNCMI3046211
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jan 2020 17:12:22 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 17:12:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 17:12:21 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RNCGJu042332;
        Mon, 27 Jan 2020 17:12:16 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 00RNCE302972;
        Mon, 27 Jan 2020 17:12:15 -0600 (CST)
From:   Suman Anna <s-anna@ti.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
Date:   Mon, 27 Jan 2020 17:12:08 -0600
Message-ID: <20200127231208.1443-1-s-anna@ti.com>
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
v2: Fix build warning reported by kbuild test bot
v1: https://patchwork.kernel.org/patch/11346363/

 drivers/mfd/syscon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index e22197c832e8..f0815d8e6e95 100644
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
2.23.0

