Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A791F4911
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 23:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgFIVpa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 17:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgFIVpZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jun 2020 17:45:25 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1FAC05BD1E
        for <linux-omap@vger.kernel.org>; Tue,  9 Jun 2020 14:45:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l27so288570ejc.1
        for <linux-omap@vger.kernel.org>; Tue, 09 Jun 2020 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=GOdQyP0B3ksL0B9EmGptEN2yLPYO2WYez041qnUzxTw=;
        b=OyiuNozrLkmkSYWiihi712t8Bz3UZepE7xj1PLpbVSUTn+Y+BuDuJieu+C7jp9r4NP
         xij05T59aRnS6zYgxw/i3ve1RBiDPYBK5shCvLYBP7hI3yNBOTXNc0Fo4tTpTXro/Oks
         sRqoAYE2aqanVIVWtNdtOrZb9bqhi/LetrclNPKUQftZkSgaJDUHQKkUYv+PSS6lYHrw
         u84EEIQ4+dAgmwvwer8eNnelhlhxbiDcoJ+FEOJXdo9Ql3tMil58KTDbAcLh9tzFmBTH
         fvTksuRxYrK6jn2Ts7nYjk7jlErcKtcjRz76cdvgqeYrujGpKOJ6YEeGJ1HUyME+cuSq
         jB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GOdQyP0B3ksL0B9EmGptEN2yLPYO2WYez041qnUzxTw=;
        b=TCUoqkg28bI7mtQJLvIWU71crFs/BEz8QKJqJgEZ6maLaRvuORpIG118m/8e1vTsQ7
         XwgN8jD5pni98u6Ax8gJlhwOdfuCSiI1jCIA372cbobbp4z7Pmv9UJ5X3hV67gQLTYIS
         4iZXnzOpE43sKafynR49+iO7Y5AvuuAmThnvuO0kyj60/NbrGcclS3uE59lc44fnDHEz
         GGsOR6t/fNQDX9DAnkXfsEB6aoHQxoteGyIxsuseoskgI1PZJIA3iVeGcN92gc9yQtN6
         xRF9Ru9okDM8a+lzZ0R66g1Ye80JGd2BZkBVOfzyOCKZZSX/wFvkMJFLaXIjUYoaQZoL
         dG1w==
X-Gm-Message-State: AOAM530wc4oxktgTT3RlYiuX33+ceJUjReWEK+lYuafOHavHxuK8YhL1
        sOLI5POQ2SUuDQWoDwebLox5Hw==
X-Google-Smtp-Source: ABdhPJwkNoRWWkvrjHDk00LLtcP7HzA7Xy3GySzV5Rd2dSAcsmwCHBgQHVl9mYyTlNU0mADnj5x1Rw==
X-Received: by 2002:a17:907:2052:: with SMTP id pg18mr349653ejb.513.1591739124134;
        Tue, 09 Jun 2020 14:45:24 -0700 (PDT)
Received: from x1 ([2001:16b8:5c37:301:1a8:aa22:e507:57b3])
        by smtp.gmail.com with ESMTPSA id s14sm13816008ejd.111.2020.06.09.14.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 14:45:23 -0700 (PDT)
Date:   Tue, 9 Jun 2020 23:45:21 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH V2] ARM: dts: am335x-pocketbeagle: Fix mmc0 Write Protect
Message-ID: <20200609214521.GB2995279@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

AM3358 pin mcasp0_aclkr (ZCZ ball B13) [0] is routed to P1.31 header [1]
Mode 4 of this pin is mmc0_sdwp (SD Write Protect).  A signal connected
to P1.31 may accidentally trigger mmc0 write protection.  To avoid this
situation, do not put mcasp0_aclkr in mode 4 (mmc0_sdwp) by default.

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf
[1] https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#531_Expansion_Headers

Fixes: 047905376a16 (ARM: dts: Add am335x-pocketbeagle)
Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
V2 change:
- correct P1.13 to P1.31, apologies for not catching that in V1

 arch/arm/boot/dts/am335x-pocketbeagle.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index 4da719098028..f0b222201b86 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -88,7 +88,6 @@ AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
                        AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
                        AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLUP, MUX_MODE0)
                        AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLUP, MUX_MODE0)
-                       AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR, PIN_INPUT, MUX_MODE4)           /* (B12) mcasp0_aclkr.mmc0_sdwp */
                >;
        };

--
2.25.1
