Return-Path: <linux-omap+bounces-5266-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E3CDFD96
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 15:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE64301586C
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8223631A7F4;
	Sat, 27 Dec 2025 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaUEgZti"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D2C227E95
	for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845432; cv=none; b=SGOyZJHayvlGgMSCSZdmeYtW8SLOnEouuAioDxD5fIlMaPS4tphBBTvniGoU7qYVxwamVLh0r4IQaR5okb8PNzELAItjnP61KeH4RNvBl4qO4tFSwK5Wj3WhdRTNBv73UEJwpqH66gNVlYOtR9lNA3zuW5aUXEaYchsDe6u0PHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845432; c=relaxed/simple;
	bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZHn0WsyNlz4LGv7GNyqhcmSPo2lxFQ50Tls9Dc/DMKN2sFpndxuPh/MY0v1tAYSbknKBPi4vN2kuFiiALPLMwLGVHOcuqLmsyyiLKYoh0p5c7g4QFbeb+5ad5No1w7MKlkN0EowzU1/0IuViZMcjvgXqivjajV7vem7tmRPsWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaUEgZti; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1611048166b.3
        for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 06:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845429; x=1767450229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
        b=SaUEgZtiLHtcDKdBYgDvGFkdk/BTnWIDIRFhPmCbtii1PjkdcLF5ClAYfNUQiAn0Yw
         Mz7vDe2p02LrRXT/JKIS3PhlxdyA62/hvc4l5FGwMCRr/8q0xQmkxyADjyTNmMmgxE4W
         DbH2yEO58oW2m02i6FHVyZ8He+6+3gnGLDTJX7KhHbmLA05o6TPxaFwvD8APx7c6GgyT
         fuocxQeiK6Oyi9Dyv25t/yu6SoScSu8B+YhemP5TLTKrlYGTdlLv2OVdSpYnVbLueEA7
         /vaDPm9DZ7SXENsSu1V5+k1X4qjnnDMMGGAzWus1mkq/98DDwn4bWTDz/dqAeLwJF3C0
         THtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845429; x=1767450229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tu3i4WlFX0wkjQWqS49NrgqXIOcBQ6oEp6NKqAmVAWk=;
        b=iUU2Eze42TNWz5vbixSNaVksAA03mPkjzBuIoJkMtc55BEROfNsJaeQQuD/AC2rBjw
         S6L022GoI+tJajufj14fBkUzDBH2olytbgqhr6gk/Uso02QRFhHMsJduyIdA3o9rjJbQ
         psCLS4VFV3jSxSTKhNyJKWUWUihSSGZgtBOTPQo1kEcABp3jNlaHYpPeqm0CQF5dDKY+
         CDSGU/l3hrSixcOnmXih/6F6VmYIOCGL08EC6UmYbT863yR/KWtt8oybuqJWjkKaGBI8
         7DbE6NCX3zWqLGM6bIh4k+imoHhVzZgdeaL0P4qIMxWd3zBbyKOHjyGKkY60WzRmaXVi
         NRHA==
X-Forwarded-Encrypted: i=1; AJvYcCWwBHjJArcTow0TS1H8feP6sWQJWbsrcmZOKdSoknpNN83YF9aYM6+puHDHzS/Z1mwiZovXq5U+D+vC@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpw/0Q6rBhNtuX+IK4D/aCuwnKdrYR1Lmoi9CZf5YXq/RaphC
	7Ee2ZhZuLGpzcB04/56KEwwZMoq5V7fWEPMpYIjK/QLZTXkwOQyNXkFSP1/geLn6uTlcidLDXMz
	WeYty8dFZMCG5TMeilnPMR5DVY5Kv3cI=
X-Gm-Gg: AY/fxX4x40Ei9YuOatNekoy6ZEJUs4g7lqYerF/eVHps87bDfgiORmBZBDhvGyqdvIW
	7jXAv89hvCSZA14/JcYzdE90yXi74PNIvDG78mN7cmtM2SDDRFuKcWOuUvxjK5XICgeL4OJbWHA
	Ozej+9uWr50Wwu0nMp78K2XE8y94foz1VH/Cdm7CJlAr2ctPtfa8y04bTmtAqXm3sVnUuvlm9xo
	6Iqayva/zSWO2QJHtkP2VblUqWpWN2+zY3W+6mLRLECM+B0cMWEntnng6YXaFKgL5fAzseg4v+I
	WVjsPMifQEJ8Go3Jhq6rENaetfhu1VJctezCWOqa831hXsZGK5bb9Pp7UrEKCQ0bv+nvgg0=
X-Google-Smtp-Source: AGHT+IEI+L27X3VYBwtvTtbD//tUK1cqRstOGm0x8A+wsW6Dy/BBoKlQjPvPMQaVva0Dsb4BJJYbeSNL+99aFRZdUpk=
X-Received: by 2002:a17:907:2da0:b0:b73:5958:7e6c with SMTP id
 a640c23a62f3a-b8036f0add4mr2974716566b.3.1766845428952; Sat, 27 Dec 2025
 06:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-2-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-2-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:23:12 +0200
X-Gm-Features: AQt7F2oJx9_5rStc5In55eyBv3lfUDojQOUDP7FelHM31gT78_xqzMu7r2M2phQ
Message-ID: <CAHp75VcumPK00xv4R1XKOspTf-8G76dmx16BG3y5G=tJ5v_b4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs support
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> Add dev_of_fbinfo() to return the framebuffer struct device when
> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>
> This allows fbdev drivers to use sysfs interfaces via runtime checks
> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
> remaining fully buildable.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

