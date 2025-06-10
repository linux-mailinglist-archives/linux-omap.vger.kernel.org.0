Return-Path: <linux-omap+bounces-3824-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EDDAD45A3
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 00:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6C0171C4E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 22:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39693285412;
	Tue, 10 Jun 2025 22:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBJYrun6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8F926656D
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 22:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593207; cv=none; b=sGI79q89Muna6xm7wO5NXBbYzJXSPmXHBr5FRCjXLP3lZOyp9QdOvqzPUrNAJxNlebwnMvPxfzBZB3eTTOgDyrv9Ui6y6XwxflFZXZYwukggSNXjZI7BD3RVjhojoJrDxMRTyWQ30Tx69B6aL3tW3JNeeFOhfq4VAEbaD2S+RiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593207; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2YUfigKz4HXYrBdvd/I3rz1J2cDp2X5SC1kiN/DK4v4y+dpRq/aO2snm3dx0z7yMzMDyaaTd9jdkQ+/4EXUBAXSN7FBquzd7lAbmrgn7sEh06x0We9NhgVeZq0sKTjKDXyeE7OKnlmnIvtZ74zJ5yhALUioUMQUSawL/2/pQJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBJYrun6; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-552206ac67aso7240032e87.2
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593204; x=1750198004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=JBJYrun6Y8qBLpH9PeR9sxX/5z4fhsjOpHAkFqgY0n2+M6LRu3j4vZiLPDo+BfITjb
         Oa9OiHV6c2aIF8gRcMZtA8BdO0qGfwjvCCnFAPTjF+5ODhsxXVyIWWTQFP/oMQH0bO+y
         BslMRlE/h2JaJl4K0u1Z54N15+GJSs/nex480LPcBIEZtTWNUvMV4H+MDCyGVjXj1O0O
         2JouZ2smwpnISJy3oXIlUy8shjX00CXFA2iiS7ZJzTjsiOe9O5hQF84Y8YCFdVZGn5TW
         iIJA7+dXQwCW35mgrBlQWbGKdJWrQD2QR3uI/Z9S4gxp4O75uxJ68M/6XhNV6iGLN6uU
         cxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593204; x=1750198004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=ti6JQ5WXY9w979wkJXqcMBw/gDJwwnHHETTKj1OMetWQy2KTlIulHinAobCr7PtqfK
         aWZCmwwFWzjdUbFDKOb37jVFm1rn0oPNxm3tyx+ikvm07CTBbMX5O8mT+qpQkUjIq2pX
         Y0+hUEQAkH1Gu83iOSwoYE1E2ex2DsIsY0IZ8wZSonPkabVuDxcdqiO7pgltQasAMnxC
         crbkUSlMBBxuSEd1/a90OON2gppbarKqk6ft7RvQNH3gn3ZSsB4ohQ571u2jTpUohxtb
         +bWJtRXOnFbdP0H5rX0sNOFV+2DcNbQJ6mcuqELkM7ED28rMrkIeN2Qh+JgZuRtPrs2k
         NF6g==
X-Forwarded-Encrypted: i=1; AJvYcCXhGUC4fGcxKcaa1mDjzaAzgNnDaVDPo7xzOLnBqCnlYvzidsgfdbUZPZuwLtcxAwRKy6uxkvccasoR@vger.kernel.org
X-Gm-Message-State: AOJu0YzQhBZuzH7cCiiqLcYHkxpCAqG61nfTGE4J8KljzyMsyWVEyY7I
	r1+Gd66Xet3zDjZ1uCVjy0YgJhVC44CJmaUVHsX3TjZ38yJqhFGW0bxrFPSijUnUPOvqOGuyLaE
	bKg92RKyAPnXOeCE0rPkCYCAoVGRV5wh5mp6MKzsxKw==
X-Gm-Gg: ASbGncvro2tBCEhvkv+FH4tAsy7Tu6uAFCn1uLY8Yn9amwwz+hNf77Ah4Jmid477zTg
	GNcychg97mty9AbyoKTlolB3m7yDZvZ9Kznssn60wqlKx5OcfT2AX0ctQ/Cnvqz8ad9lF38m/Nc
	yRLIQTyRBafet3uoJCFmP9kcMttVZW8IfnMHqIyjdrhuk=
X-Google-Smtp-Source: AGHT+IGlqZqOxo94Fq1AxRXbuSE8IQ4NwQa1mjzmaOgaM7Du8n0a08UJH2Mj9vvFcKeYpn253k3S/NXDYuSRYxggVL8=
X-Received: by 2002:ac2:4c4f:0:b0:553:659c:53fa with SMTP id
 2adb3069b0e04-5539d4be3f5mr111095e87.5.1749593203962; Tue, 10 Jun 2025
 15:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:06:32 +0200
X-Gm-Features: AX0GCFsQuNMrR1lnqoFxpoWnn4BCOjfc6g0nU8IoyS3i9wf_s_1MzLLDkyq5jQE
Message-ID: <CACRpkdb8GBwtOGQYrVkxiv8ZCjEE6pkQ_kSEutY2jYG0bUbFVg@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter callbacks
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

