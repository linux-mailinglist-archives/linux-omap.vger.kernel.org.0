Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4749E3BC32F
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 21:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhGETnM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 15:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhGETnM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 15:43:12 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAD4C061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 12:40:33 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u25so25912440ljj.11
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69OI4I6KWBAC4CXNAUxvmM2fpbymG4awIgWworiZb0Y=;
        b=hDrTf7i0j+AU394OPvh1To0/361E+L/X3hZbWesptvmlZEgoN1w6bds8BeXA1FIEwj
         BiD98whMqiftNcoc5GQthuDtDP74ImrbBIpn449DvgP3JrJaxAaIPD9wOHIwB1oG1s1a
         tRC9uxVhcDYNThalXM94LgeOn8f9bDvxESrfdKjqcLd4tBDAgBUd6oHGcMho8ioVBsQu
         k55I+9wzxPefXoD2hzgkaMbBQRSNGLfCWtDSAqBIlC3I5+gWBflkAwHiiOgV5CWBbq7s
         9k+G0supIEtQXWYeVyFzlW7clXfsOUMBgBZe5lE4aQgI3usZSCvyNN/ww1EL64mx3ls6
         3dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69OI4I6KWBAC4CXNAUxvmM2fpbymG4awIgWworiZb0Y=;
        b=qFybHvGI1MNwmEMMBcuT9f/Oo2iD2Ne2m23TbSpMX0hg7D80YMjDwvMJwtxdKA6o6J
         wE3e9qNNFIpBRg6OwyHUURpAgEK3FzA741elBIMPNIxfjHWxNigCBlCNg9Vpji3ajH+U
         c8EegtrtTw29wlmJRvFa5BB6gX3E+3NT0zBMt5FLDQbQ9C6H9NNmdHqGB6KeYgu/a9oP
         dbg+RsuHvQFcxCyqZ+kMPmatoL0N9tt7C3g5Jew4bGOTYyt4RB962ZvRL1mJ8qFVaR1R
         Hfr3vnGh3+rqp6NgQs5fSrNjkYj62takTDN8g8pUVxZNP8+M9QfQ3N9my970qloQSj/5
         VXvw==
X-Gm-Message-State: AOAM530nJNwEAf8wVtCE77t68ffqHHvBA/qg3QkP1GXDZskcT/BmOzru
        2ZeyK9ZN4dxrBt70EEuZslk=
X-Google-Smtp-Source: ABdhPJxO85THmAI1uIf9WLaPz9G4peSowkV82j9UIqK5bN/AQVa671RwMI9COEYldBWjEE159PyBBA==
X-Received: by 2002:a2e:9d02:: with SMTP id t2mr11730398lji.404.1625514032315;
        Mon, 05 Jul 2021 12:40:32 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 12:40:31 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH v2 1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
Date:   Mon,  5 Jul 2021 22:42:45 +0300
Message-Id: <20210705194249.2385-2-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
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
 sound/soc/ti/davinci-mcasp.c | 150 ++++++++++++++++++++++++++++++-----
 1 file changed, 129 insertions(+), 21 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 017a5a5e56cd..64ec6d485834 100644
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
@@ -842,10 +861,16 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	u8 tx_ser = 0;
 	u8 rx_ser = 0;
 	u8 slots = mcasp->tdm_slots;
-	u8 max_active_serializers = (channels + slots - 1) / slots;
-	u8 max_rx_serializers, max_tx_serializers;
+	u8 max_active_serializers, max_rx_serializers, max_tx_serializers;
 	int active_serializers, numevt;
 	u32 reg;
+
+	/* In DIT mode we only allow maximum of one serializers for now */
+	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
+		max_active_serializers = 1;
+	else
+		max_active_serializers = (channels + slots - 1) / slots;
+
 	/* Default configuration */
 	if (mcasp->version < MCASP_VERSION_3)
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_PWREMUMGT_REG, MCASP_SOFT);
@@ -1031,16 +1056,18 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
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
 
@@ -1049,16 +1076,8 @@ static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
 
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
@@ -1088,12 +1107,15 @@ static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
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
@@ -1237,12 +1259,18 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
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
@@ -1598,6 +1626,77 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
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
@@ -1605,6 +1704,12 @@ static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
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
 
@@ -1651,7 +1756,8 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 			.channels_min	= 1,
 			.channels_max	= 384,
 			.rates		= DAVINCI_MCASP_RATES,
-			.formats	= DAVINCI_MCASP_PCM_FMTS,
+			.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+					  SNDRV_PCM_FMTBIT_S24_LE,
 		},
 		.ops 		= &davinci_mcasp_dai_ops,
 	},
@@ -1871,6 +1977,8 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 		} else {
 			mcasp->tdm_slots = pdata->tdm_slots;
 		}
+	} else {
+		mcasp->tdm_slots = 32;
 	}
 
 	mcasp->num_serializer = pdata->num_serializer;
-- 
2.32.0

