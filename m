Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A72CEE9E4
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 21:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbfKDUjH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 15:39:07 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57096 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729194AbfKDUjH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Nov 2019 15:39:07 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kd2du126451;
        Mon, 4 Nov 2019 14:39:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572899942;
        bh=VoYslfXJH/dRezZ9Hx7G8CLZwxc7DT3fLk41RUrcppA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=j509z0JaMgFt2l13wTLQcI7IzImIWYLAlpAx5zt+/a6fUyqK2hOkzJdcFgzud6nAd
         Hg9+wA0DjfcNwbqRRmWOsvbxgAmmAix7YPajhIvppxedgrcMLcJvytcyHvUp2IWjG1
         RtSba+RsaR3a6b2C6CupVzw9ev12Zi1gTT3QM0Rs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4Kd1DL025299
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 14:39:02 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 14:38:46 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 14:39:00 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Kcl4q020670;
        Mon, 4 Nov 2019 14:39:00 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 5/5] media: ti-vpe: vpe: fix compatible to match bindings
Date:   Mon, 4 Nov 2019 14:38:41 -0600
Message-ID: <20191104203841.3628-6-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104203841.3628-1-bparrot@ti.com>
References: <20191104203841.3628-1-bparrot@ti.com>
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

