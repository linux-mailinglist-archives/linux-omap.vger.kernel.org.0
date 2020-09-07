Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC95725FF1E
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 18:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbgIGQ2F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 12:28:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53916 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729905AbgIGOcx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 10:32:53 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087EVujc015802;
        Mon, 7 Sep 2020 09:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599489116;
        bh=vSX2SLuTk0cAacN2wnopN/GO0s/2FaryB38zuY2OUQw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Dprr/PdyQCskZDYmd0/cJ+hbQ/mqcgP3JNL70Iq0CTl8DWVxjHXrTSYLOOGiLTzzK
         h14eozt3QFZYAmDXWX+bBg5Ae6S0u0pVUf6TyezJ5CjiXxfk5ieQVcDRBAh6qEv88m
         HpGboZJNYsXkQ72paQnm7T4N/gkEWz9C4m6Zwha8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087EVuZh001425;
        Mon, 7 Sep 2020 09:31:56 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 09:31:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 09:31:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087EVtvu106496;
        Mon, 7 Sep 2020 09:31:55 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     "David S. Miller" <davem@davemloft.net>, <netdev@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>
CC:     Sekhar Nori <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next v2 6/9] net: ethernet: ti: ale: make usage of ale dev_id mandatory
Date:   Mon, 7 Sep 2020 17:31:40 +0300
Message-ID: <20200907143143.13735-7-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907143143.13735-1-grygorii.strashko@ti.com>
References: <20200907143143.13735-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hence all existing driver updated to use ALE dev_id the usage of ale dev_id
can be made mandatory and cpsw_ale_create() can be updated to use
"features" property from ALE static configuration.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c | 28 +++++++++++++---------------
 drivers/net/ethernet/ti/cpsw_ale.h |  1 +
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 766197003971..524920a4bff0 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -83,7 +83,6 @@ struct cpsw_ale_dev_id {
 
 #define ALE_TABLE_SIZE_MULTIPLIER	1024
 #define ALE_STATUS_SIZE_MASK		0x1f
-#define ALE_TABLE_SIZE_DEFAULT		64
 
 static inline int cpsw_ale_get_field(u32 *ale_entry, u32 start, u32 bits)
 {
@@ -1060,11 +1059,12 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 	u32 rev, ale_entries;
 
 	ale_dev_id = cpsw_ale_match_id(cpsw_ale_id_match, params->dev_id);
-	if (ale_dev_id) {
-		params->ale_entries = ale_dev_id->tbl_entries;
-		params->major_ver_mask = ale_dev_id->major_ver_mask;
-		params->nu_switch_ale = ale_dev_id->nu_switch_ale;
-	}
+	if (!ale_dev_id)
+		return ERR_PTR(-EINVAL);
+
+	params->ale_entries = ale_dev_id->tbl_entries;
+	params->major_ver_mask = ale_dev_id->major_ver_mask;
+	params->nu_switch_ale = ale_dev_id->nu_switch_ale;
 
 	ale = devm_kzalloc(params->dev, sizeof(*ale), GFP_KERNEL);
 	if (!ale)
@@ -1079,6 +1079,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 
 	ale->params = *params;
 	ale->ageout = ale->params.ale_ageout * HZ;
+	ale->features = ale_dev_id->features;
 
 	rev = readl_relaxed(ale->params.ale_regs + ALE_IDVER);
 	ale->version =
@@ -1088,7 +1089,8 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 		 ALE_VERSION_MAJOR(rev, ale->params.major_ver_mask),
 		 ALE_VERSION_MINOR(rev));
 
-	if (!ale->params.ale_entries) {
+	if (ale->features & CPSW_ALE_F_STATUS_REG &&
+	    !ale->params.ale_entries) {
 		ale_entries =
 			readl_relaxed(ale->params.ale_regs + ALE_STATUS) &
 			ALE_STATUS_SIZE_MASK;
@@ -1097,16 +1099,12 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)
 		 * table which shows the size as a multiple of 1024 entries.
 		 * For these, params.ale_entries will be set to zero. So
 		 * read the register and update the value of ale_entries.
-		 * ALE table on NetCP lite, is much smaller and is indicated
-		 * by a value of zero in ALE_STATUS. So use a default value
-		 * of ALE_TABLE_SIZE_DEFAULT for this. Caller is expected
-		 * to set the value of ale_entries for all other versions
-		 * of ALE.
+		 * return error if ale_entries is zero in ALE_STATUS.
 		 */
 		if (!ale_entries)
-			ale_entries = ALE_TABLE_SIZE_DEFAULT;
-		else
-			ale_entries *= ALE_TABLE_SIZE_MULTIPLIER;
+			return ERR_PTR(-EINVAL);
+
+		ale_entries *= ALE_TABLE_SIZE_MULTIPLIER;
 		ale->params.ale_entries = ale_entries;
 	}
 	dev_info(ale->params.dev,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.h b/drivers/net/ethernet/ti/cpsw_ale.h
index 53ad4246617e..27b30802b384 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.h
+++ b/drivers/net/ethernet/ti/cpsw_ale.h
@@ -32,6 +32,7 @@ struct cpsw_ale {
 	struct timer_list	timer;
 	unsigned long		ageout;
 	u32			version;
+	u32			features;
 	/* These bits are different on NetCP NU Switch ALE */
 	u32			port_mask_bits;
 	u32			port_num_bits;
-- 
2.17.1

