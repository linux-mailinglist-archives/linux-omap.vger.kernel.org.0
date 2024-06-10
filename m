Return-Path: <linux-omap+bounces-1514-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9AB902458
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2024 16:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26E5328269D
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2024 14:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AF5132137;
	Mon, 10 Jun 2024 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npg5pXyZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0C623B0;
	Mon, 10 Jun 2024 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030590; cv=none; b=ZF2LTSi9xd206VHZJedsI4MQ3rBTgy/j9/bqPEEB7xqnVSm1FStLRd/DZcOXQ5yBwLMvzP0cmdkDDP4NDZezfHYOlYcBCgnqxxT9Kmg7seLHOAiYWnL2rg4ZZhUF3QMB+ZK6RM6rFDHjDd006C+D71HToXcMkTcjRi8TI/n11NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030590; c=relaxed/simple;
	bh=WfJ9jpzyEaAtpm/A8NCBTJr5h8q7wIHU4XCBvX6wUno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebrns7VrHvkw1IL84vUsaXcBvrZgbvylF5lpwsvjXZ1JBETSpLhoRnf01G5cHThmrfAREsm4PgcMmgZ1R4VrYif325X35Asvx7tK89dF20aymMvxm0OTuVQx97amI3MKWKzISV5AhAN349JRs1AugWzQsS6mIsb0aVao/rLy8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npg5pXyZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52c8342af5eso1573592e87.3;
        Mon, 10 Jun 2024 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030587; x=1718635387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARiAbV9duxyFUqNEp29RQ3QZg/sow4QH3/UXrM8Ep8I=;
        b=npg5pXyZLHTbMLJR1HVeyL7cyNKLayqUh3l1nKAJL/7qoy2cbl1asxwlQOG+e0oiUw
         Qeg7zG/w2xWXETh3YwJ/vj1x/rYNcn3kuoBk+fG9HU9YmhDezRsCLWsAf+pq0pbwQ3My
         EgKB0/ZUvflkplgArrqPdkjgYU7YLrZbXgqxjjbaykdC331an+f5KD8iBczmRV7bHuB3
         abcJjMpWCc6CEZ0OpLsJcfZvPyFUETpD7hPe8kM2k6bwHJ++zaRhtWOjNOerJpcbFZEZ
         M9ZQRBpM08dMh0ypnJ9yjkycx0vip8EXFbXpMmcfgNk6Q/T8GDHVZI2PyFCZExIxmDUE
         SoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030587; x=1718635387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARiAbV9duxyFUqNEp29RQ3QZg/sow4QH3/UXrM8Ep8I=;
        b=PgbbbdOpBKYiBoOe+e4jGDEs2P1wFQcujw8HYsljSbzS6CKP9qZeMXjgsL2YjUhLvC
         SRhPEYbhEpYzKMO0XaNYNI4BCuE+ETajOao5kVNHMuyrjsWULGIcb0rV4Y60D9gnqLIB
         Bo1hFxmOLZAac1h1G48iMYkV9S53Tqmt8xb2OmRkDgfLeuE1Z1dfKqyTJfYZz5CHK9me
         fM9T8qXo8pUKn4rdvOWb7L3+IQu3gw3gP1q7OlBj8rlSgyZWqDVi7bLGx/kSDVtWYbcm
         aCv6BUf88Ye4lWqu0TGbMMTjtG0f5e9trEoDKn3I9WOBu/Lpz3F8c4F6Q7c8bUuo072C
         HnEA==
X-Forwarded-Encrypted: i=1; AJvYcCXhXuhShFR+4ZYtNDaFWciLuvwzEaNUj4Fy4JyeXEd0Dla5rEHADjnzViuvLgjB9hHlO2NLtylSFHa83LCJ/ReZIz1OqSdZSIe6YTt9nLZeszFmhF6YZFEqzsG6MzstDIHp201em6jgSeA19iS8Ew+/GsZi3HDztgl9invdrj5rIKved39d
X-Gm-Message-State: AOJu0Yxlp74g28Rhp2SK9oth94HLzWTnnbGTbCuFuYcQ5debs4tLWJ+V
	RwUUJv87SsF9sw4b9yjrzHaiboIBv+KTT437wotCheQmbPN92Pht
X-Google-Smtp-Source: AGHT+IHiYOo9667BlphoO7DGPwPfS2rjmuIrjpGhocXL80s7aww/8aocaCFP8lqC989SjleMvbUgRg==
X-Received: by 2002:a05:6512:3b98:b0:52c:841c:d15a with SMTP id 2adb3069b0e04-52c841cd44fmr3611477e87.7.1718030587281;
        Mon, 10 Jun 2024 07:43:07 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi. [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8857d03asm725070e87.261.2024.06.10.07.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 07:43:06 -0700 (PDT)
Message-ID: <605944ac-6dfa-4620-84b6-392665cdc05d@gmail.com>
Date: Mon, 10 Jun 2024 17:46:43 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: ti: omap-hdmi: Fix too long driver name
To: Primoz Fiser <primoz.fiser@norik.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20240610125847.773394-1-primoz.fiser@norik.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240610125847.773394-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/10/24 3:58 PM, Primoz Fiser wrote:
> Set driver name to "HDMI". This simplifies the code and gets rid of
> the following error messages:
> 
>   ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'

Thank you for the update,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
> Changes in v2:
> - use "HDMI" instead of DRV_NAME (requested)
> 
>  sound/soc/ti/omap-hdmi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
> index 639bc83f4263..cf43ac19c4a6 100644
> --- a/sound/soc/ti/omap-hdmi.c
> +++ b/sound/soc/ti/omap-hdmi.c
> @@ -354,11 +354,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
>  	if (!card)
>  		return -ENOMEM;
>  
> -	card->name = devm_kasprintf(dev, GFP_KERNEL,
> -				    "HDMI %s", dev_name(ad->dssdev));
> -	if (!card->name)
> -		return -ENOMEM;
> -
> +	card->name = "HDMI";
>  	card->owner = THIS_MODULE;
>  	card->dai_link =
>  		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);

-- 
Péter

