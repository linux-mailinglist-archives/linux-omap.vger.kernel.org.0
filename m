Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E92346D59
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 23:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbhCWWj2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 18:39:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44578 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbhCWWi4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Mar 2021 18:38:56 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12NMce1b129789;
        Tue, 23 Mar 2021 17:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616539120;
        bh=TvscpToZMQACxUA/dOzxJjIy1byQa47pq+p1H55TNi8=;
        h=From:To:CC:Subject:Date;
        b=Wc8eJbE1OLP2lGt/6l+ILJAaz44jaqQfI9kBhbGAgPBVIjbOJ/DWLu3ABUGxLZk4D
         EC7WIO7WfY1eC/j7DOx+xsw61lR15QrBSTN3zYxYVhqfB0T3wv3ufAlDTKp1PC4GAI
         7DGHdeIVwZTTg2dSUG8w71UEYjOEk1On/0KD+qf8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12NMceEU034124
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Mar 2021 17:38:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 17:38:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 17:38:40 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12NMcewV058842;
        Tue, 23 Mar 2021 17:38:40 -0500
Received: from localhost ([10.250.221.195])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12NMcdSS102209;
        Tue, 23 Mar 2021 17:38:39 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] PRU firmware event/interrupt mapping fixes
Date:   Tue, 23 Mar 2021 17:38:36 -0500
Message-ID: <20210323223839.17464-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

The following series includes fixes for various different issues
associated with the PRU firmware event/interrupt mapping configuration
logic added in the same commit c75c9fdac66e ("remoteproc: pru: Add
support for PRU specific interrupt configuration"). The fixes are
agnostic of SoC family.

Following is the summary of issues and fixes:
 - Patch #1 fixes the interrupt node finding logic to always use the
   inherent sibling relationship between a PRU/RTU/Tx_PRU node and its
   corresponding PRUSS INTC node. This fixes the firmware event mappings
   for cases when the PRU nodes do not have an 'interrupt-parent' property
   (this is the norm, the property is neither required nor added in the DT
   nodes normally).
 - Patch #2 fixes a minor issue with returning a success value to the
   caller on a fw event mapping failure.
 - Patch #3 fixes a kernel crash due to switching of firmwares between
   consecutive runs, the first one with events and the second one without
   events. There are no issues when the same firmwares are run or if they
   are run in reverse order.

Patches should apply cleanly on top of the current rproc-fixes branch
commit 9afeefcf06fc ("remoteproc: pru: Fix firmware loading crashes on K3 SoCs")

regards
Suman

Suman Anna (3):
  remoteproc: pru: Fixup interrupt-parent logic for fw events
  remoteproc: pru: Fix wrong success return value for fw events
  remoteproc: pru: Fix and cleanup firmware interrupt mapping logic

 drivers/remoteproc/pru_rproc.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.30.1

