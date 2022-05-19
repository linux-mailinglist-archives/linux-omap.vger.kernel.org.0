Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B381052D8B5
	for <lists+linux-omap@lfdr.de>; Thu, 19 May 2022 17:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238993AbiESPrO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 May 2022 11:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241346AbiESPqQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 May 2022 11:46:16 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53D77CDD5;
        Thu, 19 May 2022 08:44:22 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k12B002261;
        Thu, 19 May 2022 10:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=TIWyZghTEZ//MO2jvbjUZPrmAJ1ieo/aXBoLcASAC1w=;
 b=WXh+X2sBUTuu1EFWjtVqsdMrMDBdTC0ym9haGIwCO+ZMLVfUx8/SKLsGToIUYs31WTyE
 DOU7DaMZSBWLy5uxyi8D6n5sXfUEwOFor4O6Q71aRqSJkCm8/ug0UOrgsk6LlOnY2eAX
 dahGd5rw7s39Q+k4HiuyUhuFv4znDF2258537Yh87jJafevKisgPqYTMLBx6tF7o95Z1
 JVqe/ENOFIS5ERGxgf5KlqPQoOMo9k9QNUTTDM12CQTGF72WhxtJCBx7myscccLfqIkP
 D90LiewLtzARtk3lRxI0RJS7NrHWhTX5i08HJOVo0VEnkFUlijoXOpoxH6Oohw6pNlsw RA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7A3D411DA;
        Thu, 19 May 2022 15:43:21 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
        <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 43/56] ASoC: pxa: Rename set_fmt_new back to set_fmt
Date:   Thu, 19 May 2022 16:43:05 +0100
Message-ID: <20220519154318.2153729-44-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 36sXbaeY6GpSg0BsX0_utVT-CPuXi-n7
X-Proofpoint-ORIG-GUID: 36sXbaeY6GpSg0BsX0_utVT-CPuXi-n7
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/pxa/mmp-sspa.c   | 2 +-
 sound/soc/pxa/pxa-ssp.c    | 2 +-
 sound/soc/pxa/pxa2xx-i2s.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index b746e52aaf85f..382e9d8608a3f 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -346,7 +346,7 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.hw_params	= mmp_sspa_hw_params,
 	.set_sysclk	= mmp_sspa_set_dai_sysclk,
 	.set_pll	= mmp_sspa_set_dai_pll,
-	.set_fmt_new	= mmp_sspa_set_dai_fmt,
+	.set_fmt	= mmp_sspa_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 52124be1778eb..0f504a9f4983d 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -824,7 +824,7 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.trigger	= pxa_ssp_trigger,
 	.hw_params	= pxa_ssp_hw_params,
 	.set_sysclk	= pxa_ssp_set_dai_sysclk,
-	.set_fmt_new	= pxa_ssp_set_dai_fmt,
+	.set_fmt	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
 	.set_tristate	= pxa_ssp_set_dai_tristate,
 };
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 09a0d033df6a2..7b586b7d46da3 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -335,7 +335,7 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.shutdown	= pxa2xx_i2s_shutdown,
 	.trigger	= pxa2xx_i2s_trigger,
 	.hw_params	= pxa2xx_i2s_hw_params,
-	.set_fmt_new	= pxa2xx_i2s_set_dai_fmt,
+	.set_fmt	= pxa2xx_i2s_set_dai_fmt,
 	.set_sysclk	= pxa2xx_i2s_set_dai_sysclk,
 };
 
-- 
2.30.2

