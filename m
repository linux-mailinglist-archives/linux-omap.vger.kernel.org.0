Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF64733A556
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 16:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhCNPNt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 11:13:49 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:53955 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233897AbhCNPNp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 11:13:45 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id LSPzlDn2etpGHLSQ6lAQ8I; Sun, 14 Mar 2021 16:12:42 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1615734762; bh=5x+SnMXXNl5lP1MlTpZHetc5S5OURdo5+CO/FZksj9Q=;
        h=From;
        b=PmUqJleccBTDLsFKSoMoklJ0dQHj5QDOqWY7nWWoVAob+eLdnVjVJWRiyZogzztUP
         fKlsjiuMOfPcdXwo0Z/7jYyXEVQWs7+RUGmvRwkuwpj09UBn0So3Wj5I6hfehYobZ9
         FN8xa/Ta03RtjX49zgjNX457NwNp2gzlDPiRiwJo6t5/C1DKF+JHxYCtAxpb7kYncp
         zqyhz7VrOJcm+80vD3HozBm6tTiCVDRsVkCrB7Tt9pUsI7pEFNXxdrxT1qb8FOp0ef
         0jFy4UFG9qZG24VwW1orgvI3I5EIrA64GbE+ZCXEQ9NpcvapxOFqSLdZKXr+t0rf8U
         iDjFCRzLxZe7Q==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=604e27ea cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=Bl6OLPU8nqzXNm5YYFQA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 1/4] clk: ti: fix typo in routine description
Date:   Sun, 14 Mar 2021 16:12:30 +0100
Message-Id: <20210314151233.23243-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314151233.23243-1-dariobin@libero.it>
References: <20210314151233.23243-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfN6fGTPEh5gLyghbn1eIfsPmGzVXQ4yPJN4J8eWOvCIqGJParrQEOl8NkmMBDQDwIa5sOlkRZdxhbuiSdvWALn0NBqdWNbqUZuJxJVP0MMsp+m4E+4Wc
 CeD8l4VH6m1a3BGwbhZC7iqzILXBK1q5/pDivY/mY0Ro1L+r3vZDd6UdTdRJGvzbfrlsiqPiR/0cmE4+31PfWxGAllrryyQ4QANy9uQI8SvP2wVqvkmaZmU2
 SIBGD9IGTYvOWKrW4QcJl4YmJnBUsgPbHdeW/HYaZCRi8alZGmjWzmu7dMGyXVyFVMN0SG6mEmVQSgdKcNNMmaefrMz05yzAhq6du5vmXSuK3UQDLFqQVcdB
 9OfaXOtE0vhQS2SnQhBTHOm7b6YwHARms3I+bDnU8IwBQ3Hd4r67Ps4Pbr9GmDPVIhMLJ7OFyjJgfAYvCkGlc7JWvWrO5GE9AZEx5WADQkIE8AnS1piGCK6s
 3U7a4jmO51rBtHez
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

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

