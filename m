Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0703C3A5875
	for <lists+linux-omap@lfdr.de>; Sun, 13 Jun 2021 14:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhFMMxh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Jun 2021 08:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbhFMMxY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 13 Jun 2021 08:53:24 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78243C061574
        for <linux-omap@vger.kernel.org>; Sun, 13 Jun 2021 05:51:11 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a11so11281576wrt.13
        for <linux-omap@vger.kernel.org>; Sun, 13 Jun 2021 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7FNZsPAAGrb1WAeeF9cUXTEjimHXovHW3qsy7t+IKd8=;
        b=jgqjNg/jXnEEMLzltC/qolBFRt/UA50o4WlB8zB3BXrmEM7AKtgKjubWiz41IgmASL
         O5vL0rEpckyAkTcnJv5oY25wV8D1sIsuiR7XX0GNBl6TmhKGcFhYiRuNU6IvWOXMQQwQ
         5XHmehCO3rl9yyDOHwPGRrci3PcK/oAoIm64josdFlh6OZ9h9pWgW5tLGdcCvyQGmLZf
         n/oJoPBEeEg3mT5+YaklBLGrBYAyJ3ZgEvD/ePlhD7U+1Cj0e9/Wukd9/rPzaTGEtzP7
         31uTluWkAGO0itJFQZpuyVab5KurSbAiUro4T8SGPyV4vm52xtXOhew3bWq3+hqONhtf
         iK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7FNZsPAAGrb1WAeeF9cUXTEjimHXovHW3qsy7t+IKd8=;
        b=IoYCXJJyDi/k4HrrCftLrz8PHb3Ip8sgOZX6qCjCdfdFmoeQ44R6Bev7ujkHUo30Xk
         DoCE86IER/UmtYYc2LJNqPfXIPf2cJ0zGuLq1KLiFAYRHpfML3O5oeQxorSYFjwTR17V
         mq9I0USQ09UvwsoCO7QilLFkZM5LS/m3J8EFHbmGhdES/qxH+nZmEomdxXFaSLkKFvLU
         cSo6+vYgYTd+fM5K0sdH8QfI8nrNXLNg3gAlN6E3PB98TsKYKodBw3htzAQEXHxyziRf
         fgYzo8mfpEiCJxcpyN4UoTcXJxupl9d14cR0v1TJmht6ufkYH0NaNnTHix6KNAbHD4QD
         o7ng==
X-Gm-Message-State: AOAM530pvZELWjKWCuT4iK3O+lMyWiKdFVPULQ/Ny0V1Jrh1RYW6QHTE
        p7Ail4JaHgOqfjWzUYEbOPI=
X-Google-Smtp-Source: ABdhPJyaqzFN4ibTvRvbeBK8CSXvfvDSn4qt+xqc+tLnZPgf1oOp0x0d34ZHhpqaJ0KW7Kodhzk0MQ==
X-Received: by 2002:adf:a45d:: with SMTP id e29mr14094064wra.161.1623588670027;
        Sun, 13 Jun 2021 05:51:10 -0700 (PDT)
Received: from morpheus.home.roving-it.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id 4sm12879500wry.74.2021.06.13.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 05:51:09 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 3/3] arm: omap2: Drop the unused OMAP_PACKAGE_* KConfig entries
Date:   Sun, 13 Jun 2021 13:51:05 +0100
Message-Id: <20210613125105.786984-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613125105.786984-1-pbrobinson@gmail.com>
References: <20210613125105.786984-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP_PACKAGE_* Kconfig entries are no longer referenced
in the kernel so can be dropped as they're obsolete.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/mach-omap2/Kconfig | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 0d93914a8e3f..7f13adf26e61 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -181,18 +181,6 @@ config SOC_TI81XX
 	depends on ARCH_OMAP3
 	default y
 
-config OMAP_PACKAGE_CBC
-       bool
-
-config OMAP_PACKAGE_CBB
-       bool
-
-config OMAP_PACKAGE_CUS
-       bool
-
-config OMAP_PACKAGE_CBP
-       bool
-
 comment "OMAP Legacy Platform Data Board Type"
 	depends on ARCH_OMAP2PLUS
 
-- 
2.31.1

