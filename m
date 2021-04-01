Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F59351FFD
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbhDATiu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:38:50 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:54082 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235093AbhDATiu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 15:38:50 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id S38SlkFJgtpGHS38Yly35V; Thu, 01 Apr 2021 21:37:50 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617305870; bh=VUyW4at8ikf5TAP5arNsEOQdtEUh+Xle5ljz58DZnLQ=;
        h=From;
        b=KilEJfe0DBAmC+gUtmopB/ZNvhoXXny7rjKm82zeIwGqo2D9yewjRPOQhz27FRAej
         sdrdtQHswu2wSPLKHp8ghmK+szrfwMKKHnomKgBf/daU475LljMuOnmj68IfI/52qk
         75NXfAXvZk+25uU3CXHPnJQndKtZCM57z6N4PlRNaiXDmwoLJR7zj+i4zvVLqKauH9
         vV9tku4RM2Tww2ck+zZOSuPLJhbS/VIpyaApHYI06YAvbxrJgejVckTbvKu4QlW0mE
         1BA5l9fIo8NzOSCCrFYHC/BXxf79pfqxcKeNg8d/UGtlW7jx5oYkvO2+q1UP1meyvh
         Jw7U/VTWe4IHw==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=6066210e cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17 a=VwQbUJbxAAAA:8
 a=Bl6OLPU8nqzXNm5YYFQA:9 a=AjGcO6oz07-iQ99wixmX:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v4 1/5] clk: ti: fix typo in routine description
Date:   Thu,  1 Apr 2021 21:37:37 +0200
Message-Id: <20210401193741.24639-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401193741.24639-1-dariobin@libero.it>
References: <20210401193741.24639-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfDiLzMti9f+2PiHEAAsu6xn+rVDM+lPnGENoR6zBoMCDhuA17etv25hLQb5jrSKjuAcMphCH4j+8tg/G5wT4AC9Exakc0HQKI9oab86fVstoTZdlfS6G
 9WoiF3Qx5zZx1dyZ07esTdm9XgZdhVG4puKiW+Rg8HcJg84o7ivevZa6qlmgsU+QuMk4ZR2zAN9WVCU+bSq0WPGpBzCLzG/ZisBzK5gXDDjpzaa6xNvCZbp2
 mOoZzMVvSf7mA2+Y+I6MaiZw9s3QS7W3J6gLVNT14kfL0kOBWm0u2vQgQY0C/VS6/DIlEbvldIQxoxRUhwZ9SDYJm1V/IjFV+nS9zT7uliWsnFGZhclCWXLO
 2iAs2R4TcHzchP8Ptv6mLSawhfHbcdx8Pdzp/SuLPYIK7SUGri+azFeAO+/xjVv/Skl5P+5b6VUwJ07u4Hma3o5PO+FYfkjcolmRtP+CkFgNlCHDMsG7a9rV
 FEYfR8k9GOiiUemjVaNUB3eAbD7CyzDAqbsGEw==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

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

