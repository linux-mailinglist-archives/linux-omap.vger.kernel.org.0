Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E581954E3B5
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 16:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377734AbiFPOfd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jun 2022 10:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377726AbiFPOfb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jun 2022 10:35:31 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937641F61B;
        Thu, 16 Jun 2022 07:35:30 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07CH027888;
        Thu, 16 Jun 2022 09:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=UKatc6+tXyUsYCxIUlOCKACRDXtjL/84KfpSbCPcQ6U=;
 b=PVEf/gSBt1LrSmysiT/MfKCEqEuopaWdPpEGU6ngsUBRBfSA3DVN619Ate1wBzxNso82
 /d+DwJ2CB9MVBEfTyWHEbVWVRrA4Um6ZdSHZ6rcUKMCCGRKs847pYfYVdic7OowtWiy5
 PRphUBqgwffGkX177bGgo8IfWe2mt/cn0rOv2CAcZ1iD1++4evb48Oacy/TM5aZKhj8O
 P/yTHnlVN7vTTq8Ym1cXRWpuyw3w2U1YfKHSgXozo/HZdS3kwo2PsTjbey8H+K51fEqT
 4qBpeUkyOsQ0oxd26dWX476QmNP1PSE+Gw141MYWtRj18bB/cLKnpv4MzDsBncpq+YC9 +Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-14
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 16 Jun 2022 09:34:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:33 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 07BB011DA;
        Thu, 16 Jun 2022 14:34:33 +0000 (UTC)
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
Subject: [PATCH 38/96] ASoC: pistachio: Remove now redundant non_legacy_dai_naming flag
Date:   Thu, 16 Jun 2022 15:33:31 +0100
Message-ID: <20220616143429.1324494-39-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kgcjvTB7aSQbNwlmVULg7B1ofhUZ2hNS
X-Proofpoint-ORIG-GUID: kgcjvTB7aSQbNwlmVULg7B1ofhUZ2hNS
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/img/pistachio-internal-dac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/img/pistachio-internal-dac.c b/sound/soc/img/pistachio-internal-dac.c
index 802c0ee63aa26..e3b858643bd5d 100644
--- a/sound/soc/img/pistachio-internal-dac.c
+++ b/sound/soc/img/pistachio-internal-dac.c
@@ -138,7 +138,6 @@ static const struct snd_soc_component_driver pistachio_internal_dac_driver = {
 	.num_dapm_routes	= ARRAY_SIZE(pistachio_internal_dac_routes),
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static int pistachio_internal_dac_probe(struct platform_device *pdev)
-- 
2.30.2

