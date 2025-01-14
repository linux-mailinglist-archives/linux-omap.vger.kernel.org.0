Return-Path: <linux-omap+bounces-3123-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BB6A1136E
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 22:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 464D17A3A97
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 21:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6228D212B3E;
	Tue, 14 Jan 2025 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icOnZjLl"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046C1CDFC1;
	Tue, 14 Jan 2025 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891494; cv=none; b=gxmLITa2mUXItQNJb9xBDCCP7093ymYIB8v96d6OnRQMZdSZFimo92v2/rgyR8iidNN8SBhQNOPxVHDPrWZjxXzdBrg7GynnpCK6zWQ9IICtESKPA8cyel7ssRm2jqPH/d2phtmqKANVcOm2gD9O5ieSHV+h4DRvUDaamhutes0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891494; c=relaxed/simple;
	bh=J0Y0wf0alXAG3eiHrlkOle1Tn2kEBIOSJ+71wMMFBic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkKrOky3HLrPvJPo0uvd63UrH3c60Tw5wkhfErFL1IPgnnIgwLC0UG9nljyveb1u32FcX1t/Y4aAoiG9agwFjQeF3vENoLEtFK4Yywc+k70o98Qh45YlHeNvbTBzvKqwLMyKFNESFhlODhsLzRK8B+ksyTLHDGJeGGaXTFVinfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icOnZjLl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21649a7bcdcso103211565ad.1;
        Tue, 14 Jan 2025 13:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891491; x=1737496291; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVbV5ac+2VYXiTrtVXv7VKO5c0GRCJbX3LZtQlOWK8o=;
        b=icOnZjLlo6AtIr/ym+nMIoWOPkI+kaU1vyPjzEo5zgeeB7iYlD7kVb78b+ZqJaYUWq
         ma+pAQFFcGNLyejpm8/qTOvgEKeIDGeEVQ9sZqYqTGBJc+5OOkBaoNBIVTDtYw/GPvHG
         vJhnr9hIfRk4XhpXFQUehmRYHiP1UG+1VpN5LMxPPn8RS0YzcVRKg4BNP8k6Fi6MIE5J
         eNUHwthJgBCjUeduyKrOsN2I6iKbm56A3kaoH7ZfXDXFWGP8NXb+RYcbQkdh4ozLQj8+
         i5+Ss+xG4Fh/VahOP8CqNs/93uj0vzSK6z+g4OUCXUXTW5V8pGrYxoXlrpMJMVyklmNG
         inzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891491; x=1737496291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVbV5ac+2VYXiTrtVXv7VKO5c0GRCJbX3LZtQlOWK8o=;
        b=WXljvfQSrI0f2bScoGNGlopcxeI8+W2/X9EVUL+6alvD+d2X0m+1hEuf1k8v3aTQhv
         K7ziG/Kxeanh7h+IatvVMvB87y9nfPUROV4s2/QQKmp3ViW3VQCJUmdlXO63+8GL7tK+
         AaD34slFBEoRboLJzCyVUebybFovONUm8VgcDMpoYbBfKRDz2OK1lIxp0OjNUyj9Z5XM
         9nfEPwUGgQa8NaS4RfNKXDEnh5nXBcPmYb/qqoZGM0uv58Lz0kiWDHFtkTlH24NH098S
         Sl1a02h/yvpUyzZG3/WKn0mZWji+xBG4Jnr84O3tjUg63LRjrnKST9oj8BIM3v2u7AKG
         1Ihg==
X-Forwarded-Encrypted: i=1; AJvYcCUOhzqGvxcmYshcYoqg/TI9Hhr/EBXWp5mfBqAWpWXWbZXIbqH9K80uRPmS5+fEAG/dY/CtqoPtA2nsJBo=@vger.kernel.org, AJvYcCVrvOtFCKImZxAaWaKN8HRUXNhE4aKSSwEHR4LCfZt3q92gG+ZHyIvXJln95OonyxSoP733UrCfty6P7nqZ@vger.kernel.org, AJvYcCWuBzm+Bxb/esGD30IJOLu+XhigXU3nPshrRrGgJh0FzFLvM83LvfTltYy+H9d1VlqEfTlB72JQiVAl5Q==@vger.kernel.org, AJvYcCX7L1vUD2RmbOLCvPMZApMruoSX2+zJm7qjDG89s66GMAl/gXJ352ew0W4kxrbwlWOmmDyn9PHsEAdv6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvo/0T3LzgKSf7StgKJ0GtjBauw/h3HL1+oKYmD9Wx55bxqtw1
	LCOqNtKTz7WwQ7urFd6ZGx0jnOEqK2uNuE3OMmX4xaI+PmjWBNPO
X-Gm-Gg: ASbGnctQRGcWJJhAbUFKh2TGwUAQGF+TRLNc2lGaatFaIEb24lKkjacTuyehda+4TFT
	h8XEFlrP5caeUx18nJGbZr8iMr8lCoKFSRqLboCKhcski1i/jW4ZBoLkxaz5/ZMJpvK4L6ypY1g
	hXPcKLmjIVI3Wg1wjmFWJslEug/LBIS74FPCHB7aL218Ua9n6jQT5uZYR8NrVB++EItR2YWOT8q
	AX8ZOoCPgTGJZtW1XxYOCnQyFinvrBYwHNZ9IvatV2AJ2KTay4s2IXwFg==
X-Google-Smtp-Source: AGHT+IGsinN9xLrXzbeyr/Uj/+vG17kfUGp3+SuaRvurihjuSLHfaWbr31VKDrFVS4ZaASDbZ9hRvw==
X-Received: by 2002:a17:902:f551:b0:216:2dc4:50ab with SMTP id d9443c01a7336-21a83f42821mr366923345ad.2.1736891490750;
        Tue, 14 Jan 2025 13:51:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e152:4a95:d7ea:84d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f4d7sm70670275ad.10.2025.01.14.13.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:51:30 -0800 (PST)
Date: Tue, 14 Jan 2025 13:51:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: ads7846 - fix up the pendown GPIO setup on
 Nokia 770
Message-ID: <Z4bcXx9LjmHQ0EuP@google.com>
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
 <20250102181953.1020878-3-aaro.koskinen@iki.fi>
 <CACRpkdbfuQuTQ028=hZgRhOPiw5AbPLyoZTbRCbvNDQ-e8UajQ@mail.gmail.com>
 <Z3uAAy5vF2ezUS2c@google.com>
 <CACRpkdYbtCODxWU8F48qGGBJoTL54R5Dj6iYLB6Z2MRwsDqYzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYbtCODxWU8F48qGGBJoTL54R5Dj6iYLB6Z2MRwsDqYzw@mail.gmail.com>

On Tue, Jan 14, 2025 at 01:28:32PM +0100, Linus Walleij wrote:
> On Mon, Jan 6, 2025 at 8:02 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Thu, Jan 02, 2025 at 10:32:00PM +0100, Linus Walleij wrote:
> > > On Thu, Jan 2, 2025 at 7:20 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > >
> > > > The GPIO is set up as an IRQ, so request it as non-exclusive. Otherwise the
> > > > probe fails on Nokia 770 with:
> > > >
> > > >     ads7846 spi2.0: failed to request pendown GPIO
> > > >     ads7846: probe of spi2.0 failed with error -16
> > > >
> > > > Also the polarity is wrong. Fix it.
> > > >
> > > > Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> > > > Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Do we need to have this knowledge in the driver or can it be handled
> > in GPIO subsystem or affected board support? Requesting a GPIO with "in"
> > direction when it is also an interrupt source should be pretty common.
> 
> Hm I don't know exactly the question here but I try to answer
> anyway :)
> 
> The patch makes the boardfile describe the polarity but the
> boardfile (or device tree) cannot define directions, consumers
> must specify this. The main reason is that actual users exist that
> switch the direction of GPIOs at runtime so this has been designed
> as a (runtime) consumer duty.
> 
> As for GPIOD_FLAGS_BIT_NONEXCLUSIVE, this enables the
> GPIO subsystem to read the GPIO while the irqchip subsystem
> can also handle the same GPIO line as an interrupt source, so
> it's not exclusive to either subsystem.

But isn't this something that should work by default, without specifying
any additional flags? I understand that using GPIO as an interrupt
source and at the same time as an output line is not possible (without
reconfiguration "on the fly"), but reading state if an input GPIO line
that is also an interrupt should be OK? I am pretty sure there are
systems/boards/arches that allow this.

This is my objection - we have to add a flag to a driver that is used on
multiple systems to tweak behavior of one particular board.

Thanks.

-- 
Dmitry

