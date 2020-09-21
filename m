Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0300227360F
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 00:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgIUW5O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 18:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbgIUW5N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Sep 2020 18:57:13 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC23FC0613D1
        for <linux-omap@vger.kernel.org>; Mon, 21 Sep 2020 15:57:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e23so20115613eja.3
        for <linux-omap@vger.kernel.org>; Mon, 21 Sep 2020 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jSUUFraOan7yfkNBxJ0PXo4gn5Fu1DsGDMc9ndN1tQ=;
        b=cHEUC3C9K11LQLTPxZnfAmjIogqYmFr8vJH60PhAVwa4FQGTM3NkA2zDBi4+nNnh+V
         wW4EDqRSW0BTCg85zhKjVc1ZaSXVLJZeQ7elYRILPEzEsgg9tIJVqi+OcU3GKPFkblAv
         4Z7eEP0jbOhhbVo2KeozKp7OVo5cqz/K/2/udw5PaQStDEOKziVyLbYcGC35fo4+Yreg
         GQjwaGp11FnVmhyn6674qIt5PVo5iXl4fz+MZV8sDcCiMCkQEDmE6DNoFhUBd4qZgG+V
         vUjx0zynTSJ+SmJkkojfu1gOqjtzRcZUZ3Fz/3kNtAkjFc1O7vqC+JwIN+3RUYr0k2hH
         NMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jSUUFraOan7yfkNBxJ0PXo4gn5Fu1DsGDMc9ndN1tQ=;
        b=M8xDT7wkMjhUr1ptlJ6VqbdtATgUS7MiEp7RlhgmziPzsBAThYKvVz4m3mI1b+TJUX
         FCM7re2/xJJGthnz7WJ0JVPyQn1pU5M2t13Qo39CDgWhIIR4otnJOqx4NmItsZdvxX1N
         xV6ELbmToek54fM+9BrjhoeYKRmLFoGceW7jNLDfMSpNsauuVEERoA5RQbRORaU4K1NL
         RhE4XnBJ3E+YVlC7XxQsaS47BkG5PYbQzfdFYCnaofkm71lgXhtO3npNWZlBVnwXWlaS
         pyT64IHfuKRZI8nCcOow14yypZOXGs7IpfC5GGsFWA6MybapH1PaU06M5bCEosU/SOCi
         lwQQ==
X-Gm-Message-State: AOAM5312uCfufeSpGbPi6qglwTUY+vlxpMOhc5bZkL4hdugI06UsBWOh
        GOAInjjSpDKT3z7mCpOoLiZhfw==
X-Google-Smtp-Source: ABdhPJzP2r2Zay0wb4c78o7KqOUFyqGJ05rId6WnI920VXQBmoylUgFeYGIw9gYCqi7ifH7VMnYtpg==
X-Received: by 2002:a17:906:6a54:: with SMTP id n20mr1840834ejs.401.1600729031313;
        Mon, 21 Sep 2020 15:57:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c50:7f01:652a:68b1:4040:26de])
        by smtp.gmail.com with ESMTPSA id e15sm9401321eds.5.2020.09.21.15.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 15:57:10 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] ARM: dts: am33xx: modify AM33XX_IOPAD for #pinctrl-cells = 2
Date:   Tue, 22 Sep 2020 00:50:55 +0200
Message-Id: <20200921225053.4126745-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Modify the AM33XX_IOPAD macro so that it works now that #pinctrl-cells =
<2>. The third parameter is just a zero and the pinctrl-single driver
will just OR this with the second parameter so it has no actual effect.

There are no longer any dts files using this macro (following my patch
to am335x-guardian.dts), but this will keep dts files not in mainline
from breaking.

Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
Suggested-by: Tony Lindgren <tony@atomide.com>
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-devicetree/20200921064707.GN7101@atomide.com/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
NOTE:
checkpatch complains "Macros with complex values should be enclosed in 
parentheses" but all the other marcos in that section have the same
format so it seems appropriate to ignore checkpatch and maintain the
style.

 include/dt-bindings/pinctrl/omap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/omap.h b/include/dt-bindings/pinctrl/omap.h
index 2d2a8c737822..f48245ff87e5 100644
--- a/include/dt-bindings/pinctrl/omap.h
+++ b/include/dt-bindings/pinctrl/omap.h
@@ -64,7 +64,7 @@
 #define OMAP3_WKUP_IOPAD(pa, val)	OMAP_IOPAD_OFFSET((pa), 0x2a00) (val)
 #define DM814X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
 #define DM816X_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
-#define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val)
+#define AM33XX_IOPAD(pa, val)		OMAP_IOPAD_OFFSET((pa), 0x0800) (val) (0)
 #define AM33XX_PADCONF(pa, conf, mux)	OMAP_IOPAD_OFFSET((pa), 0x0800) (conf) (mux)
 
 /*
-- 
2.25.1

