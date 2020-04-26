Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6691B8E81
	for <lists+linux-omap@lfdr.de>; Sun, 26 Apr 2020 11:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgDZJn0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 26 Apr 2020 05:43:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2910 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726251AbgDZJn0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 26 Apr 2020 05:43:26 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B569892C8BB359192DCB;
        Sun, 26 Apr 2020 17:43:20 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 17:43:11 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <peter.ujfalusi@ti.com>, <jarkko.nikula@bitmer.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <rafael.j.wysocki@intel.com>,
        <tglx@linutronix.de>, <alsa-devel@alsa-project.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] ASoC: ti: remove comparison to bool in omap_mcbsp_dai_set_dai_fmt()
Date:   Sun, 26 Apr 2020 17:42:38 +0800
Message-ID: <20200426094238.23914-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:

sound/soc/ti/omap-mcbsp.c:1188:5-11: WARNING: Comparison to bool

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/soc/ti/omap-mcbsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 3d41ca2238d4..0348963f4df7 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1185,7 +1185,7 @@ static int omap_mcbsp_dai_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	default:
 		return -EINVAL;
 	}
-	if (inv_fs == true)
+	if (inv_fs)
 		regs->pcr0 ^= FSXP | FSRP;
 
 	return 0;
-- 
2.21.1

