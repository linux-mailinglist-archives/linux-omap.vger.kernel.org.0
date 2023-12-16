Return-Path: <linux-omap+bounces-160-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65B815B2C
	for <lists+linux-omap@lfdr.de>; Sat, 16 Dec 2023 20:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CF6B1C21A33
	for <lists+linux-omap@lfdr.de>; Sat, 16 Dec 2023 19:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1E431A76;
	Sat, 16 Dec 2023 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wizery-com.20230601.gappssmtp.com header.i=@wizery-com.20230601.gappssmtp.com header.b="iji/RbfY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A930F88
	for <linux-omap@vger.kernel.org>; Sat, 16 Dec 2023 19:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wizery.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wizery.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbd04e7d183so778896276.1
        for <linux-omap@vger.kernel.org>; Sat, 16 Dec 2023 11:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wizery-com.20230601.gappssmtp.com; s=20230601; t=1702753202; x=1703358002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIw0KKUn/sOJBPVAoLZOVp9Vicr1Z2LvCEsaKQOJ4vI=;
        b=iji/RbfYRGlkGC1aqPTRRA1fRi1x+37MCNA9+8uRxq9SS9MZk6RfuMNb2MriP5OA10
         tR5Wrev0UwCVOA1adLbUHNwx7Pf6UBBxCobNp6RsZy8VTVgfvsVowU/m7rP3vKOeI5nz
         oQXfi+GR2w6RTT1bfCHk3QM89bWl85b8iNaJT9iFziAU9HrXRLTSQaeJmNL9oLr7vhdu
         YvS+KOMcyKhcf28lLPeb7Ve1kdwRy6BWJSDwoAepZxh2L85YquhiZh6x9sGCDEdJyCgf
         dfLgh9cjNykWSopFmUc7NfMMjv11tAu9BDd7DO4DeOSMN7dVXs+D25Q6pAufGgegX+uL
         8mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702753202; x=1703358002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIw0KKUn/sOJBPVAoLZOVp9Vicr1Z2LvCEsaKQOJ4vI=;
        b=GgsDJvAAN8/9XtsPYgnKLwt3sxHa9JGJtnTvvDxqP/iVC66ViHaBHj/wlxqKRYmalh
         9xRzcG3HnoXctw7zkkwEGhabzBq4d9ykfMJpxXI6nAPyoau7caKuL5TJXJUt4wl3jcjE
         yJYiRsSR2WhSOc5CAJWEGrQhb/Wc/kZuNJv/bT1l24RJN8y30wN6d+uX4LnWX7I4zAVZ
         Ayx1PUKPnpq/IAVf8+MHA7D1DUrB6MDKOstySljcM6+aJfKFuS9PUCI8KglAarIQfKxJ
         3l0K7EsL+bJdPwRldkb6UyVGf2FxkxqXZhwwIKfsGtJGXrzJHDM1ekK5MuSvCBK/VP3z
         1NKg==
X-Gm-Message-State: AOJu0YwcSso80Pt8/jBv7nHvQH0Sd8RpCeyDXWMmmtvJIF0kTwwZKeGx
	9imGjm135R5rbCTndBRHg9JPCWSJiCJotG+mYRp0zg==
X-Google-Smtp-Source: AGHT+IEu+BEXHnMbI0ik6h0fSzQ/20GsZF57JKonaLuC0uEMnoISaaztlU5S6nY6t42nI9n75OQvE9qmJt3aQCsJS+M=
X-Received: by 2002:a25:2391:0:b0:dbc:e53f:8703 with SMTP id
 j139-20020a252391000000b00dbce53f8703mr2406150ybj.100.1702753202061; Sat, 16
 Dec 2023 11:00:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231216111017.17624-2-bagasdotme@gmail.com>
In-Reply-To: <20231216111017.17624-2-bagasdotme@gmail.com>
From: Ohad Ben Cohen <ohad@wizery.com>
Date: Sat, 16 Dec 2023 20:59:50 +0200
Message-ID: <CAK=WgbZcM8qEm6EOT2FFLNLoJC986UYpjEWK2O6-js0P=4No4w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Ohad Ben-Cohen from hwspinlock subsystem
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux RPC <linux-remoteproc@vger.kernel.org>, Linux OMAP <linux-omap@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bagas,

On Sat, Dec 16, 2023 at 1:10=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> --- a/CREDITS
> +++ b/CREDITS
> @@ -323,6 +323,7 @@ N: Ohad Ben Cohen
>  E: ohad@wizery.com
>  D: Remote Processor (remoteproc) subsystem
>  D: Remote Processor Messaging (rpmsg) subsystem
> +D: Hardware spinlock (hwspinlock) subsystem

Please also add:

D: OMAP hwspinlock driver
D: OMAP remoteproc driver

Thanks,
Ohad.

