Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A89210926
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 12:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgGAKX3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jul 2020 06:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729791AbgGAKX0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jul 2020 06:23:26 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C154C03E97A
        for <linux-omap@vger.kernel.org>; Wed,  1 Jul 2020 03:23:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f18so15160244wrs.0
        for <linux-omap@vger.kernel.org>; Wed, 01 Jul 2020 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+0L7y/Q5A/sbDA9AxIYlmTu4gtBQkLRySgsaJ7BoAY=;
        b=kQ7dkkURh4AtE4qt3ISqlQdkih3RMk1qYxt16jBrQnP+M4yANrT9fjqxEUUvPKBZCU
         +ibk0nVgsTJCv4KKuqtFXLS8ZZtsA/C8msTHGAFRRTlzdhnMWf9JNjyvkaDSSsfvjqHZ
         rS/oIaEhI6i26kgyrdznxuGzcahq74INsEQy0Ym87n7DF1mrbXcKTeUdBwDN0tjsM1jY
         i9LOzkwVt4ut2AxZkywFAPtfZ7WpDqZd89Kq81kqnQErx087oc0kNMyRM2CA8ZtKAO+U
         2U+nlItyqhrv6GNd6bzObPsvbtxMF6HRjaJowz3v6BcX7pfLCHcxvOFceHEtpydsTSsV
         XXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+0L7y/Q5A/sbDA9AxIYlmTu4gtBQkLRySgsaJ7BoAY=;
        b=YPm10Vzjvf7rkAkXjVVU6NZBxOCB24hx3hWkU0sO4S4jfDyi+4R8qJeyZFIm9Lsh5r
         RFG8TiNgrNcNHtBv7PZwmnHNeBTlopVD8OOAN6msEC5ePYjO9wiGYBfFMFJmxIzDTkVC
         sBI/DQe8GHDqDAiz+QMV+3ARn6gy3U6aLIhWwFls2x2HMMmXYvcTIUELofwOWEHloU0H
         hJ4upHgRItD73cDlY8bAFbwRrSSrb/TUTopv7K8Db/dBBU8Nn4ZLQjCElBv8kfbpOoAE
         VjgkZQ65uOmhu8rjyV/nBr/FS3BFyuRcZlYHXORKppG1bVkQF3D0qdG5jK32K1xQ4kDy
         +pSQ==
X-Gm-Message-State: AOAM532dSsmjqnQAIwKNNqKeeGHtbTUmA0esIdPpxqzlkVzufbPB3yM+
        UQA4fwr4jqptnG1B6/ihvHerRw==
X-Google-Smtp-Source: ABdhPJw1kO9gxa4UxTNtADJOroEmaJriqXOuZTCWjSGpmV8hPEVE/6FojS/GyzGme4iBa4RNP8DHqQ==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr25362925wrr.240.1593599004674;
        Wed, 01 Jul 2020 03:23:24 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id d10sm6994341wrx.66.2020.07.01.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 03:23:24 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH 1/1] arch: arm: mach-omap2: mmc: Move omap_mmc_notify_cover_event() prototype
Date:   Wed,  1 Jul 2020 11:23:17 +0100
Message-Id: <20200701102317.235032-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When building the kernel with W=1 the build system complains of:

 drivers/mmc/host/omap.c:854:6: warning: no previous prototype for ‘omap_mmc_notify_cover_event’ [-Wmissing-prototypes]
 854 | void omap_mmc_notify_cover_event(struct device *dev, int num, int is_closed)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~

If we move the prototype into a shared headerfile the build system
will be satisfied.  Rather than create a whole new headerfile just
for this purpose, it makes sense to use the already existing
mmc-omap.h.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/mach-omap2/mmc.h              | 4 ----
 include/linux/platform_data/mmc-omap.h | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/mmc.h b/arch/arm/mach-omap2/mmc.h
index 7f4e053c34344..b5533e93cb632 100644
--- a/arch/arm/mach-omap2/mmc.h
+++ b/arch/arm/mach-omap2/mmc.h
@@ -16,7 +16,3 @@ static inline int omap_msdi_reset(struct omap_hwmod *oh)
 	return 0;
 }
 #endif
-
-/* called from board-specific card detection service routine */
-extern void omap_mmc_notify_cover_event(struct device *dev, int slot,
-					int is_closed);
diff --git a/include/linux/platform_data/mmc-omap.h b/include/linux/platform_data/mmc-omap.h
index 9acf0e87aa9be..f0b8947e6b07d 100644
--- a/include/linux/platform_data/mmc-omap.h
+++ b/include/linux/platform_data/mmc-omap.h
@@ -116,3 +116,6 @@ struct omap_mmc_platform_data {
 
 	} slots[OMAP_MMC_MAX_SLOTS];
 };
+
+extern void omap_mmc_notify_cover_event(struct device *dev, int slot,
+					int is_closed);
-- 
2.25.1

