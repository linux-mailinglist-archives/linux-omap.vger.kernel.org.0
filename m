Return-Path: <linux-omap+bounces-4106-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BCB0DEC0
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 16:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE6D189004C
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 14:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3032EA49E;
	Tue, 22 Jul 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="axhpDc8X"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2232D59E8
	for <linux-omap@vger.kernel.org>; Tue, 22 Jul 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194683; cv=none; b=jf3/vVeYyU6z80m7vCCcFHcANAkD7gdE+S43V4TLv4ev07jgXS3Vm+OfJTvvAaCuj2tzIKrM16EGhlTB3C+wnY5yn0r9aSwtH0xv5i3bXFV7Eix3KWl+FSPyn+OnaJmUtqloXVlD+PlXN9E7ahWKs3gI+32TFNLUjzF4/x2A00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194683; c=relaxed/simple;
	bh=UZ+zBV2JeyxDYayE20yxFBEI2cnrLC+AvEyRTZiqdzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlsP1yGbQHT5GLC9jmkeH9gPZsdO1u+Z92NmxO0L+UyD+LW2+1Lw2oBzjYL4ZBGRkLk621ZxnbYhw8Dp/DdCoOrBxLVFZzT+Bs1pLqj21v36uIOjkF57yb9vwOFGxD7969PMgqGRVGyPPEcB3J1NqYhMQNBfiGYJFaat4qfq9QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=axhpDc8X; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55a25635385so6412785e87.3
        for <linux-omap@vger.kernel.org>; Tue, 22 Jul 2025 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753194680; x=1753799480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV1WGtpxAkHZqPn5ByrKWI6F5o4/gV/EdT2Vc2w+8Qw=;
        b=axhpDc8X4VmYOSSWitSMM0Rl9MmZd4ePLcjYSHXHSVXY5VSYxz0Q7DChhnV3VDnOBl
         s/Q/VKVXOzLximZuY46EiBoKrHMemquRfjRjBNA8VusBMg2b57FQ3hqFPh1u+f+OIYzQ
         K9ImZF+KHlt0pBHODImaqSjkI0WYRTT0+Jf0fn9B2uXKmRH2pkuDWFCDYBlikhsddDvc
         rmTqG2OqZVXCY9GlHiMMa0UHNMwCKVMDsAg4IZekw+qyy7ERrIQvLVHC9p3Fi1T8wPgX
         C59zelaKyYBZ6AI4L10AbUqCJKusaJ7+W+NqCkDp9jxWVY1LYZWXjk1ycROs2c4PZ36Z
         hAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194680; x=1753799480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV1WGtpxAkHZqPn5ByrKWI6F5o4/gV/EdT2Vc2w+8Qw=;
        b=iNinpx897XYUs9dxU0w/Qe4/LXZt2W4SVuERgmM3jXiRjAN2Y+mbkqG2NSHRadUx2y
         vXUs/UHJF2sTzp8uSFJW/vRkpBMK2gEcGbuhsmJlw1lFtUu14g382oqFW6YNYoNKaETh
         vZ40cgQsHIOQCO4SbvegnygkrSKYHZh942QXas4uYNsbIlGhDIBGe+WGUCDlkHVrbEeS
         525sTMYvnx1PZ7Mn+aLVcG5PqNVdJoxlicxtdtEEGFeGuRRf2p5dIG1QOP1jPl0PcBMQ
         Ylq1WrqOdb4Z/9TuM684H6jwaLjpJlOsbqxPxMhVkDXMVj3wAGihafdmX9ZLvcHH6UKI
         IjCg==
X-Forwarded-Encrypted: i=1; AJvYcCXreXaMLTKmjmiXau/8e8wczvuggjpIi53klrjqFGasAf2Vf3SdZahbK8NVRSBhY1p1CHBLMXzBWEyj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2URs/c26deame+fSNYdq8urN7Inmf/+RHxW8gUXGki6Nf2GuH
	m8nGJGWGCm1uU6fMFg8pyZvJVKJB5LbbPpdH/EJtBcyOAzcfWatFjpp97tX5LXU6n4n+oZPUh0Q
	k4rj9vyOA36mLfKIpd7/b/Svu9QglWt3xOTUjshM5Rg==
X-Gm-Gg: ASbGncueSfKWdiLF7SYE5RTy67wL8J1523RejDnN5yWl8kLRM2BnDJSKodnYEuaSeLu
	QcmyEICxuqp0cuZuHZQfgZm7DjXeT1RPdzsPTPpZ4JEy++FOZduUKBtMAkLm5Pnmpdpc/gqTBiA
	bGi3+iXTvIq4n5MzdS0fGB0Q8zcwwuPhJfUlr/iTK6jFsryKkg4fWRiKgjiIsW1Edab7StVLquL
	uFE2d4D7H/i7kKHuWi49Cx9hiy03VBBm9zVu2hvziHEtv2a
X-Google-Smtp-Source: AGHT+IFEqOvUZdS0xFaiTKwfEoQAuQOvPLkieUBzBnWGqxyef23UMwYYSmoW4V1YF8P8O4BYxzngOKTcYEWjVpbw5cE=
X-Received: by 2002:a05:6512:1323:b0:553:ceed:c859 with SMTP id
 2adb3069b0e04-55a2331da49mr6069204e87.21.1753194679879; Tue, 22 Jul 2025
 07:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721233146.962225-1-s-ramamoorthy@ti.com> <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
 <CADL8D3YaF4zt2Wu0Vv1=8W9e9n5BKM+2npgfVmLhJ=wz-jHMKQ@mail.gmail.com>
In-Reply-To: <CADL8D3YaF4zt2Wu0Vv1=8W9e9n5BKM+2npgfVmLhJ=wz-jHMKQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Jul 2025 16:31:08 +0200
X-Gm-Features: Ac12FXy7NJ_nraRS25UNlwGulNE3E8mn28sh-4PSfu7qcum-O7yR_ClX6M5nv2I
Message-ID: <CAMRc=Me7ade2aSJhn4tEAdNUvB3Y5TRLp8j8w8zgP5J3C6_MkQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Jon Cormier <jcormier@criticallink.com>
Cc: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	linus.walleij@linaro.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, m-leonard@ti.com, 
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 4:16=E2=80=AFPM Jon Cormier <jcormier@criticallink.=
com> wrote:
> >
> > This doesn't apply on top of my gpio/for-next branch. Do you think you
> > can quickly submit another iteration rebased on top of it?
> Maybe this is a basic question but is there a rule of thumb for where
> to base patches to be submitted to the mailing lists?  I've generally
> been basing them off the latest tag in linux-stable/master.  I suppose
> this might be one of those it depends on the subsystem things?
> >

I feed my tree into linux next, so generally using linux-next/master
would be your best bet. The rule of thumb typically is checking the
subsystem's git tree in MAINTAINERS and using whatever branch goes
into the next release.

Bartosz

