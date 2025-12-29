Return-Path: <linux-omap+bounces-5280-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A819FCE71E0
	for <lists+linux-omap@lfdr.de>; Mon, 29 Dec 2025 15:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 652D43019BAF
	for <lists+linux-omap@lfdr.de>; Mon, 29 Dec 2025 14:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12CB329E40;
	Mon, 29 Dec 2025 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZK/XVsC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43FE329393
	for <linux-omap@vger.kernel.org>; Mon, 29 Dec 2025 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019633; cv=none; b=ToIOWed5Ia/XtLMX451riX1V4NKEfni5Z8BvH/Z9z1PmYpEVMzenuz8lUm86XrQT+//4zwXRfYmWJXeeMvMzduRkE5LpWciNJlbciOyyBd/ALIazjmtUda+ZJMDff8lGlRhjeyDP+U4ygo8dJdUmW/JrBgOEs3SqnUdnqVu8d/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019633; c=relaxed/simple;
	bh=0fdYin/a1kGKTO0aBJq/0xsRm45K7iupOY7iUNqRRJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FeT2YWYc6RvvJyGVlHUl5Iahk+7WdqXRsyFYJnHIiot7EzYaF0nGrzTbJhL80D8NPCW1PvTNaMY1Ux0aIrKKk/CJjtspoMP3o+wcJuchAG1eXe49obWCczto9siAZVj5Dk+T30Oc2sIVZSA7Iv5Q37IBneaBUVeZQUC3Kqsxip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZK/XVsC; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6467c5acb7dso4858760d50.1
        for <linux-omap@vger.kernel.org>; Mon, 29 Dec 2025 06:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767019629; x=1767624429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hiFIGGOCel6e4RtTn/5DW6H0+gmbweG5rl/mIaIEv30=;
        b=gZK/XVsCELIw+kf+fegZRFaWFH8spENIhMsxFJA+BlEMdUeN7lmgs9xjk+xjOMu8r9
         LuMgJ12OEOjhLQCbXsljPAEAL95CE9jsH0C59xbNv5GR4wyoZrx+saA1yhMQgr+mA5SM
         ECNv+N6QlgdCRCP52QCHyZIi3QpkwWubtYi2JnIreHqCTEWYa3Mz8fHipWe+jojkeeqO
         t98ky7n+6/H/F17HzZsX5AwyKI63KX2fiCenajVFCiVpQIHnt5Kyq06SXY+gr+vH0OAK
         srIthZ7RGMnHpSLjAWxQALybXyadnZ63Iej55QQm3efWV8MyC1877OC2VyC6YRi6oEB/
         7K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019629; x=1767624429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiFIGGOCel6e4RtTn/5DW6H0+gmbweG5rl/mIaIEv30=;
        b=riUB0qCWAM7Z/5DSZY3okQ090W4m/cFbrUQqdbnRrrTC4gQBhSJjoCzPtf74R5LOpP
         1M3yMQkgrrhGpHjCGg4tICjjaL3eNVMy9b1q7g8oXWRa4+tR0fv3clsjr86E6FMzEr08
         XjsWjdiU0ky6LG5Tu4OdzWZh6ciBR4K1CHugzF2rCOjIAMtGaQ1Ppem7IHWRdVs2pk9y
         Vtyys3nOJweqLnFEocVZQjQJB17heVSdkaGVmUizaBEJ6hx4lMoEbW5l4OyctgClFR9x
         rs0FKA2JxYDukCyZhGdzyXs+6xwrUzeI+qANE3J66OOEzqswVYtRUtKtjoUxdyhjrauy
         9lOg==
X-Forwarded-Encrypted: i=1; AJvYcCV/D476ok5Ek10zoWxgoA13zJWLAbtD5EZPR5+hArxSkt64L3wFVX8xSP3rh7vw9RyEa8ZlXmSmfgKW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywce5Ff9PLrcJl76ciH/lGvrzGE21r2qCmR6/a+f8cgXvn+ffyv
	yE5G/0rd6UKnRGeiZ9PrbK1DlUGOBQxkFmz1s1uoNVEwE1cHrDxuw+AfMpLv6I1Abau9MBoi2ue
	rVLz8khPAcly5uBl/ydvE5kKdNxQ5fmnLMv7S6r9aoQ==
X-Gm-Gg: AY/fxX4S8zdz72kqMvv0qJQoP1rqXXfJvwsruNsFTHkh1Fjs6mhUWWEAIfTxF78d43K
	lOUE6/cTsiNxyt8WY3kOApFs7Gqi2mriXb+MkIR5QzI1P3SQ2+cgoC6jqdSaSWo6A9/DTHhkmtL
	sK6VYcmRM+UINH7o+bfC2VqPukcWn0R8ldnjWzUfY1jlndvYZW258+lmEeHXQlUaODFqch9D7s2
	3S8Wrn/AYtQ0PcdxWm7tNWeDWDqgwJHd9NwbD/jM4kbGK8pi3hc9mKyTd/wSORWmpl1fX1X
X-Google-Smtp-Source: AGHT+IGO4whynDnDczZe5aUSFNc6rZ7ClmyTEypWHVE9Jxyg/qzrfMWaETUGVpcInjLrsVhW/aWOBEshOk4ENImI9iE=
X-Received: by 2002:a05:690e:1881:b0:646:7a21:f05c with SMTP id
 956f58d0204a3-6467a21f232mr21185393d50.50.1767019629379; Mon, 29 Dec 2025
 06:47:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com> <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
 <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com> <CAPDyKFo2jsV02qSDBSZTewJjV09AMO8iETU5Uxqz+GBnd0JY6g@mail.gmail.com>
 <e8b0579d-21b9-4072-857b-5afab92c42e6@solid-run.com>
In-Reply-To: <e8b0579d-21b9-4072-857b-5afab92c42e6@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 15:46:32 +0100
X-Gm-Features: AQt7F2qjavw22v0M0v4JRnBk0tlNXPSxJSyNw5ogCiPk3Bm42fj5er9DVY64ELg
Message-ID: <CAPDyKFqN1Yq0atE6YaeigzR75n1Q1BSU8JjLno=ioUBwN8=FSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Dec 2025 at 12:30, Josua Mayer <josua@solid-run.com> wrote:
>
> Am 22.12.25 um 15:47 schrieb Ulf Hansson:
> > On Sun, 21 Dec 2025 at 11:38, Josua Mayer <josua@solid-run.com> wrote:
> >> Hi Ulf,
> >>
> >> Am 17.12.25 um 14:38 schrieb Ulf Hansson:
> >>> On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> >> cut
> >>
> >>>>  /*
> >>>>   * Using subsys_initcall instead of module_init here to try to ensure - for
> >>>>   * the non-modular case - that the subsystem is initialized when mux consumers
> >>>> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> >>>> index 2e25c838f8312..a5da2e33a45c0 100644
> >>>> --- a/include/linux/mux/consumer.h
> >>>> +++ b/include/linux/mux/consumer.h
> >>>> @@ -60,5 +60,9 @@ struct mux_control *devm_mux_control_get(struct device *dev,
> >>>>                                          const char *mux_name);
> >>>>  struct mux_state *devm_mux_state_get(struct device *dev,
> >>>>                                      const char *mux_name);
> >>>> +struct mux_state *devm_mux_state_get_optional(struct device *dev,
> >>>> +                                             const char *mux_name);
> >>>> +struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
> >>>> +                                                      const char *mux_name);
> >>> Seems like we need stub-functions of these too. Otherwise
> >>> subsystems/drivers need to have a "depends on MULTIPLEXER" in their
> >>> Kconfigs.
> >> Currently the drivers that can use a mux select MULTIPLEXER in Kconfig.
> > Yes, but that's not generally how we do this. The driver may not need
> > MULTIPLEXER for all platforms that driver is being used on.
> >
> >> There already exist a few mux helpers both for mux-state and for mux-control,
> >> and they might all need stubs.
> > Correct. I think we should add subs for all of them.
> >
> >> I'd prefer the restructuring of kconfig dependencies being independent from
> >> adding mux-state functionality to renesas sdhi driver.
> > I understand your point, but adding the stubs isn't really a big thing
> > - unless someone has some good arguments not to!?
> >
> > Moreover, since the series changes the mux-core anyways - and
> > subsequent changes depend on it, I don't see an issue to fold in yet
> > another patch to add the stubs.
> Would this also cause changing all the Kconfig "select MULTIPLEXER"?
> If it is only the stubs - sure.
>
> And then in the renesas sdhi patch I can drop my change to kconfig.

Correct!

Typically, it's better to do a "select MULTIPLEXER" in the platform's
Kconfig for those platforms that really need it.

Kind regards
Uffe

