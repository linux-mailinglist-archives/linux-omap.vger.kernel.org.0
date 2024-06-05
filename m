Return-Path: <linux-omap+bounces-1470-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D08FD2CE
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2024 18:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C79241C2413D
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2024 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0E2154457;
	Wed,  5 Jun 2024 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GGCHFT6s"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EC04597F
	for <linux-omap@vger.kernel.org>; Wed,  5 Jun 2024 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717604446; cv=none; b=oTNMoyYephrPGvq26oJexfFK8hal4bj6ddQb8n7nqc6jrvWtGTiAC+puyyuq+tkCDi5U7E2rdOVp2XKu0Ul405MqMX84QCKaGdWcxzmZSVsJf49cDYxQ4whlRQ/QkZsWgg/PDchP2Rx7+LC+P0QJp/ETljlE1ei7tHRNpcLzf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717604446; c=relaxed/simple;
	bh=ixylQI7utK8P2kXta8T8EnM4MLYsyQBVnOHEb5mb/Lw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P5pDugR0/iX++cs7GE+jTqunKXe2cqN1ona1WTk8GOf2D8Z9mMKTE4W7bjyhL3+y20htAOz6DOk4ucaRQvfL9pzotyb4lFkMFTKLYdpXLAysyiMLWS4usBzIiOc7Vtj9MYMV94qi/GgD5lJygyHujr1Kfx3DAIdW6RWVpUS69GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GGCHFT6s; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7025cb09553so3806247b3a.3
        for <linux-omap@vger.kernel.org>; Wed, 05 Jun 2024 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717604443; x=1718209243; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUe72lp9PhB50ZDi28KIqlfosEkYYMEINegcANIHd7U=;
        b=GGCHFT6shPUGf/PbwDoQl9fFhUQYCbCSbvR5RMqvw/vfsMPhmRSg5riHHaxeVBDGYQ
         dceFyxbtNm9t035Nqv07JajRVPAWMfp7LCJRt1TglNwpPdM2sepsW4WKCRPHno9Z0i7G
         ayWhHS+eChnQHccOUjJzTvAlF407QHJ+Xn9l7U4Utb0SvuYEAkZ4+f17k+gkbKNnzJmD
         fpkaz0AEhtPvYcYU8fgYUUrbDpDhWuGTDsV+tGFpLe+x5AAJ3ZrN8WzWfPzJ9JPicrJL
         pgbrNNfm9vPrWfH601xjOfbyei3PQoUxFRvKM60ZxXlfWFtdAuaYV8efFs8IPrE1BTiE
         dvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717604443; x=1718209243;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUe72lp9PhB50ZDi28KIqlfosEkYYMEINegcANIHd7U=;
        b=GEIzYP5k1bD9cQksBndJRLPOQmwGsUTEeeiwQ1p06/ow2kdkYJs/rqECuLniXZE8Z1
         mIwEifAb9VUGVJHWTi3oWz800mjTPFe9RRAMCM93m+v3yIg+IiQZ1Nu7+Cyvth1Mrt5W
         O9ThMXDSCcIOgZcsLLQ6Wt0cFdZepUqXcbw97fpkPa5Ur3msKNMx9x4dQs6BNL3VKoAN
         MOr1G2KwsEo+H9S8zLjtZmHTNomryMqvT7q43LSaQILxnH32LOQsnp0ly/XBIN4MiPZK
         NE9Eltk86nInECHvm9atx4DlhjQZU83gxfDD7ES0uH98Lz76fyuMx5aBirFdXPpp+2GL
         XFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0qssXB1qQ+BhyvctBag3Q7qpzp2LJvWRKP6xD1snUWavHRuwEzQtfdjobDm4gkPOO8xzkxjXpTTmGhCyX/c/5119smXKYF3uecQ==
X-Gm-Message-State: AOJu0YwECIrrm1Jg4SaEC6R5g7lKml5DIQUaX+xn+S3jpYL8amgb6CgQ
	SONcbDVuUBnBKn07rLootlOwNcVHkWJPVq6hwpoX9oUKBp2ngmiqw9Uuqqn6Aho=
X-Google-Smtp-Source: AGHT+IHxt0GRFGmoe8o1aJ9tM2fFQdjYjVVDC1JZZ6cW7eoWBYdWNYz48rxjQnlIN1A0crfntQmv2Q==
X-Received: by 2002:a17:902:e741:b0:1f2:f63b:4795 with SMTP id d9443c01a7336-1f6a590a987mr35049105ad.14.1717604443031;
        Wed, 05 Jun 2024 09:20:43 -0700 (PDT)
Received: from localhost (75-172-111-169.tukw.qwest.net. [75.172.111.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632416d90sm106720635ad.285.2024.06.05.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:20:42 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Adam Ford <aford173@gmail.com>,
 Andreas Kemnade <andreas@kemnade.info>, Andrew Davis <afd@ti.com>, Arnd
 Bergmann <arnd@arndb.de>, =?utf-8?Q?Beno=C3=AEt?= Cousson
 <bcousson@baylibre.com>, Carl
 Philipp Klemm <philipp@uvos.xyz>, Ivaylo Dimitrov
 <ivo.g.dimitrov.75@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Merlijn Wajer
 <merlijn@wizzup.org>, Nishanth Menon <nm@ti.com>, Olof Johansson
 <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Peter Ujfalusi
 <peter.ujfalusi@gmail.com>, Praneeth Bajjuri <praneeth@ti.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Santosh
 Shilimkar <ssantosh@kernel.org>, "Sicelo A. Mhlongo" <absicsz@gmail.com>,
 Tero Kristo <kristo@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Vignesh R <vigneshr@ti.com>
Subject: Re: Adding more mach-omap2 maintainers
In-Reply-To: <20240419055249.GE5156@atomide.com>
References: <20240419055249.GE5156@atomide.com>
Date: Wed, 05 Jun 2024 09:20:42 -0700
Message-ID: <7h1q5b2wf9.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tony Lindgren <tony@atomide.com> writes:

> Hi all,
>
> I want to add some more maintainers for omaps to ensure continued support.
> There are many generations of omaps, and having multiple maintainers allows
> us to split the work. The earlier split by category to things like PM,
> clocks, and SoC core interconnect hwmod/ti-sysc no longer exactly current
> as the work has been completed, and people have moved on.
>
> TI is naturally mainly interested in their active parts am3, am4 and dra7.
> Additionally, the community folks are interested in maintaining also some
> of the older devices, mostly based on omap3 and omap4.
>
> So I'd like to add two maintainers from TI, and two community maintainers.
> This allows both the TI and community maintainers take turns with the
> merge windows and chasing down regressions.
>
> I've started working full time at Intel and will be stepping back. I'll
> be still around here and there too as a hobbyist maintainer tinkering
> with some mobile devices I use :)

Thank you Tony for maintaining these SoCs so faithfully for such a long
period of time.  You've done an incredible job for so many years to keep
these devices well maintained upstream.

> Over the past week, I've privately asked some folks who I trust to help.
> I started with people who have been active recently related to omap
> touching SoC devices.
>
> From folks working on TI SoCs, I'd like to have Andrew Davis and
> Roger Quardos to join. They both have a long history on working on omap
> based devices, and are actively working on the SoC devices that are used
> both for omaps and the new K3 SoCs. Kevin Hilman might be also able to
> help a bit on some related Linux generic issues.

I'm interested and available to help maintain these going forward.

Kevin

