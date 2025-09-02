Return-Path: <linux-omap+bounces-4488-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD9B40C4D
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 19:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 336767A808D
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 17:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084FC2DA751;
	Tue,  2 Sep 2025 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="052kC5kU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DEC341ACA
	for <linux-omap@vger.kernel.org>; Tue,  2 Sep 2025 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834921; cv=none; b=b+Us3S2JUKSpDcjkfseRfBuEGrHULgW1bhcKhKKhb6FkgaehDyHDKorxotqIQiDTDgH9yOgEP+bycjTkjS+eoKF2c9BAA1nUcNIvJl3ZRfG0UN4YuYL6W4jpj8GaRDbek6NRbpJGS2nqchaHBRhwZMIc9Hg0TmqxJDMqwQiJV0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834921; c=relaxed/simple;
	bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWz0qFDReJk4O6kvHn2VlwkaqVYV0eImEPGOMlo1FRVQp+evFbUM1WEfnoj8fzQ19NzL43C6b9A9/8IlXrMDiYXszt5Ci3xJKvog4IeIGpeiWhshhirGWUODv8iFPkf02MHaujJ47UXo2bitJ9JH2tT/NsgiMeSpo4yqlCufzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=052kC5kU; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso2560168e87.2
        for <linux-omap@vger.kernel.org>; Tue, 02 Sep 2025 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756834918; x=1757439718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=052kC5kUrN2lLVVfPRcbxYKEvakX+9A7x5MhmKE0Sz4C2+uxx/jOoim6DZIaHQKMPa
         GDhtrl9dcFVs2lFsgyiQjtkd4kWLa+6WSAuYDQsio8916UO4NufV8PSWtwEJ51+Hdnbj
         3JhkLhMfCXXgxHB4oInFKhJrj++PmB4AV+7DG4z5K1gPaMP8fY80gfK9nfh9cXGU+AVt
         KKEEkuMiGE9OJpwCucHwtfwNRXTKx+ajjAoS8K2zzgar0WltDFY2AwoTvVg+9UFNzy7w
         HawcpobEx2ZR9nvorl9w92hMY5uxtwzxDeb+Omby/7oUXO5VS5pnht7wpxzaJFTDjeVG
         vT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834918; x=1757439718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY/P1wmmQ5CXIAhE0M3q1QG3EUDBLGeGAVW5/TOHSa0=;
        b=DvR33bcXtpO3IW0KVTOOVmYk3CeVRzp0ZLSAbs7dvPliTAe5aaMy+90rxpeXuFmaa8
         04PqInoOWwyqvSc2z2gZqtv/O7o/YWQEENhe/cwU5EyQnj7CHUMSz+jj1zdCC3sr+4cw
         L7p66XDQ0e7Gzj7punzfQOuXiSD2pcFYEqeCxiJXRv3xiOMY2Oe0jMIL/DQ/xYeI0VxN
         Cm+QIcxxbVQFzQI6MmCHLIzGi2KWCQh27K2FUCuUabu0DJ+CO6CygHRaqtIguVen2kkg
         fpKFsZ3hI9VWJVgtiRndlrj1+CeUxAij7AGlmQC+PLVKfLYo9JrZhLjNucRBEosBOEmU
         E1sw==
X-Forwarded-Encrypted: i=1; AJvYcCWi1VjN0u4zJs340PLsoYWsantG1Hct4vu5zN2ND0LMz7yb1LJFjykawe+UlDIlpFKIUiGL54gWl3tN@vger.kernel.org
X-Gm-Message-State: AOJu0YxIqWVrt+KYlCAsTVu1yd/xqk/2dbZvaPJuTBnOEz1hyTKGnLT7
	5jGnKHkLUp0HlabPwLHD49vCwjLnyEpoprFa5jPxwjIoOWjCFCYYZbQYAWxmbrQItK/5bXO74ru
	aXJS3BBNGVDZEAt0ed6Q6N9LKG+LyYJ3BPsAdYn26QQ==
X-Gm-Gg: ASbGncs1Yzu32ryEvEeysBOn1w2G7hcZPAxvhmhrGzAISIn29B7oCozrTiSEymxSBBE
	RfshOdSFJlfbk+g3rh2ZD3IciV2p5Mr2ShsRWfMdswU70t2lmstgzhD+JMBrRD6y0+JMY3UcDhN
	XBVAHZhvOp/pbmgkOWhRP/CPC9pNV5JZsA/LIfhPJTERRPBFUxYJE8MHku2SfLN2icPtEJDxFIa
	Yf7WdYxQYs8+XagmVs6tEAlU9AcVQ1ZDatxPM88gdHkX77jRg==
X-Google-Smtp-Source: AGHT+IEj8d7P3cFn9WHSMlcQJco2rutroHWRWEZV/BsdBzW10JlelDxpX/d5bcqoiRzS4+dxD5+bg22V2Ltijnn3kOg=
X-Received: by 2002:a05:6512:61d5:20b0:55f:727d:408c with SMTP id
 2adb3069b0e04-55f727d46c3mr3142298e87.50.1756834918139; Tue, 02 Sep 2025
 10:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org> <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
In-Reply-To: <aLcBcjvMbrxoDYoC@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:41:47 +0200
X-Gm-Features: Ac12FXz-Ict8QGMZawDnah9byaE6SYSj17yQF92en6o4smsRWpZmv8sya_ULoRc
Message-ID: <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The strict flag in struct pinmux_ops disallows the usage of the same pi=
n
> > as a GPIO and for another function. Without it, a rouge user-space
> > process with enough privileges (or even a buggy driver) can request a
> > used pin as GPIO and drive it, potentially confusing devices or even
> > crashing the system. Set it globally for all pinctrl-msm users.
>
> How does this keep (or allow) I=E6=B6=8E generic recovery mechanism to wo=
rk?
>

What even is the "generic recovery mechanism"? That's the first time
I'm hearing this name.

Bartosz

