Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C270F3A5884
	for <lists+linux-omap@lfdr.de>; Sun, 13 Jun 2021 14:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhFMMyW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Jun 2021 08:54:22 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:53035 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhFMMyW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Jun 2021 08:54:22 -0400
Received: by mail-wm1-f53.google.com with SMTP id f17so10523274wmf.2
        for <linux-omap@vger.kernel.org>; Sun, 13 Jun 2021 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ah1ld02LgyCAKBWIkH7RUzMXyjk4o3gII9N/SQONNLY=;
        b=jChf4oxRX6tx4bicJZWeN5XgiHXWBh/ZEmdcuAdKFf8ud6yBS5g9A9H1G2qSBEGR6Q
         KI/HkgCPBDr7leJi/MAAB2TumL5THtzdglTZl9+L9lNSwU9a9mbjm6Xu/r9r8wQOnCNn
         Ar8ihWb60sLrVCwRF+9eQpG0yBfhyZxk87/W6I+oxV9fD4xYjcjeQgcgZG+O7ONACX3E
         sZmiK+egXQIBjmRo1rnpGF44wa2rMuTkXA6sUT9sNbhBj2AOghwzsVsdD4brfJ+0jVDD
         iDwO5YUsARrQB/dkuEqCICeHwCsPXGvjstU+eyMi+nEU6XvR1lGHvoAMsis1vEbjNd3d
         rMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ah1ld02LgyCAKBWIkH7RUzMXyjk4o3gII9N/SQONNLY=;
        b=DE4v2K8+XUbpQ0P8a9TRWTfQSl+ArQYwmfRYv1odYs2ioWfJk2tx2gEmbjGYkPIqE0
         ohQ6xMZ6d+svWr2VI8NkogwA9UKjTe/0pT4j5vI4Ar1rEMyU4HnGv2RQ6QgGu+KZKVbG
         CFOyzzWt1XLi3c1msAQqH+XMxYo6jqPy2aIF1d4UqIykqeDci+zPFRBHC9pMcm1VHaJ1
         P8oWeGgKYx5F9YU1Y940SErJMYXkxcJ+/ILEiAqQDjOb7OedT8JRkPxI9cV/mjgIWmdw
         7QjvxFaP+e0PvvwvkpfrcfGymeAj/jp3XbPu2xjJL9+V58alB5BB/pf46CNNur1q/aBh
         prEw==
X-Gm-Message-State: AOAM531rZIY4tz+TpSl7s7w2h3XZiTzZAeE/Qcea6rjOyZbqazv3zeT7
        qenQ6/gN9KPiIteIohNasBQ=
X-Google-Smtp-Source: ABdhPJyQxam6suUDTKSVFyAKfEYYvGO/JmDNm7aaEBierUKatEIPHiTZrwFtPNo29YDHEHOXoQ0vRA==
X-Received: by 2002:a7b:c006:: with SMTP id c6mr27732710wmb.11.1623588669413;
        Sun, 13 Jun 2021 05:51:09 -0700 (PDT)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id 4sm12879500wry.74.2021.06.13.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 05:51:09 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/3] arm: omap2: Drop obsolete MACH_OMAP3_PANDORA entry
Date:   Sun, 13 Jun 2021 13:51:04 +0100
Message-Id: <20210613125105.786984-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613125105.786984-1-pbrobinson@gmail.com>
References: <20210613125105.786984-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The MACH_OMAP3_PANDORA is no longer referenced anywhere in the kernel
options so it can now be dropped as the board has long moved to DT.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/mach-omap2/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index dbe7fa6e8232..0d93914a8e3f 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -204,12 +204,6 @@ config MACH_OMAP2_TUSB6010
 	depends on ARCH_OMAP2 && SOC_OMAP2420
 	default y if MACH_NOKIA_N8X0
 
-config MACH_OMAP3_PANDORA
-	bool "OMAP3 Pandora"
-	depends on ARCH_OMAP3
-	default y
-	select OMAP_PACKAGE_CBB
-
 config MACH_NOKIA_N810
        bool
 
-- 
2.31.1

