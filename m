Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE313398DB0
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 17:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhFBPDC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 11:03:02 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:34229 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231866AbhFBPDA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 11:03:00 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id oSLqlJ7WDsptioSLvlKAs8; Wed, 02 Jun 2021 17:00:16 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622646016; bh=hBVv0EIDOJPnyshBY6NoCuTaYvUzw/b0onSPeL7WQcQ=;
        h=From;
        b=ppUATeBJ+5wizAZTqCemG42hzTxRl9JDvWS37QLeqazXDdOrHKkGOPeGYW4W5F1kz
         m3Wc+GcCTp4FE0WRlkAVi/nYysoU1slcjXIxe2SJeP8bNp4/Et6w2TPd0uBDhToNDn
         cEDDzhk2DRSdutqIPFF12WnvDaGCLETONuljpWzufYvyScJhilwkjNyGxO9PDM29zR
         pnFSWedqO/xnXZ4Utm3s31SwJ2d4DMV9o7BsYHS4IbmsEQUHEQg8NdHQ5vzLPxcGT6
         t084r3O/+VxASypI9KrNDBR3ab4CJwgVYPpUbte2eeqOuLjxhP/QJOYqrlmFtOjN+T
         M2Od/N1wu9rtQ==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60b79d00 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17 a=VwQbUJbxAAAA:8
 a=Bl6OLPU8nqzXNm5YYFQA:9 a=AjGcO6oz07-iQ99wixmX:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v7 1/5] clk: ti: fix typo in routine description
Date:   Wed,  2 Jun 2021 17:00:04 +0200
Message-Id: <20210602150009.17531-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602150009.17531-1-dariobin@libero.it>
References: <20210602150009.17531-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfBLCgayubmjjCLak38s7cr4yfgaSyVJdTZ7yaAhrXkgcbkYka3zLoybxIsD243u5wKsZ/OFYitHRJqiGhNihDE8qZ2AYhVn+0BbDUHPRDHwIEKKczfZN
 80RAQ0xpxCKhIhR88pIEw7Zh6ZwOL8TRRb6bs4ViNT3m5zewvZw70Pae1oQfP1uO2p2MsfpxdkHSPVBM+W251UEoFFtLcv7amw7Vr7iApIkTpqHBZhu3bSq/
 qmi89N2q/UKSji6Nph9jxxXBg+PJ5USFlC9XXQKIwbup9iMafrlFY0dq1kuuCp7KWcGAk9vUi9kNzfPlRXP0y/pPRGwKNYC+hQYROo4d0DekQm5HdE34d5WP
 UJ1wVUZgDoF63je9z0y2S72HxGHMyxXJDf0jORHBLzdPvGnYWhjc4PcEuNVOmK2adchBGA1HLbt99gDGrqSf1sOb28f4yLsCE8HTb/LsxYEq8IdWxz+68g3n
 DK0GGYUFGmBPexPCZtJ/It/OqwsOuNruiMDB47+inTofv84SYwqRO4oY9e/YJSD/Kfk9mZvDkvSZZWG+3J7XtsXKoKALauM93a1QQg==
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

