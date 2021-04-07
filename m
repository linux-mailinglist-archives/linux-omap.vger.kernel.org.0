Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A075D35712D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 17:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245455AbhDGP5H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 11:57:07 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52368 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbhDGP5G (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Apr 2021 11:57:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 137Fulpo116650;
        Wed, 7 Apr 2021 10:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1617811007;
        bh=r78S7ZI4t8HWx+zggh+zIGvWwlMtHHDtztUrnZCJObU=;
        h=From:To:CC:Subject:Date;
        b=tGbYaKvDiKH9NIF54rSuMN58mRR1ezK3lCaXY0Thb8N0zgo1d/MhStsmWIf6OVnHU
         w4brV5JM1C+cslX76fKGDmIa9Ipr9bg7M5JFXIIN1XYVW68+TC7ASTFL/E7U0VDwuM
         Z3PHCae2DNk2kkJb7eRAWm+TnPppBsT5iDn3NNVg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 137FulfA047396
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Apr 2021 10:56:47 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 7 Apr
 2021 10:56:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 7 Apr 2021 10:56:47 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 137Ful3U112645;
        Wed, 7 Apr 2021 10:56:47 -0500
Received: from localhost ([10.250.37.105])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 137Fuk5C075236;
        Wed, 7 Apr 2021 10:56:47 -0500
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
Subject: [PATCH v2 0/3] PRU firmware event/interrupt mapping fixes
Date:   Wed, 7 Apr 2021 10:56:38 -0500
Message-ID: <20210407155641.5501-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

The following is a minor revised version of the series [1] that includes fixes
for various different issues associated with the PRU firmware event/interrupt
mapping configuration logic. Please see the v1 cover-letter [1] for additional
details. 

There are currently no in-kernel dts nodes yet in mainline kernel (first
nodes will appear in v5.13-rc1) so these can be picked up for either v5.13
merge window or the current -rc cycle.

Changes in v2:
 - Picked up Reviewed-by tags on Patches 1 and 2
 - Revised Patch 3 to address additional error cleanup paths as
   pointed out by Mathieu.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20210323223839.17464-1-s-anna@ti.com/

Suman Anna (3):
  remoteproc: pru: Fixup interrupt-parent logic for fw events
  remoteproc: pru: Fix wrong success return value for fw events
  remoteproc: pru: Fix and cleanup firmware interrupt mapping logic

 drivers/remoteproc/pru_rproc.c | 41 ++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 9 deletions(-)

-- 
2.30.1

