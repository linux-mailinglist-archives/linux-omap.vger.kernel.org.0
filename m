Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40D31BE0F2
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgD2Oa0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:30:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53948 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgD2Oa0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:30:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEUGjf098716;
        Wed, 29 Apr 2020 09:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588170616;
        bh=i4nxys67IrBGJmeZqHzLnjDvYm4CubsYfNKisa2LT9g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QmTfaj5aVGqy8JbeAXA0XcCX6iqqBL1PRqfnuwJKARW4PFyoELBC0iQLS8zOIzz6+
         Tk5auPe6q3/9ZFeZUiwRLuoiLRNEO5+vlR1D5xq8pzySzCjh3SPnDPJOw5TC+Qx7D5
         5omZZXY4JxNlF1oBX20BqG0V9VG3yq4ta5fH6T/A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEUGww122297;
        Wed, 29 Apr 2020 09:30:16 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:30:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:30:16 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU54r010784;
        Wed, 29 Apr 2020 09:30:15 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 7/8] ARM: OMAP4: Make L4SEC clock domain SWSUP only
Date:   Wed, 29 Apr 2020 17:30:01 +0300
Message-ID: <20200429143002.5050-8-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429143002.5050-1-t-kristo@ti.com>
References: <20200429143002.5050-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit c2ce5fb3f3f5 ('ARM: OMAP: DRA7xx: Make L4SEC clock domain SWSUP
only') made DRA7 SoC L4SEC clock domain SWSUP only because of power
state transition issues detected with HWSUP mode. Based on
experimentation similar issue exists on OMAP4, so do the same change
for OMAP4 also.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/clockdomains44xx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/clockdomains44xx_data.c b/arch/arm/mach-omap2/clockdomains44xx_data.c
index 6005c4ed3bc6..8285be7c1eab 100644
--- a/arch/arm/mach-omap2/clockdomains44xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains44xx_data.c
@@ -214,7 +214,7 @@ static struct clockdomain l4_secure_44xx_clkdm = {
 	.dep_bit	  = OMAP4430_L4SEC_STATDEP_SHIFT,
 	.wkdep_srcs	  = l4_secure_wkup_sleep_deps,
 	.sleepdep_srcs	  = l4_secure_wkup_sleep_deps,
-	.flags		  = CLKDM_CAN_HWSUP_SWSUP,
+	.flags		  = CLKDM_CAN_SWSUP,
 };
 
 static struct clockdomain l4_per_44xx_clkdm = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
