Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081DB3BC331
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 21:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhGETnO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 15:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhGETnN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 15:43:13 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4F6C061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 12:40:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id p24so25980469ljj.1
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Of8Vz+AlX9OJfwp1F1M1cBJeQ7g9UEr/Kf9uzSlhTsA=;
        b=uevef/jxFwawTS1dkrJ17zLsjRlPBa3IJneGPZxnDTr+DdAOWdECBnDWII+1YEEHkh
         +92qew6vPXky3Ytnxcu8RniKkeTxnKDbyQbktuc7VxtTy7aDYirMHas49owcFTcqQhp4
         jZfHKf1IoZk9xvlOA6I34KjFSj8tv2c3O3sHZYTDCHQt5Cdy0g283sWR1nkkMsKR28L6
         BE9i4yB9LTl85HItm2rhKjoFNZnKjiLldrkVqZsSAL4Y0Mn7uksVevOMj+Mkdnqo0DYG
         qALEwLe53R5cXWKzUuv2D8op64/5uz8z2sg/kxeAYSKuAGYGh15HnZZAdBAMU20qBscF
         OwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Of8Vz+AlX9OJfwp1F1M1cBJeQ7g9UEr/Kf9uzSlhTsA=;
        b=mfWXCT6OwZoFnvg/xa9jVchDIYPJzSdVOtNFKh+ZEDuxGGGTggF1AADMEtIetkRAz9
         wriJIi7g/bO5gA6TuEkhHFmi7cVrXHf/QmoAWtbG6PeqXMfgpT6mVJfOH3fLlqA81Kd3
         Z/H2kyiDgneISqovhn+3VjSH3PUApujmp1K0U5Sx7oT9Wphc+Mfb6RpWvUrgplpe0+pO
         kNOO/ubREsIY+Y0OougoNJK2qmC9Z4EoBYwVL5KElLmjUKG3T8TF/uNSbjtYKjW+n7SI
         G/0p+59+0IO2r4qMd+2n1/lPe+vSalVXRT573UFoug4dSbva5oT1gyJhl/m0h4EjBcXd
         E61A==
X-Gm-Message-State: AOAM530+m3exVpgsWwLVVDM/OAZYu9oQ4dqTYkGE4RoJPklUt7nm5WhU
        5nGPXaEiEALqeblMnLUGEk4=
X-Google-Smtp-Source: ABdhPJzoRpbY9jPi2xgrW7OHuDXYvKKdgUsA72NLPLjMgiMjHdTPI5WDbSt9JYiy2eLOx9JWWVDiAg==
X-Received: by 2002:a2e:9d59:: with SMTP id y25mr12171169ljj.399.1625514034643;
        Mon, 05 Jul 2021 12:40:34 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 12:40:34 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH v2 3/5] ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
Date:   Mon,  5 Jul 2021 22:42:47 +0300
Message-Id: <20210705194249.2385-4-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Ujfalusi <peter.ujfalusi@ti.com>

There is a single McASP on OMAP4 (and OMAP5) which is configured to only
support DIT playback mode on a single serializer.

Add 0x200 offset to DAT port address as the TRM suggests it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 include/linux/platform_data/davinci_asp.h |  1 +
 sound/soc/ti/Kconfig                      |  1 +
 sound/soc/ti/davinci-mcasp.c              | 26 ++++++++++++++++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/linux/platform_data/davinci_asp.h b/include/linux/platform_data/davinci_asp.h
index 5d1fb0d78a22..76b13ef67562 100644
--- a/include/linux/platform_data/davinci_asp.h
+++ b/include/linux/platform_data/davinci_asp.h
@@ -96,6 +96,7 @@ enum {
 	MCASP_VERSION_2,	/* DA8xx/OMAPL1x */
 	MCASP_VERSION_3,        /* TI81xx/AM33xx */
 	MCASP_VERSION_4,	/* DRA7xxx */
+	MCASP_VERSION_OMAP,	/* OMAP4/5 */
 };
 
 enum mcbsp_clk_input_pin {
diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 698d7bc84dcf..1d9fe3fca193 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_DAVINCI_MCASP
 	  various Texas Instruments SoCs like:
 	  - daVinci devices
 	  - Sitara line of SoCs (AM335x, AM438x, etc)
+	  - OMAP4
 	  - DRA7x devices
 	  - Keystone devices
 	  - K3 devices (am654, j721e)
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 64ec6d485834..56a19eeec5c7 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1794,6 +1794,12 @@ static struct davinci_mcasp_pdata dra7_mcasp_pdata = {
 	.version = MCASP_VERSION_4,
 };
 
+static struct davinci_mcasp_pdata omap_mcasp_pdata = {
+	.tx_dma_offset = 0x200,
+	.rx_dma_offset = 0,
+	.version = MCASP_VERSION_OMAP,
+};
+
 static const struct of_device_id mcasp_dt_ids[] = {
 	{
 		.compatible = "ti,dm646x-mcasp-audio",
@@ -1811,6 +1817,10 @@ static const struct of_device_id mcasp_dt_ids[] = {
 		.compatible = "ti,dra7-mcasp-audio",
 		.data = &dra7_mcasp_pdata,
 	},
+	{
+		.compatible = "ti,omap4-mcasp-audio",
+		.data = &omap_mcasp_pdata,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mcasp_dt_ids);
@@ -2350,10 +2360,17 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
 	dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
 	dma_data->filter_data = "tx";
-	if (dat)
+	if (dat) {
 		dma_data->addr = dat->start;
-	else
+		/*
+		 * According to the TRM there should be 0x200 offset added to
+		 * the DAT port address
+		 */
+		if (mcasp->version == MCASP_VERSION_OMAP)
+			dma_data->addr += davinci_mcasp_txdma_offset(mcasp->pdata);
+	} else {
 		dma_data->addr = mem->start + davinci_mcasp_txdma_offset(mcasp->pdata);
+	}
 
 
 	/* RX is not valid in DIT mode */
@@ -2418,7 +2435,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		ret = edma_pcm_platform_register(&pdev->dev);
 		break;
 	case PCM_SDMA:
-		ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
+		if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE)
+			ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
+		else
+			ret = sdma_pcm_platform_register(&pdev->dev, "tx", NULL);
 		break;
 	case PCM_UDMA:
 		ret = udma_pcm_platform_register(&pdev->dev);
-- 
2.32.0

