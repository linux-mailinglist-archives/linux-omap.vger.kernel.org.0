Return-Path: <linux-omap+bounces-4742-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63692C02E66
	for <lists+linux-omap@lfdr.de>; Thu, 23 Oct 2025 20:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A5E1AA6A02
	for <lists+linux-omap@lfdr.de>; Thu, 23 Oct 2025 18:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857382749C7;
	Thu, 23 Oct 2025 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWPlzUWS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526026ED52
	for <linux-omap@vger.kernel.org>; Thu, 23 Oct 2025 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243764; cv=none; b=h7Q7ojEopRJ3o1trOQ4p8vekUOadWzBtEWHUKs9tahBF3MjD41dw+3SHKIVTWJ6EX9HD/cTBAYTWBWZWpccJYltwjKAk4TnBs9YFzqnTz/4i2O6DN9130Er+XBa+sa7jVZ2clLyB+TYuNaScGxpCAKY6Vh1LtI6ZUkhOsw9Ge5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243764; c=relaxed/simple;
	bh=ki5+mgUHCnasXn1u4axDq9+oqXOSoglYFcLhefvUius=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Le8GtWvKdg03S7bZZRugB/2z1Frf3F1xOaLyP1z84HpeXf5C++h84pZRrBnk+RVM/lBK0LWrtc39+Qy8EAufU1dQXWB3w4PKQlLH2w+q1rR+8ga/f90mj9WB8IvzXa7okFVUDbGQqn2FYV6eODvUK2t88Wi33RRRBO7BQbNhjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWPlzUWS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67C7C116C6
	for <linux-omap@vger.kernel.org>; Thu, 23 Oct 2025 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761243763;
	bh=ki5+mgUHCnasXn1u4axDq9+oqXOSoglYFcLhefvUius=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sWPlzUWSpVRWZgCncwV66KdKtAz3ZCtXZvfGH6oOvDH+mFW3SZG7798L0DL+EkeC6
	 rsydTYrYTvt+Du2BbydT9SPpKVLatxa4UlZDdU/L+I5P/XjCpTparbSAlum2j3KoBx
	 31/Dnoe7zWnbZaT+e16RjHHgYhlmix22NQ6iuW2xJke99aihS+VHp8N9sLG0FaVdlh
	 nJbIbHxdpwIpzEeVzLT2sMQZyxdao55Eu3kmbYb9GZQgDWQyyregHh/reVh5hXC5bl
	 b9E+R6GcQYkM+DgIqF1kvuD42Te5zkKdR+IqgSOggakS9beWsGceboCOIFIruDF24Z
	 L+uOyv+opf5nw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso214397766b.3
        for <linux-omap@vger.kernel.org>; Thu, 23 Oct 2025 11:22:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/590CbRCFpTY50e0qFO09vayhoVhCQDAcXX7i2p3bgagQK3fiRisxkmgeFei8z/Gm2VoGFFY8JhDc@vger.kernel.org
X-Gm-Message-State: AOJu0YzQY3nvSA4OORneKY2Bipj0ggkS6qeDfGtn5zc9qLHlt8rKYPBJ
	suteIsF72bKYrsJJyDqik0PRO5nVeciCBgrFdoLYuhyyuOMTX5e/Mszrk7aADsBXSzBzE2CDRdW
	/ZrJR9gMUQWDYohDJJ3qo8nLzoQ+h8Q==
X-Google-Smtp-Source: AGHT+IGLx3rjGA0ygPuZ0ue4tsAy1uyY6E2iqKcFNvBVFK1AT8U02rrjmbhfD67T5Vtw6dKvUfug+7/XnTddWg6T1Yk=
X-Received: by 2002:a17:907:94c1:b0:b4f:ee15:8ae8 with SMTP id
 a640c23a62f3a-b647453ff06mr2883570166b.58.1761243762241; Thu, 23 Oct 2025
 11:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>
 <20251020142710.GA576827-robh@kernel.org> <46aa84cd-63cc-4263-9061-021fa3205b87@gmail.com>
 <CAL_JsqKH2NTvXGPoimpVp=-yvcQgbXSoxKY6AO16WgJHSeOT5A@mail.gmail.com> <879da8d0-1ea5-4495-90e5-03b55aa91362@gmail.com>
In-Reply-To: <879da8d0-1ea5-4495-90e5-03b55aa91362@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 23 Oct 2025 13:22:31 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+ZmvVHvmLYKQD0fn74+9WcnmDVAqC1Q48HFLVN35tuFQ@mail.gmail.com>
X-Gm-Features: AWmQ_blWZxcr-hs2RJd2EAMFSu7sdNXBzF6idHteILW7eB4wsh10MHRrwDMkAkw
Message-ID: <CAL_Jsq+ZmvVHvmLYKQD0fn74+9WcnmDVAqC1Q48HFLVN35tuFQ@mail.gmail.com>
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

On Thu, Oct 23, 2025 at 10:40=E2=80=AFAM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
>
>
> On 20-10-2025 21:28, Rob Herring wrote:
> > On Mon, Oct 20, 2025 at 10:44=E2=80=AFAM Charan Pedumuru
> > <charan.pedumuru@gmail.com> wrote:
> >>
> >>
> >>
> >> On 20-10-2025 19:57, Rob Herring wrote:
> >>> On Sun, Oct 19, 2025 at 01:04:36PM +0000, Charan Pedumuru wrote:
> >>>> Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
> >>>> property typo for a DTS file.
> >>>>
> >>>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> >>>> ---
> >>>> Note: The property "ti,needs-special-reset" was not removed from DTS=
 cause it will
> >>>>       disrupt the compilation for other compatibles as the node &mmc=
 is used for all
> >>>>       compatibles for some DTS files.
> >>>
> >>> I don't understand. AFIACT, "ti,needs-special-reset" is only used for
> >>> the hsmmc driver/binding. But this series for for the sdhci
> >>> driver/binding. So shouldn't the property be removed from sdhci nodes
> >>> (and the binding), but kept for hsmmc nodes?
> >>
> >>
> >> Yes we can remove that property from sdhci , but &mmc node in DTS is c=
ommon for all mmc drivers and this "ti,needs-special-reset" property is def=
ined there for one board, so even when I remove it from DTSI for sdhci node=
s, the DTS file still contains this property in &mmc node which is also com=
mon for other mmc drivers, so even if we remove that property for sdhci nod=
e, we still need to define it in YAML to resolve dtb_check. The issue here =
is not removing the property from sdhci node in DTSI file, but to remove it=
 from &mmc node from a DTS file which is common to all mmc drivers.
> >>
> >> Here is the DTS node (ti/omap/am5729-beagleboneai.dts) which contain t=
hat property and is common for all mmc drivers.
> >> &mmc2 {
> >>         status =3D "okay";
> >>         vmmc-supply =3D <&vdd_1v8>;
> >>         vqmmc-supply =3D <&vdd_1v8>;
> >>         bus-width =3D <8>;
> >>         ti,non-removable;
> >>         non-removable;
> >>         mmc-pwrseq =3D <&emmc_pwrseq>;
> >>
> >>         ti,needs-special-reset;
> >>         dmas =3D <&sdma_xbar 47>, <&sdma_xbar 48>;
> >>         dma-names =3D "tx", "rx";
> >>
> >> };
> >
> > I'm pretty sure that's not how &mmc2 works and you are confused. I
> > would suggest you do a dtb->dts pass and compare the results.
>
> So, I can remove ti,needs-special-hs-handling and cap-mmc-dual-data-rate =
properties from a similar DTS file along with ti,needs-special-reset as the=
se properties are not used for sdhci-omap driver and are no longer in use, =
I will remove these properties from YAML too, if this is true. Can you conf=
irm this?

If the properties are not used in drivers or .dts files, then yes they
don't need to be in the schema.

I think you just need what you had previously and just drop the
changes to hsmmc nodes.

Rob

