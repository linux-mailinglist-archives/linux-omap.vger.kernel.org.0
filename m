Return-Path: <linux-omap+bounces-1493-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B158FF429
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 19:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA921C273EA
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 17:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E4019924B;
	Thu,  6 Jun 2024 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiArbu5z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A538DD4;
	Thu,  6 Jun 2024 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696638; cv=none; b=JuhjPA3W3+7hiM8agupBEH8f935eo33fCwsPTwIV8/f35S/I/BMPEEOTwDXQ9ENZCUUGrIaLgipy+ik0AfTnprmiGw/6GI4oht4nlKq0FEoFaWK9tidMGvAHaovyZ5mu+dZOJHui5pXQCJd0oZIDT+3DyywYTKe49FhCwUtGmmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696638; c=relaxed/simple;
	bh=gkCUgE7P7NzShBjfKiNhvn1MyEbe7axgv1vrcTnyD4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNlZjbZStwaugOAWWm+AtbUra+A99/mn6Eux2gmsMMMAy75ypXYUIT+U2cM7VsmWWRouDUQxszzkQUhMA3yvTJ4Sp4imgOGi+QKgyaVjuC9Kwo4BPm+XSBMH/4XEy4Q7iF4GwhZ5wX2JLMZTNDmybt45nBb7ZrgkZHShPqDOKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiArbu5z; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b94ad88cbso1952161e87.0;
        Thu, 06 Jun 2024 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717696635; x=1718301435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bzgl98bn7gL5PMnWW0uBPTQqYfyzdwW025Pm9JSfbr4=;
        b=kiArbu5zpuqIRhfIF0CWwpTYZ064glSRwvBmT/0gVv7vkzhWAZcV+lXDRsHd/DZkRS
         GjXwmMAp+DnsQU4a1AS/fVbCh4Aku9yAqf4S/vJyHMoOBUxMs7VhkSelE4ttV7ND8Fu4
         9Xmiqh+JXyoXvjTiQ5XuYrf0PpjTMjQx8mz36nh+DgxvPXSwsvb5V8BVuVVUK9xOo+om
         FkZpUNYMAO2Vu7li1KpY2ypiIf++AZygvZDoLy1naux6u1WJ67kAJbdXw6SP2TgxXd7F
         M3vBW8OM2w8rgZaY7YLD/ZP2qQctoO6tYr9Q33XQq7l9g22dlCJDguWTYH8D3fB+YpPy
         dA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717696635; x=1718301435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzgl98bn7gL5PMnWW0uBPTQqYfyzdwW025Pm9JSfbr4=;
        b=KFIdFCGM1tToRSU4SerFF9z9mNQfClRcQwyxb0wtTFoMjpoH80GTIm8NADC3tAf11K
         dPr0BChXsZGe/cOIPUqaX5LOAB2WVec4Yp8Ekx1Gzuw8EOAq7WEkb9//qvHFau8n83n4
         CogqvS9khHF/OX0Xp1XmLxnfUvghszH70ZS7BoIdxe6TgcLYxZVbqoCQAp/GFh8mfTEd
         LUQTHq8JHDXoKPnN5Y3ZHFYcGOUOAg4GPKpY7XP89s2OJG5IJnMP/y4tfMD72cf7RWrP
         pSBI0EBAwgWsQPIq7z1BfX22umCe1Ux64+7WDXy/Ce0mJe8aRq/RwRBw7pzfaPuUr6oa
         kxxg==
X-Forwarded-Encrypted: i=1; AJvYcCX7BSGNj9pWnpbKBp9V8vnS+mEeDn4BeZNGOc4DPETDbN8fkkhL5AxUG8OWaHxX2TkawB371GnphjxnSasFahheXZH1u7FynXihQ5LVe2vabOBf+ybo33eAeYsUn2AtCzI5OdFENPMs7a8CDGrZ2mej2CDh/mM88ClzAcMPAsa1i3+AKWPj
X-Gm-Message-State: AOJu0YzmYavh6zjQovDmmqL5Ba23qhoNTd8YmtTSvbPz+/e8Qum4NbLi
	MIaVE6u0GU8wRSMgkmYnxTGJSzt8aD8c5hxupRMfSghhNtOuotSO
X-Google-Smtp-Source: AGHT+IHfsZTaWw8cyEJODnWTHek4v/td5BgR07Fxe0Qt5gqajahKNvtk8vdCRCB90tggvG/AdMdglw==
X-Received: by 2002:ac2:4472:0:b0:52b:872f:228e with SMTP id 2adb3069b0e04-52bb9f8a542mr317359e87.41.1717696634711;
        Thu, 06 Jun 2024 10:57:14 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi. [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423d528sm258759e87.191.2024.06.06.10.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 10:57:14 -0700 (PDT)
Message-ID: <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
Date: Thu, 6 Jun 2024 21:00:47 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
To: Primoz Fiser <primoz.fiser@norik.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240606070645.3519459-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/6/24 10:06 AM, Primoz Fiser wrote:
> Set driver name to DRV_NAME. This simplifies the code and gets rid of
> the following error messages:
> 
>   ASoC: driver name too long 'HDMI 58040000.encoder' -> 'HDMI_58040000_e'
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  sound/soc/ti/omap-hdmi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
> index 639bc83f4263..3f35eedeea41 100644
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
> +	card->name = DRV_NAME;

I think it would be better to name is simply "HDMI" instead

>  	card->owner = THIS_MODULE;
>  	card->dai_link =
>  		devm_kzalloc(dev, sizeof(*(card->dai_link)), GFP_KERNEL);

-- 
Péter

