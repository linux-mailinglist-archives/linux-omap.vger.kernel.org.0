Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC48733C812
	for <lists+linux-omap@lfdr.de>; Mon, 15 Mar 2021 22:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhCOU7n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Mar 2021 16:59:43 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42438 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbhCOU7O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Mar 2021 16:59:14 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FKx5F3115937;
        Mon, 15 Mar 2021 15:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1615841945;
        bh=UoF3cldJyikro6utsBYNtr1jTBmig21JZkMN3IlKsys=;
        h=From:To:CC:Subject:Date;
        b=hK+xJkiURaN2Fv5+HlpWoMqYp6FagUS0NmqR82+0z1jMWDMZYApr9+hU8V6CwtwLK
         U0XRIHgilJ0TjG5C0HPSx2kwulF8pJfu5uPODoqZzIzcqMF0gm4RofGnYwwiOJ7XiH
         1nGJMleUmySctvvScF7ht/tnNE0+MXlSPRmTy7yg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FKx4b7118738
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Mar 2021 15:59:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 15:59:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 15:59:04 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FKx4dR098491;
        Mon, 15 Mar 2021 15:59:04 -0500
Received: from localhost ([10.250.34.48])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 12FKx42r064830;
        Mon, 15 Mar 2021 15:59:04 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] remoteproc: pru: Fix firmware loading crashes on K3 SoCs
Date:   Mon, 15 Mar 2021 15:58:59 -0500
Message-ID: <20210315205859.19590-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The K3 PRUs are 32-bit processors and in general have some limitations
in using the standard ARMv8 memcpy function for loading firmware segments,
so the driver already uses a custom memcpy implementation. This added
logic however is limited to only IRAMs at the moment, but the loading
into Data RAMs is not completely ok either and does generate a kernel
crash for unaligned accesses.

Fix these crashes by removing the existing IRAM logic limitation and
extending the custom memcpy usage to Data RAMs as well for all K3 SoCs.

Fixes: 1d39f4d19921 ("remoteproc: pru: Add support for various PRU cores on K3 AM65x SoCs")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919d76b3..16979c1cd2f4 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -585,7 +585,7 @@ pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		if (pru->data->is_k3 && is_iram) {
+		if (pru->data->is_k3) {
 			ret = pru_rproc_memcpy(ptr, elf_data + phdr->p_offset,
 					       filesz);
 			if (ret) {
-- 
2.30.1

