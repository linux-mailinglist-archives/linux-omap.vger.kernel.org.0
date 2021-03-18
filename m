Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C09C340727
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 14:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbhCRNsu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 09:48:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13196 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhCRNsZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 18 Mar 2021 09:48:25 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1SwR06clzmXWF;
        Thu, 18 Mar 2021 21:45:59 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 21:48:15 +0800
From:   'w00385741 <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] ARM: OMAP2+: Make symbol 'pdata_quirks_init_clocks' static
Date:   Thu, 18 Mar 2021 13:56:49 +0000
Message-ID: <20210318135649.1286347-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The sparse tool complains as follows:

arch/arm/mach-omap2/pdata-quirks.c:578:1: warning:
 symbol 'pdata_quirks_init_clocks' was not declared. Should it be static?

This symbol is not used outside of pdata-quirks.c, so this
commit marks it static.

Fixes: a15de032a72d ("ARM: OMAP2+: Init both prm and prcm nodes early for clocks")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 3405aa815a24..765809b214e7 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -574,7 +574,7 @@ static const char * const pdata_quirks_init_nodes[] = {
 	"prm",
 };
 
-void __init
+static void __init
 pdata_quirks_init_clocks(const struct of_device_id *omap_dt_match_table)
 {
 	struct device_node *np;

