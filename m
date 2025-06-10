Return-Path: <linux-omap+bounces-3822-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B9AD4498
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 23:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B352A189CC7E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 21:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611EA28313E;
	Tue, 10 Jun 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KcuNSzi6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174A2820B1
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590199; cv=none; b=qa9cGdpBr/Cc/mmPP/pkTzAVp/ESfV9JRYKDnn3Nj99z43sgw0hSQvz4zEOgn8MbQOHAtBZpuI8W2jQ/+n9j0R1yBPLQYkpFyxDoI7Wox4Zhp15jRFgH/oAb+b2t0KyKr9+ZXp+xvKuLKhP47iYcWlfCvONxRUqV23UcdylIJ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590199; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBCI4lS7ICL/WmOyCXnoIMxvZPYYP96DMl/4vcyhCeEEu+I3G86NJmB0vHN8YM2JgvjN+ef02c0U9yFV3dE8v3WhH8th9nNXv/B6GW/aeLb9IbgzzVFhbW6ebmRRlrwIs1CGqFwQe18mUtkNEWS2BxcGbKXrnvSIFDtr0/1BBsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KcuNSzi6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32a9e5b6395so55531841fa.0
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590195; x=1750194995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=KcuNSzi69ZpOD8lZJ2yIzQp234bfXMoUtF3ot9GhBj4YEsJPC3CB496eGqhb5qOAPk
         +5mq3WO5eQCzubFwtTPTO3JBxEhQ/z7oe+idkT3KkLUPrB+5PuufICXMVl2qugjLTADD
         hvReDhMGy6Cw+6P+JuETfN5+RHUFpbCUVMSTPAc7avuGu8b8A4VQ8Wry9Lhre2oE1yf2
         qJKeoyryLFA40MHZ9epKWId8zSPQsUGwpUC2ZV0cuegLRnpu3GhW176Wp7yMS1Kc/tm0
         jvLtEZ4IfSOD8lGUsKZeFqDzs3mp8I+t7dZy9GoHxShmg7U1iCsiTneVNZndN0vSxVOd
         0pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590195; x=1750194995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=vLqccIiTZr1mr88Q+ikqH7DHQ7JZS0GajpPlpq0OQU+ldSNRvm+sD39ROHrtcLj6ks
         ZBKspEDlqLv7/7FtzwvTGql9mG912KPWXns3Aen2lX89D+V3t7lHHAwurUcACUuagU9O
         7akfgyR8wXU2ptz3qusWKHcfcingPFSj0dNO1xefTOQC6krPoC5KEWK8yVHpErhbpo6y
         crzcX6gjV46RsnEIQcdxkN75iOW9qObuzlR3bGRiE22uPcgtVmBzxHUrdBmC9h7HP7Q7
         9H7/z9KMTQxrJelYk8egMKZr66oZG392cxV2XxUTK2dBzo9TPk8Va+twR9BrT/lbri8k
         dK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr3xD+eU/IFG4pZ+lZ8ZDsTsMztaOADxbUQIQ2vhjFTtb283gWOtuLOkYEV/y1lgBz42XB5AkCcOBG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9DFmNdDoHdYO3XVBmw/kfeyF8Q45NliwCGAw7+LR+3sxu/qRT
	dlY4YUoXRz914KrofLMNdYKpK0hEscYY7TRGK2m6L3ezeyzNliMGEeVGWblUJCTkFkGJwilP69N
	rI37nvhUtpX5G/LwOuJNihSYCdvM9triCAMZZLJ4wvQ==
X-Gm-Gg: ASbGnctlsRRbF9QK2HzzH/DYviJntD5ho16rpOE4wmrq+qvVjrxvMDdc0vSMFS+3G14
	sc11bPhV2tqlxMvjw8nRE/p6KZrYwUpDA+68uys4jl0R75YLrq3QwI6s9HyyEDctn27fwXdpw+o
	RDTuyDCyt7mkT2XQEuOaJOICeYS9GJNVmoXr6/wD9fk8w=
X-Google-Smtp-Source: AGHT+IFjB38ga64es1q/x9Xln0eJ4c1gLnvGRBRN0i0PTR13a813fBLuiycDGURGtRbChXkECB+ZBVHqj34ThqQMqbk=
X-Received: by 2002:a05:651c:1a0a:b0:32a:6aa0:217c with SMTP id
 38308e7fff4ca-32b21e99d3bmr1744231fa.34.1749590194721; Tue, 10 Jun 2025
 14:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 23:16:23 +0200
X-Gm-Features: AX0GCFuXsSEbKJPPrZYl0t_vGXohg5ZS4zY2cQAKwzq1fVBy4N3FSGLwpMM1OkY
Message-ID: <CACRpkdYrnmi2a8iL0tA7zNDfhMRN3F-NEfTntxXgC54t-LZA4w@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

