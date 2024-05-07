Return-Path: <linux-omap+bounces-1353-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC98BDF51
	for <lists+linux-omap@lfdr.de>; Tue,  7 May 2024 12:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52EF628168F
	for <lists+linux-omap@lfdr.de>; Tue,  7 May 2024 10:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3260E14EC44;
	Tue,  7 May 2024 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClqbICPf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C214E2E0
	for <linux-omap@vger.kernel.org>; Tue,  7 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076243; cv=none; b=l76yNmYpm1wTYlZC6Cz82jkvupNCrcTvn+SzyEaSUMclgEI7Sglq+fvhi0VPdVVjf6FvjT2n6M20iEiREmEd6KaAM9uhngim4gINDgfs8Cwljk2lkrhj+xdb+aXvI8FP505iOzMzo+frIoVapHdH97MumKWTSV9icp70xm0qZWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076243; c=relaxed/simple;
	bh=jnbmoIfEkquEEjiJBAjqdCDBxOD1+Yzt7A7OKiFlJfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCxuI2g47OS37rHBSUJnGSBTHNBY7/K3wtGmT8M1K5IBaU2Zn8u3eGJY50Mswbsofd575z5hzpeSRDfGlPkNuriTCxR3M6cB89apbN8sn1L9Ufqbjd0fyTdkTA1ewwCCDeLxInyIc5ZlQpAnWb2/e/TFhsqz2nJ3kMRwEreNMmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClqbICPf; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61ae4743d36so30681847b3.2
        for <linux-omap@vger.kernel.org>; Tue, 07 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076241; x=1715681041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=ClqbICPfGWs4b3Kil8wr9qUk9sNcSadQx7MKrglRxSUZNtKHMoGjJUbwrtS+2iOZJY
         eadxodiGOSOVLNQMyvANf317P6IFUtwTyUHhLOt7M7tvuVa/fwz9wN/+erbwFLXG2g2y
         1oH8B115XICgrEKBcpZvfl1GSSwX37sXhcPF1RBF2im4pDZLcSScd1kn3Gou6n+G+CNJ
         MDSKhUcbfeueiOci2vFZoYnyvQC5mgekuBzf5piN9ZJrWOwhVArEPla0MNH3XSuSPEQN
         u87VP4F0SjIDS3IEoI6MmIpP0Ep7GIo0z+K7dW7iDrf4EWBDrubFEtAe81yZDOMJhAG1
         LZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076241; x=1715681041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=bIV0zyPvVrEkEk6F4KN8i7Q7aDjGVG0IbomaQvjA24kbUgv3Ym0OhDj2ZJCznkI+3K
         LrJKhGauSNegb6FrpD4etQBE/u47YXYk5ETeXzHhvs6Gx55UIx08PH2QjbDvCCyfMRhr
         ySHaPQJJR0pF5H3XXmATXMtZkSvudBVBX0VRQKzLIC133/ZJ+nQUxG/3Spx70OeD5jZi
         CdIYTxBRfzhDaxDaieZ1Bw6lU7G3Tlo0oWxj/218YwidGD15BpIOMxGxKJcsX4/ZTzFH
         DPXYfFTcDI6NJVx5qq7Oh3i1X3e5IlQAXNqR4fklSptznnBjqbE37gMdRKD9EF75aN0w
         xR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHTfhpYhch50uxSpSXZEuHZMIEx3ksQz5hZAZroQqawdKxf5X+KtGZbLEEUlm6z/4KFF4gFajTGggUhIrk8SvNdtBH79z2sJMQkQ==
X-Gm-Message-State: AOJu0Yy8MQsuS5/wFubahdfgDMWLIs4m4bM1RYviJKeLUJFfFVpO89aw
	FI3w/5yfta5YAo2ltZCNdFYG0Mp0nhq2E0ZmJesoF0+ArSqz+1tdFyKOrwBu3ozptlRfLoZ3kgb
	8/yIDeWc+1BVrtIanLvXblJKf4dK1NT6N1g3cqg==
X-Google-Smtp-Source: AGHT+IE6RbboWA6zivUgxElWhiInYBOoZKZxCooBjJtVLVKzpcY065ewr27Om73FjNB7+c1CsbFfoFINBaR1I1fIna4=
X-Received: by 2002:a5b:912:0:b0:de6:3c4:c3a with SMTP id a18-20020a5b0912000000b00de603c40c3amr12223334ybq.10.1715076241415;
 Tue, 07 May 2024 03:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:03:50 +0200
Message-ID: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In v4:
> - added tag (Mani)
> - fixed a polarity bug in iMX.6 driver (Linus)

Looks good now. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Perhaps the use of  _raw accessors could be avoided in 5/5 by some
elaborart polarity quirk but I'm no perfectionist and it can be fixed later=
.

Yours,
Linus Walleij

