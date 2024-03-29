Return-Path: <linux-omap+bounces-1087-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99389115C
	for <lists+linux-omap@lfdr.de>; Fri, 29 Mar 2024 03:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356DB1F2456F
	for <lists+linux-omap@lfdr.de>; Fri, 29 Mar 2024 02:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48982E62B;
	Fri, 29 Mar 2024 02:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="irOwViPR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726F22E62A
	for <linux-omap@vger.kernel.org>; Fri, 29 Mar 2024 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711677936; cv=none; b=DMPo+Wxs2wuDn7ThFLflLrnr6crzhtvC/9sBYdUwZUgsPhrSbCWwFeqrajpfSwhu/PsNM83grEsr5tR3KpNp7o+SkBTSuPw0AGED2uKzDd0JfwbXzUxQP53Rqt6HkNWyGJ33dc82Mshz1UZcoxoRRss+LhKl8+la9lFeC7BayYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711677936; c=relaxed/simple;
	bh=CdxD/AuZc6YtvXA1cCb2pqHCqBbF40xB8sWz7lyx60g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckEv6Uv9XU+KkuapRIZ3af5e1wI/RYlXbsHNLEBT4PV8y0XY3xE+E1D/SbJffe3CrxI+IENwSOP+haESc8UhoED2eLnEBoKui8/uPiBuLgjokMbOR/ZQWSBntSQPVkf/W8G3o44Klc2trlfBL/LVrhqzo4gM9xEDSk6ZMFI01UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=irOwViPR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34175878e3cso1140351f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 28 Mar 2024 19:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711677931; x=1712282731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rI4RAyyEjYoTE7q+2i/OtTQj9IFJxxIim3QqSMJSu3E=;
        b=irOwViPR/ShNqJBlsv+S2ZcrDsZTi0nCnRl2PpCQ7CMZkLqw9NUN9SmsTDWVB0wbCf
         p0ijbVaGf06YEa5YdEYbpd3eJiR60vuue04YbcHFa+B0AkGyItpW3W+7kqidXTWmdYKF
         KP8iq1mzrjkqBuMgPcD0omeU24y6NIwj2ql875Pjz75020p98uZyh4XgjNfzM+l+53Fd
         yzgfHw9ckOUlA10Ydz2z5LJIG/TZvYZ+YIlm5WdEDnsooZ5ReB448goU1RsAwwWZR7ED
         tQDUaiicET4c+6H5b56cZtQ+DuVrmvPpafFL4kWbgcFRzYOHmfk/nX7R6J/xSwJuEPKf
         c/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711677931; x=1712282731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI4RAyyEjYoTE7q+2i/OtTQj9IFJxxIim3QqSMJSu3E=;
        b=xLcM1y3SlHxXjTGd2xgpwbJvNvNgHuLU3CO3kMBKihVxxOYlDkwiRIlp3RnF8/fxUy
         jsJYEKbjGxyKgStG9rNg9p96lh6QavKjGozvjgBMMhyojsKHEsUktN+pbYmUj2K7gIt1
         zNmU7bwlRvM7RwEeAQ8pB4WNgJjHHOQA1ws4aw7U0ASjs5SV65o6LG5xggT+qD/ELrXu
         gNYlFSn97ca1Lv/D56BQY+pEqdpitCwxAxrin9c+p8wHqvWN5cg2CD6DXa5Md4MJTtOR
         0aoMq6u1/qmfZPmqmuTzAYxniJwA0ifetWNA9ep/lwiC9OXYyCCDvJ/s4Xk3QcNCA/DL
         BNdw==
X-Forwarded-Encrypted: i=1; AJvYcCVHpQZACnX9g5uQNug1rYNUDShdJXuOgR0rtDrRc+ier+WJGp4sSvAOAl4QErLD2oEQCE555A+tHPFuXHURFLkIcFR9LxQGWT+CzQ==
X-Gm-Message-State: AOJu0Yzyv9YS/sTyklR/ab2tEsPaCuxTYPoaRua/rLi7zNDd3XFrg2yZ
	TTccgEQGEp4ZQASRjtiCKOj2glGRSRteUIBYlPFOKnjzZqYyvmZjg47IkY7kkwU=
X-Google-Smtp-Source: AGHT+IFDORXhcZHGI6UUjC2LVGODgLzYWzJ3FdbVCjgXfdx/ICUJQibz6S51XTtgJH4N8fup/lQ09A==
X-Received: by 2002:adf:e652:0:b0:341:bdf0:f86e with SMTP id b18-20020adfe652000000b00341bdf0f86emr473552wrn.67.1711677930681;
        Thu, 28 Mar 2024 19:05:30 -0700 (PDT)
Received: from hackbox2.linaro.org ([2a00:2381:fd67:101:f4c1:e8ff:fe8f:2fb2])
        by smtp.gmail.com with ESMTPSA id d8-20020adfef88000000b0033ed7181fd1sm3003276wro.62.2024.03.28.19.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 19:05:30 -0700 (PDT)
Date: Fri, 29 Mar 2024 02:05:28 +0000
From: Haojian Zhuang <haojian.zhuang@linaro.org>
To: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
Message-ID: <ZgYh6Kn6PT9ibBYg@hackbox2.linaro.org>
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
 <20240319110633.230329-1-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319110633.230329-1-matthijs@stdin.nl>

On Tue, Mar 19, 2024 at 12:06:34PM +0100, Matthijs Kooijman wrote:
> The pinctrl-single driver handles pin_config_set by looking up the
> requested setting in a DT-defined lookup table, which defines what bits
> correspond to each setting. There is no way to add
> PIN_CONFIG_BIAS_DISABLE entries to the table, since there is instead
> code to disable the bias by applying the disable values of both the
> pullup and pulldown entries in the table.
> 
> However, this code is inside the table-lookup loop, so it would only
> execute if there is an entry for PIN_CONFIG_BIAS_DISABLE in the table,
> which can never exist, so this code never runs.
> 
> This commit lifts the offending code out of the loop, so it just
> executes directly whenever PIN_CONFIG_BIAS_DISABLE is requested,
> skippipng the table lookup loop.
> 
> This also introduces a new `param` variable to make the code slightly
> more readable.
> 
> This bug seems to have existed when this code was first merged in commit
> 9dddb4df90d13 ("pinctrl: single: support generic pinconf"). Earlier
> versions of this patch did have an entry for PIN_CONFIG_BIAS_DISABLE in
> the lookup table, but that was removed, which is probably how this bug
> was introduced.
> 
> Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
> ---
>  drivers/pinctrl/pinctrl-single.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 19cc0db771a5a..c7a03b63fa812 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -554,21 +554,30 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
>  	unsigned offset = 0, shift = 0, i, data, ret;
>  	u32 arg;
>  	int j;
> +	enum pin_config_param param;
>  
>  	ret = pcs_get_function(pctldev, pin, &func);
>  	if (ret)
>  		return ret;
>  
>  	for (j = 0; j < num_configs; j++) {
> +		param = pinconf_to_config_param(configs[j]);
> +
> +		/* BIAS_DISABLE has no entry in the func->conf table */
> +		if (param == PIN_CONFIG_BIAS_DISABLE) {
> +			/* This just disables all bias entries */
> +			pcs_pinconf_clear_bias(pctldev, pin);
> +			continue;
> +		}
> +
>  		for (i = 0; i < func->nconfs; i++) {
> -			if (pinconf_to_config_param(configs[j])
> -				!= func->conf[i].param)
> +			if (param != func->conf[i].param)
>  				continue;
>  
>  			offset = pin * (pcs->width / BITS_PER_BYTE);
>  			data = pcs->read(pcs->base + offset);
>  			arg = pinconf_to_config_argument(configs[j]);
> -			switch (func->conf[i].param) {
> +			switch (param) {
>  			/* 2 parameters */
>  			case PIN_CONFIG_INPUT_SCHMITT:
>  			case PIN_CONFIG_DRIVE_STRENGTH:
> @@ -580,9 +589,6 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
>  				data |= (arg << shift) & func->conf[i].mask;
>  				break;
>  			/* 4 parameters */
> -			case PIN_CONFIG_BIAS_DISABLE:
> -				pcs_pinconf_clear_bias(pctldev, pin);
> -				break;
>  			case PIN_CONFIG_BIAS_PULL_DOWN:
>  			case PIN_CONFIG_BIAS_PULL_UP:
>  				if (arg)
> -- 
> 2.40.1
> 

Reviewed-by: Haojian Zhuang <haojian.zhuang@linaro.org>

