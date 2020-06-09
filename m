Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3321F48E5
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 23:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgFIVds (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 17:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbgFIVdp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jun 2020 17:33:45 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA89C08C5C2
        for <linux-omap@vger.kernel.org>; Tue,  9 Jun 2020 14:33:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id x1so214996ejd.8
        for <linux-omap@vger.kernel.org>; Tue, 09 Jun 2020 14:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CgbcjfQ1kq89L3/ienhL9zGUKzOCusjb9FsMQdNs9jE=;
        b=SBs0a5RSiaP8x0a+u23Ej8vtBCk4zBDH6+TbzQB5mFkyN300SzQZs5wkqEw4nKmaNC
         vpuW/4Hb/j3+QfoWiNcAEadN5VYeUXK8YsGgkvI3b2qqJxvt8D4SrpSWp7vpT/l2q+Yz
         d70QpIlvPsB9Krf5aEqR3hBHvrvTRSMNqTxkAfdf5iAZz8zQPPmU1NGyydSUfxtiy1Vu
         V5bJqfw5DEeElt0HMnaJGKipg7EhcGt1yw8y29BfMG7h79q+0cey1w+JjmDL/w5L2dcA
         o96pF4EivkpWZrXMBzMAgZ6L4iNVESrdcC5xala6n9jO1j/nCAF1Ke+4opF1sulRe4eQ
         P1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CgbcjfQ1kq89L3/ienhL9zGUKzOCusjb9FsMQdNs9jE=;
        b=IvFlkJUW57SAUeN294lWDqA9BNIb4o/H0HHZeX0WC4IMHIZYv9TmleEklcaK1yaLbk
         XfpHYrRY1gGxzdzdrtQ1TgiIRyXRqnuq+TtmBnebVD36/tCk7RgAweH8EGFGSr0n1Zpx
         5KZiXk+mtt07RinC/xNMR25cm56WIrhqEBJFDq8cwYDUAhcxA9IngU9tCVsA7B4JT+d1
         RxSxzyyBuZOIloYHb7TPupQ9yxVXthnxTZ4/NmMjDPMk/b7xCDDCorM2B482wP1ZpkEg
         OP1k0WAk9fhSsTEPBhNJ79gcOtTWu/daAUI5TeAbU8Jf/3/6PND+d/iXSlTAvEMyEk8r
         4DHw==
X-Gm-Message-State: AOAM531vTnU0dk81DK9Nyz6Y0q5TAwEjGdfKB53zL2ddAmwzsQk3njbz
        MwL+LHblIn1o6C2FQjnB/WpCyA==
X-Google-Smtp-Source: ABdhPJww7ye4OsDfB07ilbw8KkpEg2aYFeJ3uubVqXldFSn0oXMyMAyiNep/qKjK55jFi6HjDLGHxA==
X-Received: by 2002:a17:906:28da:: with SMTP id p26mr313099ejd.551.1591738422202;
        Tue, 09 Jun 2020 14:33:42 -0700 (PDT)
Received: from x1 ([2001:16b8:5c37:301:1a8:aa22:e507:57b3])
        by smtp.gmail.com with ESMTPSA id p23sm14019375ejw.125.2020.06.09.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 14:33:41 -0700 (PDT)
Date:   Tue, 9 Jun 2020 23:33:39 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH] ARM: dts: am335x-pocketbeagle: Fix mmc0 Write Protect
Message-ID: <20200609213339.GA2995279@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

AM3358 pin mcasp0_aclkr (ZCZ ball B13) [0] is routed to P1.13 header [1]
Mode 4 of this pin is mmc0_sdwp (SD Write Protect).  A signal connected
to P1.13 may accidentally trigger mmc0 write protection.  To avoid this
situation, do not put mcasp0_aclkr in mode 4 (mmc0_sdwp) by default.

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf
[1] https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#531_Expansion_Headers

Fixes: 047905376a16 (ARM: dts: Add am335x-pocketbeagle)
Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
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
