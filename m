Return-Path: <linux-omap+bounces-214-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B057F8219B5
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 11:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A592D1C217C6
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 10:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03280D2EA;
	Tue,  2 Jan 2024 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlbPXPUx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D50D285;
	Tue,  2 Jan 2024 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55590da560dso3725364a12.0;
        Tue, 02 Jan 2024 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704191375; x=1704796175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFPe9D0y3N44X6lYNDVVER2vuR/CtkvdNpqm9Z/uUds=;
        b=YlbPXPUxCAd7+gRVGMAXr+Y+dHJ5i8TC89VNFG2Gs6jiW6F2Q9wG3aH6VBZZMSZU6n
         bgBefrY6W8BGpl4TCH438jTaUx3Dtf8LQUNW00owNvASlWXM9b2DUXppVgdZoDowzhI5
         KOTCZYSh/zWGkiF9JtnLHDVMFMsuL3MSCeAMB9Ot7cLduYkg9tBzxjnEnPph+LXcAMLH
         qkr9WOMV1uMscpBaQgy7G1A9kSlE5+8voK+U87vZdbbwj1fKGcEn1fezR/osc6W18yfr
         ids2H5FOPus8RjczsGRgPVkl/8/f8Y+aBiK1V0luYdx1AkyxOmGI7W5oH7Dt5DTotlu+
         P4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191375; x=1704796175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFPe9D0y3N44X6lYNDVVER2vuR/CtkvdNpqm9Z/uUds=;
        b=cjISXiDPVNe6sdSeKlhCCmw+qpqoR5BfdM9FFFYKto91qKdbKPzIAyMCyO4k5w92Js
         hG9aXg/rJuV875VEVd4TywjBrrivFlWsLD860GMXyELmJgnDNrFRmbaVaohnxf/yaekk
         8DyyaNg27Utu868VI42tU+NwwlkslDHjj05ivKO0L4YAkKdQ88cnclfGNZaVU8/vhQF9
         Np67xPUl2RKYw1sE1euwbZjdoB3a7nKEqig6bh5BsvvmvbLIBxIWwRJJpqgFQ9ZdyE+p
         +bSORqjbxaDOSKk+jpamH9RKvfrQqaqKMcRMhfXVY3FcErpADsT+I1cCG4VehZwKoZ6W
         Hc1Q==
X-Gm-Message-State: AOJu0Yy4M5nWV6PUTKFklAc+0Mcv8nAepFC0ktxJeiCzoJrHndQ4Thb7
	Tvo7RySyBhmTa9gmlch9VKyM9OWQ4bR2+wgxciA=
X-Google-Smtp-Source: AGHT+IHlGEClh4mlgzqVZYchEiPuyBzKwKQ3rG0kyEeJi/RZJsGUkJ+PJ4sZZ+WIa3zX9WzKBUA+Ui7lvM1O576hUJY=
X-Received: by 2002:aa7:dd19:0:b0:556:8ef1:a173 with SMTP id
 i25-20020aa7dd19000000b005568ef1a173mr551026edv.78.1704191375172; Tue, 02 Jan
 2024 02:29:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220135950.433588-1-pbrobinson@gmail.com> <0fe97709-6b6c-4c66-82a1-ecf58dde5b3f@intel.com>
 <CALeDE9Ndke9YTCeiJJWBtHAbrShEEr1bv67Cwu1LWJAXs6Ad2A@mail.gmail.com> <cb726c1c-4ce3-454e-b8cb-fd14d18b8359@intel.com>
In-Reply-To: <cb726c1c-4ce3-454e-b8cb-fd14d18b8359@intel.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 2 Jan 2024 10:29:24 +0000
Message-ID: <CALeDE9OECYC2Brx1Hzfy6X6sKUaokFBJdvxSYhYaOGB9CnhBUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci_am654: Fix TI SoC dependencies
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Faiz Abbas <faiz_abbas@ti.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Tony Lindgren <tony@atomide.com>, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 10:22=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 2/01/24 12:10, Peter Robinson wrote:
> > On Tue, Jan 2, 2024 at 10:06=E2=80=AFAM Adrian Hunter <adrian.hunter@in=
tel.com> wrote:
> >>
> >> On 20/12/23 15:59, Peter Robinson wrote:
> >>> The sdhci_am654 is specific to recent TI SoCs, update the
> >>> dependencies for those SoCs and compile testing. While we're
> >>> at it update the text to reflect the wider range of
> >>> supported TI SoCS the driver now supports.
> >>>
> >>> Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654=
 SDHCI driver")
> >>
> >> Is this really a fix?  Seems like a minor improvement.
> >> Same question for patch 2/2.
> >
> > It is for distro kernels at least :)
>
> Distros ship thousands of modules.  I am not sure one more or
> less makes any difference?

I added the fixes because that's what a lot of other similar patches
do, see 4920bded3e and 1f223208e in CAN drivers I was looking at
recently, if you want to drop the fixes tag I don't mind but I was
mostly just following what numerous other similar patches do :)

> >
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>
> >> It would be good to get an Ack from a TI person.
> >> Same for patch 2/2.
> >>
> >>> ---
> >>>  drivers/mmc/host/Kconfig | 5 +++--
> >>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> >>> index 58bd5fe4cd25..24ce5576b61a 100644
> >>> --- a/drivers/mmc/host/Kconfig
> >>> +++ b/drivers/mmc/host/Kconfig
> >>> @@ -1041,14 +1041,15 @@ config MMC_SDHCI_OMAP
> >>>
> >>>  config MMC_SDHCI_AM654
> >>>       tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
> >>> +     depends on ARCH_K3 || COMPILE_TEST
> >>>       depends on MMC_SDHCI_PLTFM && OF
> >>>       select MMC_SDHCI_IO_ACCESSORS
> >>>       select MMC_CQHCI
> >>>       select REGMAP_MMIO
> >>>       help
> >>>         This selects the Secure Digital Host Controller Interface (SD=
HCI)
> >>> -       support present in TI's AM654 SOCs. The controller supports
> >>> -       SD/MMC/SDIO devices.
> >>> +       support present in TI's AM65x/AM64x/AM62x/J721E SOCs. The con=
troller
> >>> +       supports SD/MMC/SDIO devices.
> >>>
> >>>         If you have a controller with this interface, say Y or M here=
.
> >>>
> >>
>

