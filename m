Return-Path: <linux-omap+bounces-2797-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48539E9D88
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2024 18:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7788118875FA
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2024 17:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9301B0433;
	Mon,  9 Dec 2024 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE7GpyZw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701991534EC;
	Mon,  9 Dec 2024 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766736; cv=none; b=VT1bfX1CBGblgMJkMnfY+kJH60R6Zl1O+RGTevubzSNFFUnm56pgkYtSjf27cMavVC5eA1rxK1hUBEym4YpZ6OxSoBgyrfyYfmdj97ioV1HMZvu6yB+uef1p1uLvgP4iABTl+UZ2T6OLWMWIfdi5O/hoN5IavSl354yLmqrDPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766736; c=relaxed/simple;
	bh=Lc7CMi5T65fd+xzDNMdvkp4IAYlvO1VlGvQ6pgsERuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ksnx/qvluYmWw3PPKMrxJlMqhxIK+EDhHJ1kUWlB4SXB1GsA4aLzewfCXgcDnUwdKscHvh313DMRGOnpJqufIFlSmaqS3WtAklQG+e1wYKfLWXis0oxduH2tjLwZEqUGpvbAtaZvDECiTb/KaKO5X1AR5vPz6UHyX9UfFv/SOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE7GpyZw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cf3e36a76so40366395ad.0;
        Mon, 09 Dec 2024 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733766734; x=1734371534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/trAWIOmyeIA9QLmudtLE6fFCuJ9kiR9bEYA8dkGpM=;
        b=eE7GpyZwi3Z2zuzClFSCgNjUgc+O1qMZRbw37QOpO8BY9b/C7Fpqd3bVtIB3OMPRjz
         r+9xdJiu7wExiy8QP/J8M7q1qptWqDpJVMQSKzutwMsQ0Krh1BlM3CJaztlKkNjwhSOs
         hMjCkA0RcwZZn3EOD7AtgxHRJV8M64NGnhTE2bmi8IZBtz52eMUSvC3huQwl2TJrrOy0
         9sNmNi80nX4bBu15dwAxBeZ4q6Ogb8cL3kjmQq0368bQfFQ8ivKgFw8KnTs1m0tdwHMU
         F2IO47a+p+hiEZGhalgqgq1qSq1XTDfnSTSUYI+LATyLg77RVbD43U17NEk6tDD1qG+o
         KjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766734; x=1734371534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/trAWIOmyeIA9QLmudtLE6fFCuJ9kiR9bEYA8dkGpM=;
        b=oRjgEWZukmN+B5W0LK+ZQgpivEG/fxqSLYclCgzm6to10W2rRefisBwv9e3B//YwcE
         soEoAslMBoe+5xNtWkZGi6xdLA1nIlBXoDN3l++MS4rlGNwgr7KLkS8za1qeBD7skC/E
         YRUzN6/HMvr3DI0aVcf+6FuqUB6aENiJKfIqLwrjPJRlsmMRuqBUfNAupykIWnsIzV57
         d4tIcpjfqQLgVg01zdI+lcglxP9n89g0/I+d21zPBIoHVQNQir3Q87ppuBgMHFNpd4Ds
         Hjvmse9cTMZZf0jvfTawuIlob4o3nZ6jLg02GjQ95C7pj3QwpLbh0fVwWbU20SZZICP3
         iadA==
X-Forwarded-Encrypted: i=1; AJvYcCUv31uyY85VYNjMcx5/ClWXAY5gNrWIT1PJ/w+7n1XUKbSe/t678T2dmR3doB7VK2zGNTCaA3RWXxqn8+s=@vger.kernel.org, AJvYcCW11gx2hvCGJPbS6rwnWHybsxEbOPxkXjq1gJ+EOsLgeSxQdvJ7OgPPJFtHUEIIdw2s0x/Oos7NMtZzf6QQ@vger.kernel.org, AJvYcCW9Jd6zOhVK7lpgHiQu9Z4GfPQeTyRvJ9aIiV6DDw+51FoNJwHbhD+kq/p3T1RNdjXbCErZczqNvjFhZw==@vger.kernel.org, AJvYcCXVZIyJeH7HaYLQrCsJ4afL4LRDStA9NmWvr8bAeJHSUsLY4+ttCSjlEmbj52wKOKNi8sRyegkNmbZm@vger.kernel.org
X-Gm-Message-State: AOJu0YyR/tetmxkMhEWG5lfTm2Djek81NsQYF7Ui3sgP//LMW1JEnxYb
	NJmWaP2N0HimVKExABaD8uyzlD7S6tPS+eG+eAKULVxTANJeMWo0
X-Gm-Gg: ASbGncvuhwrRo9fRNPAWMKAcv3FMYVGEFapuG5DmpHIBo9eN7aCmt+YtYmW1CizD8tC
	qe4al9wNJ8NTR6SrF3h83onysIGdjGyPd78la0NKT0lkIUIvpGnc/cCCeJwh8I34TjwOr34EBdT
	jSxHhZSFHtBEgWNZepbHXZ2SC4MHuBA5JJxD1QkLYMDN5LUSNGf9roOjQQ+975hoVNnJX5fPlvo
	AmwBj52KizXLy/VKkjAh1WI//CK+SuOXe3bJARuV4lC/Ajsxig=
X-Google-Smtp-Source: AGHT+IEEsOy5X7sKBxPB0ErJL0U3xEpqXt12FxzWmgM7Kpv/Qhhll30qQ8stWy7rSmWuum3iWYSYdw==
X-Received: by 2002:a17:903:41ce:b0:216:1e9f:c5db with SMTP id d9443c01a7336-21669fd3b9cmr19690625ad.28.1733766734346;
        Mon, 09 Dec 2024 09:52:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:ecfb:32dc:2452:3a27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216363a3176sm34602515ad.246.2024.12.09.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:52:13 -0800 (PST)
Date: Mon, 9 Dec 2024 09:52:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: akemnade@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
	khilman@baylibre.com, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] Input: tsc2007 - accept standard properties
Message-ID: <Z1cuSxrV-ceaO1k9@google.com>
References: <20241205204413.2466775-1-akemnade@kernel.org>
 <20241205204413.2466775-2-akemnade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205204413.2466775-2-akemnade@kernel.org>

On Thu, Dec 05, 2024 at 09:44:12PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Only some driver-specific properties were accepted, change it
> to use the now-available standard properties which are
> found in devicetrees containing this chip.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
> index 69b08dd6c8df1..e346fb4f75521 100644
> --- a/drivers/input/touchscreen/tsc2007.h
> +++ b/drivers/input/touchscreen/tsc2007.h
> @@ -19,6 +19,7 @@
>  #ifndef _TSC2007_H
>  #define _TSC2007_H
>  
> +#include <linux/input/touchscreen.h>
>  struct gpio_desc;
>  
>  #define TSC2007_MEASURE_TEMP0		(0x0 << 4)
> @@ -63,6 +64,7 @@ struct tsc2007 {
>  
>  	struct i2c_client	*client;
>  
> +	struct touchscreen_properties prop;
>  	u16			model;
>  	u16			x_plate_ohms;
>  	u16			max_rt;
> diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> index 8d832a372b897..5252301686ec6 100644
> --- a/drivers/input/touchscreen/tsc2007_core.c
> +++ b/drivers/input/touchscreen/tsc2007_core.c
> @@ -142,8 +142,7 @@ static irqreturn_t tsc2007_soft_irq(int irq, void *handle)
>  			rt = ts->max_rt - rt;
>  
>  			input_report_key(input, BTN_TOUCH, 1);
> -			input_report_abs(input, ABS_X, tc.x);
> -			input_report_abs(input, ABS_Y, tc.y);
> +			touchscreen_report_pos(input, &ts->prop, tc.x, tc.y, false);
>  			input_report_abs(input, ABS_PRESSURE, rt);
>  
>  			input_sync(input);
> @@ -339,9 +338,9 @@ static int tsc2007_probe(struct i2c_client *client)
>  	input_set_drvdata(input_dev, ts);
>  
>  	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
> -
>  	input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, ts->fuzzx, 0);
>  	input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, ts->fuzzy, 0);
> +	touchscreen_parse_properties(input_dev, false, &ts->prop);
>  	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_12BIT,
>  			     ts->fuzzz, 0);
>  
> -- 
> 2.39.2
> 

-- 
Dmitry

