Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15D21FE80
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 06:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfEPEb7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 00:31:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55444 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfEPEb6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 00:31:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4G4VvKC098992;
        Wed, 15 May 2019 23:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557981117;
        bh=tomAEVW09aS7VAWn8WzMpeufFkO5eeZW8IclJMS7NyI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=R4hx2PI6QFctP74WvzhoY3AK/m6hfvH/9P8lATmc5EU6qfutdxmnbtUL3U9dHwnwB
         /YXfw9ZHW7vbtZhBNi37imEMf9YIVZgihbtqLHs/N3px/PIXhOZNF2krG52XH28bNR
         dkJoExaCsW4yp+ZpfnVAj9SR8VF12zIdX9Ku5vOQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4G4VubN042224
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 May 2019 23:31:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 15
 May 2019 23:31:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 15 May 2019 23:31:56 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4G4Vmin094857;
        Wed, 15 May 2019 23:31:54 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 2/3] mfd: lp87565: Add support for 4-phase lp87561 combination
Date:   Thu, 16 May 2019 10:02:17 +0530
Message-ID: <20190516043218.8222-3-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516043218.8222-1-j-keerthy@ti.com>
References: <20190516043218.8222-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for 4-phase lp87561 combination.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/mfd/lp87565.c       | 4 ++++
 include/linux/mfd/lp87565.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index 32d2a07d4354..8ad688fe75f9 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -33,6 +33,10 @@ static const struct of_device_id of_lp87565_match_table[] = {
 		.compatible = "ti,lp87565-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87565_Q1,
 	},
+	{
+		.compatible = "ti,lp87561-q1",
+		.data = (void *)LP87565_DEVICE_TYPE_LP87561_Q1,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_lp87565_match_table);
diff --git a/include/linux/mfd/lp87565.h b/include/linux/mfd/lp87565.h
index d0c91ba65525..976447607ea2 100644
--- a/include/linux/mfd/lp87565.h
+++ b/include/linux/mfd/lp87565.h
@@ -17,6 +17,7 @@
 
 enum lp87565_device_type {
 	LP87565_DEVICE_TYPE_UNKNOWN	= 0,
+	LP87565_DEVICE_TYPE_LP87561_Q1,
 	LP87565_DEVICE_TYPE_LP87565_Q1,
 };
 
@@ -249,6 +250,7 @@ enum LP87565_regulator_id {
 	LP87565_BUCK_3,
 	LP87565_BUCK_10,
 	LP87565_BUCK_23,
+	LP87565_BUCK_3210,
 };
 
 /**
-- 
2.17.1

