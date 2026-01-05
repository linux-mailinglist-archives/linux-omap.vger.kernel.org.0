Return-Path: <linux-omap+bounces-5312-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61076CF2006
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 06:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D35FE3047919
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 05:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D209F327C16;
	Mon,  5 Jan 2026 05:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AMTTip1s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF479327C00
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 05:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767590184; cv=none; b=D/FaJsodSBe51U3QDXcgi8b6J/RnsqRKOhQAiN11lnJCzZEC6btvGybqIkdBfeZtgzjaGBZt1Zh/3kcUxJD5CwPbeZ6CDuz2nqmlwJTO8M5mMmJ2xQvTl1K0afQRQZaKjKEBwJzuf9pdAFkXloivSFMWZ3rGiLwx9lFu50ma1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767590184; c=relaxed/simple;
	bh=mcYzBYB7y8/r8i7g4RLrBc1IZKBZ6GevOynaaAk8sbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9hrUfRhMsoWC6G3eyfPhPE1XPKgyteiEoeiOsvI2CuwD6eNuqbj9fxGdJxcB8MeUJItJ2al2Jy8wCJi5IFGzyf/M3riP+t5BmCrDKEBSb0B3BvWUJVj6ybvhipHI33sSfTge/52HkWjs3nlaeZ7LsWaFUcJn+YPNOLyCnyiYw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AMTTip1s; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-803474aaa8bso776949b3a.0
        for <linux-omap@vger.kernel.org>; Sun, 04 Jan 2026 21:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767590182; x=1768194982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpbA45esMIBMgfkAVwV6CxFZYn+BwHRYNqukP46Yyhc=;
        b=AMTTip1s8fuq3LMXokI30VJFnjHPUSv+LhLxPI1XyWVNwfmi9/0QyrBW2MbNxdtVfR
         ME17Q6edMPZ0OUasPhEFa+1FBYbtdfPALncVVgTQ/fScQiBh8HdB3z+zUJMQYE/W6A3N
         l203kqO8JrH4aQWHbGp/ai7nUDuCTIfQM8bs8wGsi7Dmfj6fFOBO8/DOfS/JffEbh6b1
         oXg443hOHtCoNK7I8auAdQcQvt0HMWcgMuSgK8NuABqO5F1POHqmea2l23m58psFMUXr
         W22puneQtNpeyemMcapdoCEfsnRfT+Moxnx2rZyiyndB+cK7a4XSx7VI6pe/FYEUp1Cl
         hIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767590182; x=1768194982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpbA45esMIBMgfkAVwV6CxFZYn+BwHRYNqukP46Yyhc=;
        b=KpQqDatKxq18+NOKl728OoyoKuYYViVhSdYa6wq4KHDhIbk4USN1xeX9BjUgs1RtIj
         oCW0q8t7UsTs9fgnaZ/zAneJ3+4z1LJYuAOcD6womHx8pV7wIsX1r0MOBEI5vdwc9RKv
         bNSuvV+NGcH4frMc+Eabl32jRbObdIDPvbXpzw8eguQeW/IQuK43TZo/9EgTAeMa7fy7
         KbRcFkv665agfg8WAfduELrfByQl+r8a9/rTW9SF1u7vdVMpOb6BDRS8sc6Eli0U7x6P
         2kDvR94xyRPr8xXEf6oVpYrPiVq+vIL4b8TLq8jhD4kuEAOELyhHu+vg+A4e4meQ/Jo4
         aYAA==
X-Forwarded-Encrypted: i=1; AJvYcCXmfsPzrvbKdVjwsZP0xrnJ8m2otiO+FUOHbszuSj3Dp4+VsP9ig6TZtPmgOriLYVNMTsYUdWo4nBye@vger.kernel.org
X-Gm-Message-State: AOJu0YyVSYlIXVFHkt5NnInhki+vHFJOCKO1MLxspgOM+GBqnlfIG9L/
	Xs4CuGJ+fqcfdgmuHMrrExDGAwUvARdo4dLe5WrqSHnss7iDZWJ6PBeLP6zVBS812wc=
X-Gm-Gg: AY/fxX6vnkcG4btBJIkcU5bxkoB/OitUs51g1EWjaC6SNxkts2mqVV3Y8tgZ6vG76bp
	/P3uKZk8bbJj5xLAThowIz/K43MoP7J9UI+6Kr1ltz2TZmeYUcxXu26jYi9eZJ64p7WCfpNlW8A
	vfAyU9Aj+LtJsNwqcCPRFHOWwkiXCWq6XOVn078cw1qdIhsQc5ZbjiE1rWShGNhg1Xnn26nN6h1
	SqaTL83XZbPYh2ojJiipNVxtLMKoNhyFYtZAkXDWVzrhFouhyqJjNU6+ZG0C+Pc7YP81sfr78oe
	mic/crW+5pPZp8x4W+MGBHRb1AG6qPw2bR+hyZx1jrSylZVMNbG7FDLZbqWsv/Wq06wsj8MYm8y
	5xsxGRrQ9f3l+VeiKFDcbJhMyq25EwV9AoB/RMC2U3K/uSd1yTG6sSfRpiqfUX43vAmdJRwXRJ/
	A8VaCsbG643iKIIt/7Yt94Xw==
X-Google-Smtp-Source: AGHT+IFfEKnsl5QxZyXv7k50VAY2BXELhz52jgPd5VP1ILP7m/DhbTLzWR4EDt/ToMMNCM4NouQd9A==
X-Received: by 2002:a05:6a00:909c:b0:7e8:3fcb:bc4b with SMTP id d2e1a72fcca58-8148b523aaamr5501381b3a.32.1767590181832;
        Sun, 04 Jan 2026 21:16:21 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a844d5asm46691551b3a.3.2026.01.04.21.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:16:21 -0800 (PST)
Date: Mon, 5 Jan 2026 10:46:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Kevin Hilman <khilman@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-omap@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] omap-cpufreq: Fix regulator resource leak in probe()
Message-ID: <63igwpx3adqf27awer7gv4yoj6qzhbgvomzierksm6m3vziybt@ypxykci7gnll>
References: <20251215030327.1771-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215030327.1771-1-vulab@iscas.ac.cn>

On 15-12-25, 11:03, Haotian Zhang wrote:
> The current omap_cpufreq_probe() uses regulator_get() to obtain the MPU
> regulator but does not release it in omap_cpufreq_remove() or when
> cpufreq_register_driver() fails, leading to a potential resource leak.
> 
> Use devm_regulator_get() instead of regulator_get() so that the regulator
> resource is automatically released.
> 
> Fixes: 53dfe8a884e6 ("cpufreq: OMAP: scale voltage along with frequency")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/cpufreq/omap-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
> index bbb01d93b54b..f83f85996b36 100644
> --- a/drivers/cpufreq/omap-cpufreq.c
> +++ b/drivers/cpufreq/omap-cpufreq.c
> @@ -157,7 +157,7 @@ static int omap_cpufreq_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	mpu_reg = regulator_get(mpu_dev, "vcc");
> +	mpu_reg = devm_regulator_get(mpu_dev, "vcc");
>  	if (IS_ERR(mpu_reg)) {
>  		pr_warn("%s: unable to get MPU regulator\n", __func__);
>  		mpu_reg = NULL;
> @@ -169,7 +169,6 @@ static int omap_cpufreq_probe(struct platform_device *pdev)
>  		if (regulator_get_voltage(mpu_reg) < 0) {
>  			pr_warn("%s: physical regulator not present for MPU\n",
>  				__func__);
> -			regulator_put(mpu_reg);
>  			mpu_reg = NULL;
>  		}
>  	}

Kevin ?

-- 
viresh

