Return-Path: <linux-omap+bounces-3350-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5D4A56AB4
	for <lists+linux-omap@lfdr.de>; Fri,  7 Mar 2025 15:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD2EF7A366B
	for <lists+linux-omap@lfdr.de>; Fri,  7 Mar 2025 14:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EBC21C9E4;
	Fri,  7 Mar 2025 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZB1FK4f"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D921C19B;
	Fri,  7 Mar 2025 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358553; cv=none; b=njJWNqeo43yZ67lB40TPKc9i5zx9VggoaNG7dE1iM7q5pU3GjLmrrLJXkTYoWxbDWj3Bh0rPEKG4VYKRzmwHWrgXyjNJYEzKHrIr8sB1F5FLkSalQzcQB/U+A4IYg4TRxTZD/Q4nr69FajsDok54FVUBoNh0kmEr2pJm3B+pdb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358553; c=relaxed/simple;
	bh=2ONhu40tkgP5kCh3XYIPkx0LVTZwXwewKchD/BE7ANY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIPAl6K9WuHggXKN3JcjpBLs/CfSQHPz/qMG95LlPRwlKiGSqW9KCtxqKQKLa+MMDKMXRexQy4nJSn2HwECsiCsBFYLIWwsHhkOxsXLEMGI8JGKcG2LeFyxEWY1TbiEgd/MS1u0ZPC25lwWxWjZtzkJsEN8iDqY9MW3kJr1jZuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZB1FK4f; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e4419a47887so1529510276.0;
        Fri, 07 Mar 2025 06:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741358551; x=1741963351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3rLgkeZyfmW+Ovwa/la/l4Bicayimylex/nXnrU7tE=;
        b=fZB1FK4faH/87CLSdc/Q4U7TkaW5Oav1HfS4I+1TNMKCoZ5UCLtsU6jaXbsYd1DQyL
         0acDtHrgr3abXiFkSyiEBtR2fWA4KLqRD3D1AVWnKmrE7qnm8gaeWEbyrDXlMmDDuDn+
         tUT/2X0gK7PWqtbVHJbB1slvOqk+Gf3xDO8Nhl8jXqMBIpW8LZ8mQRWx3hFLSTi19Mlw
         FJcym+8A8I7qsxNLbEIFX5aqiKeP5qWZ5TJ0VoqbzuPdlz+MCzgnxS59szF7Xdmn/5N4
         rdGPwPqJ0xOhdA4BrsLnMsqzXar8zYFmfiox0Adp6NlK6Z+tgfQs/e8EriKPmhkxr/KT
         U1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741358551; x=1741963351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3rLgkeZyfmW+Ovwa/la/l4Bicayimylex/nXnrU7tE=;
        b=qMb51CLK9/i3bJle/kYjMGZ/OsyO92aLAxjpA4UYpRYvPO7HxqRCfb7RC5IXMIXuGQ
         madRSKqLaiBlTCUf/z56+Svn2J8kMnOR8BLB6RFNdgM1SEdPQV3Ls3JLhF6T2JIL8agS
         dBo/uadTPM34tUYaZxsMO8bIrJXKRZy9s72C0cLSea4pRLrfGcbgRRXGkGDRX3oEWKrx
         JJ9r1MGjWnIQkLhigrzu7MNcNp0hSoBAM8NhbuAtoVDHLVzAfnqFhkKVZCLvHOjajNAB
         KRVtwEoheuVgk+gdp0j15tLHvIEezbE5dxQk4ySIqks+y/Bi0Uo833FBRWRX4sfhLYPD
         LvXg==
X-Forwarded-Encrypted: i=1; AJvYcCUyPLhdoLmpKFUy+c8XwCgamK1ixpcLn3Ge/lorfFPc/bQ3PFTo7jjo/Xw9+55EQB5g0Y0RNPiDuFwHtQ==@vger.kernel.org, AJvYcCVZlrPa1MlUZG6kguFPaNEVXfc05Xi8MiaJJK817FW4/QjVSjrtJzxDULqaIK26ZYjEVVD9Z9iA60w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGbiwnaeA4pY65BmyUfrELi0SDUVK+w2hvaExlHLWa+pPDOnW
	jyBniTa4bI+xoAuO0vhI3CZ2Wur941RL+i3R1vJbuwMI06uL2V8Sets6c3QnFwQFA+6qgEpWrQr
	KRqAhoAkHKuiWuu7EhZrtTqMwW9k=
X-Gm-Gg: ASbGncuZKqCurHc0LWqKtb8gBkacGJ5Kpwvp+tLZqEPZeSoY8U0cxnNs+XfMpugOeK4
	A1b1kE5BKFZWdV7g/UvPf/wwaCUQXb0RRpqq0A5y8BvkkTHsOtjwfZfUauEMdlfcUlRUtGknieX
	BoiPmYO/tMUYrxrzFsNTjgT7LyI0o=
X-Google-Smtp-Source: AGHT+IEaLs2ec+ex4cnd8ccBvUs29cQQbBkwr2OsisvzLc8I2AJEHn7HNqvTV8pIy1Cd0IsNhGACtqYUV9uCHdzlk44=
X-Received: by 2002:a05:6902:1107:b0:e63:4a36:4317 with SMTP id
 3f1490d57ef6-e635c18c0efmr4306756276.25.1741358550864; Fri, 07 Mar 2025
 06:42:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr> <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com> <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
 <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
 <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
 <20250226170614.18a497f0@akair> <20250307042822.GE23206@atomide.com>
In-Reply-To: <20250307042822.GE23206@atomide.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 7 Mar 2025 08:42:02 -0600
X-Gm-Features: AQ5f1JrHnQSsEsnURkPIFhS3CkXZbp7FzdhF3kzjb2B7KvbWlRM_opBWZ8aQXB0
Message-ID: <CAOCHtYj-0KG2oMuyof1c35c=A8PaUfYPZFuLY_YDKmq-SV8h2g@mail.gmail.com>
Subject: Re: sdhci-omap: additional PM issue since 5.16
To: Tony Lindgren <tony@atomide.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Romain Naour <romain.naour@smile.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Jason Kridner <jkridner@beagleboard.org>, "Aldea, Andrei" <a-aldea@ti.com>, David <daowens01@gmail.com>, 
	linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:28=E2=80=AFPM Tony Lindgren <tony@atomide.com> wr=
ote:
>
> Best to revert the patch first until the issue has been fixed.
>
> Based on the symptoms, it sounds like there might be a missing flush of
> a posted write in the PM runtime suspend/resume path. This could cause
> something in the sequence happen in the wrong order for some of the
> related surrounding resources like power, clocks or interrupts.
>

Kington's hardware anaylizer said after CMD5/sleep in about 10us,
instead of CMD5/wkup being called, it just resets the eMMC..  So
someone deep within the sdhc/mmc layer might understand that. ;)

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

