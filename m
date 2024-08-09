Return-Path: <linux-omap+bounces-1897-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64C94D260
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 16:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 303F3281FB3
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 14:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512C197556;
	Fri,  9 Aug 2024 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NRIe5fUP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F0194C6F
	for <linux-omap@vger.kernel.org>; Fri,  9 Aug 2024 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723214562; cv=none; b=VzkzF+9E2/5geNe3n5j18gV4Fbi1/9PKdK0QddDrUy0q88jhAULq++JNaOBkOxduGpXMjLlkMdvXIYSDV4PEOjVI9EOkIF9mYewaoU2Qn4f2t3cp2/unBoo66NUDSWtpVpIYQoL6rxFqoW1oSboV3P2TpBmxAg8CT0Ij1w9GgxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723214562; c=relaxed/simple;
	bh=X/lBbMgdKoyFT+HpOqv9BADMNYYjdYwiRKzB+VBXKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iryJmmLno3r9/G7xb5YnapZlOdI3OKLs8/K8fTNsLQsbggH7H7kQae2/CSq1+6JdvvRyZ0F6psM9lECjFmzJwnlOOU8+CSoZcI9pCZjRPJak8c6VCWYax8bqinmg1rlVLLa0SnctpmvaFdfZaRH/GRZoA5aS93grJnJtslKkOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NRIe5fUP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5afa207b8bfso2222597a12.0
        for <linux-omap@vger.kernel.org>; Fri, 09 Aug 2024 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723214559; x=1723819359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ6x68SVn9l/rEaIOjZbaLG4v3ZBQSVdzvMkr4BOLnE=;
        b=NRIe5fUPuQTh9Z/grhH+BbTPv80iXokwu5/G1iuw6NN7HUa3+MjGIY1lLxue57GML2
         XkXwA7VOx2Jdh9kv4PFd3m+krE49XNpF52CB5tZM0bsfnKCACVKmo3ER3sRGwel3q2Dc
         UIBoKP/bWupgmunuMR3wZt95GmPdlaP6b6GDUNKGYM5dGXyxrajN3XDik/ZJqr4RdCyl
         IV6NOE1tDhDLXvlOYtofR5jrHNGISLdJoS2kuenEStfBZyQzHHVLT/34JKQ+A5ne72UV
         EYzWG2cHjLTljQ7ArhwIjOrxZ523MLwZsjUFG2X0v3kErTXY1/rS69yVFa4TmTRtEvXp
         slNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723214559; x=1723819359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJ6x68SVn9l/rEaIOjZbaLG4v3ZBQSVdzvMkr4BOLnE=;
        b=QEcEPGh2e1kynjrFVpNY+MtxDuA4y1PSj503w/t7a/9E9I87PMA7GOR9tv0bAxcj7D
         K5QQIw8J+mx0R8q7g6v88JIT47Z9MHb3VN/mx8wZ3lNQ2QiMSbwwB2onCXh6rPXXaM+/
         4OnXW3Zxo86k757n3N2avVUR8DkyW9/fZQKtGbo8ujTZW1DLLkTcTpbQTC6gX9H3YpLc
         syAehWp9UPdyh2t1T2hMk1k+BG0+0p/l6wdDVYDzgQ9QZV1BWVwMouED3izr0ZzSWTFq
         a4JmOwHyur3DTmW1HekOILq6GAibm4O6YvlDGoFGmOHydUBwQZLJKozS3aSLzGl6uEt9
         4M4A==
X-Forwarded-Encrypted: i=1; AJvYcCX4LDpUaLk7xe1P4h2Ul0QzqJeGRozG7Vvd0yi1mPQtXIAUb/cSsxJi/OWUYj94s1sR8Z8jtqlhC3Cr@vger.kernel.org
X-Gm-Message-State: AOJu0YyNiE9cxRrHtpszBnKR0Eikl2iYmlOpWzGpPi6etVi5jSGNXG4k
	zvaxlT8Bkhjzsx9jkrsq408ZDDWvV+t48JCaoLtW6dEkkuUIEZ8tN38n6iWvM3E=
X-Google-Smtp-Source: AGHT+IH1TWOy97ETcTplA1MtQKCoS3LFPfum0DPCd6fTTLZAlQKCA2baV4vNFWcjn6rsWNaXtYSuKA==
X-Received: by 2002:a05:6402:848:b0:59e:a1a6:134d with SMTP id 4fb4d7f45d1cf-5bd0a63f468mr1207333a12.32.1723214558805;
        Fri, 09 Aug 2024 07:42:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c1f856sm1580740a12.25.2024.08.09.07.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 07:42:38 -0700 (PDT)
Date: Fri, 9 Aug 2024 17:42:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>

On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> Use sysfs_emit_at() instead of snprintf() + custom logic.
> Using sysfs_emit_at() is much more simple.
> 
> Also, sysfs_emit() is already used in this function, so using
> sysfs_emit_at() is more consistent.
> 
> Also simplify the logic:
>   - always add a space after an entry
>   - change the last space into a '\n'
> 
> Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> can not be reached.
> So better keep everything simple (and correct).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> index 71d2e015960c..fc975615d5c9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
>  		char *buf)
>  {
>  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> -	int len;
> +	int len = 0;
>  	int i;
>  
>  	if (!ddata->has_cabc)
>  		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
>  
> -	for (i = 0, len = 0;
> -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> -			i ? " " : "", cabc_modes[i],
> -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> +
> +	/* Remove the trailing space */
> +	if (len)
> +		buf[len - 1] = '\n';

I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
the original code was careful about checking.  Probably easiest to do what the
original code did and say:

	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");

regards,
dan carpenter



