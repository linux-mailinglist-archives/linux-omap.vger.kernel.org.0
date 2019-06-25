Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9293255C60
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 01:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfFYXdu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 19:33:50 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42720 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFYXdu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 19:33:50 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXM42125309;
        Tue, 25 Jun 2019 18:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561505602;
        bh=LYYsn6FVz3dICPC1xjcrf+g4cuqCw9FM0ggDi0G05Kc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sFwzpKbLCJ2IprsW6z9REMmMi1NEbB4UpkSJQIs2UhH6BkoY21nDhI9fofl1pQrAK
         Thv9NMcEjCWaZ8nDMjoXdLarfSV58pYF11YZONh/thO3m3YKNsERZEpL6aSvRbBl8B
         mZAFxV45y3dnRh2cqoWBfMgy6rgKr5766W0KPZcQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PNXLVu012960
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Jun 2019 18:33:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 25
 Jun 2019 18:33:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 25 Jun 2019 18:33:21 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PNXLjl084713;
        Tue, 25 Jun 2019 18:33:21 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x5PNXLm12247;
        Tue, 25 Jun 2019 18:33:21 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/5] bus: ti-sysc: Add missing kerneldoc comments
Date:   Tue, 25 Jun 2019 18:33:14 -0500
Message-ID: <20190625233315.22301-5-s-anna@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625233315.22301-1-s-anna@ti.com>
References: <20190625233315.22301-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A few fields in various structures is missing the corresponding
kerneldoc comments. Add them. Also, fixed the comment for sidlemodes.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/bus/ti-sysc.c                 | 7 +++++++
 include/linux/platform_data/ti-sysc.h | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 3030c9eadfb1..ccdd1f0871f9 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -54,15 +54,22 @@ static const char * const clock_names[SYSC_MAX_CLOCKS] = {
  * @module_size: size of the interconnect target module
  * @module_va: virtual address of the interconnect target module
  * @offsets: register offsets from module base
+ * @mdata: ti-sysc to hwmod translation data for a module
  * @clocks: clocks used by the interconnect target module
  * @clock_roles: clock role names for the found clocks
  * @nr_clocks: number of clocks used by the interconnect target module
+ * @rsts: resets used by the interconnect target module
  * @legacy_mode: configured for legacy mode if set
  * @cap: interconnect target module capabilities
  * @cfg: interconnect target module configuration
+ * @cookie: data used by legacy platform callbacks
  * @name: name if available
  * @revision: interconnect target module revision
+ * @enabled: sysc runtime enabled status
  * @needs_resume: runtime resume needed on resume from suspend
+ * @child_needs_resume: runtime resume needed for child on resume from suspend
+ * @disable_on_idle: status flag used for disabling modules with resets
+ * @idle_work: work structure used to perform delayed idle on a module
  * @clk_enable_quirk: module specific clock enable quirk
  * @clk_disable_quirk: module specific clock disable quirk
  * @reset_done_quirk: module specific reset done quirk
diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
index 7d009dc08a54..1a0905435b32 100644
--- a/include/linux/platform_data/ti-sysc.h
+++ b/include/linux/platform_data/ti-sysc.h
@@ -72,7 +72,7 @@ struct sysc_regbits {
 
 /**
  * struct sysc_capabilities - capabilities for an interconnect target module
- *
+ * @type: sysc type identifier for the module
  * @sysc_mask: bitmask of supported SYSCONFIG register bits
  * @regbits: bitmask of SYSCONFIG register bits
  * @mod_quirks: bitmask of module specific quirks
@@ -87,8 +87,9 @@ struct sysc_capabilities {
 /**
  * struct sysc_config - configuration for an interconnect target module
  * @sysc_val: configured value for sysc register
+ * @syss_mask: configured mask value for SYSSTATUS register
  * @midlemodes: bitmask of supported master idle modes
- * @sidlemodes: bitmask of supported master idle modes
+ * @sidlemodes: bitmask of supported slave idle modes
  * @srst_udelay: optional delay needed after OCP soft reset
  * @quirks: bitmask of enabled quirks
  */
-- 
2.21.0

