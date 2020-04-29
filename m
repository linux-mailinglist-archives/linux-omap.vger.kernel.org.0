Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E031BE0F1
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgD2Oa0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:30:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53946 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgD2Oa0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:30:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEUKOx098722;
        Wed, 29 Apr 2020 09:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588170620;
        bh=nVCV7GPPDR3vDlWCebMxkjIcsvNpW4Hi/TEQD5iWzEE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vTh3nJn3+idbSELh56lIzPb4ZkJ9OQzOV3q89DeCiRTS/SCnmtO9tvj5LfGQpDRoU
         Xntk5cHnAUJ+oP3XlbT1N/eJP/bAxYIU6quZ8wrbN7R2OpgXG04s+ZAFnBTAkS6QGT
         gVFoI9cfBpM56F8FIFOGBR9kFLhEs7+QmkT29Wn4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEUHqX055015
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:30:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:30:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:30:17 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU54s010784;
        Wed, 29 Apr 2020 09:30:16 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 8/8] ARM: OMAP5: Make L4SEC clock domain SWSUP only
Date:   Wed, 29 Apr 2020 17:30:02 +0300
Message-ID: <20200429143002.5050-9-t-kristo@ti.com>
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
experimentation similar issue exists on OMAP5, so do the same change
for OMAP5 also.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/clockdomains54xx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/clockdomains54xx_data.c b/arch/arm/mach-omap2/clockdomains54xx_data.c
index 3ab41fc89dd3..5611e08018a2 100644
--- a/arch/arm/mach-omap2/clockdomains54xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains54xx_data.c
@@ -170,7 +170,7 @@ static struct clockdomain l4sec_54xx_clkdm = {
 	.dep_bit	  = OMAP54XX_L4SEC_STATDEP_SHIFT,
 	.wkdep_srcs	  = l4sec_wkup_sleep_deps,
 	.sleepdep_srcs	  = l4sec_wkup_sleep_deps,
-	.flags		  = CLKDM_CAN_HWSUP_SWSUP,
+	.flags		  = CLKDM_CAN_SWSUP,
 };
 
 static struct clockdomain iva_54xx_clkdm = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
