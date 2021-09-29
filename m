Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B02F41C1A4
	for <lists+linux-omap@lfdr.de>; Wed, 29 Sep 2021 11:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245059AbhI2JdZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Sep 2021 05:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245050AbhI2JdZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Sep 2021 05:33:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AEAC06161C;
        Wed, 29 Sep 2021 02:31:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i19so5176806lfu.0;
        Wed, 29 Sep 2021 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/UGSy92lBMO//Gz9RL9r0Z90ZEqI/HZ9DcXU2pm2WA=;
        b=ThxTKH8UE/PEbqm5nMiArOtjD3zpEzB8+HfD6CI7jeQJqe8q7HIYMBrhSgU+LaAuto
         smh8NC4aah7HbtZXgq3EkQ4pPfBs3gEt23lg7NITWTJmxZOAW/hW6BQx4cU6nyBxTHdS
         4NJI0alZIqHjaPLhvaPbaqHdYt5dHTieCfMKI0iORFIVElhidD/TaMWptD3B30HuAwaf
         xztX5EQ8GbEISHs27HfqDhHBi4u82UUJfWHELvgDD3Op5QokttLtCpAnbo9TmYn64Uwv
         OR5aG4bPFDGuwGAhT8zdiVwcqrWgitZF+6luHiIytjfjqLtUhmxNVOQRki/vScQZGwsj
         IdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/UGSy92lBMO//Gz9RL9r0Z90ZEqI/HZ9DcXU2pm2WA=;
        b=SHwE9GMYQg1jJ242kjV3BAh7tmqbkFWc4uif+W7Vc7FxzVyBj9XS+fasZWIn1S+rn/
         Iz/TpRaVW36xrfvudiKWCmGT0UlEspb3JIjVJZufT5HKHABtBadr8F7UDkd4gt1xrLsv
         68/eJ6n9P8LDHEIhvcLRCJ0XJCM62AGN/dDC2d5ovywS/2LOLK80hpJl1CpmBF2sTplt
         z0no3jDZaOq+y1HlBMEm3sp4ZQ45IDVbXi1kgGYu5Kme1Ejzygq5LwRyoCTHIKDHM1lG
         5I1UnoV934S4n9/za1yChCtopNFLSvw2Un/qUGuN5qZQXlByq3C5chRCrO2wq2DX7wD1
         7dXQ==
X-Gm-Message-State: AOAM533nm3avm+kbXUYh4XTThDUkkDMGFIjoPUKWTJeD5w5+X3wiuOsU
        NMd0HGIENMsLp680VbXAAR0Cniadkmc=
X-Google-Smtp-Source: ABdhPJwW4/4zsW63VKddIGXUEAZY6myLvIRsXoZS6oK5Kniynr0ocbgfm+QATYDGdfGFM9XeHDO40Q==
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr4879367ljm.464.1632907902914;
        Wed, 29 Sep 2021 02:31:42 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id a25sm181519lfk.63.2021.09.29.02.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 02:31:42 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] ASoC: ti: Constify static snd_soc_ops
Date:   Wed, 29 Sep 2021 11:31:21 +0200
Message-Id: <20210929093121.21253-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These are only assigned to the ops field in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/ti/davinci-evm.c      | 2 +-
 sound/soc/ti/omap-abe-twl6040.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index b043a0070d20..68d69e32681a 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -73,7 +73,7 @@ static int evm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops evm_ops = {
+static const struct snd_soc_ops evm_ops = {
 	.startup = evm_startup,
 	.shutdown = evm_shutdown,
 	.hw_params = evm_hw_params,
diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 2e3d1eea77c1..da809c7f25a4 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -96,7 +96,7 @@ static int omap_abe_dmic_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops omap_abe_dmic_ops = {
+static const struct snd_soc_ops omap_abe_dmic_ops = {
 	.hw_params = omap_abe_dmic_hw_params,
 };
 
-- 
2.33.0

