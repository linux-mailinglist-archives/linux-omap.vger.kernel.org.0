Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC3A34F2AD
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 23:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbhC3U7g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Mar 2021 16:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbhC3U7S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Mar 2021 16:59:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBB3C061574;
        Tue, 30 Mar 2021 13:59:18 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v8so6795029plz.10;
        Tue, 30 Mar 2021 13:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GLVkZwPkKaRhPJAPLLORTSkvh5Dd5Uiq8r8OTjAPxPc=;
        b=WBBjcNxBrdR0V3i2ef1toyctyQAFtQgrWPCC/tX5suEjlhqxd/gA0sTJmNdfz2srkd
         +LEPMX1tPGGrskXKKAvgrf1FM8qzNRpQ2mS96ZRQX9Itc0Kz+iN06Ij0evj/cN/ccxMF
         sQAPXlwWMhgCWBr5opBlnfagUqjRMYll9VXbCi8NzotvcjSwWXH/F4TkCWkIkb86rXpq
         ZtLhrvSsTcuSs4Fthz/NO9N5zNXFO3sfWJd+6i/Slr6szVXbp8YTS/z+/TvfMj7uTUeB
         N1w5LTtkSNT+G2vkhVEIe+fYfjhQPZbgnz78hbCC9xm7H+bpSOFwpHSzHMMktX/v3XnO
         ay/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GLVkZwPkKaRhPJAPLLORTSkvh5Dd5Uiq8r8OTjAPxPc=;
        b=RfhCAcXyIeQZK/dppGv1LDIN/3dHWlG/axiuHA5YH1hZKrx4tBblpiMBsPRqru2tNb
         UMBCBy1wRh6pPX8Sw1Bv0q/fquxZW/Xaj+h7ks9kQMqgb7oBeP/c/AdlKP0iXbs4CH3s
         Vacls/Fxl5BsNUfMcNIeilHeMIYV1YzKNWRHdm9dAQEVwpZLXjKZBKK6y5FV5JNig4kN
         MaHRVkRUb7QJNrpk+bqgUy2GpzmpibNlNhrvniU+EsKeG5xc9iKBwjg995+dUQPYuqvu
         ReOExlYS2jwuW4rTvmzGFiPDuPyAp7vpvVlT+ezHMb/gV9l7lNwsdbe3lNcvwLsZ9U2C
         LR1Q==
X-Gm-Message-State: AOAM5315JdJXXD5/vlfTuAY8B6X6bQhI7g2i/FKvsCz9T1DIpxCwMGcD
        ZfeNsBwxIP5wv3hqx9tG9vtELmipJMi6uA==
X-Google-Smtp-Source: ABdhPJwGSaV9UaiRWx8RbovjUc9n+Gl1cLC6IYIky0o8D7pfB7CjSOhacJgjovEs0g7gxZXC6rTKeg==
X-Received: by 2002:a17:90a:f82:: with SMTP id 2mr205467pjz.196.1617137957991;
        Tue, 30 Mar 2021 13:59:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
        by smtp.googlemail.com with ESMTPSA id u24sm22431017pfm.214.2021.03.30.13.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 13:59:17 -0700 (PDT)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org, tony@atomide.com, linux@armlinux.org.uk,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: OMAP2+: fix incorrect kernel-doc comment syntax in file
Date:   Wed, 31 Mar 2021 02:29:08 +0530
Message-Id: <20210330205908.26800-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for arch/arm/mach-omap2/omap_twl.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: wrong kernel-doc identifier on line:
 * OMAP and TWL PMIC specific initializations."

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/arm/mach-omap2/omap_twl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index a642d3b39e50..d4dab041324d 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * OMAP and TWL PMIC specific initializations.
  *
  * Copyright (C) 2010 Texas Instruments Incorporated.
-- 
2.17.1

