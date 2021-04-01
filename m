Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6BB351BBB
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 20:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbhDASK4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 14:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbhDASGm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 14:06:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFC8C02FEA7;
        Thu,  1 Apr 2021 09:12:38 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u9so2814499ljd.11;
        Thu, 01 Apr 2021 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2enjizmpD/LJygPj4XEpQS/6/yzRXEF2wF7GTPmSXo=;
        b=KyF3n3noNl+TF4SyZKEn3jqL0Mzlp8c6bW86UpMr0aPNIIUPyLsI61pZeNXgA6PwAD
         wtYKQFIZc3XNHc+wGhz6vJWtEUGczM+s5yO4a21aLeQDUt0C476NSjWybeLLLsSxzuv3
         wS7dD9KBYCSl8nDJB1lJrgZxACXRZ1jJcNoluQWLGdq8drqI+0kro/pqmrX0V5m2754/
         Lh8Nv6nsac84VCAYU/AyyH44y1hQ2rUN8EnBO8ZS6RhdFm7yQTUOvPtosrCUrFVX7ubT
         D65RGfnGaBJhMlVWWEpaeaL3h/23JxZImJs7qLSg66uHwgDoCeVzv/jBsVnTXRV/D9YC
         OhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2enjizmpD/LJygPj4XEpQS/6/yzRXEF2wF7GTPmSXo=;
        b=QrMZsHCazGDNoYMDT8CFEUKhQrXtNgeHQk4FeemzJPCjLudq5zzopOrJCg7xaLHlRN
         Dd4veYU9+BaOy6vYz3Mi07LcVfHi/ZlDppeKG+nQPNYlspfyj7YUN65tUAwdhJE0PXXc
         sfHzAY6eniGGLB8BSqu5ABH8dwRk3TNLNHKnyyGhDqJP2e1wisWHoHFuqtH5bl4WbA9n
         r4ijoi0CT9n/dX0FzHo7aq0i6uVQMVkYbsXk7AzGY69vuAkjz9za2sUBM7PX7QX0/xzr
         YSOJkadNNGvTrvAxQ3D+YhrBm/FI1GfVZiMWxQFeSSt3iZvI1u9KRSk1PRe8mn9LPQTJ
         BMEw==
X-Gm-Message-State: AOAM533ikS3a8+eh3XC/wsjB1osIW8BqlVs+BvpX074ZpGYnHBUeEENH
        BqP+xR2K+vWJ/NiNjFw+f/A=
X-Google-Smtp-Source: ABdhPJzcTjTlmmQdnEzAYC4y/zeNUyjAzAY+REJdX/vK/J+OVPyc4sDFCIkK9GVuPk/uNanPkBQncQ==
X-Received: by 2002:a2e:b5d8:: with SMTP id g24mr6094104ljn.64.1617293557129;
        Thu, 01 Apr 2021 09:12:37 -0700 (PDT)
Received: from 192.168.1.8 ([212.59.242.58])
        by smtp.gmail.com with ESMTPSA id l10sm586356lfk.48.2021.04.01.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:12:36 -0700 (PDT)
From:   Maciej Falkowski <maciej.falkowski9@gmail.com>
To:     khilman@kernel.org, aaro.koskinen@iki.fi, tony@atomide.com,
        linux@armlinux.org.uk
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        maciej.falkowski9@gmail.com
Subject: [PATCH] ARM: OMAP: Fix use of possibly uninitialized irq variable
Date:   Thu,  1 Apr 2021 18:11:27 +0200
Message-Id: <20210401161127.8942-1-maciej.falkowski9@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The current control flow of IRQ number assignment to `irq` variable
allows a request of IRQ of unspecified value,
generating a warning under Clang compilation with omap1_defconfig on linux-next:

arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used uninitialized whenever
'if' condition is false [-Wsometimes-uninitialized]
        else if (cpu_is_omap16xx())
                 ^~~~~~~~~~~~~~~~~
./arch/arm/mach-omap1/include/mach/soc.h:123:30: note: expanded from macro 'cpu_is_omap16xx'
                                        ^~~~~~~~~~~~~
arch/arm/mach-omap1/pm.c:658:18: note: uninitialized use occurs here
        if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
                        ^~~
arch/arm/mach-omap1/pm.c:656:7: note: remove the 'if' if its condition is always true
        else if (cpu_is_omap16xx())
             ^~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq' to silence this warning
        int irq;
               ^
                = 0
1 warning generated.

The patch provides a default value to the `irq` variable
along with a validity check.

Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1324
---
 arch/arm/mach-omap1/pm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index 2c1e2b32b9b3..a745d64d4699 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -655,9 +655,13 @@ static int __init omap_pm_init(void)
 		irq = INT_7XX_WAKE_UP_REQ;
 	else if (cpu_is_omap16xx())
 		irq = INT_1610_WAKE_UP_REQ;
-	if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup",
-			NULL))
-		pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
+	else
+		irq = -1;
+
+	if (irq >= 0) {
+		if (request_irq(irq, omap_wakeup_interrupt, 0, "peripheral wakeup", NULL))
+			pr_err("Failed to request irq %d (peripheral wakeup)\n", irq);
+	}
 
 	/* Program new power ramp-up time
 	 * (0 for most boards since we don't lower voltage when in deep sleep)
-- 
2.26.3

