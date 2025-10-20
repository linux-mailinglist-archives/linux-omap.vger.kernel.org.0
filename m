Return-Path: <linux-omap+bounces-4725-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35043BF2429
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 17:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC4AA4EE5F3
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 15:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812B927B35B;
	Mon, 20 Oct 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smuHXiw5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2093227A12C
	for <linux-omap@vger.kernel.org>; Mon, 20 Oct 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975925; cv=none; b=XOzOWJmPf/+YGuEmZoe8lcifCrPVyfT2hJJNayQIfZtUBxG5F4sHbaNw6MSVWaaXT+R6mAfV43pT+ud3NxzNGefLBTte5NoO9M5c7nXA8cmg6flJ2+q4PvuLkWK8dg9S/XuzDMbQbuhuAf0PQ/ZzjOuG8Mib0KcnrRlOsPdT14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975925; c=relaxed/simple;
	bh=glKZh3Rs9DWA7gYVpS+eWM5XSy1bnoXD97vIC0eBJ/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaiIPhyL3jZMtrmBOzaEU4pGsVkLeGBdJ3HRZPnbLbuNtngP2vQR6mOE4UwvxJAkThfcHuEp/uPQ2sfxwESUxI3WkvXLKXBvVJ86b5J5nplAWv7RKewSIHN4X7NDVeZPcuh2TT9Mb5geGs2rq+TPzTbpB0vZiGNIFZS3zca1HU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smuHXiw5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08A7C116C6
	for <linux-omap@vger.kernel.org>; Mon, 20 Oct 2025 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760975924;
	bh=glKZh3Rs9DWA7gYVpS+eWM5XSy1bnoXD97vIC0eBJ/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=smuHXiw5hHj06d0FAMGjVN+m7UxvJImDqH61KlTBRumYxzqr7tTi2W06fIY+YzkuF
	 ALhQHYunwRkvmmasKuAarZfUPDmWR6rbUGK79ogTchuuREImsy0pz4bSk+UDzZedp0
	 QmnDTvjXDb4ZgXasdqEl+rNh0CEW6w90IpaE0V05iPhfoaPqexwMRZ5NWBQ2TDy1fZ
	 bxiUseBncCjoFlA04Wpg37VN7R0cvosfxsJm2IfEPrPXKUFHY4cHNHZdD0sYMvKKDk
	 BfVPyl30NlvqTuAc+LwScu1AAHxi2l3PV84I8hPzED1zxaDrgsDGKxqeZjxrkpAlrj
	 HuhLGzTJrQsjg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so880287666b.0
        for <linux-omap@vger.kernel.org>; Mon, 20 Oct 2025 08:58:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5kolWru8mYdyXuROU7mbX/QmnVzdWKhod/pGKRlSMXIT24g9afMYh4CK1PK2DIPqgaiiJSkynBwdd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn8ThI2/wHdFWDUlEDqFqCs8K9suUT2jnLlpSlClwuAp2FIoRa
	deNmaCXCJTd2VaFgs69IxXb/704fPw9J0sg4w/csjOWjOdR62WEUbw9N0s+BOJMqOHAffsQRkXo
	UVZR2mipsKubuUZ7vU/Vkp2TaAtvevQ==
X-Google-Smtp-Source: AGHT+IHFSbEWoYRX6JQYGr7nYekl32rjf5OMqA9lsEF/t7tJVMhAsclmRszq+RnGnDmP+4HAB8eRnHvWtEq382/XmRo=
X-Received: by 2002:a17:907:7f2a:b0:b3d:c3ee:406b with SMTP id
 a640c23a62f3a-b6475706d92mr1477896766b.61.1760975923244; Mon, 20 Oct 2025
 08:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>
 <20251020142710.GA576827-robh@kernel.org> <46aa84cd-63cc-4263-9061-021fa3205b87@gmail.com>
In-Reply-To: <46aa84cd-63cc-4263-9061-021fa3205b87@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Oct 2025 10:58:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKH2NTvXGPoimpVp=-yvcQgbXSoxKY6AO16WgJHSeOT5A@mail.gmail.com>
X-Gm-Features: AS18NWBXPTVNj0txN6F2vJaiX5RzUa6WqD5MWjk762bE6uj3xBr9nPgYQ4Qrtsk
Message-ID: <CAL_JsqKH2NTvXGPoimpVp=-yvcQgbXSoxKY6AO16WgJHSeOT5A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 10:44=E2=80=AFAM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
>
>
> On 20-10-2025 19:57, Rob Herring wrote:
> > On Sun, Oct 19, 2025 at 01:04:36PM +0000, Charan Pedumuru wrote:
> >> Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
> >> property typo for a DTS file.
> >>
> >> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> >> ---
> >> Note: The property "ti,needs-special-reset" was not removed from DTS c=
ause it will
> >>       disrupt the compilation for other compatibles as the node &mmc i=
s used for all
> >>       compatibles for some DTS files.
> >
> > I don't understand. AFIACT, "ti,needs-special-reset" is only used for
> > the hsmmc driver/binding. But this series for for the sdhci
> > driver/binding. So shouldn't the property be removed from sdhci nodes
> > (and the binding), but kept for hsmmc nodes?
>
>
> Yes we can remove that property from sdhci , but &mmc node in DTS is comm=
on for all mmc drivers and this "ti,needs-special-reset" property is define=
d there for one board, so even when I remove it from DTSI for sdhci nodes, =
the DTS file still contains this property in &mmc node which is also common=
 for other mmc drivers, so even if we remove that property for sdhci node, =
we still need to define it in YAML to resolve dtb_check. The issue here is =
not removing the property from sdhci node in DTSI file, but to remove it fr=
om &mmc node from a DTS file which is common to all mmc drivers.
>
> Here is the DTS node (ti/omap/am5729-beagleboneai.dts) which contain that=
 property and is common for all mmc drivers.
> &mmc2 {
>         status =3D "okay";
>         vmmc-supply =3D <&vdd_1v8>;
>         vqmmc-supply =3D <&vdd_1v8>;
>         bus-width =3D <8>;
>         ti,non-removable;
>         non-removable;
>         mmc-pwrseq =3D <&emmc_pwrseq>;
>
>         ti,needs-special-reset;
>         dmas =3D <&sdma_xbar 47>, <&sdma_xbar 48>;
>         dma-names =3D "tx", "rx";
>
> };

I'm pretty sure that's not how &mmc2 works and you are confused. I
would suggest you do a dtb->dts pass and compare the results.

Rob

