Return-Path: <linux-omap+bounces-169-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A8817095
	for <lists+linux-omap@lfdr.de>; Mon, 18 Dec 2023 14:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D32191F22866
	for <lists+linux-omap@lfdr.de>; Mon, 18 Dec 2023 13:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025BF37874;
	Mon, 18 Dec 2023 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wizery-com.20230601.gappssmtp.com header.i=@wizery-com.20230601.gappssmtp.com header.b="N/3zo5n7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D33786C
	for <linux-omap@vger.kernel.org>; Mon, 18 Dec 2023 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wizery.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wizery.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbcdde08dc1so2137217276.1
        for <linux-omap@vger.kernel.org>; Mon, 18 Dec 2023 05:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wizery-com.20230601.gappssmtp.com; s=20230601; t=1702906591; x=1703511391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1Q+zkEvozAEMPH7+PlxGKj4jlAEOXxsDof6pWa1inM=;
        b=N/3zo5n7cr8z0e8fS39iMYf/AfFgBvfWdQVZL7avdhI+dX5MxIwYPT4K3dpM3MD0gI
         sGjObtF4Q9Wvz+ALssyKtWUx0OcyY3foy0iJebF0W6pUHmGsrhce7frWYLeGYd5SI82Q
         V1GEM8wDvvsCGKKXyiLC/weWRQRDe0c/2rUmqVEzayYJY81YcjGuwzfShc0M+f5seCt0
         VbBYKfhegyKhMjm9xW3kR/VCGM/2no03VL1ZmmoGm842wSVYlMkdACzYOKTnLoF/zQLp
         VO507x9rOctwImSubebm1C2KqDZ+jJDjQ6ucwjm73QLnEZNeJbK1ILf6tqSjaH+gSpLF
         cpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702906591; x=1703511391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Q+zkEvozAEMPH7+PlxGKj4jlAEOXxsDof6pWa1inM=;
        b=nGkxsrjke93FHEs3yakzQl8CRhA2avki3JIJUJJx0uNRdr1+gdrC4eGJ2Z13d+9WAh
         K/LmX58YkY8KXwL12Eh5TPdWRXtVgHG8QFs1jNV88H4S2qTuVZBdulCenhnvwx/ETXOs
         btByRv9TZvu94HJm4S6gB1bd4YM27bzipB8pYlJLMCCGCTVfsYlDQMw7Hy/241qXHUrr
         K1YejHKKkdxGRCxUAR517VKMr0vtJE4mg0RB2Lj3lgygEDmckOMabqx5lbQyHi0iIzJ7
         ZBW78rEhEQDj6NCd3besHYpNODSLpVsdTu9fPYy5/U9tryTttBCefML4EnSRyZA8tYKM
         2chA==
X-Gm-Message-State: AOJu0Yz+/hCCOjOYYl5NJPLloZPhp+o5dbFeBMr0FOyr1gWzW7XqwsfN
	JFBUoMp1Qbv+fOLLWMx07Px/8s9aha6+VHBB4rtY3g==
X-Google-Smtp-Source: AGHT+IFRiFASHsEIuPxB9DH7eGlgjvjqSybAmPcflOdzRQaWzdHZYCjupXmJtUwKiCXDd6Js7et5QRcmpTWF8pT7Acs=
X-Received: by 2002:a25:cb94:0:b0:dbd:4629:6fa8 with SMTP id
 b142-20020a25cb94000000b00dbd46296fa8mr274388ybg.56.1702906590733; Mon, 18
 Dec 2023 05:36:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231218132830.5104-2-bagasdotme@gmail.com>
In-Reply-To: <20231218132830.5104-2-bagasdotme@gmail.com>
From: Ohad Ben Cohen <ohad@wizery.com>
Date: Mon, 18 Dec 2023 15:36:19 +0200
Message-ID: <CAK=WgbZ_HoaXgax4Cp97i6u8DAUzE1AA76tnUwLCVJ3dp7Y4ZA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Remove Ohad Ben-Cohen from hwspinlock subsystem
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux RPC <linux-remoteproc@vger.kernel.org>, Linux OMAP <linux-omap@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 3:29=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> Commit 62c46d55688894 ("MAINTAINERS: Removing Ohad from remoteproc/rpmsg
> maintenance") removes his MAINTAINERS entry in regards to remoteproc
> subsystem due to his inactivity (the last commit with his Signed-off-by
> is 99c429cb4e628e ("remoteproc/wkup_m3: Use MODULE_DEVICE_TABLE to
> export alias") which is authored in 2015 and his last LKML message prior
> to 62c46d55688894 was [1]).
>
> Remove also his MAINTAINERS entry for hwspinlock subsystem as there is
> no point of Cc'ing maintainers who never respond in a long time.
>
> [1]: https://lore.kernel.org/r/CAK=3DWgbbcyi36ef1-PV8VS=3DM6nFoQnFGUDWy6V=
7OCnkt0dDrtfg@mail.gmail.com/
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Acked-by: Ohad Ben Cohen <ohad@wizery.com>

