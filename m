Return-Path: <linux-omap+bounces-711-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77467861E1C
	for <lists+linux-omap@lfdr.de>; Fri, 23 Feb 2024 21:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 338A72853F1
	for <lists+linux-omap@lfdr.de>; Fri, 23 Feb 2024 20:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B61493B1;
	Fri, 23 Feb 2024 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEXixc88"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1812CD85
	for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708721238; cv=none; b=uXiQlorFUzCoEKlb20h6NWp+W3D24+A6JNDRaCDAEPGTgCygM8BJ7XIMa3J9bMrQU0nOW38RNEVQX+oj4mB1mxGuMOWRJNwc8RCnwG8gxzHGFZ00oCtynX2VQSIfWiIy2jUSO5NKtjBj74o/vQgDof/KxLOJBA3koZWDdm8qPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708721238; c=relaxed/simple;
	bh=0fFTWm56iJV+ctFkvNgjI3jrYotv/EN8fHjPw2a72gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqaxwolbrC8UEv1IS9ZdcFautPWyncUq/aXPiryvkJQ+dpQ9m29qGdlDN+2D8oSwU84uQh7kh0RfjKsYKNpVgfGIJ4qV7fQzLlaXsCylNZOE0/YVgbXfhO9lwQREzo2uIcq9pkbOKMe9ywEOuJPqN9M0EawYHCTCH0HuiiXO/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEXixc88; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-608cba5507aso5989437b3.2
        for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 12:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708721235; x=1709326035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fFTWm56iJV+ctFkvNgjI3jrYotv/EN8fHjPw2a72gQ=;
        b=GEXixc88q6C2JzskUB/iI/0LKbZQF1Evv0GAtA/EpmdR+NrZsfsXItoNxg9c32H7jI
         O8jPfmygSHvM1DL4MHXRkUXes+uWopyX7PkqCRGnj0/PbH2FUhh3ruoFT0qjowq8+9IC
         4sXqW6S4vUvXIwEM+HfnfJMkUe/Zxi1B9SMS0a/i1D0UznuravKElPQrry/EZ7gLcKtr
         NAe8rFbY5K3I2yEbceVcRn3ozGvWKvain05QgpXaucK9HEbfa39ufF3uJvbZtQ08DDSe
         kSokwecRe22b5Lpig2KPJivj6ES785uKPR0JiaTYQPfyMZikw7WRNqar6QcnyG70Z2c4
         K1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708721235; x=1709326035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fFTWm56iJV+ctFkvNgjI3jrYotv/EN8fHjPw2a72gQ=;
        b=UuPwRf81x0s1LoU8EhB3gTbFbSXwMwxwnEMOs9nHjKzDaR8fWkh17ivPElmpdF+Sqm
         OOjlpGzhLUzeAXZ54WeVkIjQ5Sbku+LpgY/gQTxgeChdAdozH4wtAIPZw9cWxCV5fYho
         B4HmmvgFbmybs4V66XI7QGy4u1+lTjIWOOfBXKgosGRrTLzFu0Ltjxu6pqDWZ6hNTNk8
         gYn1sagjO4Ej9vqUxWfwcuLcfJg/uN9ZDIDgeuq1S/P2eHR8k6BzyzFqUI58L35LOTjO
         3szwednRZ+AIUUK0A7gfSEabQh4aV0+V8mqs3F6c1TZyHp0MTytCAWvnryjL6bB6zkHP
         sBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVUi5IYOIgRbmD835iio8bXYZ9bj3IM+V7cfHDE1qaJ+KKxiQGnEbLLHELRi6wQhQ62iijcUyADsWtylpnwoGQ4ZCebL7t1+sBqg==
X-Gm-Message-State: AOJu0YzPlMoM4lwXxmG2TK4ZCiza6aKwrRX5jInqxqFo7x5lhi7cN5mF
	BN14o3VTikeAQGw7936B/lZHU6h/hIdJUGbKLSyHya8vpHgISRkwki/Gvu4o58Hl62RCQx06oOV
	gVmRRlKyPzfKNRLkdjeiJj5gG4OigRq/9xqJNmw==
X-Google-Smtp-Source: AGHT+IG6Gf+G3ngH2onPvFWemsQPhymAGktJK0IB+myTcQRjau5iLrj+DS0i0ls/ZIdjmlW01Zla/fXqBNKs6+0JvSc=
X-Received: by 2002:a25:a049:0:b0:dcc:7b05:4cbb with SMTP id
 x67-20020a25a049000000b00dcc7b054cbbmr907828ybh.31.1708721235497; Fri, 23 Feb
 2024 12:47:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223181439.1099750-1-aaro.koskinen@iki.fi>
In-Reply-To: <20240223181439.1099750-1-aaro.koskinen@iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Feb 2024 21:47:04 +0100
Message-ID: <CACRpkdaA9WfXJ9KGC+7RNO4iyH-6=qauYHv+uKsjLCYKmnh1OQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix MMC/GPIO regression on Nokia N8x0
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 7:15=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:

> Nokia N8x0 MMC has been pretty much broken starting from v6.3. These
> patches restore the functionality. Tested on N810 with eMMC and external
> miniSD card, and on N800 with SD card in the inner slot.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

100% my fault, I'm sorry I couldn't dry-code any better :(

If it's any consolation, there are now no GPIOs left for me to break
on the Nokia N8xx:s.

Yours,
Linus Walleij

