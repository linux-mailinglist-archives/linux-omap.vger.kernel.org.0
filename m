Return-Path: <linux-omap+bounces-1620-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949591D361
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jun 2024 21:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378D51C2089B
	for <lists+linux-omap@lfdr.de>; Sun, 30 Jun 2024 19:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0702915665B;
	Sun, 30 Jun 2024 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MInC2OSd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40710F2;
	Sun, 30 Jun 2024 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719775128; cv=none; b=uq9TYY91/F1Wx7/BjCbDRNP/UA9qnmsEdwekuaRX5/4Z14ex5cI9WozhPChT7Ci+SkDgtn9exap73nd+DQQIEjwvlOfcxqJl6zpPJWpx/B41oIu2YtTMJScAFn2yRdYnX5Jo9i0atv07Y1LNIxCOtMc3RpaoOf9Ar6g5ZE5qpmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719775128; c=relaxed/simple;
	bh=SIyzBUuqYC/Uv6iGqHtSBPjyKkR1Nq7Rna0Dkfcg4vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=heKzu/hqGu9O3mbqGJr9KT5hUu+CPIaMA9mpswOvchygzxoem9pwge6nPIxJDE9iIv5YBw/JXetQMyUlkP9N6FdtBBJJNdzEC4HSmvwdhOvuCGRTDEZmVQAJxzAHDqq+9eaRJRajlGzcMHBPcCdnCFI0SD9aHIwChOWHtOgVJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MInC2OSd; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-80f81080239so718230241.1;
        Sun, 30 Jun 2024 12:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719775126; x=1720379926; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LROBc5Cn3AHvEzFbrvvny5v7Q2aOnPA043oI17JubXU=;
        b=MInC2OSdhrrz7aiv3uS3EB8fO1o25YbMnz1kApD7za/LB4c023IE4sf4FEtZybWasV
         VM8USmocQBNS7Q/qxPv6w/3ERRyGsqXC3OfykikvJwJqBQoOq+XMlmDyiX7HAtEcWnOC
         TxD4yAOucdtDrVK+4FCgwErhEcMZkAJDb7ZDQ6QfLViM2rA3l/We5NCSiypATZBgHFe5
         R81WT8plgCNxgXgQK7IRPrskWjIiRe6XfMktuf8TGDYjKxMW60XB+BdC/EJh9qioDm6D
         EQOU3LBBRPQiI5zX1ys7bJUFtRzfzFBcMKpqjDTa8gWzFk+jiTNjyv4azL9DPit4IJU+
         Jm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719775126; x=1720379926;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LROBc5Cn3AHvEzFbrvvny5v7Q2aOnPA043oI17JubXU=;
        b=jftg2W1GWTCDTkwUVaeaXvJEAXAdYmisKhn3+/5utYk96W6woppGJEJmLmAkCrwQkb
         7gRYGP+PvXYQqDIJ147/9NZ6uNcZr8TYQzy3JgUN5O1fn9KYUvFRCryMaam4FkTdpOZl
         nKm7rRrLyUfyoB5C2/9WjLoy6HngrUiARB4vPGfV6P7/6H8uJrSrkbEtWersL8OQmqRf
         YTY+pA6ekHft7QKwhqtycC9kr/68yFwv0574X9Tfn1EGsUME6xvl5jmtx0q3gY4nXLoi
         FrEQUJXI/HR1Pbxr5g6+SP4fXr1VdtiqYt1G+Zk3JdDXTJwDFsIvUwb1hkcylmvwS6sR
         anHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpw5tkX04iYE1jzXQvP9Iawui7kraoEKzSlQui1ZDz1uLfAFoi297g+uVlxof6XE4iNx2BZJNnrD5rVJjUIvZBVA+fuA0VAodNhQPjGU5XFFUJLfyQlhdXpR2MwT63fE+V6T6hM7JWPEtz+1hmV4Oa/P7e4AKuN4kJNpJO84Whsz7Ov5m8vy9Y3OCuPQAWgGwrbHkXiiDYxcc33YkF/+nMGD2Q1jIk
X-Gm-Message-State: AOJu0YxwTAfJ+LQCfFEC2TCfOwFcEnJvffWT4mMEx1kdjEu0lsaoGfY6
	QHyyJwuM+agLJsuAPYIzxi9yI6lsLNm/pCdVU5PAhsn6JnauJLAUej9XvEF3cbf859bRvFbC2yt
	BIwxpmEzuHP3/JueP31GOm4YuYiU=
X-Google-Smtp-Source: AGHT+IHgXhi2h52NtLmNbTtFIUCqAOSczB+xkST86qS4TfxzvyFy0Gcmgp6HzPHOYCP2gE0K0vx6dS/AhjgLGdIaoO8=
X-Received: by 2002:a05:6102:4c12:b0:48f:461b:c9ac with SMTP id
 ada2fe7eead31-48faf08f6ccmr4121074137.14.1719775126006; Sun, 30 Jun 2024
 12:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626121551.3127032-1-allen.lkml@gmail.com> <dc7hnzrxtrtvlnkfxnqfn46ulx4gq3so235tibohb54zwvjbcx@4s5osl4sjrb7>
In-Reply-To: <dc7hnzrxtrtvlnkfxnqfn46ulx4gq3so235tibohb54zwvjbcx@4s5osl4sjrb7>
From: Allen <allen.lkml@gmail.com>
Date: Sun, 30 Jun 2024 12:18:35 -0700
Message-ID: <CAOMdWSKh3+HXFuYVx-GHC93iqEPskRKLti9KHKLHs5RYy-mcjg@mail.gmail.com>
Subject: Re: [PATCH v5] mmc: Convert from tasklet to BH workqueue
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Allen Pais <allen.lkml@gmail.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > v5:
> >    - completely dropped renasas changes from this series.
>
> It seems you need to read mails more carefully. In v4 I said that...
>
> >  drivers/mmc/host/tmio_mmc.h       |  3 +-
> >  drivers/mmc/host/tmio_mmc_core.c  |  4 +-
>
> ... these need to go as well.
>

My apologies, I have been out sick and wanted to unblock Ulf and
in the process missed reading your feedback. Will have it fixed and sent out.

Thanks.

-- 
       - Allen

