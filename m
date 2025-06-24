Return-Path: <linux-omap+bounces-3966-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24079AE7021
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 21:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7321D7B0648
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 19:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3655A2E7F05;
	Tue, 24 Jun 2025 19:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP/jpYyw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6AA2E2F05
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794324; cv=none; b=QcxsH2Ted0jDp1tc3VergruXfZgU8rHGmF25yZAMX2AMO/kMdF3o2up/C7KYfBpnIfiIMiqWZr3Nw4QL81jI3wP7DOYmm9A3I5pmO3btCmnuVlBre6X5RxSUYZgkBaxlcNeFFNrU/6BkbKwBcNEsnCTRInB9/zxsgbxd0o94npg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794324; c=relaxed/simple;
	bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAYDVHAOxv410+ri5EjInco683jKykiNyMc9oJnUmiWBcxjJXKscxtY0xH4Ha4iecfjdhHu6GWjMLo2XE9BtfLuVXndsyInYqIDIuTrEZrreRJS5BDiMcyBN1imMqVJcQBFFWDsmn14oyJXvRSiB0XxjXsSZOUc5Z2te/FR4as8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP/jpYyw; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32add56e9ddso47781101fa.2
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 12:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794320; x=1751399120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=hP/jpYywfPh1JFB9YkQ1vVGg/+/Jg0mkwd74myvKZZ5kOqxrZlk74X8dd5v4JAWT+W
         +TYXXGddhgNvRRrlHEZfCtiWpzzVohLCJYSdrQv43nca7M7Y8hlHjkdIsEXKVEnNig9S
         g3Qxdegcxt2ZpMlqYqxX6wK6qsdDWi4sY8yYnjp9176ycdv/YCb/9ADGmM4Tv0ztjVoh
         eHxZm8FjnMw6nV8tUq0Wft+aCAM4N6QnenxX45+qPmgEJMwpEBuy9tkfduQyaNCz91dB
         BsOiOK9Nj1kxneUmoh+SGxn/EIivLF3v5Uqd0X7jJHYLmY4agFo6qcEyzO1G2SX93Uon
         Yk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794320; x=1751399120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30oeBRC9xhWE/gLU7A7qEMlCfCO9Q3lAAEFktP0zyns=;
        b=NlMZU5nrhZnFYtJkAlbP6fv7Wk6U7tJpppHcoEzqK2BfDwTsQxOLamZ81vdp2z5VSu
         ibJFrxdYU1OVEnJtDcFfiNkd7putDQJzctTkrrgG/gqXrJ4ePKGvaI7Ad2JQLejtVdzf
         zxkEzvtDutAceszcUPGxhKVhBAIkV6Onwz+QzsXqiq0rrDzLhCQVtm8ohB9t09Tzk3jN
         czWDHz+8w57+ut5/yJChAeF87HTjbOhhGJTSWXmnBopGZAewZDMZOLFe1l4XUO8Ebtbd
         pL+K7zSDiytUxK9ziyGpPfF80X/fC79M2uWArEMbhQP1VtxWyWuZEUJnAyAvapAQ6XZb
         yExg==
X-Forwarded-Encrypted: i=1; AJvYcCV7de7g0XxYTWK3xisy1WTXj05VMlUPbBZv8DdIY13u/9cpzBW0+4IZDYF6OAEuwobDvyD82LuIuMde@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5vOLs7EC3LUH6hVoOpFe4uy8IYxhR5gHGYcUcqMeZ6H0g7S5
	EulGYEX+Mbazm0rzytGdEnYOaXRYkYMkpE1j2WeuCszN3o0Og7cT9cXLJedVHU2vsTRT9cnJKcn
	Y9MbhF0tt195V4EnIUYq2E3eUzT/CwE74lTh94ard3w==
X-Gm-Gg: ASbGncuVoA3erp9IFo50PfWDQRhnB0wd7+vp9zFq/MS9zGcw7AOARUiM0BfH8kfywkz
	87qjbBnrj27sAeei6dUo7H72ujL+41J2ih/UKuiJadYR4/MTGom9Gu+29E57Cy3V6GXg80P3WSz
	rpPsw8IbRE2lPVwDws+N9l9W3leytYcbJVFj/3TS69LH4=
X-Google-Smtp-Source: AGHT+IGHrdlGkQUWphFDOu9KYoSs8Q372bw5fsoYgco33pNU9fbGTgKUqdcWmtZRyS8Ikc4JU9SHkbRiDX4irW201y0=
X-Received: by 2002:a05:6512:1396:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-554fdd0ba1dmr50743e87.22.1750794320312; Tue, 24 Jun 2025
 12:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:45:09 +0200
X-Gm-Features: AX0GCFu6Td3LW-_JOyLEYO7GYkA80dSGig80su6HVwjgXpS6hbnfvwIR-aklY7E
Message-ID: <CACRpkdahd=5cdjL4Je4_PqFmV8dkSuuuRLxdPB0n0-gyFKin4w@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

