Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B33C54E49B
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 16:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377937AbiFPOgX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jun 2022 10:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377847AbiFPOfx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jun 2022 10:35:53 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D553BA66;
        Thu, 16 Jun 2022 07:35:52 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CD027888;
        Thu, 16 Jun 2022 09:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Tu/WQm2FL2SPUViv8WWXoQaXIl+eGAzL/AaxkzkbEBw=;
 b=AMQdjrgAqwJ/4AsYDmuhjYwlEV3icOOcP06EzuAVCHrAQMPlCpQnC+0THfD5Buzd09e8
 +mTNrKwE32cQbYffRwT87jH28EUE7M+yvE+6+pTIG8LJfwvP3Q32d5vPZagE/EKZ+J6m
 wwgLlgXylhY30+u9mkW5iP7sHRMW6y5IYsl8UeMzG1wFSDWN2koZpIeB+yjuTGds33Vt
 G+VMlTbVXsfjWCAHDB3mPGkg2FFhcXuiZl9/h5UTyx4JNA7pevI04N8x0yjCiUY86KEg
 LqFZkv7T3wk4A0z4yQ1Y4wmwWmU0RCfhtdO9/UqRu1eZ9iGgsKasUz4tuHI4PPcCLphu 0g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-10
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CF8A511D4;
        Thu, 16 Jun 2022 14:34:31 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <vkoul@kernel.org>, <nicolas.ferre@microchip.com>,
        <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <daniel@zonque.org>, <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-rpi-kernel@lists.infradead.org>
Subject: [PATCH 24/96] ASoC: qcom: Migrate to new style legacy DAI naming flag
Date:   Thu, 16 Jun 2022 15:33:17 +0100
Message-ID: <20220616143429.1324494-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UENYE4qDSpHk7ZiegPp51XCrz9nX_mX8
X-Proofpoint-ORIG-GUID: UENYE4qDSpHk7ZiegPp51XCrz9nX_mX8
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/qcom/lpass-cpu.c       |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e6846ad2b5fa4..6f1cd38000016 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -472,6 +472,7 @@ static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
 	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.legacy_dai_naming = 1,
 };
 
 static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b74b67720ef43..5fc8088e63c81 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1205,17 +1205,18 @@ static const struct snd_soc_dapm_widget q6asm_dapm_widgets[] = {
 };
 
 static const struct snd_soc_component_driver q6asm_fe_dai_component = {
-	.name		= DRV_NAME,
-	.open		= q6asm_dai_open,
-	.hw_params	= q6asm_dai_hw_params,
-	.close		= q6asm_dai_close,
-	.prepare	= q6asm_dai_prepare,
-	.trigger	= q6asm_dai_trigger,
-	.pointer	= q6asm_dai_pointer,
-	.pcm_construct	= q6asm_dai_pcm_new,
-	.compress_ops	= &q6asm_dai_compress_ops,
-	.dapm_widgets	= q6asm_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(q6asm_dapm_widgets),
+	.name			= DRV_NAME,
+	.open			= q6asm_dai_open,
+	.hw_params		= q6asm_dai_hw_params,
+	.close			= q6asm_dai_close,
+	.prepare		= q6asm_dai_prepare,
+	.trigger		= q6asm_dai_trigger,
+	.pointer		= q6asm_dai_pointer,
+	.pcm_construct		= q6asm_dai_pcm_new,
+	.compress_ops		= &q6asm_dai_compress_ops,
+	.dapm_widgets		= q6asm_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(q6asm_dapm_widgets),
+	.legacy_dai_naming	= 1,
 };
 
 static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
-- 
2.30.2

