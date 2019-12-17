Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F83123B11
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 00:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfLQXrv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 18:47:51 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33448 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfLQXru (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 18:47:50 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHNlmxf123641;
        Tue, 17 Dec 2019 17:47:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576626468;
        bh=U05d7LZJRVvEL3Gttj/8aeTMezf1Mq8fFt4LuuHqwLw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y64ufrfctJEeqFJrYD1Rd2P5rL1y3Vw/mEW+4x3VTnI/3BEaUkFZYXNNmW241roZg
         5NuJQXHfZYSVMR5bXDQ/zc8njHYZ/A7lyVQsJdxC7Dm3B0pe2CT2r11pBI1YAdbKl1
         nRZ2rGMAS5gzx0AyaWc258nhv2J/CK8Zacw+V564=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHNlmlR007594;
        Tue, 17 Dec 2019 17:47:48 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 17:47:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 17:47:48 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHNlm9h009938;
        Tue, 17 Dec 2019 17:47:48 -0600
Received: from localhost ([10.250.79.55])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBHNllu27118;
        Tue, 17 Dec 2019 17:47:47 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v2 2/3] ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
Date:   Tue, 17 Dec 2019 18:47:44 -0500
Message-ID: <20191217234745.4434-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217234745.4434-1-afd@ti.com>
References: <20191217234745.4434-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This check and associated flag can be used to signal the presence
of OP-TEE on the platform. This can be used to determine which
SMC calls to make to perform secure operations.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/omap-secure.c | 14 ++++++++++++++
 arch/arm/mach-omap2/omap-secure.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
index e936732cdc4f..39d8070aede6 100644
--- a/arch/arm/mach-omap2/omap-secure.c
+++ b/arch/arm/mach-omap2/omap-secure.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
+#include <linux/of.h>
 
 #include <asm/cacheflush.h>
 #include <asm/memblock.h>
@@ -20,6 +21,18 @@
 
 static phys_addr_t omap_secure_memblock_base;
 
+bool optee_available;
+
+static void __init omap_optee_init_check(void)
+{
+	struct device_node *np;
+
+	np = of_find_node_by_path("/firmware/optee");
+	if (np && of_device_is_available(np))
+		optee_available = true;
+	of_node_put(np);
+}
+
 /**
  * omap_sec_dispatcher: Routine to dispatch low power secure
  * service routines
@@ -166,4 +179,5 @@ u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag)
 
 void __init omap_secure_init(void)
 {
+	omap_optee_init_check();
 }
diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 9aeeb236a224..78a1c4f04bbe 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -10,6 +10,8 @@
 #ifndef OMAP_ARCH_OMAP_SECURE_H
 #define OMAP_ARCH_OMAP_SECURE_H
 
+#include <linux/types.h>
+
 /* Monitor error code */
 #define  API_HAL_RET_VALUE_NS2S_CONVERSION_ERROR	0xFFFFFFFE
 #define  API_HAL_RET_VALUE_SERVICE_UNKNWON		0xFFFFFFFF
@@ -72,6 +74,7 @@ extern u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
 extern u32 rx51_secure_update_aux_cr(u32 set_bits, u32 clear_bits);
 extern u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag);
 
+extern bool optee_available;
 void omap_secure_init(void);
 
 #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
-- 
2.17.1

