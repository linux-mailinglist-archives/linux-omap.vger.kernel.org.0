Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4EE34F28C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Mar 2021 22:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhC3UyM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Mar 2021 16:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhC3Uxn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Mar 2021 16:53:43 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC98BC061574;
        Tue, 30 Mar 2021 13:53:41 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id s21so8396794pjq.1;
        Tue, 30 Mar 2021 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=76Ftwc6j0K5A0mdhCxE35QoW2mVgwaH1Lt+VHIxvLcE=;
        b=Xs33hE/uq+i7i05sdlY1p4nl+mEWK9rmNggt1oqffM7UMa+sAHYsFw3w9v6ReFViOK
         PILw0yc/9qUNvp4sBCOFa9ITYvIkaAG0d2s1XrYNMhvw1djyn3hQVzq1DQQSgzg5hygY
         HLintNu+m5cfEFGQlWFsFKpz5gNSz/fGKDlCGy+MchU71F2vpofB/34lvqUz0iIwZI4p
         3flbBilRjtTyW3jC5V6TIpE1CxGSXIXJ5s1zSLdhR3qRKul4Zl6UiPqcEiZxnZgVgDJb
         ji8r6U1hlxQWIbcuXXQ8fJxae/52xYDUCAaY/igmC5I9DI9RMFORgukd7ccp9fkG9oLb
         UqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=76Ftwc6j0K5A0mdhCxE35QoW2mVgwaH1Lt+VHIxvLcE=;
        b=INS4+B/Saz2FCx7shpIgIgZA0DcYC4BZzQ7DCNmI7vajkJrW9wySQdqL6Zys7UacNM
         uZrD//2dlAU1zSY3YF/sMkjbQAWpFGEO0pU5PpSmTnbSlF1Cqh3p14ecLQV8e7WjFl59
         kTMHGuD1SvVfBGOrJZyMLvuvyC/9rDRWFCavO1C4w3eeM1/kflDy8X3JGZhFecS9SP9T
         VmlgF2TiPSraDUWCev9DPZxTGcirOIsqzKd0B/LnBzWRHOs1KlI5uV8Q7ryR0q5spcgA
         zL6DT/JR0sqT+QRNqyAeCMnNHFHJ7c8Qyzm4m/yRUnggrHwSxBTw7WYuq9vkRHWs9cBF
         F4YQ==
X-Gm-Message-State: AOAM531tGhYWegdFCm/aHR7+DHMbfoYIdnmWjhw8ZWVCpQx+4E3j+W7b
        mnUcbH7fbI1JMe7TAfUl9u8LqO67cWHnCA==
X-Google-Smtp-Source: ABdhPJwUjuJTIOCOPZKJifMZmhD87LnB9We54yGCEzll7ZIcimiVPqhJskN/NOLFeEebbRsY3yaCUA==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id k6mr181610pjd.212.1617137620933;
        Tue, 30 Mar 2021 13:53:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
        by smtp.googlemail.com with ESMTPSA id fh19sm35622pjb.33.2021.03.30.13.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 13:53:40 -0700 (PDT)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org, aaro.koskinen@iki.fi, tony@atomide.com,
        linux@armlinux.org.uk,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] ARM: OMAP1: fix incorrect kernel-doc comment syntax in file
Date:   Wed, 31 Mar 2021 02:23:30 +0530
Message-Id: <20210330205330.26345-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for arch/arm/mach-omap1/timer.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: expecting prototype for OMAP1 Dual(). Prototype was for OMAP1610_GPTIMER1_BASE() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/arm/mach-omap1/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/timer.c b/arch/arm/mach-omap1/timer.c
index 97fc2096b970..0411d5508d63 100644
--- a/arch/arm/mach-omap1/timer.c
+++ b/arch/arm/mach-omap1/timer.c
@@ -1,4 +1,4 @@
-/**
+/*
  * OMAP1 Dual-Mode Timers - platform device registration
  *
  * Contains first level initialization routines which internally
-- 
2.17.1

