Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0290C39D15E
	for <lists+linux-omap@lfdr.de>; Sun,  6 Jun 2021 22:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFFUZM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Jun 2021 16:25:12 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:40281 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230130AbhFFUZL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 6 Jun 2021 16:25:11 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id pzIbl3WgQsptipzImlrvTk; Sun, 06 Jun 2021 22:23:20 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1623011000; bh=hBVv0EIDOJPnyshBY6NoCuTaYvUzw/b0onSPeL7WQcQ=;
        h=From;
        b=S35rnS2OHcU9WPAShYxU7WE9H2EAodCOqWS6eJbZrhWlmZHz/ByFjA+VzJ6kManVZ
         tTvu9QgT3Vz6naQ5b0VVsmnhfFhcPzesqyxsd3pHdUP20K8CqMYqo7pkkmp1KJaE5l
         1PdvcQ0YjlignQp0J2ua5tJDZZalb1FcOQH08sB+mYuXuvoDIQ6tB8qc/b5GRUs6pP
         sAxAQ91Nru3XXWGhY/u9EbORes1LkumBE6mQx9340q6RwtFjcl4x4UeTD1UPfDvP+m
         6c+rCdl5PWE3gJ1FODxK92a2rkaMjTvjVDva9T5S/9GDgs4KLa7ZfcQrhHlsYBafqx
         FZ1XazYY2NsCw==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60bd2eb8 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=VwQbUJbxAAAA:8
 a=Bl6OLPU8nqzXNm5YYFQA:9 a=AjGcO6oz07-iQ99wixmX:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-clk@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v7 1/5] clk: ti: fix typo in routine description
Date:   Sun,  6 Jun 2021 22:22:49 +0200
Message-Id: <20210606202253.31649-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606202253.31649-1-dariobin@libero.it>
References: <20210606202253.31649-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfA2VjuQiAzoirEZ1LkdGs4376tXOzMv5c2Be4MrNdG0SmrBE+TzKngcJIRPSK8udGRW1QykL69azMRIfV5cW7Tqlu9BQ0nTkVxK2cA1INh/ZJj/kFnQe
 hrpOuDZlONkGr0WTpbbTs/RfjjObtbvfBNZF7boLernm0KRetmaRSTC1dy89nJXV9Ut6HAxcdl0jgSUM2+dt0Up34SCvMA50TL3VxA9w1xkijZrUlx/tUt8f
 li8BiJFAUq3IPuoAU11ttgKeYOth0ZJz3LsH6FNcfEUI+U8YKS23h2ZFzrBwcRA6SU1cNS3x4fdfWI8dioXXG+jk4wKBTljY2wdv/ISVTfDPBoahQkN/XdCx
 A6ZJVRwAZASEDZAM6lJSx+CSdK4ONUNe42w7cy3ixayATXA9x2kwLLfEoGVEHCyXh8zJHez9/giQ3XkBWPqTK59J7/GoUUquAvmdNTekPFVxMH1VbbpJ3t3x
 XQit/uoD8OSBM8K60cZuAOGoJQdghYU0mjJMGJoCZNv1aLjUTvA89E6+Ki43M2YG77Im38iupfe5FNlh1i93zJzyitCHYyMnLlg7jw==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

(no changes since v4)

Changes in v4:
- Add Stephen Boyd review tag.

 drivers/clk/ti/dpll3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 6097b099a5df..94d5b5fe9a2b 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -292,7 +292,7 @@ static void _lookup_sddiv(struct clk_hw_omap *clk, u8 *sd_div, u16 m, u8 n)
 }
 
 /**
- * _omap3_noncore_dpll_program - set non-core DPLL M,N values directly
+ * omap3_noncore_dpll_program - set non-core DPLL M,N values directly
  * @clk:	struct clk * of DPLL to set
  * @freqsel:	FREQSEL value to set
  *
-- 
2.17.1

