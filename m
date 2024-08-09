Return-Path: <linux-omap+bounces-1898-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DC94D274
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 16:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2381E2818B3
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 14:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42692196D9D;
	Fri,  9 Aug 2024 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGRZ2EY8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E818FC86
	for <linux-omap@vger.kernel.org>; Fri,  9 Aug 2024 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723214922; cv=none; b=Cq8BGIFRsdPeqUziXP9u3KF7EzFGRKw/vdDamhjvyI06AgSB3vQXy9ry8h94gJKOP/xlhNqDPV4GvTiA9w12Up411mC1IG+DLCTw7efJZIvcqTOkyzRtQRg00WYexd7CWnU02B50mkMnWz32HV5+mbwJQgbJCKsYItAlCALmhzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723214922; c=relaxed/simple;
	bh=4I5b2H9NUEiAhmrSpLhpqMq35zTGGlKoTm2KVgYDd8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaC0RZBpgGMHSEnxSeDB70zLdlaToznCXAqucNH3RpUtR8MZiFJ1W9EWzEHMfM0Sub3eCQZOIBTZ9gimZPLM/MI1hqY0PpFk0G6QE7k/5tFvfFYj9S2zoScQThAvkb4BfnYWTUQ1Z0IyUuhwhay1Z/rk10M/sA3fAHC1Feg6rko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGRZ2EY8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a91cdcc78so74931766b.3
        for <linux-omap@vger.kernel.org>; Fri, 09 Aug 2024 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723214919; x=1723819719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFtgPj7cDJPPMnEzJqYuz4oTx2v5U6jmL1KNLX38x4Q=;
        b=xGRZ2EY84cWKdcwGaBmL4Do9kjrLYeq3e3nNsKqv4TFpGAiy+K8u4RCVWzlD170hOy
         KFZh6VFfBBfqLNNSYoSPswFKt+ieVqPLhOOCXc3IevlUD/ervn+hVOKrTfNZOpkwoq9p
         tyWTQuMovkhxYlOaciC31JlXsFz65Q1H6GCKHfidhiCPE7RGG5zOqKNwtxXgckquJ7W5
         IcbTF02mI0Wx+JEsVaFfWhQ7iYnq36eh+s1g7c3xSX+c1BCODJS/2q2drZCmJeSCadxo
         cRsWAmc4xJXi/jsJ7KQy0Z4UGi22ja0luL2nCzQlA36PwaK9ZOslp3gYy34U2a4j89Lx
         o3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723214919; x=1723819719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFtgPj7cDJPPMnEzJqYuz4oTx2v5U6jmL1KNLX38x4Q=;
        b=bDBaOFwXWFr2mSKxyOM6w+nN0TNHRQ4XekDw9BK9sIsBPpLTIxJ0UK1DgLXhnuj7Ke
         hJjy0IQ1Qp3q88Ihry6IPINDIFslsHBiyjmkKiwtJWEkYHCwS/I13mu7kgCMT46mYTzr
         g4ppY1czsk4nEZDJjvZ8ldj5OQzyFFVew4Fp3CMdnp0Mhdn/N4pquyAazNWa0ud2+sDW
         LvXHymR7pJjtKGgLCoMhswWF+9CGsiXAetZLYd2Fr9iyAQeRgdMsqvZYWPzC9d6LlVAU
         JYHiUjlpcfktYZWECLLgcw6QRtBANqHlv7DJx+8nHGRj9JTYyUz4rgdYivRZBI3atauO
         9ZZw==
X-Forwarded-Encrypted: i=1; AJvYcCWWCZe06C4lu1Tcd8CKeVFIkYg62KIbiJolnaGXxhMt4XfVWV0py3blBjt1lcxEe1BXviyJ7wiGDDqrC04YejuA52JQWxqI50Y7Qg==
X-Gm-Message-State: AOJu0YxuXfbTWlAHL/V2ac9NyxSI0OemvpjARPFuPMj3tI1YkUPC75aS
	3xvPMbhpEkWkvaduwGwRkIK/kzu5XgUU28ZxOv7fcKoEmyVd+lzUPjUCv6ZVWtM=
X-Google-Smtp-Source: AGHT+IFBY2Fa09LrgoQHpcmAJetlamh86kOIIRg78Yt85HeAsUAmRa90xiVBDSWmTBmcEOH2cLKoNw==
X-Received: by 2002:a05:6402:510e:b0:5a1:b6d8:b561 with SMTP id 4fb4d7f45d1cf-5bd0a535c1emr1850330a12.9.1723214919081;
        Fri, 09 Aug 2024 07:48:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2e5c8edsm1596620a12.81.2024.08.09.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 07:48:38 -0700 (PDT)
Date: Fri, 9 Aug 2024 17:48:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <eb7fc428-3987-4858-b24a-d5c127077acb@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>

On Fri, Aug 09, 2024 at 05:42:32PM +0300, Dan Carpenter wrote:
> On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> > Use sysfs_emit_at() instead of snprintf() + custom logic.
> > Using sysfs_emit_at() is much more simple.
> > 
> > Also, sysfs_emit() is already used in this function, so using
> > sysfs_emit_at() is more consistent.
> > 
> > Also simplify the logic:
> >   - always add a space after an entry
> >   - change the last space into a '\n'
> > 
> > Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> > can not be reached.
> > So better keep everything simple (and correct).
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > index 71d2e015960c..fc975615d5c9 100644
> > --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
> >  		char *buf)
> >  {
> >  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> > -	int len;
> > +	int len = 0;
> >  	int i;
> >  
> >  	if (!ddata->has_cabc)
> >  		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
> >  
> > -	for (i = 0, len = 0;
> > -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> > -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> > -			i ? " " : "", cabc_modes[i],
> > -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> > +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> > +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> > +
> > +	/* Remove the trailing space */
> > +	if (len)
> > +		buf[len - 1] = '\n';
> 
> I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> the original code was careful about checking.  Probably easiest to do what the
> original code did and say:
> 
> 	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> 		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
> 				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");

Or you could change it to:

	if (len)
		sysfs_emit_at(buf, len - 1, "\n");

But that feels weird.

regards,
dan carpenter


