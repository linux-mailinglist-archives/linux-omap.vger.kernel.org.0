Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222CF38B6EE
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 21:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbhETTPq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 15:15:46 -0400
Received: from smtp-34-i2.italiaonline.it ([213.209.12.34]:37658 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235392AbhETTPo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 May 2021 15:15:44 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jo6clK7DY5WrZjo6ilTD6m; Thu, 20 May 2021 21:13:22 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621538002; bh=hBVv0EIDOJPnyshBY6NoCuTaYvUzw/b0onSPeL7WQcQ=;
        h=From;
        b=lt4OD/JCm71jSEWWf5waabOJ1A5yDTb0T62Qfp4OylOw45X9verM1HoM+Oa0juTJC
         m2SLz9q8azaefBRgv++QQfatV7cNg7yWCiCITZ9C3CxIz2g1GYtHJ/QdaVt/YpLQvZ
         ggmjfjDyvt6CZRFY/nKq01rQU4NXq4sxPzep3PHJ54bkQ83LOrFBARKvUa1V1AJOsS
         EDCrvoPwoyuXw7Oorf8EdPm9VcFa7TGv5MLpL8/QgNHxbwX7bXjEMMe3Y1MBBo5hHl
         VLAeTHNX1XnKoiVtjdGnFpGzyKor0bpk485AMxsaSl8JvCCRGyis/0UOqV/g7zNsCZ
         DM9E+gafNxj9w==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6b4d2 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17 a=VwQbUJbxAAAA:8
 a=Bl6OLPU8nqzXNm5YYFQA:9 a=AjGcO6oz07-iQ99wixmX:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v6 1/5] clk: ti: fix typo in routine description
Date:   Thu, 20 May 2021 21:13:01 +0200
Message-Id: <20210520191306.21711-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520191306.21711-1-dariobin@libero.it>
References: <20210520191306.21711-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfAQR7MsSMyb1ZKg3ZEfotApon7KhAUuSBROKP6UOUbsI6+xVOxtvRx2rdXf8G7tVDoCjUsXcDvvCGkwz/nGT52Yy8lTAyhidgINviB1g7ju5oDNdyZXS
 HW3IvnQf+MGnDgucHzfgP5d6OceEspgfgM0o3Yq/0JLxbzgnWNJ5lV7XRtLbgk0gWgMH5Dghu2WXW7cgQMTWbCFRO1lV6A+teltIHwOfNwLqvMbf9L2ERWbe
 C5dxVvGR3jXaBZvOn3W96xuXHdyX5aGWkp645heRcZR2E4SHhJRcvFMfjhNZ3fGt50UtgR/rjR/AwSIOrwd+3hHcg0EQPPTJCUBE+d593BeIwa/fIzchBb+W
 lEm5aRISF2jWIUovlA2ijBADWcNDK0RFTK26I3MWrtxM1e2Zb+eTgT68QLmHqW4lxhUHYWVloSgLWZU1zlmRgzyrbQMIqkhFHV+1eLtwW/szHqpWqvNNokSg
 ThA6XG7Nu49QiiFnmD244X+OFGqicKmr1ACbmsT8o0DD/X3t07gbfCCz8EDw0vSdYmJ/UX6WFeZqoE/ZjRlVU2bASAwKS7K6Ydjfsg==
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

