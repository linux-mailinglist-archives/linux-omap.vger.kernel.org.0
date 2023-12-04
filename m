Return-Path: <linux-omap+bounces-104-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214F802F58
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 10:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52D561C20A60
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 09:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B781D55E;
	Mon,  4 Dec 2023 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z1ihlZp5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C0EC4
	for <linux-omap@vger.kernel.org>; Mon,  4 Dec 2023 01:53:16 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d226f51f71so46577017b3.3
        for <linux-omap@vger.kernel.org>; Mon, 04 Dec 2023 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683595; x=1702288395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4N5YX1BKV8oox5fEfVsppXE4Fy2jzNA7d1t/N82c1Q=;
        b=Z1ihlZp5OvACtHh8wDM8HVv9cYHgGpVvf6XuwF/q1xhvV3BuS5YPMfHQnyiYd/WR49
         YSv4lnUiHpL+ELL6YxhotvcpuHrUFm0VCRJc28m5EpLM1Lo9NH7UBOmiaoBkuHstMi0n
         tNJdaZIZxjmvlUUA8HIdNTScCS59ruHrdze4WNXHCUAkuAHm/3Kj3f/e9BoTcSgBSTMi
         V7Bn11D5fI+sxqeUyRvq3KrXk2Wjfeb78tazkOp3CpwrAmcEkED+7ziK6SN57BszxQrr
         AO9JtIBXhy5u4eA3vnkRLu3xzC16lXXws//SNG98yv+L7pThx6HjOCUS1JNk5exGiK8P
         hSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683595; x=1702288395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4N5YX1BKV8oox5fEfVsppXE4Fy2jzNA7d1t/N82c1Q=;
        b=T40dOgMyIKxiBtKBEJxWAzXElNhgbH5Dq1KypfMt0+t62oq3bGJPdOJu6+6JtGcm9T
         EzozLtFTOLWNpyXLw63vfXFz/aOikG5RReNvSSSfkJym5Z+xlRVZA795mFY4qVoKny3p
         x2fAc/XWvhFLuP74HNcG7f+7Ivz5yZduR5vavXHE0EkeUgZtdprJN7dX8abink34DUcp
         m3S5UmN606fymQteocrH+nfz8SQU/3LrgdK7elxric9jL0qg7E9gVw1g3vo2ZCa0h35g
         l8UdS+7j/xBefVrsFPk4gbpAJREF/scyfpOpev04nvXlaaNNd9m1UzuuHY6hgy3Z5J/Q
         9VEA==
X-Gm-Message-State: AOJu0YydQEVnIbT6ruesxv9u9atvf8nkI2ygpI2oGiHd6Scf9P+n99lm
	oEQkmyZQTIeXS/IYwvcR8O976/AJ5XnjtbdQ5YbXKA==
X-Google-Smtp-Source: AGHT+IHcnTMe/JadPl1Hll5euXLI4XbibjJDI0jfVQz3qrgnV13paxopm65SeTqFDG1zbpo/IAuRT5PYQjZPVvBBMpw=
X-Received: by 2002:a81:ae05:0:b0:5d4:1fe1:312d with SMTP id
 m5-20020a81ae05000000b005d41fe1312dmr5265235ywh.17.1701683595605; Mon, 04 Dec
 2023 01:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:53:04 +0100
Message-ID: <CACRpkdbsOxxemqe023jsE8vCxgY763CAZJ-Ru9dLTr=5-wqzBA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: pinctrl-single: fix suspend/resume on j7200
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

> Thomas Richard (3):
>       dt-bindings: pinctrl: pinctrl-single: add ti,j7200-padconf compatib=
le
>       pinctrl: pinctrl-single: add ti,j7200-padconf compatible

Patch 1 & 2 applied to the pin control tree, thanks!

>       arm64: dts: ti: k3-j7200: use ti,j7200-padconf compatible

Please funnel this through the SoC tree.

Yours,
Linus Walleij

