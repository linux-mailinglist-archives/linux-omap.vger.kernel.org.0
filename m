Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29380F1FBB
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 21:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732602AbfKFUYN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 15:24:13 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48162 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732234AbfKFUYL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 15:24:11 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6KO3VG123411;
        Wed, 6 Nov 2019 14:24:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573071843;
        bh=VoYslfXJH/dRezZ9Hx7G8CLZwxc7DT3fLk41RUrcppA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=iPZ9nctaByjTC+bwjosx/OHzKSvQc8nEHumJWob4H3o0AKzdnsDPzjIK6KgNVUgq4
         rkHO45MmfArYCX5DKbvC3DCCF3EYYaaGz6whjB2uW9b09zHomRATijJd4II14h8tEH
         pP3Y15Dtxv6SQYhndQRFxm1BP9ZlVJh5PsV96QV4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6KO2Cp015609
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Nov 2019 14:24:03 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 14:23:46 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 14:23:46 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6KNsiw119124;
        Wed, 6 Nov 2019 14:24:01 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 5/5] media: ti-vpe: vpe: fix compatible to match bindings
Date:   Wed, 6 Nov 2019 14:26:22 -0600
Message-ID: <20191106202622.2648-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106202622.2648-1-bparrot@ti.com>
References: <20191106202622.2648-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update the compatible string to match the updated bindings.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index b54f637633a7..65c2c048b018 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2644,7 +2644,7 @@ static int vpe_remove(struct platform_device *pdev)
 #if defined(CONFIG_OF)
 static const struct of_device_id vpe_of_match[] = {
 	{
-		.compatible = "ti,vpe",
+		.compatible = "ti,dra7-vpe",
 	},
 	{},
 };
-- 
2.17.1

