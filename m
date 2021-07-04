Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2973BAD91
	for <lists+linux-omap@lfdr.de>; Sun,  4 Jul 2021 17:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGDPFQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Jul 2021 11:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhGDPFP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Jul 2021 11:05:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A81C061574
        for <linux-omap@vger.kernel.org>; Sun,  4 Jul 2021 08:02:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq39so15068360lfb.12
        for <linux-omap@vger.kernel.org>; Sun, 04 Jul 2021 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aMFV9aMPXhkidl0Shg2y0S/3JmD1x6u1AFTNBB2LV50=;
        b=XRsE2GuqHLNjYcPKFh4G+usOFtZXGs6OxXyN8MvG2q/55q7d7ccdXJbSclCVuT8Wpl
         ylNX+W0PcV0u3lC17mGlGMf9F/q4zxEyfjGJVUziyIo9vtSzCfCvCYcGPSrpj6+OsUNO
         ESsJTQWBlqF/N2fz3dqfJNe4XnEPW9EikWhAwWxCd6PVJ89GoFe1gZL3pfyVz+2ZTgli
         URC+mS85voT0c/qfxlXCTBUCy+Q97Ar6P93NWZ8YWzkF13IQ0DEs+G4xGG6BtTwmzEed
         bETJFzUTRzsl9aJ17oH/keK42+Kyc9BSK9ib2LLT2eEfLMPzHWCKwZqqBblYFCes1KhK
         WIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMFV9aMPXhkidl0Shg2y0S/3JmD1x6u1AFTNBB2LV50=;
        b=TdudUC3NyOWkrV0WWAImvH+5bYaIafzJSBIbfqDLf9/WUo4wMFEHljU4YTwxWF/Ea3
         zpyUN3jk23FmUE1TIm4W3sz3VAkZMbzIHyHF94u89/I5Ts9on2pn0MQGCOSL9MGWSm75
         A1rzB4A6VZNMBCieWiIqLkZ/emGm1eIphjFpLrjyRAHOwsfd6RaCg0hMWFP7WIJd5OUB
         ucfP14/o0AHeQNCy5ERiUNU8XynevhS/GCvo9iFlDmJyXlDwFtDumePvvR77B38HtEjG
         i8K1gQt1++Iva8+7UukLKmz3UmDOkkJSI14BdBU/cF0eAEymCOW0PbQ5+52fee4J0/SM
         uh+w==
X-Gm-Message-State: AOAM530rJ6fHD4ouQ8cDSp1xr8R2I6J54sm1MZnmUDAD2GIXlzLcNJg9
        FUcpKjeFmVcphsjrfhj76WE=
X-Google-Smtp-Source: ABdhPJwO99spGf6BMeG90kmpkwBFy8BTyxCt0IOaDm2fPRF7mSJiXycpHL33FtQvNKitomPB4uPVZA==
X-Received: by 2002:ac2:5f62:: with SMTP id c2mr6238988lfc.156.1625410958698;
        Sun, 04 Jul 2021 08:02:38 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:02:37 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH 3/5] ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
Date:   Sun,  4 Jul 2021 18:04:48 +0300
Message-Id: <20210704150450.20106-4-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
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
index e56a22c28467..f453728d2afc 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1788,6 +1788,12 @@ static struct davinci_mcasp_pdata dra7_mcasp_pdata = {
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
@@ -1805,6 +1811,10 @@ static const struct of_device_id mcasp_dt_ids[] = {
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
@@ -2344,10 +2354,17 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
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
@@ -2412,7 +2429,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
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

