Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EA91F6FBA
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jun 2020 00:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgFKWKD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jun 2020 18:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgFKWKC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Jun 2020 18:10:02 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D1AC08C5C1
        for <linux-omap@vger.kernel.org>; Thu, 11 Jun 2020 15:10:02 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id q8so7175797qkm.12
        for <linux-omap@vger.kernel.org>; Thu, 11 Jun 2020 15:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7vi95NSNGo0FVYj7bBTDUtokoPAu8hd+3gRY+DmZdRs=;
        b=gnAHqeZAMs724/5TtjuVPFRp2MixtrDQEfiNIVM8YLfFH4B09RRQPO3+5qffHxj2Yb
         8EJ85CfjzgL6qIkjatNEmxJYgOyuES8RiyssWtUt22FuyfX+33qO+td2YKwlqMzBcMQm
         kRv0M26ybLYxoyw0sHJshp4HQJYb7d9dGcOVnwmpgBxdybRgoq9Fb8vfZZJAMsTk4l8L
         XG0K+pjzJPyvkQmqBnXsMBlsSP3RClxF4FPi+biZy7BDC5+aCPTagt1oOEQjee6LC16r
         1buCfp3sBqpcfxyGtxlcFDexDEfWb3pzIx4zVi6qnXAuB/GFxiRc/QKzjRkCuidn8yqn
         RFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7vi95NSNGo0FVYj7bBTDUtokoPAu8hd+3gRY+DmZdRs=;
        b=b7l0Ej++brhrNiLdMEszXmAhyXXoB98DvfYJL5c6dOBDR9sGm0gCyuQREMIZv1DYr2
         8iLgGdpZWyGwg5as2jK6ML6erO3W89BaI0CoBNISkQcmmQ59WIA/pr0+8eLtcNlJsdq1
         U8uIHjUirKAFwmStBv6Gc2RDdGUwGel3jOXGkk9CrwS2pXsrrnmk4Kb89JQtVFuchPGZ
         S5yJfF89b6ZANIxOD1VYbffCkY6xoamVAeJSIEF22YB1aElZPtyegdp6z0fPcUfixtLj
         TYToOHZhzbe4vYcq+BAUY3hn6/dUatlaQpgas39c1hRF10QouwPh96GUWMal1Nu9Ry3Y
         mjrg==
X-Gm-Message-State: AOAM533v4ffjjUsm7KRf3rMQ/7F1P/sXE19rX+Rc1VzvTlbTWRJsHih9
        aCgnrYRMsYqn1RENe5/53WG9pQ==
X-Google-Smtp-Source: ABdhPJybhAxOsyTZf0LQiKs8JrBNtizqFqRuN3cJeLA7ECRaRH1T6Q08A9mzwpItugpUTANFEU8XKg==
X-Received: by 2002:a37:9f09:: with SMTP id i9mr166786qke.60.1591913401743;
        Thu, 11 Jun 2020 15:10:01 -0700 (PDT)
Received: from x1 ([196.52.2.87])
        by smtp.gmail.com with ESMTPSA id d17sm3168281qke.101.2020.06.11.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 15:10:01 -0700 (PDT)
Date:   Fri, 12 Jun 2020 00:09:51 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: am5729: beaglebone-ai: fix rgmii phy-mode
Message-ID: <20200611220951.GA3355634@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since commit cd28d1d6e52e ("net: phy: at803x: Disable phy delay for
RGMII mode") the networking is broken on the BeagleBone AI which has
the AR8035 PHY for Gigabit Ethernet [0].  The fix is to switch from
phy-mode = "rgmii" to phy-mode = "rgmii-rxid".

Note: Grygorii Strashko made a similar phy-mode fix in 820f8a870f65 for
other AM5729 boards.

[0] https://github.com/beagleboard/beaglebone-ai/blob/master/BeagleBone-AI_sch.pdf

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Fixes: cd28d1d6e52e ("net: phy: at803x: Disable phy delay for RGMII mode")
Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am5729-beagleboneai.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index 9877d7709d41..4c51c6b05e64 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -505,7 +505,7 @@ &mac {
 
 &cpsw_emac0 {
 	phy-handle = <&phy0>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-rxid";
 };
 
 &ocp {
-- 
2.25.1
