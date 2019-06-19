Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E664B965
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jun 2019 15:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731724AbfFSNFy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jun 2019 09:05:54 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60669 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731178AbfFSNFx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jun 2019 09:05:53 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M7s1M-1hhPlr438s-0051Nk; Wed, 19 Jun 2019 15:05:38 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     arm@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Paul Walmsley <paul@pwsan.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2: remove incorrect __init annotation
Date:   Wed, 19 Jun 2019 15:04:54 +0200
Message-Id: <20190619130529.1502322-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dnAraIqnAFKO4Ee+PXPJF/LL3WFx+kBCx35hS/zH3XPenx1T9Ys
 kgXaZ8E4MOrxh9YQWe2g5fxpnQBAjZAJiNm8/rhI/Q9x58NdE5suxhAdEY176sJhbxqO0ZU
 0dwSTg4Gvhn+nxBMPKr9Wz38owbJx2ueOa5DEA60MCmTAC8sdf7kVmXLR/nWg7mc692p9Le
 BvoIQPBnyZctUKgIRs8/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0mRlXBkSslw=:FoLq8ELxMpa2ObJt7RxxZ7
 QQJlQ/XyvjcJchlJGmvbu+7W4CFnMm5z4zxQ1TwUtjrpriuekVOwMyX0PdzUFJ7fXpmHcF/ZW
 yjCB7+ZOpMJj+0ECdwIc0Pd9O0t3fYDc1ahzT9prtfhu/uu4/kd6/jSuXvKKbcE9IdoX3iIkA
 ZAFlq9IT9R+8iOEvGQG7iGZiJAjbBA1MfTwMuxlvDkv7tBZR1ezHdDQjwg4shzvEvIDVl7hEg
 WlPAfmpIvWKIyqR7KHkYlbjHCHvt/gmpzfzsCYJQIEHKW9LSAESmDmoVDV7v8Om9kXBh9BwQT
 ZH0bhfooDV5RhLKH6euGrIeQEl1DeNKGp3DP/huqIiEYezEH0k1KCdkBRduZr9EHFAvEUJChY
 rhMi6qLhqnzdUHUcdc7jpaunWTtFbN7hvCinLppWvCEUCjxHfnlxnoCAIHhBTSlIjusySXLhM
 jftrcky1AQcVoBAgxOGxxnvT1B9qA8y0R9PU/Tfdw34KZ9oUz2P3n0heMcClgTD/qoDKorXGy
 Z27RxBCvyruSt90PIPKW5mSl7huKCyW3u4tDQWwATKwZlHvA3nt6aJtxeAawRaHn6rITq5JXm
 FvTuguSX2tcSG8yNuTNTJ/6iE45AJ222Mr4tj+JbceubmXOsFyceBnZ5iNa5efEIAdwW7oJu9
 Wvj8eI0QnD9UHilbLOp7yk63PY/iCCHOOWdCc6VQoyE460y7ceIEvWFYYO8F86sTz1OjTNA6B
 FxGgg1lfBa7KgEULX59U37Mgu4FH1j2G2JzutA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

omap3xxx_prm_enable_io_wakeup() is marked __init, but its caller is not, so
we get a warning with clang-8:

WARNING: vmlinux.o(.text+0x343c8): Section mismatch in reference from the function omap3xxx_prm_late_init() to the function .init.text:omap3xxx_prm_enable_io_wakeup()
The function omap3xxx_prm_late_init() references
the function __init omap3xxx_prm_enable_io_wakeup().
This is often because omap3xxx_prm_late_init lacks a __init
annotation or the annotation of omap3xxx_prm_enable_io_wakeup is wrong.

When building with gcc, omap3xxx_prm_enable_io_wakeup() is always
inlined, so we never noticed in the past.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/prm3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/prm3xxx.c b/arch/arm/mach-omap2/prm3xxx.c
index 05858f966f7d..dfa65fc2c82b 100644
--- a/arch/arm/mach-omap2/prm3xxx.c
+++ b/arch/arm/mach-omap2/prm3xxx.c
@@ -433,7 +433,7 @@ static void omap3_prm_reconfigure_io_chain(void)
  * registers, and omap3xxx_prm_reconfigure_io_chain() must be called.
  * No return value.
  */
-static void __init omap3xxx_prm_enable_io_wakeup(void)
+static void omap3xxx_prm_enable_io_wakeup(void)
 {
 	if (prm_features & PRM_HAS_IO_WAKEUP)
 		omap2_prm_set_mod_reg_bits(OMAP3430_EN_IO_MASK, WKUP_MOD,
-- 
2.20.0

