Return-Path: <linux-omap+bounces-2088-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516196A154
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 16:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2FF3B22F41
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 14:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCFD16C453;
	Tue,  3 Sep 2024 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgZTPGph"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3403307B
	for <linux-omap@vger.kernel.org>; Tue,  3 Sep 2024 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375300; cv=none; b=uegNYmDNnRE9R0deKbC/45bFZSzuA0hbXfFgSf1ovh6rJ/MYVldxP1XXv3Sk114BxV9nYA+p8wO2k9u/oZn85+Dyj9CLNR75bcOEHK9kuD5B1uLSWP0M5MecW0iZe3eaL/IibbSoj1KHcLwCDQYwNkDk4L85xO6kbnhKvyEQIz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375300; c=relaxed/simple;
	bh=+iHV51fA2pw5mwUyDLfptDFizpXWF2KKh7BQ9shciUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5ZUd1FruMnhfM/wJP8ZtryHfHhO925YufYQaX3ilfNeVzR7nxenWUS/76ehyhxv4B9clo46B5iFmPnhUJ8y7yGB+IMkpwuXYcajjwHv2pxImd0Ybt7K+06IqGeTx1vcCDWuNRvT4mGtJuNnJd2aTYpp1lP5/kFuwkaPoLXTW7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgZTPGph; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a868831216cso631964666b.3
        for <linux-omap@vger.kernel.org>; Tue, 03 Sep 2024 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725375296; x=1725980096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=db2ndbu/vXCNONnSDu1Fc7RY2m2odGGHeBIDFICLit8=;
        b=rgZTPGphw+pqXjN4uybRDqSxuh/3ob/qDR6rUnYl0bkcmKMCeL3dSo/2yAKZm+rkXq
         YBzicaTNJZVZfOxCZHgRyeaiVTwEbJiyUVRyS1YclCq/H2jnmBEOKnSkw3HwtX4xAVW+
         liFYsgWnlvcofZx5E3dTUUB3ojM6BlEtRQ9d+sXPUTYk+o761bQxYTTRknVBjh/G9NUJ
         V1afAZFwzIUu7YdM80+0biJPQsC2Lq1lWGO+lUJ+cM86sIQ5KQDWNg0aTC5CIvf4CsIU
         PbUI9FE+7Fldosj9iipa93SyNtO1FU0Lk2Y/8vy4+i5fYrIL48Jg0aUsG94HAV9CGcgg
         OmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375296; x=1725980096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db2ndbu/vXCNONnSDu1Fc7RY2m2odGGHeBIDFICLit8=;
        b=OdwXrCyoWsNNXQKniFzFLYsprW8CUcOf9rSCXs33qvg/bpZ5LKfEjj5dKtK0JH5DI1
         PE955jnFoX+QURc+Gz6ho+PyYihAdqOsXT0bidckrS1S52wTcOOzvRSIxSYTWw+x25A4
         AYajJlJwZ28fbVgMZJh/6dweg28HLUACgeEr7GGvJZN0hTgt0gWsWeOmai47eAe8Plsu
         t7w8+ZXehycwXUM8B9htGBPngY0y6WSXnlahOeu1ZOH/yXfAH7Nrn2rKBuYrPKg2gCRb
         iu/NsOqrXMwV5j7ko3miDqo5/laIncL5KzIEVEKvRMGE0XkOgR1zolyJ7Rb4lAylwFsK
         mhLA==
X-Forwarded-Encrypted: i=1; AJvYcCXQh+vjJK6Nn36pX9ka/Wpr3hM90Sq1ooY4eUlFv5fT0qOo3gCchMCBXYb5lu3SMl7jYvrNBk1pe0fE@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6hnkLEr6fn5AsVfbB1hvVgzYuxqdxittnGyuzNDQVbM2FluT
	e37W0LrmQ9nr7/L/mvxxctddaJu8izxiMMFuUAARVQ6fufs89Q7P5ku5bu+Eu8s=
X-Google-Smtp-Source: AGHT+IEyUf/v4h/Ijd2K+a2Wjxfx10xMb/xv27U7b2cAgzUjpyJE1MBmrex/8Ky5wCP/si8xCkynyw==
X-Received: by 2002:a17:906:6a0a:b0:a86:6858:8a8f with SMTP id a640c23a62f3a-a89b94cef4amr833383966b.26.1725375296428;
        Tue, 03 Sep 2024 07:54:56 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196a86sm691362066b.127.2024.09.03.07.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:54:56 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:54:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
	shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 01/28] backlight: lcd: Rearrange code in
 fb_notifier_callback()
Message-ID: <20240903145453.GC12939@aspen.lan>
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240820093452.68270-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820093452.68270-2-tzimmermann@suse.de>

On Tue, Aug 20, 2024 at 11:22:39AM +0200, Thomas Zimmermann wrote:
> First aqcuire the ops_lock and do al tests while holing it. Rearranges

s/aqcuire/acquire/
s/al/all/

> the code in lcd's fb_notifier_callback() to resemble the callback in
> the backlight module. This will simplify later changes to these tests.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/lcd.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
> index ceec90ca758b..0cd0fa1b24f9 100644
> --- a/drivers/video/backlight/lcd.c
> +++ b/drivers/video/backlight/lcd.c
> @@ -29,21 +29,25 @@ static int fb_notifier_callback(struct notifier_block *self,
>  {
>  	struct lcd_device *ld;
>  	struct fb_event *evdata = data;
> +	struct fb_info *info = evdata->info;
>
>  	ld = container_of(self, struct lcd_device, fb_notif);
> +	mutex_lock(&ld->ops_lock);
> +

guard(mutex)(&ld->ops_lock); and eliminating all the goto code would be
better here but not a huge deal.



Daniel.

