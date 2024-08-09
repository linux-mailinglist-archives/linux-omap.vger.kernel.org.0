Return-Path: <linux-omap+bounces-1900-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB994D30C
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 17:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365461C211A8
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 15:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3893F198A0F;
	Fri,  9 Aug 2024 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTTGWga2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C485197A9E
	for <linux-omap@vger.kernel.org>; Fri,  9 Aug 2024 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216393; cv=none; b=Eo3Dyk2hnRetbHNpvy90oi9vXDXDJjQXTdIxPwEjhpa/63lB5/xksFKKSzVluMJ/zs4/8o7wGT5KLHWAtgU7RGlyqvQfMqMVmgpRosXKGNbJJDNyQTTp9/+5KNiSGRzQ5xIvRgs6SgSkurwrBzg3BxbmWG1Fntdojp3v6BouAxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216393; c=relaxed/simple;
	bh=d5w8AW3pXhgjfBTU7zpf3M2Jmo6P9aFXNIiNbsyY0tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFC+/HReua804AHxT0p6X2/Bl1sgzlWeJ2q0SvDKH8Izhm3mjGGxrEQm2dXqu7aEePq+l1Yk9l6YiFdvDj8yFeE5Wbk11byJ1lxJnmdFxC2P2X3llTl6i2KMCc7d8Ppkr8qcP7g46QnzrAzgwjD2vaWXXPftcSJVjrH/gOgd2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTTGWga2; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so2624748a12.3
        for <linux-omap@vger.kernel.org>; Fri, 09 Aug 2024 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723216390; x=1723821190; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpX0PmRMIOMosOFUpPOvs2TSQ8WjI+Sk8T/asQuu3RM=;
        b=mTTGWga2JQJhAv1czZpXLjMhIXenYDRZPy6BsoRRj/FVtuYHiWKzdzmdqaKReef7Gp
         u1Vwz4XxsDA0/I0uyWFmxuhIPpx3Hct5EY79fxmM8pObhCBtBaI1hQuIWmMo6xwESei7
         aROAy86BSxZKMfdFdEpLKa5IhwktYNobSyGQ2kPXw3b0Ii/9L1bYMC9U/Ad87goYydjV
         n2z5Uh4gB9eitaaobmjMfgnnovn/6HfQW7y7jEKWQfGMt/6amTCNgWZzSg5BZncZYYJg
         qFC/bAyt80gqpqmfo7MTJX23wNg1FlSC4A08t/SdzEsq7CBWaBe2nI+ElakFS77/kf87
         OOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216390; x=1723821190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpX0PmRMIOMosOFUpPOvs2TSQ8WjI+Sk8T/asQuu3RM=;
        b=AKfCCYL3zI9WovzhJM90RNcM17RPgNmmvTgooKUfeVW5ZIW8ed15wIQgYmXDvYJI2W
         oHDvt8k3JozxvOwrGleodXhhpxiRks1b3CJ5IY3lH+K9639W2pt6oE08e4kgA4Qe/EYW
         RnpdWQNe5m5YYOTzjltdPXil6my26QoiFZfqpQRZMTVFj0FelKrDw6LfHvU3Ea4Mvg3y
         TVXHjmScZVzNPirzGCsdpUtdEyNU+pT8/tgfJmNJr+LxLSiGQhIQAcilmT4/jhsGYvKl
         mmiFNX1b3/K88a0GbrZ3eNo2TOmuG9DPlFnyiCHrXueLL8JCjGZjhkZz7VWZmchxEIfc
         fbig==
X-Forwarded-Encrypted: i=1; AJvYcCXjFEkKhnAd/bSoB7/kuu25yqEvTLX9jlXESl4XL4OW9PzKkmuhcuGjUVVeoKxjBRBnKDWL4qj+pq5EsQ0q5Os5kqlvmYtlrDF/gA==
X-Gm-Message-State: AOJu0Yx5tBSfQ+nkByVi13h/DVfinodZY6B6ec3q/j7urMVsl6uizAjx
	ywVpjp9SARHVarNpEqr0/zx0RhN/VQHQoqwEpmVm451Zp764A9wHMiRZ7c0w7xY=
X-Google-Smtp-Source: AGHT+IEBThtubQZ1lg4fjJJt14Xg/AU44Rj0pn1BDb2spFYMlZm36ap+IHP9bae5VVVd9msuHZFx7A==
X-Received: by 2002:a17:907:9604:b0:a7a:ab1a:2d65 with SMTP id a640c23a62f3a-a80aa67ae2cmr145636166b.67.1723216389708;
        Fri, 09 Aug 2024 08:13:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c615f3sm852578166b.94.2024.08.09.08.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:13:09 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:13:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <08fab5a3-4a6c-442c-98f9-672c5afc3609@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
 <7b65dbd8-1129-4fcc-97ba-43400fc98e31@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b65dbd8-1129-4fcc-97ba-43400fc98e31@wanadoo.fr>

On Fri, Aug 09, 2024 at 05:09:28PM +0200, Christophe JAILLET wrote:
> Le 09/08/2024 à 16:42, Dan Carpenter a écrit :
> > On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> > > Use sysfs_emit_at() instead of snprintf() + custom logic.
> > > Using sysfs_emit_at() is much more simple.
> > > 
> > > Also, sysfs_emit() is already used in this function, so using
> > > sysfs_emit_at() is more consistent.
> > > 
> > > Also simplify the logic:
> > >    - always add a space after an entry
> > >    - change the last space into a '\n'
> > > 
> > > Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> > > can not be reached.
> > > So better keep everything simple (and correct).
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
> > >   1 file changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > > index 71d2e015960c..fc975615d5c9 100644
> > > --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > > +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > > @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
> > >   		char *buf)
> > >   {
> > >   	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> > > -	int len;
> > > +	int len = 0;
> > >   	int i;
> > >   	if (!ddata->has_cabc)
> > >   		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
> > > -	for (i = 0, len = 0;
> > > -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> > > -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> > > -			i ? " " : "", cabc_modes[i],
> > > -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> > > +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> > > +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> > > +
> > > +	/* Remove the trailing space */
> > > +	if (len)
> > > +		buf[len - 1] = '\n';
> > 
> > I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> > the original code was careful about checking.  Probably easiest to do what the
> > original code did and say:
> > 
> 
> Hi Dan,
> 
> I don't follow you. AFAIK, it does not assume anything.
> 
> Thanks to sysfs_emit_at(), len can only be in [0..PAGE_SIZE-1] because the
> trailing \0 is not counted.
> 

Ah, you're right.  Sorry for the noise.

regards,
dan carpenter


