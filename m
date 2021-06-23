Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8B63B1F8C
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jun 2021 19:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhFWRfJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Jun 2021 13:35:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37208 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFWRfJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Jun 2021 13:35:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NHWhWd051373;
        Wed, 23 Jun 2021 12:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624469563;
        bh=gvlnXVFcZfJehSU6KC3iEsNhb53rQyk2kBKfxDIOHGI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=iOE8IyszeCZ33EW1oVgJTbtP23Vivib+B6Cui8k3WBd76SKJgZLq5/8pp1LHPM5Gv
         WRDNFBzuy7T96x8H97ucJhLT2PBlGJDTjvnBXyvJCDHPMh3dzSONsWzq17c3XfjYWw
         DCfnG5ZHvdDp2G3A8wD6Wi6M4D+/b91sg40Tc9PU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NHWhGf083268
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Jun 2021 12:32:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 23
 Jun 2021 12:32:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 23 Jun 2021 12:32:43 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NHWh7g122984;
        Wed, 23 Jun 2021 12:32:43 -0500
Received: from localhost ([10.250.33.41])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 15NHWhAp028855;
        Wed, 23 Jun 2021 12:32:43 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/2] remoteproc: pru: Add support for various PRU cores on K3 AM64x SoCs
Date:   Wed, 23 Jun 2021 12:32:42 -0500
Message-ID: <20210623173243.7862-3-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210623173243.7862-1-s-anna@ti.com>
References: <20210623173243.7862-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The K3 AM64x family of SoCs have a ICSSG IP that is similar to the
version on AM65x SR2.0 SoCs with some minor differences. The AM64x
SoCs contain two instances of this newer ICSSG IP. Each ICSSG processor
subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called
RTUs, and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).

Enhance the existing PRU remoteproc driver to support all these PRU,
RTU and Tx_PRU cores by using specific compatibles. The cores have the
same memory copying limitations as on AM65x, so reuses the custom memcpy
function within the driver's ELF loader implementation. The initial
names for the firmware images for each PRU core are retrieved from
DT nodes, and can be adjusted through sysfs if required.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index e5778e476245..0ecf2675f5eb 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -894,6 +894,9 @@ static const struct of_device_id pru_rproc_match[] = {
 	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
 	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
 	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
+	{ .compatible = "ti,am642-pru",		.data = &k3_pru_data },
+	{ .compatible = "ti,am642-rtu",		.data = &k3_rtu_data },
+	{ .compatible = "ti,am642-tx-pru",	.data = &k3_tx_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.30.1

