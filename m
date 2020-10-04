Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D20282A2E
	for <lists+linux-omap@lfdr.de>; Sun,  4 Oct 2020 12:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgJDK0j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Oct 2020 06:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDK0j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Oct 2020 06:26:39 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2792AC0613CE;
        Sun,  4 Oct 2020 03:26:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so6375796wrl.12;
        Sun, 04 Oct 2020 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WI5lq349UOc/rM1ogB7WEEhfDIlX4fgfdyC+wmwvVyU=;
        b=kTcbPlMH0pRvBTL+XzuLaer8gkgqwkayqk5vhELRB5AdwW0g4vMxH+Cuo4W5WOrwoe
         PdjrGPx4wLGXjAKXIKhKkOq4r3yjkdc8aI9s6k7oygCa0KIvY1IgxO55JvvOJODbmmCt
         tOtRPibgT6B3ir2nYmp3e2/x6jSv4s3htfoudL6z1A064XJV/jX1yk/7zQG36TZ7Kak0
         Jd4iX6XesfZXNZM0uF5/1tdjSElsHJ0QotxKrTVcnvFj1YO4h3W/3XQiOuy0lIqFDlGD
         LymJ56niDzwrQLWizE5LpmmORZOz6/Od065hEVCeAqClNhE7LR3pm8UKFwKLA9OS5zdu
         Qqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WI5lq349UOc/rM1ogB7WEEhfDIlX4fgfdyC+wmwvVyU=;
        b=CqGQJZY4J2v9PYZEznxOhJSNJpkgmqVvTNDjPc3ZHdf/QivHIKtD6kClNKUW3zBKmi
         yVGrY90UhUNbaRjDZONVtN6ie+9zBmBi3S+zkohw7oHRryJ3nydHfFbY6RnmN+gSvmVD
         OAEQjxd6eLazZTM9FMxrkZkLoUwBrQA31Z8GaioGPx2WTy3ac4aNesI6IE19yiKi15ts
         o8kqIlBPRE4xAISusFWaCFaG48WRF+YK10NxJA70M5ldiAI5AS6b6ph0EDG6Ba4b8k4p
         wd2ANsU2Sm+p7s9BfJun1leJGjmXanpX0lHnWAIh0uExr5FhYtOxbTUtM3yF73DCDX5n
         XTiQ==
X-Gm-Message-State: AOAM533MZEAWA7SqbLxWQwt5VDKu299NgqddFjWprX7Zf4LxXedAF1K4
        +LL5Q/mJLRgIEf54jLSD0HE=
X-Google-Smtp-Source: ABdhPJx8EQUEpEizo9JeW9ReirzOlZH1RWCe4mtUqCr338S4VKiWNT2h43IxA0WS/+0H0EoqAjrvhA==
X-Received: by 2002:adf:8b43:: with SMTP id v3mr7496838wra.414.1601807197616;
        Sun, 04 Oct 2020 03:26:37 -0700 (PDT)
Received: from localhost.localdomain (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id q4sm8423007wru.65.2020.10.04.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 03:26:37 -0700 (PDT)
From:   Alex Dewar <alex.dewar90@gmail.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: omap-mcbsp: Fix use of uninitialised pointer
Date:   Sun,  4 Oct 2020 11:25:36 +0100
Message-Id: <20201004102535.325547-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP
and Sidetone function split"), in rearranging various files, also replaced
calls to platform_get_resource_by_name() + devm_ioremap_resource() with a
single call to devm_platform_ioremap_resource_byname(). However, the
struct resource is needed as we access its members so at present a null
pointer is dereferenced. Fix by doing things the old way.

Addresses-Coverity-ID: 1497530 ("Memory - illegal accesses")
Fixes: 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP and Sidetone function split")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 sound/soc/ti/omap-mcbsp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 186cea91076f..6025b30bbe77 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -620,7 +620,11 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 	spin_lock_init(&mcbsp->lock);
 	mcbsp->free = true;
 
-	mcbsp->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
+	if (!res)
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	mcbsp->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mcbsp->io_base))
 		return PTR_ERR(mcbsp->io_base);
 
-- 
2.28.0

