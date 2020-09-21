Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588032724C7
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 15:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgIUNLP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 09:11:15 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13809 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727461AbgIUNLA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 09:11:00 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E73BFF52CF0634DF072C;
        Mon, 21 Sep 2020 21:10:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:48 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] video: omapfb: simplify the return expression of hdmi_pll_enable
Date:   Mon, 21 Sep 2020 21:11:12 +0800
Message-ID: <20200921131112.93411-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
index 4991be031..a36e92155 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
@@ -104,11 +104,7 @@ static int hdmi_pll_enable(struct dss_pll *dsspll)
 
 	dss_ctrl_pll_enable(DSS_PLL_HDMI, true);
 
-	r = hdmi_wp_set_pll_pwr(wp, HDMI_PLLPWRCMD_BOTHON_ALLCLKS);
-	if (r)
-		return r;
-
-	return 0;
+	return hdmi_wp_set_pll_pwr(wp, HDMI_PLLPWRCMD_BOTHON_ALLCLKS);
 }
 
 static void hdmi_pll_disable(struct dss_pll *dsspll)
-- 
2.23.0

