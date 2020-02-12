Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6728D15A2A7
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 09:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgBLIDN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 03:03:13 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59110 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728250AbgBLIDM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Feb 2020 03:03:12 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01C81xBJ095149;
        Wed, 12 Feb 2020 02:01:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581494519;
        bh=NMTGmOJTTsRgJdge33dgFYwCOb7FpIs1fPjpfpLUBhM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Szq2nQYzAVvT+ophs58XAJBCUwogpwmwVdiXQghZG5ljD+XDAXj1yQgiCxGUpkaRi
         HYeV9e4Y8XNBSzCdW3NznHpqDpccIt5dfrPcpmX276vS34FBX1AhfVXo88ZCknfzWh
         TSGbdN6dZrqBXJOMUYJ4Vv0JZNVu/RQIN0BXLkjw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01C81xf1023194
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Feb 2020 02:01:59 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 02:01:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 02:01:59 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01C81taM069601;
        Wed, 12 Feb 2020 02:01:56 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To:     Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
References: <20200211171645.41990-1-tony@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
Date:   Wed, 12 Feb 2020 10:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211171645.41990-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/02/2020 19.16, Tony Lindgren wrote:
> We can have multiple connections on a single McBSP instance configured
> with audio graph card when using TDM (Time Division Multiplexing). Let's
> allow that by configuring dais dynamically.

It is still one DAI...
If you have multiple codec connected to the same I2S lines, but the
codecs communicate within different time slots, you still have one DAI
on the CPU side, but multiple codecs (codec DAIs) with different TDM slot.

> See Documentation/devicetree/bindings/sound/audio-graph-card.txt and
> Documentation/devicetree/bindings/graph.txt for more details for
> multiple endpoints.

See the example for 'Multi DAI with DPCM' in audio-graph-card.txt
The PCM3168a have 2 DAIs: playback and capture, but you can have
multiple endpoints within a DAI.

> I've tested this with droid4 where cpcap pmic and modem voice are both
> both wired to mcbsp3. I've also tested this on droid4 both with and
> without the pending modem audio codec driver that is waiting for n_gsm
> serdev dependencies to clear.

What this patch you effectively just creating dummy-dais on top of the
real McBSP DAI.
You also rename the DAIs, which might break ams-delta.

We still have legacy support in
omap-twl4030.c
omap3pandora.c
osk5912.c
rx51.c

which will break with the renamed DAI. On the other hand I think the
legacy support can be dropped from them.

I know it was discussed, but can not find the mail:
Can you brief again on the audio connection?
Do you have branch with working code?

- Péter

> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Arthur D. <spinal.by@gmail.com>
> Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  sound/soc/ti/omap-mcbsp-priv.h |  2 +
>  sound/soc/ti/omap-mcbsp.c      | 76 ++++++++++++++++++++++++----------
>  2 files changed, 55 insertions(+), 23 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
> --- a/sound/soc/ti/omap-mcbsp-priv.h
> +++ b/sound/soc/ti/omap-mcbsp-priv.h
> @@ -262,6 +262,8 @@ struct omap_mcbsp {
>  	struct omap_mcbsp_platform_data *pdata;
>  	struct omap_mcbsp_st_data *st_data;
>  	struct omap_mcbsp_reg_cfg cfg_regs;
> +	struct snd_soc_dai_driver *dais;
> +	int dai_count;
>  	struct snd_dmaengine_dai_dma_data dma_data[2];
>  	unsigned int dma_req[2];
>  	int dma_op_mode;
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -14,6 +14,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -1304,23 +1305,53 @@ static int omap_mcbsp_remove(struct snd_soc_dai *dai)
>  	return 0;
>  }
>  
> -static struct snd_soc_dai_driver omap_mcbsp_dai = {
> -	.probe = omap_mcbsp_probe,
> -	.remove = omap_mcbsp_remove,
> -	.playback = {
> -		.channels_min = 1,
> -		.channels_max = 16,
> -		.rates = OMAP_MCBSP_RATES,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
> -	},
> -	.capture = {
> -		.channels_min = 1,
> -		.channels_max = 16,
> -		.rates = OMAP_MCBSP_RATES,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
> -	},
> -	.ops = &mcbsp_dai_ops,
> -};
> +static int omap_mcbsp_init_dais(struct omap_mcbsp *mcbsp)
> +{
> +	struct device_node *np = mcbsp->dev->of_node;
> +	int i;
> +
> +	if (np)
> +		mcbsp->dai_count = of_graph_get_endpoint_count(np);
> +
> +	if (!mcbsp->dai_count)
> +		mcbsp->dai_count = 1;
> +
> +	mcbsp->dais = devm_kcalloc(mcbsp->dev, mcbsp->dai_count,
> +				   sizeof(*mcbsp->dais), GFP_KERNEL);
> +	if (!mcbsp->dais)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < mcbsp->dai_count; i++) {
> +		struct snd_soc_dai_driver *dai = &mcbsp->dais[i];
> +
> +		dai->name = devm_kasprintf(mcbsp->dev, GFP_KERNEL, "%s-dai%i",
> +					   dev_name(mcbsp->dev), i);
> +
> +		if (i == 0) {
> +			dai->probe = omap_mcbsp_probe;
> +			dai->remove = omap_mcbsp_remove;
> +			dai->ops = &mcbsp_dai_ops;
> +		}
> +		dai->playback.channels_min = 1;
> +		dai->playback.channels_max = 16;
> +		dai->playback.rates = OMAP_MCBSP_RATES;
> +		if (mcbsp->pdata->reg_size == 2)
> +			dai->playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +		else
> +			dai->playback.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +						SNDRV_PCM_FMTBIT_S32_LE;
> +		dai->capture.channels_min = 1;
> +		dai->capture.channels_max = 16;
> +		dai->capture.rates = OMAP_MCBSP_RATES;
> +		if (mcbsp->pdata->reg_size == 2)
> +			dai->capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +		else
> +			dai->capture.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +					       SNDRV_PCM_FMTBIT_S32_LE;
> +	}
> +
> +	return 0;
> +}
>  
>  static const struct snd_soc_component_driver omap_mcbsp_component = {
>  	.name		= "omap-mcbsp",
> @@ -1409,18 +1440,17 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
>  	mcbsp->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, mcbsp);
>  
> -	ret = omap_mcbsp_init(pdev);
> +	ret = omap_mcbsp_init_dais(mcbsp);
>  	if (ret)
>  		return ret;
>  
> -	if (mcbsp->pdata->reg_size == 2) {
> -		omap_mcbsp_dai.playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
> -		omap_mcbsp_dai.capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
> -	}
> +	ret = omap_mcbsp_init(pdev);
> +	if (ret)
> +		return ret;
>  
>  	ret = devm_snd_soc_register_component(&pdev->dev,
>  					      &omap_mcbsp_component,
> -					      &omap_mcbsp_dai, 1);
> +					      mcbsp->dais, mcbsp->dai_count);
>  	if (ret)
>  		return ret;
>  
> 

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
