Return-Path: <linux-omap+bounces-105-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E8802F5C
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 10:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D43C280EEA
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 09:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163F91EA77;
	Mon,  4 Dec 2023 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mEFGIH+K"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABB6100
	for <linux-omap@vger.kernel.org>; Mon,  4 Dec 2023 01:53:53 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d7692542beso15247737b3.3
        for <linux-omap@vger.kernel.org>; Mon, 04 Dec 2023 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683633; x=1702288433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzMOxxlEg/QFrxypJgdxPuDbMTB8FVdAxHNtSJTBldI=;
        b=mEFGIH+KDTI6iObuF+GOXSisfw/zDOYMXVyhB9vU5TLA6qaJGeswbnIzzzFBvRDlLz
         fwjJzwYNo+yJTb6fCr99Bd1BbHEH0IbOw1zuScpBkaIdy2CxgdtUhEbB01BXz+JnjwC6
         kyl+X+MWyI5DWvwRIxTsPJQna7iN+fmqvpI1NXI0oF5ybAlVUS6vZXM/7UtaceLJkhau
         N15XaLB5y3pH25BVKUjNZ3bAAxdqUU0D8sH81VyC4VYm6Jpcukg/htxCd6BoQjFLVEa+
         kuXhn5kwp33EWg9lEMX2VRfAf8UuOxYkCp754UQr4bRSnnfCqOk6xoVLHsllFnHm5297
         BMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683633; x=1702288433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzMOxxlEg/QFrxypJgdxPuDbMTB8FVdAxHNtSJTBldI=;
        b=BQDc9gjdANvSc6jzRxUnIhWcr+vQz5gvLpqpw8+Wh9k3Azy/eHRYlLmaqjeo1dCIxk
         TxqLibTpqC4D4+/dhl37XKNRAa/1/dO6BKsTNCJK8MI/oQw2HxT4tjjzVtm+B1ri3Api
         MJtOlXVmAHjoFHBn4GG1rPrlLT/Zt5V9exvuL7UfallxOWbiHpNPkJuPPHicLSOUDYmI
         SHpcUIKljgjTONz7bvkegfE/AL9Sdx9Nydpuepi/8fTN3io1Ur8YCzLPYc6qw9brqybi
         wYUhQWXbMt0m0Qo9MlUrxlbDk2QVeet6rbK7OU6sPbK563flRa/5LYHBGLABl1QYz8gZ
         Js7Q==
X-Gm-Message-State: AOJu0YxnG++PFSiM2VEmfwmrykzsFYyEHpKLJJ9ut8gZRx4f5+FcYtK7
	D00V1sBIK1lDO+pdWdJLXo76CH7KZl/WObqu/iH9ActjolhMJeiH
X-Google-Smtp-Source: AGHT+IEf2tKDzcON3NlEWW9zl7T+Ip9DEjCMzaO4XQ9afDuuBb8LKUN0p5LBxWpJxwqrynnEIc94uFQW0MlXOdgNJv4=
X-Received: by 2002:a81:b702:0:b0:5d4:7f5:cdaa with SMTP id
 v2-20020a81b702000000b005d407f5cdaamr6258004ywh.33.1701683632891; Mon, 04 Dec
 2023 01:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com> <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-3-704e7dc24460@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:53:41 +0100
Message-ID: <CACRpkdYndEUkC7j133LVsrFXgpujwimvxGPYfDeVTRZAWsQprQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j7200: use ti,j7200-padconf compatible
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 4:35=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> For suspend to ram on j7200, use ti,j7200-padconf compatible to save and
> restore pinctrl contexts.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

