Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13ED53239E
	for <lists+linux-omap@lfdr.de>; Sun,  2 Jun 2019 16:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfFBO4J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 2 Jun 2019 10:56:09 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41784 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfFBO4J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 2 Jun 2019 10:56:09 -0400
Received: by mail-lj1-f196.google.com with SMTP id s21so3198993lji.8;
        Sun, 02 Jun 2019 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DW2E0BpzAc0HLFFmW75+Kp5tG91kuZE20dTCBSAHOjQ=;
        b=WsL5NCHO/hx1ZcYASq4bsmolID5vN3N1r5wG/oh7g8v9HayVY74o1nj2uE6NvUpM+t
         dByuvmgtCWtJmogFel7dFCHTiIsgOSJclkZ3LElEGL5FLevDqF3Tm25/Mz/fftMMWMha
         kWImrXq7jvQXlgq5Dlw2jVjERZ0/NNI0ApMjPxRfOvDp9aykkipBF4yhaERnX1ZuGSI5
         haG2X8KSUGAtGdmSFDJDI3I8XCzb5BgO5DVX0NV4JRBFWRcKAHeH/QGERFelXs2+l4Hc
         w7DL2pR3j8JMZEKcvfgE8Sg1D/QP7Rx8ELE3zkJnd8XCkXEhpyJSFm01SHb+BAjswNGu
         EqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DW2E0BpzAc0HLFFmW75+Kp5tG91kuZE20dTCBSAHOjQ=;
        b=DL/bCED6pyk2o0xo0DDFrOjBeiidp03yLS2nN0yiOVKPZAnlKeDX/2P8Eqjm54zl6t
         7ZF/dPaFb+SbDWknszgiYy7+ZqN1kFP75JjUayFLejCnxYLvXzxditeQAcdx70BPxNjv
         89NfwPKi9UPR8jJuWJHpB1JKGCi2/TA0detj+hveO1jMhcKX87+ih3NDUbMBgVZx4i9m
         VzchOgPhTAsOL5Zxp6g3AWvCtc/BdwlMFnEYVazWHRtXWB7yqhTfRVC7s9y/2CUzGXGn
         gSXT88MSsz6wC8vAtV5OXTgT155eHaoD4SaDbsDfBgGV/rWc5qtxFhu88AYlihboHCyn
         LSYg==
X-Gm-Message-State: APjAAAV08SRcB32YUvw3H+9XlTYLX5g9LczD1X55Qa4ElFL5IBvBu3aE
        OntjQCri1eA+Jsw43c2SbyJk7BQPmIM=
X-Google-Smtp-Source: APXvYqxuvhbc5F1/SxRPxqwQh4RZAsUd4T+CyhZn3U7SOKGpwqiR7EKjrJoNpV/YsRm9j6xUQKE+3g==
X-Received: by 2002:a2e:5d49:: with SMTP id r70mr11553508ljb.102.1559487366917;
        Sun, 02 Jun 2019 07:56:06 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id x14sm2523212lfe.83.2019.06.02.07.56.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 07:56:06 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH] ASoC: ti: Fix SDMA users not providing channel names
Date:   Sun,  2 Jun 2019 16:55:49 +0200
Message-Id: <20190602145549.30899-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

McBSP used to work correctly as long as compat DMA probing, removed by
commit 642aafea8889 ("ASoC: ti: remove compat dma probing"), was
available.  New method of DMA probing apparently requires users to
provide channel names when registering with SDMA, while McBSP passes
NULLs.  Fix it.

The same probably applies to McASP (not tested), hence the patch fixes
both.

Fixes: 642aafea8889 ("ASoC: ti: remove compat dma probing")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/davinci-mcasp.c | 2 +-
 sound/soc/ti/omap-mcbsp.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 9fbc759fdefe..f31805920e3e 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2237,7 +2237,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		ret = edma_pcm_platform_register(&pdev->dev);
 		break;
 	case PCM_SDMA:
-		ret = sdma_pcm_platform_register(&pdev->dev, NULL, NULL);
+		ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
 		break;
 	default:
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index a395598f1f20..610c5e706fd2 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1438,7 +1438,7 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return sdma_pcm_platform_register(&pdev->dev, NULL, NULL);
+	return sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
 }
 
 static int asoc_mcbsp_remove(struct platform_device *pdev)
-- 
2.21.0

