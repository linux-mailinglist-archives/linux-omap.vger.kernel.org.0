Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8483BBE91
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 16:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhGEPAg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhGEPAf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 11:00:35 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22C4C061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 07:57:57 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u25so24971756ljj.11
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c62jtTESBdhj+zgxKn4K3UO9kuNCdUDnlQS6s6Ij6r8=;
        b=No2a8yoo3KOw7mHPy9P2rVG16ptsTZ1nWmPmDyGbvX5g5Itgyzal6M39/EXpr91fCK
         ULoXkmdiE4ATTrYaDzTc/Rr3cK+10ES/l2ZW1hLRFY9Y6VOmtFfoqyHhbAoLUYzJ8viX
         l3PT5EXY8TKXaUNF+vx3VR6zMcYoOeygRk45Cnx0lheUqgtAI7Zx+6YOMq3SEXnAIqhv
         STvsDhsn9AxLYcgRqBXTU/Y/vEaXerRL8DfETeyVofFX4GrN/3ki2PfR9+hKBxklPaDB
         P61dgEvzkmqMFPTM0tVyDYytRMk83ilwk81K8cPdCxZZX4cXlFJneibwgN96KKkMt2kz
         1kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c62jtTESBdhj+zgxKn4K3UO9kuNCdUDnlQS6s6Ij6r8=;
        b=XmXd37w67+eD241/ivxlEUzTFzNUEkCscUvs5F1KoavmuSEuQL6hO8WfLfgxeZ80GP
         CzTk9z5r+rS9S//oiTyPtkCjp/frimUfIkWCrttm2dGd7z4N3DSBdxEAV+/KwEXot1HL
         DbKn3SZKwMhfYMVqSByVH4lWjm9gLsQuEjYYpEByQdQMlJ83Trwavij0avC2mCWgiTiJ
         CUWsC7MSVfRzU527lb9h3Gzob+G3K5Wyx7Jnhv08rTxtkMjXWhnROoDcIPx+7Zef/sTi
         3RG+6PK0PtZOLEd665zmdlqmv6zyJsJAMd4yJF2zehpqUfdySyeJW9aZCNDbaiZLScGW
         aGOQ==
X-Gm-Message-State: AOAM530OSAnouHyCm/8gDSNygutAcc+dPPdsvrWNOp3L2cy8TgEQGpkv
        Uz/Oy2Sgu5HqU6GSpnzwyCY=
X-Google-Smtp-Source: ABdhPJzQP0LEE4SbbmpXytvLRJagEFjPCzE5zUuZuHzDUk73YVT+TUP5DbdaM7245+d1sxQq3z2GXg==
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr5119851ljm.291.1625497076072;
        Mon, 05 Jul 2021 07:57:56 -0700 (PDT)
Received: from [10.0.0.115] (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id a25sm1421542ljp.71.2021.07.05.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 07:57:55 -0700 (PDT)
Subject: Re: [PATCH 1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
 <20210704150450.20106-2-peter.ujfalusi@gmail.com>
Message-ID: <4b530480-bcd6-08cc-b8d6-7e57d0a823ce@gmail.com>
Date:   Mon, 5 Jul 2021 17:58:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704150450.20106-2-peter.ujfalusi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 04/07/2021 18:04, Peter Ujfalusi wrote:
> The DIT mode support has not been tested due to lack of platform where it
> can be tested.
> To be able to use the McASP on OMAP4/5 (only supporting DIT mode) we need
> to have DIT mode working in the McASP driver on a know platform.
> After hacking around (on BBW, mcasp1.axr1 can be routed out for this) it
> appeared that DIT mode is broken.
> 
> This patch fixes it up and 16/24 bit audio works along with passthrough,
> but I have only tested with DTS example and test files.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 142 ++++++++++++++++++++++++++++++-----
>  1 file changed, 122 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 017a5a5e56cd..e56a22c28467 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -83,6 +83,8 @@ struct davinci_mcasp {
>  	struct snd_pcm_substream *substreams[2];
>  	unsigned int dai_fmt;
>  
> +	u32 iec958_status;
> +
>  	/* Audio can not be enabled due to missing parameter(s) */
>  	bool	missing_audio_param;
>  
> @@ -757,6 +759,9 @@ static int davinci_mcasp_set_tdm_slot(struct snd_soc_dai *dai,
>  {
>  	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
>  
> +	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
> +		return 0;
> +
>  	dev_dbg(mcasp->dev,
>  		 "%s() tx_mask 0x%08x rx_mask 0x%08x slots %d width %d\n",
>  		 __func__, tx_mask, rx_mask, slots, slot_width);
> @@ -827,6 +832,20 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
>  		mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXROT(rx_rotate),
>  			       RXROT(7));
>  		mcasp_set_reg(mcasp, DAVINCI_MCASP_RXMASK_REG, mask);
> +	} else {
> +		/*
> +		 * according to the TRM it should be TXROT=0, this one works:
> +		 * 16 bit to 23-8 (TXROT=6, rotate 24 bits)
> +		 * 24 bit to 23-0 (TXROT=0, rotate 0 bits)
> +		 *
> +		 * TXROT = 0 only works with 24bit samples
> +		 */
> +		tx_rotate = (sample_width / 4 + 2) & 0x7;
> +
> +		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXROT(tx_rotate),
> +			       TXROT(7));
> +		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSSZ(15),
> +			       TXSSZ(0x0F));
>  	}
>  
>  	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, mask);
> @@ -841,7 +860,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
>  	int i;
>  	u8 tx_ser = 0;
>  	u8 rx_ser = 0;
> -	u8 slots = mcasp->tdm_slots;
> +	u8 slots = mcasp->op_mode == DAVINCI_MCASP_DIT_MODE ? 384 : mcasp->tdm_slots;

This is wrong.
384 will not fit to u8...
I wonder why I don't saw this...

-- 
Péter
