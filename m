Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C049E11CD67
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 13:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbfLLMsD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 07:48:03 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48794 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbfLLMsD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 07:48:03 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCClsoY107994;
        Thu, 12 Dec 2019 06:47:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576154874;
        bh=MQ3QAf8DC18YNgiP5+JogVGUzlLL6GHx/Hd//IFV084=;
        h=From:To:CC:Subject:Date;
        b=x12My7tUk+Kj4IIdhu0xhNnHp0LQvoBpkywcGGJCCDWm4ZzhPdxCnwjMqQAx4g8S/
         UFrAycQGpsbCp8hm3ioVrTN15xHVVdRYekRz9aWi5R7o1FXLFreXqdt4GHliNO/P/A
         EpAjg7k2X64q4pIb9NgvtkeZ59maSfZdSZelz7eg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCClsVZ073571
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 06:47:54 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 06:47:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 06:47:53 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCClpeK038513;
        Thu, 12 Dec 2019 06:47:52 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH] bus: ti-sysc: Drop MMU quirks
Date:   Thu, 12 Dec 2019 14:47:51 +0200
Message-ID: <20191212124751.3400-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The OMAP IOMMU driver no longer uses the pm_runtime_irq_safe() API
after commit 1432ebbd6003 ("iommu/omap: remove pm_runtime_irq_safe
flag for OMAP IOMMUs"), so the SYSC_QUIRK_LEGACY_IDLE quirk is no
longer needed for MMU devices. Drop the same.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/bus/ti-sysc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 56887c6877a7..1c74f38110ac 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1209,10 +1209,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
 	/* These drivers need to be fixed to not use pm_runtime_irq_safe() */
 	SYSC_QUIRK("gpio", 0, 0, 0x10, 0x114, 0x50600801, 0xffff00ff,
 		   SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_OPT_CLKS_IN_RESET),
-	SYSC_QUIRK("mmu", 0, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
-		   SYSC_QUIRK_LEGACY_IDLE),
-	SYSC_QUIRK("mmu", 0, 0, 0x10, 0x14, 0x00000030, 0xffffffff,
-		   SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("sham", 0, 0x100, 0x110, 0x114, 0x40000c03, 0xffffffff,
 		   SYSC_QUIRK_LEGACY_IDLE),
 	SYSC_QUIRK("smartreflex", 0, -1, 0x24, -1, 0x00000000, 0xffffffff,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
