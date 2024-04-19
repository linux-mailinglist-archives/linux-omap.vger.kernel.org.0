Return-Path: <linux-omap+bounces-1230-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 351818AAB7F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Apr 2024 11:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5D51F22141
	for <lists+linux-omap@lfdr.de>; Fri, 19 Apr 2024 09:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C626377F2D;
	Fri, 19 Apr 2024 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXV1KM6e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372AF77F10
	for <linux-omap@vger.kernel.org>; Fri, 19 Apr 2024 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713519068; cv=none; b=q1J2ku9phIwU8PqXzn5tZuI8ACVlZYjVPLJCDPS/Ws1ScRIdtWQAj5WjrYAezYWSlfANUJiDqITdNn6baulTZzDGfIloI4F7MPYFte47u09Gr12KqCD/J68N0O+ZwbQ834HS9PEADGvUPRbBuAd44w1CSVMMsUWkfZzloFR0F4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713519068; c=relaxed/simple;
	bh=YtXF38UCrfs4V96WaSRUghiYqTmal+47CS3VCe40U+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZPMcK/3u+/Hk+Le8scgyhR4Hdr+Jy4gRbesXahX7jAI/DFnbFjx6HrZBeOIQimPQHo/ykUYp3isREZulmyeAItA7/CPj4GQogaGDwJWVMv1WOF8UNLfEfHZScTDOsIYkmS+UwsXf2kDeGtTK891VJPAUMEMACW+kmILxqyh21k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXV1KM6e; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5f7fc45fe1bso522045a12.0
        for <linux-omap@vger.kernel.org>; Fri, 19 Apr 2024 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713519066; x=1714123866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtXF38UCrfs4V96WaSRUghiYqTmal+47CS3VCe40U+w=;
        b=MXV1KM6eMTyibcfsaqJYRmEzuUlaqYT3Cl4o8f/R0tkc4gCxFnUM4GiqunKxmi4wKG
         74dGDjCIXUQ70kdEHUApuSUOrjBxShF2xRYx8SjViagjXxrdWU9/kiKfIIVx+mjaIA/d
         71Faz4UeI+jTArLMOirHndwxKefBz5cleW3Z+2LWmozcdAU9ImN7RNi+weprTP9YDytz
         FvwY/phBjNOWdc60z+/QyuEcU2aRGuFskuryvpGCHWKY5VYzohs70q307cBpcRcMrUgQ
         h+wDz+3HIbysK2nW5q8/E1kl3TVF696vUOsmxEIwOVHBf4PFc9vKXplZGEcCHxCrN6mA
         ru/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713519066; x=1714123866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtXF38UCrfs4V96WaSRUghiYqTmal+47CS3VCe40U+w=;
        b=LCp9bSAAhcAz9H8OOFW9KdfmjBbwrXEYWbMjPVNLvjohdCRe9/PdMz+DuOc/TaVz7b
         Duj5PyGZtxgArbVcDhdUcgHrwnXuOiZfIYqWChLcgDSwKDCrpKm9tY0Nx0x6FJY0Ro3s
         Uq9BgSScaPc1j79BdXhXVDKVuRCvv+qz5mMkseLIxppTtADt7lRqAIKrLW3zrduYodRy
         xY34phL8lFilxJkZFV9bzmynhql5GvYKZUQf9VY6cEIrX5KdGEDERDA00XL0eA2spMSI
         srvS/TMs+QOVoDqetiq/91bNSf5hIouVP3ykvK6itU/JxCPxc39TwqZmxhUzM7f7AScU
         l4fw==
X-Gm-Message-State: AOJu0YwxYN5HMfBEg+uWMo/FmJxaOPTV6VV3cYQTXxXNrJt8DVtrk9jC
	LkqpydaxX4LsUraKS5mNwmXxSZQ/StV4EZaEsfqE73BPqD45QWoZFQpCmsBqKaN7LBxdJGcl0wu
	vhpWAk32WEDb07Uvr697CVQI26jQ=
X-Google-Smtp-Source: AGHT+IGWsAaCW9M+WirQG2ACbfWWCj3uz7ONQNOQMOKIfTy/WefXtscfLLktDFvzoIljyeIAm+vA70FKNQ1ScYX/mw4=
X-Received: by 2002:a17:90a:ae08:b0:2a2:94c0:38d4 with SMTP id
 t8-20020a17090aae0800b002a294c038d4mr1611540pjq.31.1713519066225; Fri, 19 Apr
 2024 02:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419055249.GE5156@atomide.com>
In-Reply-To: <20240419055249.GE5156@atomide.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 19 Apr 2024 04:30:54 -0500
Message-ID: <CAHCN7xK2O-b0QY-Z2rKWPr9W8XGokXL0ZBdF+dDB9+yk5J7ONA@mail.gmail.com>
Subject: Re: Adding more mach-omap2 maintainers
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Carl Philipp Klemm <philipp@uvos.xyz>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Merlijn Wajer <merlijn@wizzup.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Praneeth Bajjuri <praneeth@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Santosh Shilimkar <ssantosh@kernel.org>, "Sicelo A. Mhlongo" <absicsz@gmail.com>, Tero Kristo <kristo@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 12:53=E2=80=AFAM Tony Lindgren <tony@atomide.com> w=
rote:
>
> Hi all,
>
> I want to add some more maintainers for omaps to ensure continued support=
.
> There are many generations of omaps, and having multiple maintainers allo=
ws
> us to split the work. The earlier split by category to things like PM,
> clocks, and SoC core interconnect hwmod/ti-sysc no longer exactly current
> as the work has been completed, and people have moved on.
>
> TI is naturally mainly interested in their active parts am3, am4 and dra7=
.
> Additionally, the community folks are interested in maintaining also some
> of the older devices, mostly based on omap3 and omap4.
>
> So I'd like to add two maintainers from TI, and two community maintainers=
.
> This allows both the TI and community maintainers take turns with the
> merge windows and chasing down regressions.
>
> I've started working full time at Intel and will be stepping back. I'll
> be still around here and there too as a hobbyist maintainer tinkering
> with some mobile devices I use :)

Thanks for all the support you've provided over the years.

>
> Over the past week, I've privately asked some folks who I trust to help.
> I started with people who have been active recently related to omap
> touching SoC devices.
>
> From folks working on TI SoCs, I'd like to have Andrew Davis and
> Roger Quardos to join. They both have a long history on working on omap
> based devices, and are actively working on the SoC devices that are used
> both for omaps and the new K3 SoCs. Kevin Hilman might be also able to
> help a bit on some related Linux generic issues.
>
> From the community side, I'd like to have Aaro Koskinen and Andreas Kemna=
de
> to join. Both Aaro and Andreas have been working on multiple mainline
> supported omap devices such as n900 and gta04.
>
> I'd assume we get the final list sorted out over next week or so and then
> I'll send a patch for the MAINTAINERS file. I've tried to Cc a bunch of
> folks who have been involved, but probably missed lots of folks who have
> been involved, so please add to Cc as needed.

Thanks for keeping me in the loop.

adam
>
> Regards,
>
> Tony

