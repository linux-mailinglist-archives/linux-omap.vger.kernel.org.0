Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412D7AD444
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 09:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfIIH4C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 03:56:02 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44090 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfIIH4C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 03:56:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x897tePC068928;
        Mon, 9 Sep 2019 02:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568015740;
        bh=4gtl3Y2OCPlIejYIKw1ZRCQ3sVSq/SmbtVtVLnTa+VM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=RqUHQX48Yyx5d5yO0UEcnyD0G5BP4XbkWYkx636AqUxIVHIYC2gGJwpBQDTjFG2Eo
         Dt+Iif2wrGaNHI/6uaO/Bv59DgSTdUOE7iePQPK6+mw3jkbCb7daDK3mA5Kxey8bCf
         jeedjaGxXfMkgClfI315aPQFyT2TjuEINGr34a4A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x897tebQ088026
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 02:55:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 02:55:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 02:55:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x897tcfj091610;
        Mon, 9 Sep 2019 02:55:38 -0500
Subject: Re: [RFC PATCH] ASoC: ams-delta: Take control over audio mute GPIO
 pins
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        <alsa-devel@alsa-project.org>, <linux-omap@vger.kernel.org>
References: <20190907111650.15440-1-jmkrzyszt@gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <1a93e50f-b9da-a473-e60a-90fa490586ad@ti.com>
Date:   Mon, 9 Sep 2019 10:56:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190907111650.15440-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/09/2019 14.16, Janusz Krzysztofik wrote:
> Since commit 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused
> GPIOs"), on-board audio has appeared muted.  It has been discovered that
> believed to be unused GPIO pins "hookflash1" and "hookflash2" need to be
> set low for audible sound in handsfree and handset mode respectively.
> 
> According to Amstrad E3 wiki, the purpose of both pins hasn't been
> clearly identified.  Original Amstrad software used to produce a high
> pulse on them when the phone was taken off hook or recall was pressed.
> With the current findings, we can assume the pins provide a kind of
> audio mute function, separately for handset and handsfree operation
> modes.
> 
> Commit 2afdb4c41d78 ("ARM: OMAP1: ams-delta: Fix audio permanently
> muted") attempted to fix the issue temporarily by hogging the GPIO pin
> "hookflash1" renamed to "audio_mute", however the fix occurred
> incomplete as it restored audible sound only for handsfree mode.
> 
> Stop hogging that pin, rename the pins to "handsfree_mute" and
> "handset_mute" respectively and implement appropriate DAPM event
> callbacks for "Speaker" and "Earpiece" DAPM widgets.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Fixes: 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused GPIOs")
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 10 +++++----
>  sound/soc/ti/ams-delta.c              | 31 +++++++++++++++++++++++++--
>  2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index e47a6fbcfd6e..a2aa7a12b374 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -246,8 +246,8 @@ static struct platform_device latch2_gpio_device = {
>  #define LATCH2_PIN_SCARD_CMDVCC		11
>  #define LATCH2_PIN_MODEM_NRESET		12
>  #define LATCH2_PIN_MODEM_CODEC		13
> -#define LATCH2_PIN_AUDIO_MUTE		14
> -#define LATCH2_PIN_HOOKFLASH		15
> +#define LATCH2_PIN_HANDSFREE_MUTE	14
> +#define LATCH2_PIN_HANDSET_MUTE		15
>  
>  static struct regulator_consumer_supply modem_nreset_consumers[] = {
>  	REGULATOR_SUPPLY("RESET#", "serial8250.1"),
> @@ -476,6 +476,10 @@ static struct gpiod_lookup_table ams_delta_audio_gpio_table = {
>  			    "hook_switch", 0),
>  		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_MODEM_CODEC,
>  			    "modem_codec", 0),
> +		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSFREE_MUTE,
> +			    "handsfree_mute", 0),
> +		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSET_MUTE,
> +			    "handset_mute", 0),
>  		{ },
>  	},
>  };
> @@ -590,8 +594,6 @@ static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
>  static struct gpiod_hog ams_delta_gpio_hogs[] = {
>  	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
>  		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
> -	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_AUDIO_MUTE, "audio_mute",
> -		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
>  	{},
>  };
>  
> diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
> index dee8fc70a64f..8e2fb81ad05c 100644
> --- a/sound/soc/ti/ams-delta.c
> +++ b/sound/soc/ti/ams-delta.c
> @@ -23,14 +23,31 @@
>  #include "omap-mcbsp.h"
>  #include "../codecs/cx20442.h"
>  
> +static struct gpio_desc *handset_mute;
> +static struct gpio_desc *handsfree_mute;
> +
> +static int ams_delta_event_handset(struct snd_soc_dapm_widget *w,
> +				   struct snd_kcontrol *k, int event)
> +{
> +	gpiod_set_value_cansleep(handset_mute, !SND_SOC_DAPM_EVENT_ON(event));
> +	return 0;
> +}
> +
> +static int ams_delta_event_handsfree(struct snd_soc_dapm_widget *w,
> +				     struct snd_kcontrol *k, int event)
> +{
> +	gpiod_set_value_cansleep(handsfree_mute, !SND_SOC_DAPM_EVENT_ON(event));
> +	return 0;
> +}
> +
>  /* Board specific DAPM widgets */
>  static const struct snd_soc_dapm_widget ams_delta_dapm_widgets[] = {
>  	/* Handset */
>  	SND_SOC_DAPM_MIC("Mouthpiece", NULL),
> -	SND_SOC_DAPM_HP("Earpiece", NULL),
> +	SND_SOC_DAPM_HP("Earpiece", ams_delta_event_handset),
>  	/* Handsfree/Speakerphone */
>  	SND_SOC_DAPM_MIC("Microphone", NULL),
> -	SND_SOC_DAPM_SPK("Speaker", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", ams_delta_event_handsfree),
>  };
>  
>  /* How they are connected to codec pins */
> @@ -542,6 +559,16 @@ static int ams_delta_probe(struct platform_device *pdev)
>  
>  	card->dev = &pdev->dev;
>  
> +	handset_mute = devm_gpiod_get(card->dev, "handset_mute",
> +				      GPIOD_OUT_HIGH);
> +	if (IS_ERR(handset_mute))
> +		return PTR_ERR(handset_mute);
> +
> +	handsfree_mute = devm_gpiod_get(card->dev, "handsfree_mute",
> +					GPIOD_OUT_HIGH);
> +	if (IS_ERR(handsfree_mute))
> +		return PTR_ERR(handsfree_mute);
> +
>  	ret = snd_soc_register_card(card);
>  	if (ret) {
>  		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
