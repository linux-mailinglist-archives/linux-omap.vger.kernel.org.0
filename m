Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9353BAD8F
	for <lists+linux-omap@lfdr.de>; Sun,  4 Jul 2021 17:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhGDPFN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 4 Jul 2021 11:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGDPFM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Jul 2021 11:05:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E5CC061574
        for <linux-omap@vger.kernel.org>; Sun,  4 Jul 2021 08:02:37 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c28so4255732lfp.11
        for <linux-omap@vger.kernel.org>; Sun, 04 Jul 2021 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NnisACRRPmsvg83/UOa1MhDLWzwBA7pdjqkJYMqvE5Q=;
        b=Hrzs6Xhf7ldRq0s4i8V5RahEAF7TA66k77KeoTClrYiQVbpYBVfb4s77wQtqnH1eEE
         JwYhPLcoltbJGXw60VDNq1MVZDfYVfHhPRXQLo7mPkZQSvkRk8uoFV7J0bI8ULEp6uKq
         fY9Vz+u0P2nbYIomITCN2TlrvTeHHx1yEUJehxHVoZoRgzHLG74fQird5JWllFXaeeXX
         z+T8dwGOx9vGofvUvhU7xdw4SNTTfKH26V2h0fantesSEEXuGfvOuKzaUSzeGjglj+ag
         lhrdfRjISQk94mKuScPz0mgXhFmWcU42tf/CSy7ei0jDZgnDiqxl/0PStYr1hMj3QOf7
         ZyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NnisACRRPmsvg83/UOa1MhDLWzwBA7pdjqkJYMqvE5Q=;
        b=TWaxQbbIVGvu+k8jNyDTXGc7DRze/7CXD04qlnlDjNjB9wfg49sVKgtgLsEDWTqP5v
         3x5tGvLUUJDIPQFHrlTE67+ymWIQOF+r+cZQDlqT3PtqE34naq3FaeTSIiRGUVDEPGbU
         d6/6Po7uEkVflbXRZk/fJ/Ea4oRQTvUD3+hU4RE6xq3UdJbDaYKFyG/Uh+eXaA2j+AaZ
         RzASVDXedssdpLHw9zKzKvEor6hCVhXgMCUD+q1Vkq/fiFutKVfhoCplTvwrRvVczVzu
         OK7LAWXQrJ4X2nOfgGPcMOHzLxM86UYeGCEk/5I1sTrt7VlHuz8ik1JJH3uIA2qOYj5E
         CyBg==
X-Gm-Message-State: AOAM532AGgQgM0PvAAO1MpMnmonDs9vFBTks8a4bEBRsnwjAOjs7uKzR
        b8zRs+c3zGnDYpYRoqwEJmI=
X-Google-Smtp-Source: ABdhPJxsh18H0rDfuqTu5OQBRNsMtCDcqXWOpRaP/jhc86A2g3WpCe+t5VgpqooemiXLuXfn6zdP1Q==
X-Received: by 2002:a05:6512:2629:: with SMTP id bt41mr6952875lfb.95.1625410955217;
        Sun, 04 Jul 2021 08:02:35 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:02:34 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH 1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
Date:   Sun,  4 Jul 2021 18:04:46 +0300
Message-Id: <20210704150450.20106-2-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The DIT mode support has not been tested due to lack of platform where it
can be tested.
To be able to use the McASP on OMAP4/5 (only supporting DIT mode) we need
to have DIT mode working in the McASP driver on a know platform.
After hacking around (on BBW, mcasp1.axr1 can be routed out for this) it
appeared that DIT mode is broken.

This patch fixes it up and 16/24 bit audio works along with passthrough,
but I have only tested with DTS example and test files.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 sound/soc/ti/davinci-mcasp.c | 142 ++++++++++++++++++++++++++++++-----
 1 file changed, 122 insertions(+), 20 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 017a5a5e56cd..e56a22c28467 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -83,6 +83,8 @@ struct davinci_mcasp {
 	struct snd_pcm_substream *substreams[2];
 	unsigned int dai_fmt;
 
+	u32 iec958_status;
+
 	/* Audio can not be enabled due to missing parameter(s) */
 	bool	missing_audio_param;
 
@@ -757,6 +759,9 @@ static int davinci_mcasp_set_tdm_slot(struct snd_soc_dai *dai,
 {
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
 
+	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
+		return 0;
+
 	dev_dbg(mcasp->dev,
 		 "%s() tx_mask 0x%08x rx_mask 0x%08x slots %d width %d\n",
 		 __func__, tx_mask, rx_mask, slots, slot_width);
@@ -827,6 +832,20 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
 		mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXROT(rx_rotate),
 			       RXROT(7));
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_RXMASK_REG, mask);
+	} else {
+		/*
+		 * according to the TRM it should be TXROT=0, this one works:
+		 * 16 bit to 23-8 (TXROT=6, rotate 24 bits)
+		 * 24 bit to 23-0 (TXROT=0, rotate 0 bits)
+		 *
+		 * TXROT = 0 only works with 24bit samples
+		 */
+		tx_rotate = (sample_width / 4 + 2) & 0x7;
+
+		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXROT(tx_rotate),
+			       TXROT(7));
+		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSSZ(15),
+			       TXSSZ(0x0F));
 	}
 
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, mask);
@@ -841,7 +860,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	int i;
 	u8 tx_ser = 0;
 	u8 rx_ser = 0;
-	u8 slots = mcasp->tdm_slots;
+	u8 slots = mcasp->op_mode == DAVINCI_MCASP_DIT_MODE ? 384 : mcasp->tdm_slots;
 	u8 max_active_serializers = (channels + slots - 1) / slots;
 	u8 max_rx_serializers, max_tx_serializers;
 	int active_serializers, numevt;
@@ -1031,16 +1050,18 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
 			      unsigned int rate)
 {
-	u32 cs_value = 0;
-	u8 *cs_bytes = (u8*) &cs_value;
+	u8 *cs_bytes = (u8 *)&mcasp->iec958_status;
 
-	/* Set the TX format : 24 bit right rotation, 32 bit slot, Pad 0
-	   and LSB first */
-	mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXROT(6) | TXSSZ(15));
+	if (!mcasp->dat_port)
+		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSEL);
+	else
+		mcasp_clr_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSEL);
 
 	/* Set TX frame synch : DIT Mode, 1 bit width, internal, rising edge */
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXFMCTL_REG, AFSXE | FSXMOD(0x180));
 
+	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, 0xFFFF);
+
 	/* Set the TX tdm : for all the slots */
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXTDM_REG, 0xFFFFFFFF);
 
@@ -1049,16 +1070,8 @@ static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
 
 	mcasp_clr_bits(mcasp, DAVINCI_MCASP_XEVTCTL_REG, TXDATADMADIS);
 
-	/* Only 44100 and 48000 are valid, both have the same setting */
-	mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG, AHCLKXDIV(3));
-
-	/* Enable the DIT */
-	mcasp_set_bits(mcasp, DAVINCI_MCASP_TXDITCTL_REG, DITEN);
-
 	/* Set S/PDIF channel status bits */
-	cs_bytes[0] = IEC958_AES0_CON_NOT_COPYRIGHT;
-	cs_bytes[1] = IEC958_AES1_CON_PCM_CODER;
-
+	cs_bytes[3] &= ~IEC958_AES3_CON_FS;
 	switch (rate) {
 	case 22050:
 		cs_bytes[3] |= IEC958_AES3_CON_FS_22050;
@@ -1088,12 +1101,15 @@ static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
 		cs_bytes[3] |= IEC958_AES3_CON_FS_192000;
 		break;
 	default:
-		printk(KERN_WARNING "unsupported sampling rate: %d\n", rate);
+		dev_err(mcasp->dev, "unsupported sampling rate: %d\n", rate);
 		return -EINVAL;
 	}
 
-	mcasp_set_reg(mcasp, DAVINCI_MCASP_DITCSRA_REG, cs_value);
-	mcasp_set_reg(mcasp, DAVINCI_MCASP_DITCSRB_REG, cs_value);
+	mcasp_set_reg(mcasp, DAVINCI_MCASP_DITCSRA_REG, mcasp->iec958_status);
+	mcasp_set_reg(mcasp, DAVINCI_MCASP_DITCSRB_REG, mcasp->iec958_status);
+
+	/* Enable the DIT */
+	mcasp_set_bits(mcasp, DAVINCI_MCASP_TXDITCTL_REG, DITEN);
 
 	return 0;
 }
@@ -1237,12 +1253,18 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 		int slots = mcasp->tdm_slots;
 		int rate = params_rate(params);
 		int sbits = params_width(params);
+		unsigned int bclk_target;
 
 		if (mcasp->slot_width)
 			sbits = mcasp->slot_width;
 
+		if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE)
+			bclk_target = rate * sbits * slots;
+		else
+			bclk_target = rate * 128;
+
 		davinci_mcasp_calc_clk_div(mcasp, mcasp->sysclk_freq,
-					   rate * sbits * slots, true);
+					   bclk_target, true);
 	}
 
 	ret = mcasp_common_hw_param(mcasp, substream->stream,
@@ -1598,6 +1620,77 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
 };
 
+static int davinci_mcasp_iec958_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int davinci_mcasp_iec958_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(cpu_dai);
+
+	memcpy(uctl->value.iec958.status, &mcasp->iec958_status,
+	       sizeof(mcasp->iec958_status));
+
+	return 0;
+}
+
+static int davinci_mcasp_iec958_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *uctl)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(cpu_dai);
+
+	memcpy(&mcasp->iec958_status, uctl->value.iec958.status,
+	       sizeof(mcasp->iec958_status));
+
+	return 0;
+}
+
+static int davinci_mcasp_iec958_con_mask_get(struct snd_kcontrol *kcontrol,
+					     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
+	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(cpu_dai);
+
+	memset(ucontrol->value.iec958.status, 0xff, sizeof(mcasp->iec958_status));
+	return 0;
+}
+
+static const struct snd_kcontrol_new davinci_mcasp_iec958_ctls[] = {
+	{
+		.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			   SNDRV_CTL_ELEM_ACCESS_VOLATILE),
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.info = davinci_mcasp_iec958_info,
+		.get = davinci_mcasp_iec958_get,
+		.put = davinci_mcasp_iec958_put,
+	}, {
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, CON_MASK),
+		.info = davinci_mcasp_iec958_info,
+		.get = davinci_mcasp_iec958_con_mask_get,
+	},
+};
+
+static void davinci_mcasp_init_iec958_status(struct davinci_mcasp *mcasp)
+{
+	unsigned char *cs = (u8 *)&mcasp->iec958_status;
+
+	cs[0] = IEC958_AES0_CON_NOT_COPYRIGHT | IEC958_AES0_CON_EMPHASIS_NONE;
+	cs[1] = IEC958_AES1_CON_PCM_CODER;
+	cs[2] = IEC958_AES2_CON_SOURCE_UNSPEC | IEC958_AES2_CON_CHANNEL_UNSPEC;
+	cs[3] = IEC958_AES3_CON_CLOCK_1000PPM;
+}
+
 static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
@@ -1605,6 +1698,12 @@ static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 	dai->playback_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
 	dai->capture_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_CAPTURE];
 
+	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE) {
+		davinci_mcasp_init_iec958_status(mcasp);
+		snd_soc_add_dai_controls(dai, davinci_mcasp_iec958_ctls,
+					 ARRAY_SIZE(davinci_mcasp_iec958_ctls));
+	}
+
 	return 0;
 }
 
@@ -1651,7 +1750,8 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 			.channels_min	= 1,
 			.channels_max	= 384,
 			.rates		= DAVINCI_MCASP_RATES,
-			.formats	= DAVINCI_MCASP_PCM_FMTS,
+			.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+					  SNDRV_PCM_FMTBIT_S24_LE,
 		},
 		.ops 		= &davinci_mcasp_dai_ops,
 	},
@@ -1871,6 +1971,8 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 		} else {
 			mcasp->tdm_slots = pdata->tdm_slots;
 		}
+	} else {
+		mcasp->tdm_slots = 32;
 	}
 
 	mcasp->num_serializer = pdata->num_serializer;
-- 
2.32.0

