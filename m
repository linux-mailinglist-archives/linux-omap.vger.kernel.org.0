Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 573EA13D85D
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 11:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgAPKvX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 05:51:23 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44892 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAPKvI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 05:51:08 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GAp10K050263;
        Thu, 16 Jan 2020 04:51:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579171861;
        bh=T3h+Fu6ytCpvSGafi/xfB4tD7d0LWp5ziadK1cgAJQo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JcdhHgxgHU8Yl9zfU/0N3piCMwGTC8K6u3Eyb3pTJ62DE7gsbEpoZnVrU2M4oBHMH
         aP8PzR8IBFQB9NdOn+UTpXMwnH9HsMzT7vQxopSWj4+9s3lAfC/wUV/OSp6Z17R9nb
         ncU7HZKAGrvdar//KoX/a2FcofTnpLLVh8g2hBIU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GAp1n8016974
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 04:51:01 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 04:51:01 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 04:51:01 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GAoRdb000589;
        Thu, 16 Jan 2020 04:50:58 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <adrian.hunter@intel.com>, <kishon@ti.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>,
        <faiz_abbas@ti.com>, <tony@atomide.com>
Subject: [PATCH v5 09/10] mmc: sdhci-omap: Add am335x and am437x specific compatibles
Date:   Thu, 16 Jan 2020 16:21:53 +0530
Message-ID: <20200116105154.7685-10-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200116105154.7685-1-faiz_abbas@ti.com>
References: <20200116105154.7685-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for new compatible for TI's am335x and am437x devices.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/mmc/host/sdhci-omap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 1f05c8e98d62..5433c9e6ac10 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -898,6 +898,14 @@ static const struct sdhci_omap_data k2g_data = {
 	.offset = 0x200,
 };
 
+static const struct sdhci_omap_data am335_data = {
+	.offset = 0x200,
+};
+
+static const struct sdhci_omap_data am437_data = {
+	.offset = 0x200,
+};
+
 static const struct sdhci_omap_data dra7_data = {
 	.offset = 0x200,
 	.flags	= SDHCI_OMAP_REQUIRE_IODELAY,
@@ -906,6 +914,8 @@ static const struct sdhci_omap_data dra7_data = {
 static const struct of_device_id omap_sdhci_match[] = {
 	{ .compatible = "ti,dra7-sdhci", .data = &dra7_data },
 	{ .compatible = "ti,k2g-sdhci", .data = &k2g_data },
+	{ .compatible = "ti,am335-sdhci", .data = &am335_data },
+	{ .compatible = "ti,am437-sdhci", .data = &am437_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, omap_sdhci_match);
-- 
2.19.2

