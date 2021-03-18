Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFC8340BCD
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 18:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhCRR1j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 13:27:39 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:60290 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232105AbhCRR1M (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Mar 2021 13:27:12 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id MwPulsZ9jtpGHMwQHlfgfG; Thu, 18 Mar 2021 18:27:11 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1616088431; bh=urzH31Z57u5IKC1xQOvu0WiSuxDteA7bOWqFQMrqKOk=;
        h=From;
        b=LgwRXNWvyIdo2uELJyQbmDyD+bkmXhjUcXirhrnjX8BRtZBzlxZMPhzug7PLrt3dr
         qfhzePJVr6F3g9c8dzHpFmG5t+gkVySuvjnf9ZYAhyohDDvpw/tlBxzkm48abpOadK
         RbP7zqd1oI/6uRK4SGzYR/wGB3Ccq4ZdLf6ln1z9HvO4XF1hGzR5+kLJP/KrHLyQA/
         FuAkURHTvLeQ9XdE5gA44FI3z+W4iIxTP44tHJ7P2RARe8IIMtxzelxRyT91KVL0W7
         P8Zlpi/iaCGuXsdj5sLL4d5gMcA1ZNqH6r8eYhpR/03qasr1dJybIpAmckWK6vhS85
         uVBTSqvmZPB5w==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60538d6f cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=Bl6OLPU8nqzXNm5YYFQA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 1/4] clk: ti: fix typo in routine description
Date:   Thu, 18 Mar 2021 18:26:23 +0100
Message-Id: <20210318172627.12173-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210318172627.12173-1-dariobin@libero.it>
References: <20210318172627.12173-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfDxn+9InnTOZBfihnOKd4UM+NXSHwEsgEiEM+jBwUiSl8Bix6nk0TJ0iJ8EjrS8Qa5VwK56xii6M5M4JNiChjKdr//uVemhFkJxnn1cUQn6fwrsE7zFY
 DKeC4YpSu+CX83wDJQAlZj+4L7/Q8ZQDaxKI0ffdpDTcPzTCoLyZV6FcQVR2nZvW9XpjEdc/IRpFxi3Twmh28+QMLmh/7W5jvJ/8/f+zf+C61sdhnU8lpK+C
 cg1J+s/diQhNjk0hrNsAtjqE0I4bgNYKf+YWSg4MBTaLX+b/qKqBDaGvOFtgUFhV8R6PJy3Zw5+GtxlZXKaxhxEhBhjdWE1Tx3egBPff6DPz/AAN2IF27pdZ
 1Xjn9AxiSTsHLwuQ6a7XlUj6+46p/LNrYtHiIMN/fVx1+cHsSmOefudW4+0RoiRXYvLkfgbrKPQSkMhrMDahgFEE/8pjQXRL1U+67d6QEPyrA2AEZuNEGuIX
 8chqhSP1jV57V5hhGY0U7CMmEFQrZPRrbx5lSA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace _omap3_noncore_dpll_program with omap3_noncore_dpll_program.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

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

