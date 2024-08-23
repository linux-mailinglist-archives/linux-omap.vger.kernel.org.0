Return-Path: <linux-omap+bounces-1993-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093695D262
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 18:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D31A284F1C
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C361898EA;
	Fri, 23 Aug 2024 16:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TiZeWRtt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289781C680
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429145; cv=none; b=CXoqcrTyt6IQblv/15NkY8Jb/wwfjcChnPx2v/mX1WuDatugPKDGOkwF7y0eaaee5HqkRKHhkwuBIxCCeO9RqIYUV+q/jW+IlA/+VxvFo8GJL3cjFcjL97LoU2FXRihihMrWiiAOssTY1LybpazmBJMBl5v8Ub+TUssapNO6iDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429145; c=relaxed/simple;
	bh=CtH44QKwujAGQE8ahoA+3jbLv2Uur7pXg2mjO4prtB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDOZE8zQ5Hxc0CYa2Mc8VavDow8sWZkaVxlEK5Gg8OChAlxa1Ed3hJ7RjLsYr7d0NRxCDklLZkc4XyQ/D3mKeLzsjrWwHgOym07AoSTU5F4gGGrdN1Jo0wfy37iMGheCBNg49r8YmFhjjm7EVfyJhAZ++/ZB7S+20pagYTj1+f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TiZeWRtt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334879ba28so2619828e87.3
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429142; x=1725033942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtH44QKwujAGQE8ahoA+3jbLv2Uur7pXg2mjO4prtB0=;
        b=TiZeWRttdJs0LL3h0MSJkCb6YQD9HzH7SHkVQRl1QsvOiNF9O2Tu+nZwVMpj/C1X6U
         1xr2caF0o3oOFH5+CRuG3k6j+b7Rv6c0Zqhpy6/6PiVLZATmx/OhlBt17bw1tcZ0QbHQ
         PWzvZOceArjHXnAnh8HmYBpmloExeU/sSw14/Z8bLuZHJh40nhEjDhT42zJcljjTLXu6
         RFM9fe83MM7W5GfiyN8X+AIZXFVgEv7YCu4zKKVC+hVlO5TqxJ/hK1EXArDiQgwChsts
         kE/i6O8oXjyiKGYJX06E7rv8fAMlymS1CpuMMEqu/PBHAlIbMJ3m0UabivmrPSXXJs3I
         M9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429142; x=1725033942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtH44QKwujAGQE8ahoA+3jbLv2Uur7pXg2mjO4prtB0=;
        b=s6eTn+7plodZHwgpo+3FAwYqremBh7e3XoPl+kb4E+nmPCwtV4wQAOVYkqETBx2qOa
         cuzbEU6gCXonEdyNbiC9FE46btDKbRTMOWkwnANJukSZly0jAZNR9Q2F3jPstdTGz0E2
         f3GGxr1lS7lalXd5Tz52unKtfkTxl+rt/GtLhe2rbFYOz0Oflh17/XzdHcNQhkmgVV2z
         D9MDEwHFFIMASwZM0sZgbLtOrE4E0j4Jql+aPczQPolrzqbLkrxbZOcupdCLWe49YV8L
         Iq9CYHNc2mNJCm7lgYAfzB6JoqqIL9KlH26e0I2OI11EYWcR8pr4iX88Y2K9Cic0nsle
         KFkA==
X-Forwarded-Encrypted: i=1; AJvYcCV+emt2aIX8R4C4fMyfopnlBq3J/aVCjHwOosx0FXqvJ84a9B0DZefMAq6J+8oaaYQaudtD+u28nW1F@vger.kernel.org
X-Gm-Message-State: AOJu0YwxzRngGopWQNpYmhnUqdgeQuaiNB5vJhhhZt4oyLTs22NNak7d
	FTTkUdruI8pDZgWWit++X7d73ajjKysPC+WpkHqiaYW3S39JUfe0zFMl+ofuVFwj9qMDsXjvP7T
	yw6cIejIQwze5w3g/yLha8XKEo/j0CcrHy3VR+g==
X-Google-Smtp-Source: AGHT+IFup5zNjSHwkI2S/YAnufS8QBOQVFCx3HRsnuBi4f//6Xe94XR5Vv9t6+VRO3kcnKL+sE8ePevaR0twifCKGDc=
X-Received: by 2002:a05:6512:3c9a:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-534387bbf66mr2083635e87.48.1724429141735; Fri, 23 Aug 2024
 09:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808041355.2766009-1-make24@iscas.ac.cn>
In-Reply-To: <20240808041355.2766009-1-make24@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:05:30 +0200
Message-ID: <CACRpkdavngGcP43APeXuJzn75nt=_0rzj1E3+nk0E1Qr6BVKJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix potential NULL dereference in pcs_get_function()
To: Ma Ke <make24@iscas.ac.cn>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 6:14=E2=80=AFAM Ma Ke <make24@iscas.ac.cn> wrote:

> pinmux_generic_get_function() can return NULL and the pointer 'function'
> was dereferenced without checking against NULL. Add checking of pointer
> 'function' in pcs_get_function().
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 571aec4df5b7 ("pinctrl: single: Use generic pinmux helpers for man=
aging functions")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

