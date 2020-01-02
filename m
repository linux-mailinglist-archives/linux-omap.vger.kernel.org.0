Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3403412EB33
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 22:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgABVTs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 16:19:48 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40820 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgABVTs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 16:19:48 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 002LJiUE103911;
        Thu, 2 Jan 2020 15:19:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577999984;
        bh=nSJBKNTi6Ht6MpBooEsO7IO6UlDy0iHjYVVxT59n/0M=;
        h=From:To:CC:Subject:Date;
        b=oMVVLaVIcpLe7XJr6xZir8LnTvN3Ohr60ZvhuMOf/O4J4O3+urYb6c+J6Xt87wnJM
         3zdcUIqtbax5q98ajCV3H6ZBByArvnr5ej9vD2fOQiIUMusSDf1lAxRTiYiWO7OE/s
         95eUtUiJ+hRNTxdN/04dY7AGjgb9qc8Yw4cMeBqE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 002LJiDs009087
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Jan 2020 15:19:44 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Jan
 2020 15:19:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Jan 2020 15:19:44 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 002LJicG063921;
        Thu, 2 Jan 2020 15:19:44 -0600
Received: from localhost ([10.250.65.50])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id 002LJhu04869;
        Thu, 2 Jan 2020 15:19:43 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Lokesh Vutla <lokeshvutla@ti.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v4 0/4] Use ARM SMC Calling Convention when OP-TEE is available
Date:   Thu, 2 Jan 2020 16:19:39 -0500
Message-ID: <20200102211943.20480-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello all,

This is the reworked patch turned into a series to allow upstream kernels
to make use of OP-TEE on the OMAP2+ platform.

Thanks,
Andrew

Changes from v1:
 - Split into logical patches
 - Check for OP-TEE in DT only once
 - Check the OP-TEE node is "okay"

Changes from v2:
 - Add HS patch using 'optee_available'

Changes from v3:
 - Add comments as suggested by Tony and Lokesh

Andrew F. Davis (4):
  ARM: OMAP2+: Add omap_secure_init callback hook for secure
    initialization
  ARM: OMAP2+: Introduce check for OP-TEE in omap_secure_init()
  ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available
  ARM: OMAP2+: sleep43xx: Call secure suspend/resume handlers

 arch/arm/mach-omap2/common.h      |  2 +-
 arch/arm/mach-omap2/io.c          | 11 +++++++
 arch/arm/mach-omap2/omap-secure.c | 50 +++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/omap-secure.h | 10 +++++++
 arch/arm/mach-omap2/omap-smc.S    |  6 ++--
 arch/arm/mach-omap2/pm33xx-core.c | 24 +++++++++++++++
 6 files changed, 99 insertions(+), 4 deletions(-)

-- 
2.17.1

