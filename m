Return-Path: <linux-omap+bounces-1912-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 962CB9539E5
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2024 20:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31457B23EA8
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2024 18:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBFB78C9D;
	Thu, 15 Aug 2024 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyGalb6B"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403927BAEC;
	Thu, 15 Aug 2024 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746288; cv=none; b=gAODhfPG6V9bHMMqcY2pYRsCAp4BXlvr5isO24ErO2FAtwhdtc/S5lnvqmJrp6jRTpaL/PACsWm01ru9ZgCQcfS0aYYRKcmzW5e5yPD5v3ryx/5SpeDfcJqw4+iqeP8nIWJiCvpKyPZ7IuRafHNcZdTerrOplzTZp2WykuunSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746288; c=relaxed/simple;
	bh=2BAvT9XZ1ouGPfnrwn/2/w++HGqzdHhXWUBaWEb/C0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqT3y8ap4Bu9PrUr0EpfjOueTKg77WW9Utr5DN1imlvDYmmQjibRUaoYX9ledt8NJC6o6AiwshkugmayQG8fNVbRUEDi/8YfbbHgNTCfSMYD8DR0YfeeNFuOcV++SYlYmKq98/a1LfLb0Pg4UlkMk+TjU27hZQoTqdABduIeoFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyGalb6B; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-685cc5415e8so12800617b3.3;
        Thu, 15 Aug 2024 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746286; x=1724351086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BAvT9XZ1ouGPfnrwn/2/w++HGqzdHhXWUBaWEb/C0Y=;
        b=XyGalb6B//6fdj474nKVY3c55wei7AvFvQn8mkG7pGJzeQ4Asd1E3bPHt4t+BmmQyE
         k2ywmt1NGgEgOpbxeGMi/EnXiQAyUsUkhQP8t7vpeHZVsqcbrntyS9mWD5gzJlUkIjLS
         oT1pGlaYDo/TFdz9eI+BfmOWgFYy2Q6W/3ZncjOimn+PzFJAYBN9oHPgo98+4HUp1TWu
         CAlEymn1cAUZ0BI65rJKKpJUJ82+vtMU5L31/MmbB/0Daw8nsXrR9FC6WW/+cxd79Hrq
         EoqWIiaESCustRdFCtB/1pVmqQrzxAi5Ac/GRTC/JYN3SAf4hjSo+oIY7jSMvNk75015
         YZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746286; x=1724351086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BAvT9XZ1ouGPfnrwn/2/w++HGqzdHhXWUBaWEb/C0Y=;
        b=YIg/94FJmzDiuTPBkaAmJunjnwaVcQG4u4yqHWnOhWZYWlCfCbO6fDQVVvIiQ5HR3X
         LizP6GWTrAFELO2HPo42qAh3j/P5IpSfqPZOAjFT1NEngEGwvPoGa8rijyxELY2w1QYQ
         IbELhCvDShpBUrtx9Qmvt0qvMYWZOhwwMp8rQS+jsc405qdq5vfewtdvYMjzGfT5DSId
         +WFkPQBWt8Tbhjp8rPL+3QjeHzEZrrEBmLXErDGfh0qz/0f7WUkytUOBiQdOmMAPnP4t
         9dbqM/WVG9m3ccEE7Ca74bhj0tgzTXBNylcHkZ49vhtry3Na4xGwpgV52rjJpZfMPwoI
         C7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCV7sMIgaOOhLaYCZ4BOq110NdpxplYqAOva0vLBYmpPgtgaSHBDYL8JFhXrnqpJpvpbelWSXdb4vmKTXOr0jFiJTdxIPECTOzE4mofyXw1c/ySW1MC20LPQebotmuD8FpHPg63XAXHhT5hExZgiD5DnFl63f3yrG+JZIbjsu/cny9Ij6bTsD+98MdPJ
X-Gm-Message-State: AOJu0YwN87Cb31+DNk6vBWAXZVG9NOizqTAeTmXfZnlIma0FkYesEMAi
	5jOBqm3ckygjC0NS9Kz3M2yzpBa95/Ah7LcZ9LjiZsUCZD0WxjSl
X-Google-Smtp-Source: AGHT+IGFUnH96RNkQ2f7l5/TWt3sgZafGcCoUjqKTP0es9sClP0WpxzlBIT6TGy+svuFpvH5nI/fJw==
X-Received: by 2002:a05:690c:6d0e:b0:64b:893f:fc28 with SMTP id 00721157ae682-6b1bd17d13dmr5281827b3.46.1723746286207;
        Thu, 15 Aug 2024 11:24:46 -0700 (PDT)
Received: from localhost ([162.208.5.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6af99f9dfd3sm3409007b3.42.2024.08.15.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:24:44 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:24:43 -0400
From: Matt Turner <mattst88@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Richard Earnshaw <richard.earnshaw@arm.com>, Richard Sandiford <richard.sandiford@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Nicolas Pitre <nico@fluxnic.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	Nikita Shubin <nikita.shubin@maquefel.me>, linux-samsung-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, debian-arm@lists.debian.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Message-ID: <upt52224svue5ozyacrzm3qcavkcz7kojyi2yajoqb4y2pgffo@cy437r5ipdbm>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>

On 07/31, Arnd Bergmann wrote:
>=== iWMMXt ===
>
>I'm not aware of any remaining users for iWMMXt, and we dropped
>support for ARMv7 PJ4 CPUs (MMP2, Berlin) already, so the
>only supported hardware that even has this is Intel/Marvell
>PXA and MMP1.

pixman had [1][2] iwMMXt paths that I optimized for the XO 1.75 and
would occasionally test on a CuBox over the years.

I'm surprised to see that commit b9920fdd5a75 ("ARM: 9352/1: iwmmxt:
Remove support for PJ4/PJ4B cores") landed with the claim that "there is
no v6/v7 user space that actually makes use of this". A quick Google
search reveals evidence of usage [3]. It doesn't seem like this should
have been backported to the stable branches in any case.

I know that ffmpeg used to have iwMMXt paths as well, but I believe they
were removed a few years ago.

Anyway, I guess it's totally dead now.

[1] https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/108
[2] https://mattst88.com/blog/2012/07/06/My_time_optimizing_graphics_performance_on_the_OLPC_XO_1.75_laptop/
[3] https://www.phoronix.com/news/MTEzNDQ

