Return-Path: <linux-omap+bounces-771-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1186CC58
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 16:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7F5283C08
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 15:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63DC13A24A;
	Thu, 29 Feb 2024 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsB3fYdG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60913776F
	for <linux-omap@vger.kernel.org>; Thu, 29 Feb 2024 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709219205; cv=none; b=PZk6w8FKDZZS/Fndn4WOnTiw6KHwVGFWACUSXH7taO/uCGfDYlFZPi1go2XqnMKF7KoQUvkphoJS5WHTDiqS1LXYRIes+99PanU4f6xITnY7ZKQ/1A8L2Y+v5nS55yLi8TaQ5ngAMymL19NX+OJ74hpDEw4xc0C/uo1SXlnFsds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709219205; c=relaxed/simple;
	bh=PQ/k0j/+e1mnfwmxiUbzUWJRrlV0ylYhakUhgNYyuQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7oRfHgGH6za3ZPk7Qr+VWyYL762kua43K0Xv5mYKFcvY0OqeEUehKWSCz6HpHzXjXZctFSLIHAmJg/J+1IDsBxacu67ocCK93VC+zDbC36FNfocCAPsZgCu4el1MThss6HXdfIFILhcVnzFjiKikaP39Utvjr5ZA3nCynD8jxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsB3fYdG; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc742543119so1124882276.0
        for <linux-omap@vger.kernel.org>; Thu, 29 Feb 2024 07:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709219201; x=1709824001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26MU8kHY9/G5Vo/Dcv5Tts/6jAZMZIquioYpJYzi0xE=;
        b=KsB3fYdGhLGct4kjtdL0Q713IKX2Aa3fWKkRV1Cugx3CStkNQnyhtXWvrxEu2zM1PB
         CmyHRZjvPIwkbbWqODjHxitkWyI2i5teoFgr+5Cw0hEnik93Zp7oFuKFgiyzca7mMp9i
         4gyrWSQRqQd7vkFP2+1eV/6fsyE+Qbr4euV6ZhcwI8w578yQGpC+xgRMTL0c/fU5fEYH
         ydnSBuWlEqz+XLZjv/tWYWjopwXn9PLU1/bs7EZrF7TBbjKMzRZ6ucgjImr5r+ltgMao
         ypFc+AW/e2HLgfQkMN0FyyymgkyTnlEXAesawPoerSHazj0Y4WOcW6+T7+t/RlBYJXu9
         U3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709219201; x=1709824001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26MU8kHY9/G5Vo/Dcv5Tts/6jAZMZIquioYpJYzi0xE=;
        b=vPTwx+tLqewbACJRpOEifRojsA2SHft99FpMFgqxLvpakqVKJ8AOoaXaBQLgtdO5Hz
         OBUw2G44MzpWOOsrZ1SB4UHR39jwu9XsICEtd2ymeoaA+ZxcftgCuFyRZs2ya6ZuY7hK
         64wtxSnoanpskhMSjc0/FVoOe7HFBeg53e87RXMBPFxCf+bK4vdpPNCHzk0HtfA2jM1h
         M/3ks+s10rmr4n/8AEZGYc4wW0Uk2C+GGWyjtuF9YMMK8+gPfjr5RYefG6nDv049J7Ec
         IkKo/y2q5xHd9f5PQ6MHpd6D+9cs7nQrSJQ24zsSSkEFJY3QcnzVWnHsGa3hCYj8FFEY
         pOWw==
X-Forwarded-Encrypted: i=1; AJvYcCWJeKa1l5P6j7Q4VpcHFNqxDXt5KefSDdHdDZnaBVWwrtsimG16y+gTdnvu08b9jKBGapfwZ9Am7lTbJ8UPrd9M+rXpbYDk6LPJhA==
X-Gm-Message-State: AOJu0YwIXBMMhlP7IAUbCWTmcYES97hbkzvv70VOPMMXHJVjgtCzwnHe
	DH2/x7eUTObdzw8UL9xkbV5/ATKln+e7Z2wjMmCztYyDNQrmeWwfln4zX1lxwag02Kk0BXOMrRa
	cxtmyRRse4J+bSwT+E3s80n1V/uJhDKnbCLbCAA==
X-Google-Smtp-Source: AGHT+IGyVzxlO9P2N2/Nle4urv89zandwAhtRJZVVvNItIuQ0pBbBhYt18T7OWc2iTv2p8Tw14IEUrXNp6FevFF8nO0=
X-Received: by 2002:a25:e812:0:b0:dcd:a28e:e5e0 with SMTP id
 k18-20020a25e812000000b00dcda28ee5e0mr2521252ybd.25.1709219201044; Thu, 29
 Feb 2024 07:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223181439.1099750-1-aaro.koskinen@iki.fi>
In-Reply-To: <20240223181439.1099750-1-aaro.koskinen@iki.fi>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 29 Feb 2024 16:06:04 +0100
Message-ID: <CAPDyKFq-KuoMNE56zjc329OTfF-O8Qm5pDxtkNotZWi2aTBd2Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix MMC/GPIO regression on Nokia N8x0
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 19:15, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
>
> Hi,
>
> Nokia N8x0 MMC has been pretty much broken starting from v6.3. These
> patches restore the functionality. Tested on N810 with eMMC and external
> miniSD card, and on N800 with SD card in the inner slot.
>
> A.
>
> Aaro Koskinen (5):
>   ARM: OMAP: fix bogus MMC GPIO labels on Nokia N8x0
>   ARM: OMAP: fix N810 MMC gpiod table
>   MMC: OMAP: fix broken slot switch lookup
>   MMC: OMAP: fix deferred probe
>   MMC: OMAP: restore original power up/down steps
>
>  arch/arm/mach-omap2/board-n8x0.c | 17 ++++++-----
>  drivers/mmc/host/omap.c          | 48 +++++++++++++++++++++-----------
>  2 files changed, 39 insertions(+), 26 deletions(-)
>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Nitpick: Tony, while applying I think it would be nice to change the
prefixes of the commit message headers for the mmc patches to "mmc:
omap:".

Kind regards
Uffe

