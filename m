Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C051CD972
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 14:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgEKMPt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 08:15:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41626 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727826AbgEKMPt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 May 2020 08:15:49 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2E31EEECA77004EA773D;
        Mon, 11 May 2020 20:15:40 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 11 May 2020 20:15:36 +0800
From:   Ma Feng <mafeng.ma@huawei.com>
To:     <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] ARM: omap2: make omap5_erratum_workaround_801819 static
Date:   Mon, 11 May 2020 20:21:44 +0800
Message-ID: <1589199704-11980-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix sparse warning:

arch/arm/mach-omap2/omap-smp.c:75:6: warning: symbol
'omap5_erratum_workaround_801819' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 arch/arm/mach-omap2/omap-smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap-smp.c b/arch/arm/mach-omap2/omap-smp.c
index 6a82fce..570a987e 100644
--- a/arch/arm/mach-omap2/omap-smp.c
+++ b/arch/arm/mach-omap2/omap-smp.c
@@ -72,7 +72,7 @@ void __iomem *omap4_get_scu_base(void)
 }

 #ifdef CONFIG_OMAP5_ERRATA_801819
-void omap5_erratum_workaround_801819(void)
+static void omap5_erratum_workaround_801819(void)
 {
 	u32 acr, revidr;
 	u32 acr_mask;
--
2.6.2

