Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928B92BBC80
	for <lists+linux-omap@lfdr.de>; Sat, 21 Nov 2020 04:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbgKUDCL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Nov 2020 22:02:11 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51734 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgKUDCK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Nov 2020 22:02:10 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AL323vZ084362;
        Fri, 20 Nov 2020 21:02:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605927723;
        bh=3/qDd3AkKLSUfAA0+7kLtAVBxqJoSdiJvzlY8harGLo=;
        h=From:To:CC:Subject:Date;
        b=qTuED89rKY2bXNx3dgCdGAtUybcqIaIDis55Vo4jUYTK9wbXN2IeuDLixL0qEpiIE
         amiMFeP+pEBLK7CO65Mf6kL8S9dJov6dJfj63d980EeMgAh98CCQJz4ouUpjXV/AHU
         A/ZkfSqwkwIomzBsZ833kw0w/e75Dv2jJjfAil3k=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AL322T6021582
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 21:02:03 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 21:02:02 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 21:02:02 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AL321oU102104;
        Fri, 20 Nov 2020 21:02:01 -0600
Received: from localhost ([10.250.68.46])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AL321uB038535;
        Fri, 20 Nov 2020 21:02:01 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/3] remoteproc sysfs fixes/improvements
Date:   Fri, 20 Nov 2020 21:01:53 -0600
Message-ID: <20201121030156.22857-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi All,

This is a refresh of the unaccepted patches from an old series [1].
Patches 2 and 3 from that series were merged and these are rebased and
revised versions of the same patches. I had forgotten about these patches,
and am resurrecting these again. Patches are on top of latest 5.10-rc4.

The features being introduced here will be needed by the recently posted PRU
remoteproc driver [2] in addition to the existing Wkup M3 remoteproc driver.
Both of these drivers follow a client-driven boot methodology, with the latter
strictly booted by another driver in kernel. The PRU remoteproc driver will be
supporting both in-kernel clients as well as control from userspace orthogonally.
The logic though is applicable and useful to any remoteproc driver not using
'auto-boot' and using an external driver/application to boot the remoteproc.

regards
Suman

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20180915003725.17549-1-s-anna@ti.com/
[2] https://patchwork.kernel.org/project/linux-remoteproc/cover/20201119140850.12268-1-grzegorz.jaszczyk@linaro.org/

Suman Anna (3):
  remoteproc: Fix unbalanced boot with sysfs for no auto-boot rprocs
  remoteproc: Introduce deny_sysfs_ops flag
  remoteproc: wkup_m3: Set deny_sysfs_ops flag

 drivers/remoteproc/remoteproc_sysfs.c | 28 ++++++++++++++++++++++++++-
 drivers/remoteproc/wkup_m3_rproc.c    |  1 +
 include/linux/remoteproc.h            |  2 ++
 3 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.28.0

