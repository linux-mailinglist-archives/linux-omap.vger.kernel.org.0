Return-Path: <linux-omap+bounces-1791-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A393E09E
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 20:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBEEEB214B4
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jul 2024 18:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DCD186E53;
	Sat, 27 Jul 2024 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSPrweyd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74325288BD;
	Sat, 27 Jul 2024 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722105702; cv=none; b=Sr4Yq8k+JeREy2cVvW5I1t8j1NPPwRTZCqT3PS41xZbkfixfFHCcu9//JFKwEjlMMWipUYOjKFx4cj3NsZwMuaGAwpAISOnbI2lH2BKx0FMd5O2VXwy27E9q1WS/BSVSut4rrxNnG4N7jU5IKa/sSMwCj6QO8fHVUtgSTerNCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722105702; c=relaxed/simple;
	bh=9Uotxu6q7x8QVz/3PidHI5far08qZeP1lwfIyj+fXRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pInBGUZHiZB475NAhmDnZvQtVN82nh0XV8GP6GK306netSN79wQckWl1xgk1w2B7c2Z0GYMkLigsEZHkBLOE0OBtMTQx0DXP75yBgmBNY2UsrHvD51U8IX7Mdh1Moe7d35fauGGka7F4sobtZYSbdKWpdhbm0XwI3K+fJSfzAQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSPrweyd; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f035ae1083so29565151fa.3;
        Sat, 27 Jul 2024 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722105698; x=1722710498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R4Kt3H168QWVGbDRl+eGwQJ/YJR+XXyzPP9PeurRnLI=;
        b=LSPrweydoMRCi87FAj/esNro5ktnQTLBoZe+SBr3Z9DogMguarqRmrlW2BbuxUlVIj
         Rg5lro0ZiYhVPqr/k57xfsXsm4O3E0ziuqbr3sRIsD5WfLgcgYvToKlZguAoNTYuf0fu
         o49x62TbJ6RtAKUpqv89KNdJPaBWWNUeSUd0QTd4p0J+kdAKhWk8RjR2sGBFiV78qA/y
         g/jYl5Povbhg8dUD4XOlByp4R97xoAqsio0CZWDjzJxO5vrAFfZKV66JZEYIQ8KpowRN
         KiAptHXtcPQ8pmEe5SmVcxC8wv4x2nt6GIVTZTtMHugC042MX/c0MWPyHpBp2v9MG0sj
         Tilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722105698; x=1722710498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Kt3H168QWVGbDRl+eGwQJ/YJR+XXyzPP9PeurRnLI=;
        b=TvljBW//kVF/O1IaGPHfzWynOIUcjHZUP2fOPQ16scHexJTrjPfLvr8YIL3AbKuCub
         GCBU9RWXZYMlhMof4d+PHNkRGKCHuL9JOL4oL/GZYNhDtFgpA4KUFYeKh+7dUbwwVl5s
         VyLE6WP9f9MddHR2L6rXfk5zIYIZQE7rRwXkWL3bkG19GNS3vgV1WTMsCQrG927CxvPu
         /BXVAMp0iBPjyjkjq42PS2JFMJ4VfRwgAyIn0VVvgPW00BNU4cTTUIAAbDhdGYqFZVYc
         CUZSU5UjXR5NfUqjeM/Jusk9Bp2KF0tBtEWXj/mZ8VccotZ9mVx+ehPutxwa28nZY7B5
         8cIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVDrzI9yYQhNkRjXUowUyYn+6HaFFsUr6TOQG6lwSXBid/CeB14k+I2ialyUYk6tNYZPPYwB6SYC9hNnDoss2nKRaaAOUYOBMe9YCNIf1oPpkCTFiAZEiQnnJyycukd1TBHr7WC80=
X-Gm-Message-State: AOJu0YyNlB4tm/lEDG0R+kwOt7osuTXLAZ9QzMRIG62Ad2X8ZNpf9E+U
	dc/9WqnQDsSx4L8EUjD8M7dRt622HfaL9OwHFEX5AldZeNpQRFtyrJMUJpUGTLs=
X-Google-Smtp-Source: AGHT+IH7v8Cpj4IIQry+j/srcpGkQBIahqEf9KbpQZ+lvUvjHySk1KK5H9WrYlIobRIBbxE4z+D0Lg==
X-Received: by 2002:a2e:924c:0:b0:2ef:20ae:d11c with SMTP id 38308e7fff4ca-2f12edfb4damr18415271fa.8.1722105698069;
        Sat, 27 Jul 2024 11:41:38 -0700 (PDT)
Received: from tp440p.steeds.sam ([2602:fbf6:10:a::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280574b21dsm121526255e9.27.2024.07.27.11.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:41:37 -0700 (PDT)
Date: Sat, 27 Jul 2024 20:41:20 +0200
From: Sicelo <absicsz@gmail.com>
To: tony@atomide.com, linux-omap@vger.kernel.org
Cc: maemo-leste@lists.dyne.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] ARM: dts: omap3-n900: correct the accelerometer
 orientation
Message-ID: <ZqU_UPQHCJ37qZfa@tp440p.steeds.sam>
References: <20240722113137.3240847-1-absicsz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722113137.3240847-1-absicsz@gmail.com>

On Mon, Jul 22, 2024 at 01:31:11PM +0200, Sicelo A. Mhlongo wrote:
> Negate the values reported for the accelerometer z-axis in order to
> match Documentation/devicetree/bindings/iio/mount-matrix.txt.
> 
> Fixes: 14a213dcb004 ("ARM: dts: n900: use iio driver for accelerometer")
> 
> Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> ---
>  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> index 07c5b963af78..4bde3342bb95 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> @@ -781,7 +781,7 @@ accelerometer@1d {
>  
>  		mount-matrix =	 "-1",  "0",  "0",
>  				  "0",  "1",  "0",
> -				  "0",  "0",  "1";
> +				  "0",  "0",  "-1";
>  	};
>  
>  	cam1: camera@3e {
> -- 
> 2.45.2
> 

CC: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>

