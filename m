Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB293FB61E
	for <lists+linux-omap@lfdr.de>; Mon, 30 Aug 2021 14:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbhH3MeX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Aug 2021 08:34:23 -0400
Received: from smtpbg127.qq.com ([109.244.180.96]:32466 "EHLO smtpbg.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232267AbhH3MeX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Aug 2021 08:34:23 -0400
X-QQ-mid: bizesmtp40t1630326771tm1kaj5x
Received: from localhost.localdomain (unknown [171.223.99.71])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 30 Aug 2021 20:32:48 +0800 (CST)
X-QQ-SSF: 01000000004000C0D000B00A0000000
X-QQ-FEAT: ikVgnzmvsa8SxmQ1mguFw4U+Du57XD1NId7DJ3hYvRKitl6EyUueCghgz8fvv
        QKUHdVrL/kV4wtPmoV3Slb51CeH5ZoXSUzj9J/KcgDIa5AraQX6MtIUEwoZCVXaKn39VNz+
        iA8TrKZwp3F+3VuvtA0Sp0j4LCkM8BVazT3UwDy4pS6lhbahQ3gP0BZsDTXFk5dBApCWBxg
        RL7dize42e0pBY08I8lQhS7SAetez70Jy+Cn43HM8Gepn+g3ltp6GUfaZXZalP6ZMH3sARW
        Xq2PQMQkgObcXAXFUjrSyuyDzWYMjkywTOYm/z0Bc6I+kZUSM6LduBLcNL7rQ2i+XmfxK8l
        r/6PYsp
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     tony@atomide.com
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] ARM: OMAP2+: Fix comment typo
Date:   Mon, 30 Aug 2021 20:31:28 +0800
Message-Id: <20210830123128.9767-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove one of the repeated 'not' in three comments.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/arm/mach-omap2/powerdomain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/powerdomain.c b/arch/arm/mach-omap2/powerdomain.c
index 0a5b87e2a4b0..2d747f6cffe8 100644
--- a/arch/arm/mach-omap2/powerdomain.c
+++ b/arch/arm/mach-omap2/powerdomain.c
@@ -626,7 +626,7 @@ int pwrdm_read_prev_pwrst(struct powerdomain *pwrdm)
  * powerdomain @pwrdm will enter when the powerdomain enters retention.
  * This will be either RETENTION or OFF, if supported.  Returns
  * -EINVAL if the powerdomain pointer is null or the target power
- * state is not not supported, or returns 0 upon success.
+ * state is not supported, or returns 0 upon success.
  */
 int pwrdm_set_logic_retst(struct powerdomain *pwrdm, u8 pwrst)
 {
@@ -658,7 +658,7 @@ int pwrdm_set_logic_retst(struct powerdomain *pwrdm, u8 pwrst)
  * state.  @bank will be a number from 0 to 3, and represents different
  * types of memory, depending on the powerdomain.  Returns -EINVAL if
  * the powerdomain pointer is null or the target power state is not
- * not supported for this memory bank, -EEXIST if the target memory
+ * supported for this memory bank, -EEXIST if the target memory
  * bank does not exist or is not controllable, or returns 0 upon
  * success.
  */
@@ -696,7 +696,7 @@ int pwrdm_set_mem_onst(struct powerdomain *pwrdm, u8 bank, u8 pwrst)
  * different types of memory, depending on the powerdomain.  @pwrst
  * will be either RETENTION or OFF, if supported.  Returns -EINVAL if
  * the powerdomain pointer is null or the target power state is not
- * not supported for this memory bank, -EEXIST if the target memory
+ * supported for this memory bank, -EEXIST if the target memory
  * bank does not exist or is not controllable, or returns 0 upon
  * success.
  */
-- 
2.33.0

