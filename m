Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061885A5D4C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Aug 2022 09:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbiH3Hrm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Aug 2022 03:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiH3Hrl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Aug 2022 03:47:41 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC7FA2A8F
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 00:47:36 -0700 (PDT)
X-QQ-mid: bizesmtp86t1661845652tlk0wfuu
Received: from localhost.localdomain ( [182.148.13.26])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 30 Aug 2022 15:47:26 +0800 (CST)
X-QQ-SSF: 01000000000000B0C000000A0000000
X-QQ-FEAT: ritJ6yQ+u74NYs0KfEsv97r4l2pahlCofJwhpVxtFM50sUOtnz3Q8LGJldDeY
        2ez3/wPxmifowRNpDwC3YWtSD7AeXwS8UERiMe9YWKGCKJdDgTHips0mT/riUE1QwfSZcJ5
        /MfdB4Ke2YH+vdHkiNSaSR9c4JzEnpOXCAi1lZzr3lbpGTrnsNN1yyPAtEeRIJQ5EHkhxcI
        TBSeWyU5MBLDt8TaiqR/41b/Gyn5sye2OSyXJ7KcVqu18UI1GbcdAWOnocn/BVdGrZ+CcAr
        rCo26/VYjrW7V8GIal3MWwieGFyceMDCy+G9PO7R72U+ACeW+sK9Euhzl1pJttzKs7BFGjm
        waQKF8eMpGJTMMgQ5FAJGGLelbEeZ4fiqC0m2tYM0FIH0cQ+wU=
X-QQ-GoodBg: 0
From:   Shaomin Deng <dengshaomin@cdjrlc.com>
To:     tony@atomide.com, linux-omap@vger.kernel.org
Cc:     Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] bus: ti-sysc: Fix double word in comments
Date:   Tue, 30 Aug 2022 03:47:26 -0400
Message-Id: <20220830074726.12943-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Delete the repeated word "the" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 51d772bb8046..2386e8013e18 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -915,7 +915,7 @@ static int sysc_check_registers(struct sysc *ddata)
  * within the interconnect target module range. For example, SGX has
  * them at offset 0x1fc00 in the 32MB module address space. And cpsw
  * has them at offset 0x1200 in the CPSW_WR child. Usually the
- * the interconnect target module registers are at the beginning of
+ * interconnect target module registers are at the beginning of
  * the module range though.
  */
 static int sysc_ioremap(struct sysc *ddata)
-- 
2.35.1

