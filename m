Return-Path: <linux-omap+bounces-4640-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A32B5882E
	for <lists+linux-omap@lfdr.de>; Tue, 16 Sep 2025 01:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E18C4839AD
	for <lists+linux-omap@lfdr.de>; Mon, 15 Sep 2025 23:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1011A2566;
	Mon, 15 Sep 2025 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AnNF5SZK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41515214236
	for <linux-omap@vger.kernel.org>; Mon, 15 Sep 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757978670; cv=none; b=Tutu+E4DFoTMmkprI7UDBTYIOe11dfYdKxzICvaNP26RN2v4mHY6dHYSRZM7xvflw1uD/4RIoKmPCH2uE/7wLCMHeYmu90kJIa7vOI4SAIluDBnx0qVcLwwH3OdE0XwVhQGDict3v3VOvgDa230VIcC1w79mwb5oBAbTyMfTnRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757978670; c=relaxed/simple;
	bh=GKwwThVWN55ZdhLn8yiXh6K4JxO9Mo/TQgLMtJNViiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QgF+Y4eyM6GfUtZkK6+II+KmBBdhS+evs++aHGEG8Jody+Si5qxsF3ca2QJlbm0YuWqs8S5lxkkKJi2C/DULTzlYnTCeW4UevZqA3CmgSw4Qcw+AAi5WyOlsQB1Vh+n3dnidEfe5e7PwkZFIW042+CkuPeeCMcl7h0jp4+jIz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AnNF5SZK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so4061688a91.2
        for <linux-omap@vger.kernel.org>; Mon, 15 Sep 2025 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757978668; x=1758583468; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=;
        b=AnNF5SZKv5v17asZT7KXmEVrj+c+cAHFNsqbOyyCckZn84Ou+TpsIyq9M5CNxXk9tp
         wozriOntYhSiUFCQX/n/vTLbuYa1UxAeDgBphC69+e90/WPfG5f9ttB/62oYoZQY8wIQ
         dFXRBNh5B8KDoHLupM0qQAHa1+etF8bgl1mJ2keogyskBZ/n+5OwdiFMhbXGJw/5YVks
         S9lZyMmR5QX176dS50qmD/ygPWC0tVguS33YcC4T1DUjl0lrLk5P8z/H96YhD6PAL8pn
         4FtAA667OE03xWx25OtDuFMjryLGR1dw2RQW1ytemeZGHlyQkpfZWg093TQRbI0MBXIc
         w20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978668; x=1758583468;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J7uiIeEfgdlPYTD6UL4WzVPf/Tll8ADDPeUkNnf2rCA=;
        b=Eip3vbyhWouw/nXkBrpjCQJ/8pUGuHbGJ/3tATStU0ZyEikIULgRA6xXXDyKHYuhlG
         +XxPJhnAjHAQgwD3kd5qAXE0I219imfqkBE5GxQseVupFhYxECPLKm0bcX/7J+tFgtb5
         ZP+AA3F+T78UrIEYO35qXwAj7t2zkIKzqe63CbKzw+JiVYNOuEJiUiDzwIykyuUrlc6p
         oH0IhEyN9GaMFsLUWbmGhUBrHzZnPR9Vhd/gX+N7Qu2lWOd8tFpDfpJ91ruLP55oqExk
         59FnJDRgieazmsP95S5t9Rj1GffMRo60+Hlo8vSPordbIZSFZkcVaEKLmM8VCTbUQh7I
         T5kA==
X-Forwarded-Encrypted: i=1; AJvYcCW+S1JHLFHnMxRqWcejNPQRfsmLTUwfIkUX+5feBPbKgDCWWLk2+J650NMFN9XV1sA5V2rDv5XfqIwO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7A9tf3PbA9husjmWGEW8bGl+hEzVN7IBe/R4qrVKV8X2LEO1Y
	yH7BlE+9coC7aZz8tPyMrTUe9UrfkjmuK05JuaEYVTU9MKfWncRr9vMgahVmAi0vbXw=
X-Gm-Gg: ASbGncsQ8MLjJmE2PoUfQUbP3ziXHPHWMqDjCvTpVzcZDSbPeD5b+MW7uRD8uaV/I1+
	mU+K2+nViAuaqVfixuEZCXCUA9VtFBCVWdzYxuPWTq1kn+mBywGBp9GusLPtZr10UblxUgxQIWd
	IxKCdCrOadKbBoHwa/NzQeAC43qHQjSDaJdIyH0kIy0D2o2DXz/Uo1NNDw6kbn5KFxJMymVwwyB
	/KBVXfCPdzRhBtQny0KTSSlLlE9OlTTmQM77smX7imkfZvFQG6SzI2blXp4iCW/UdxaFxIlKwe8
	sH6fGf8Oba3kHsyPgNIUb80N90XfT7X2t2SsLpGP18IvaprW0aUoR1yXu3OQ0sFaugFmPu/9ueE
	F1Pcc2Z6QDw3M6KXLxmssdWp9Mu4aiOY=
X-Google-Smtp-Source: AGHT+IHW+Ei25gxkyciUKrKbP1B/EsmDVjk/MF+hGzmjRjAtg2y1sc/2CYFiYtv3fYigvlxtLkhu6A==
X-Received: by 2002:a17:90b:49:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-32e528c62abmr7999389a91.24.1757978668587;
        Mon, 15 Sep 2025 16:24:28 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32df315f9dfsm11154777a91.21.2025.09.15.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:24:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
In-Reply-To: <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
Date: Mon, 15 Sep 2025 16:24:27 -0700
Message-ID: <7hfrcn8fkk.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> On Thu, 10 Jul 2025 19:42:15 -0400, Brian Masney wrote:
>> The round_rate() clk ops is deprecated in the clk framework in favor
>> of the determine_rate() clk ops, so let's go ahead and convert the
>> drivers in the arm32 subsystem using the Coccinelle semantic patch
>> posted below. I did a few minor cosmetic cleanups of the code in a
>> few cases.
>> 
>> Coccinelle semantic patch:
>> 
>> [...]
>
> Applied, thanks!
>
> [1/3] ARM: OMAP1: clock: convert from round_rate() to determine_rate()
>       commit: e2c0510935c5485a2dacfd13af3958536b9d138b
> [2/3] ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
>       commit: bb676996ed583464504123721195e98a708fbba9

I only toook the OMAP patches, Linus W. should take the mach-versatile
one as he's the maintainer for that platform.

Kevin

