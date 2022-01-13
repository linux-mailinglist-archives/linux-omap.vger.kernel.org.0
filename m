Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E8748D304
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jan 2022 08:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbiAMHkK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jan 2022 02:40:10 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:38704 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229768AbiAMHkJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Jan 2022 02:40:09 -0500
Received: from localhost.localdomain (unknown [124.16.141.244])
        by APP-01 (Coremail) with SMTP id qwCowADn7JxF199hYV5FBg--.59804S2;
        Thu, 13 Jan 2022 15:39:50 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        inux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: omap2: omapfb: Remove redundant 'flush_workqueue()' calls
Date:   Thu, 13 Jan 2022 07:39:28 +0000
Message-Id: <20220113073928.9946-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn7JxF199hYV5FBg--.59804S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF17GF47AF1fGFyrCrWUXFb_yoWfXFg_W3
        s7uFZrXFZ8tr40k34rtan0kFs293srWF47WasrtrZ8K342qrySqrWDZr1IqFWUX3yUCF9r
        Zr1jgr48Xwn3CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbFAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggFA10Tf6X3nAAAs3
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index a3decc7fadde..afa688e754b9 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1854,7 +1854,6 @@ static void omapfb_free_resources(struct omapfb2_device *fbdev)
 	}
 
 	if (fbdev->auto_update_wq != NULL) {
-		flush_workqueue(fbdev->auto_update_wq);
 		destroy_workqueue(fbdev->auto_update_wq);
 		fbdev->auto_update_wq = NULL;
 	}
-- 
2.25.1

