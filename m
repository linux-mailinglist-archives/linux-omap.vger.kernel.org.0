Return-Path: <linux-omap+bounces-3404-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8938A65CD2
	for <lists+linux-omap@lfdr.de>; Mon, 17 Mar 2025 19:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD0D37AB386
	for <lists+linux-omap@lfdr.de>; Mon, 17 Mar 2025 18:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5521DDC0B;
	Mon, 17 Mar 2025 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QhhT4BH/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB01A2860
	for <linux-omap@vger.kernel.org>; Mon, 17 Mar 2025 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742236650; cv=none; b=ahGNRQVkNrTaSMcDl3OzeE9GmRocW4Sibvfg4Shdx2A2sp+N/hk4JkPUOJSTUakMnoj01AJiDhay2C7DNP77agK3uPitJXQWzSzGbmXGuiDbe8wagLbu6Hhqe7xYSFsAiQq6N6vzx+ZtmZiIhsF7SK+gMGoJUeUbUp5nWTMbRwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742236650; c=relaxed/simple;
	bh=q59iJSJH2gYjj3Ke2DcYEO5vI7HOkzDhzrWL2ugzs5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYvXLIViheUdFEbEuSSw+6DWEKM7EqOb9Mkbrleg8wQTeqlPdSM31TCsr5QAmNl8ZfVx4Rlh0W2LceZyGCStZ9GEM4SRlFES0EWjgEqjnJ6c2r4IqHoBrqA/YilZ9rNN7pVvqXJUDVQeeP7SKHp86ElGvUgri2yZcNCoABXDIaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QhhT4BH/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso79489355ad.1
        for <linux-omap@vger.kernel.org>; Mon, 17 Mar 2025 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742236647; x=1742841447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=;
        b=QhhT4BH/YMPeuK1gawgdyu1DQJRpzC0uiP39lYwvVuk9QX5C/5OjS80H0PYdNgfaCZ
         BRFMHdYwzQGudlMjBE/hGZlwKmxIloh2kV8sgR92wngpcueJCefVJr584lAmYPXFn0Us
         ftrV8i36BTxluNzWtF3ZCuKoCaKewmguI9k4th3vMRviWzGCXphp491/vK8htuKD+R5m
         BpFX74OQMlTlDZjSdhbpaZBIpjBbisTKTnX5YN7wkjbFVygRDEI2jn05ZEJb3l+QacOQ
         +7i01NiKM1jwRNsomms0IXFxjj6C/t4dRMGz9v1qFOnMnorkUfi9ztpTdo0hVbeL/V0A
         bvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236647; x=1742841447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=;
        b=nPy/VBNKcznQey97OzzHop96tzukRAkOov2IpOFVFIfeloKI+pqIIdxnYOWjN5y9JY
         m9LblWNzoX0WG+nsK+SPGFyeTiCjBeeTAy4eb5i8QCEw2/4jyMTbXL3TrxeVSevYzSvw
         1xptX6CffLjJKQUcGnA7O0TPKfplc2SEbZEsaFdmq6TexNymNQYI3ynL/ve6VFoxeNUX
         WHp6qVqv/V0YSjWENIkp2oKoBy7moeHt5rh936lX7JCkaTH5y/FGiS0wbeFeKS48vgAq
         G2V1ZW0UnLqMWciZ4GEj5RtHy0OYpo755IdkzpjagE01uZk8AY1isfsWjisus+0+xiX2
         Y+uA==
X-Gm-Message-State: AOJu0YypGrZ9igZ8HkkKJ1pAasHSxS+KbOxYO1aC9cwrE4SYS3fLYgEa
	gLC7UXlkpWRAJKz7ATsQtLt+RxjKw1w/zq34f3Q/GttE8wgJ26PgkfRUcsQ5fW3bIWl5yRfVVGQ
	C3B0Z6JxWyr77DJPKOp7SJRnwJ3mf/c4hHVmBbSYH+RPUgYIi/tI=
X-Gm-Gg: ASbGncuspqf6vp21ipPbdW2jT2YKCvtonrlW2kKYiSozuL1FwoJcZq5FT07dq6IKIdZ
	hXyeNYbWsLtIm2nEh7D//sqApKfdyBQM1IA/5Zr4fN0Hq5SvX6AjwivqhUCihXjMuoEcHIYwcgU
	d+i2f58mu3tWy5NkuEfuYqBW4ogBkkX8dkn76q6Q==
X-Google-Smtp-Source: AGHT+IEhoXE3G6cQ5PsnTmHbL5R88MWeJjXOzzkHY7nsry3gktOpZ2t5U93aL61v6oxrZzlHHYJm0XVXQXeQDtBLhAg=
X-Received: by 2002:a17:90b:1807:b0:2fe:d766:ad95 with SMTP id
 98e67ed59e1d1-30151cd2f55mr17924347a91.9.1742236647100; Mon, 17 Mar 2025
 11:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7hcygyb3yi.fsf@baylibre.com>
In-Reply-To: <7hcygyb3yi.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 17 Mar 2025 11:37:15 -0700
X-Gm-Features: AQ5f1JpIDMTdEuLdnoZ9Sgoh0AJoi8JyKOnu1RuLyl2dlsvLYLw5n8ugF-DlDxU
Message-ID: <CAOi56cVkwwsRQo-KQbME-Nmc2HemjmFEDn4_oaGcg9Te_MU_hg@mail.gmail.com>
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Jan 7, 2025 at 3:26=E2=80=AFPM Kevin Hilman <khilman@baylibre.com> =
wrote:
>
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git ta=
gs/omap-for-v6.14/drivers-signed
>
> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
>
>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
>
> ----------------------------------------------------------------
> arm/omap: drivers: updates for v6.14
>
> ----------------------------------------------------------------
> Andreas Kemnade (1):
>       Input: tsc2007 - accept standard properties
>
>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)

It seems this PR was missed for v6.14.  Could you still take this one
for the v6.15 window?

Thanks,

Kevin

