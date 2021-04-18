Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A3D363638
	for <lists+linux-omap@lfdr.de>; Sun, 18 Apr 2021 16:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhDRO6e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Apr 2021 10:58:34 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:55783 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231320AbhDRO6e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 18 Apr 2021 10:58:34 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id Y8r3lCRdYpK9wY8rCla5W4; Sun, 18 Apr 2021 16:57:06 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618757826; bh=hBVv0EIDOJPnyshBY6NoCuTaYvUzw/b0onSPeL7WQcQ=;
        h=From;
        b=FCwpPwsgkMu0vU52HZS7lmXLXrNc0DrzCYgHL7Vc/+NxazWjpo5qECHXuX3Vxmmzp
         mjHjhIZNp7GQMLsVfbEMm/pKkOtV7OfaJvJJ5ZjR7SES8gdyvtORvn0cw+4U9intft
         7JlfvYIGP8xj+CR14mKxQtv6JtfCRITeYqNN7y38Sv1O6wd2rvD7pW6I0PDPi2RnCO
         GZetXAw3th6faW1xYrSVeotYcTkHgQCt+HyL4j+7lHUE7ObCSe+47xG3XZOl41CVS1
         WH4BZr0TwtDIDa01+Vga+SUeO954B8PAWYa6pHjD8q88EnNgn6pinY87ZD3hI0CswS
         xmqmd4vBCD3NA==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=607c48c2 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17 a=VwQbUJbxAAAA:8
 a=Bl6OLPU8nqzXNm5YYFQA:9 a=AjGcO6oz07-iQ99wixmX:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 1/5] clk: ti: fix typo in routine description
Date:   Sun, 18 Apr 2021 16:56:51 +0200
Message-Id: <20210418145655.10415-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210418145655.10415-1-dariobin@libero.it>
References: <20210418145655.10415-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfLJ32xryx0zJbSv/pCGIcH5UmtmnokARk/xsaPBFowp6UztyiGOVUTDn3mEyJIJIRdrgRjlEXJj5lsxBZWVTZpbOq4B/5/vwDnCgjTWsQgpM+VVTpESe
 Oo43KFHKLo0W2BHTDTc1WoXA96gYEf4ybTwGXu2vB8hmUUcdt9YaePpvwDF0+0L94K1VrUJsmVp3uDT265pUPEQSlDcnIxWl4hwzmizZDEq/A3c26P9mXrFb
 trBH0/OEpkc052PttkHPk22UcCtMs6nL66Rd63wUqwuzfzN4EC4wutmYPKHotxp+1oKpot90Nn+sWTDVPfOCeWSolrOn7GaOvzmT4/xPyX2Gieuecezlgy/Y
 +czitd97sgZ9UVl4hON33FvIX1at/v19eexMy89VIs0XQfkKIlHZKGMA/sVnvC+/UKl+C6KjKGGIQUfZ/6UZydLhVbTju2AUrLK8n1u3JlJjbhJ6MXx4MrhD
 BtGb3gskjyGYSHjII/94tpu53UPIPnHKiWJE/A==
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

