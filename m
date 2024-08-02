Return-Path: <linux-omap+bounces-1828-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF2945FAA
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2024 16:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3DD11F220C9
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2024 14:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227912101B0;
	Fri,  2 Aug 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CwMh6/X2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CFrr7VJU"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE5210184;
	Fri,  2 Aug 2024 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722610383; cv=none; b=SwpyS8u8UTGdxvYcgE9VzrGPYsm+ctII+zdkimijV3s4vR2jYeBAVcWZOZoKKRKvQyeIyXiB4oubqvPZNPf9blmrGRWkG3ux7tAotYLQ7+mEuy0cltey1gb0BFRkoPDnAtrQjde5CmLyTw3WMDCH+qPqxqzpXfcQ3d+hfgthdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722610383; c=relaxed/simple;
	bh=YOvI+XpA8M3L2wsn4b4f/al0/MdP82kcv7OYMqkQids=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JuOUSkOhnySBT88FKT4EQ9xTGDXvZJAOd/2KuF/mltG8jY77LrLrmGhX04PuKlpw7+3OzmNE1tVqj4sDXcuzstJtwJJC7Rw0Jhidq5n7os4/JimAq/b25oPPEhHVmQ0UYbO5pKb2FhvniKk3qTmqu35+DM2+CtpQUc1i4fwxi+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CwMh6/X2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CFrr7VJU; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 809911151A7E;
	Fri,  2 Aug 2024 10:53:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 02 Aug 2024 10:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722610380;
	 x=1722696780; bh=NeqiCTewY5OK6dnUxXzSah7Pl6i0DLqRmBrqL9BR/TE=; b=
	CwMh6/X2U6PT6fkyX1FBT1JsfIjVZ3kgAfkO2yLBlMb9bn9bHv2QwryYb/YpDcaS
	yiQ+bf8CtG5VAVn6XgCrT2KI4pidNdCGea+Zf99m0Jyne01bmfSRkVp6wuA4Mahr
	qDlQrF1SIvlrn5H9E3Q2c1nJZo33mA+CT8IsM8iI4n3zNwF/VzzKi7BOkIUODsiA
	OOL0jEU8n57kuActqQQsVFswYj5Dd1gPP9FSWbCrcJZKFTcEhCtsKIH195FCc8OA
	S5iqGyqvAtJTuxrFoF0r74kS0ZRbPPCYkxd5IvBnCqayCtc+/RvXUeO8+rqs/pfV
	ptF4FVQ2PDDUOWCuZIISHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722610380; x=
	1722696780; bh=NeqiCTewY5OK6dnUxXzSah7Pl6i0DLqRmBrqL9BR/TE=; b=C
	Frr7VJUNiuuibLcfn5UYmV9swWudEvOGck9Gs7tn91dBTIdRoQOWOKfHrSaBbmJI
	GuYaSMWuYYfXBHkaU+X/vUppF97mIPlZUmTI9LMlzbR51mWZFDLGr99F1uS8LzaS
	KWefimHe0QCJ96KH3RwzrTAMpTDdzQenfzNbBQdUsTj8Y76Fp11nfBrQc5XJVocc
	kR1xiSXSwCtW5EAqMOqpVlXQHimMOc42+bWu2/niN/y8dSB/ipljIMKjfLDNUx+q
	hea81+BoCzkWO+FTth3thuWRcFe4EsoXp0kzeEyDBy127odM+XMDnD57FOBhA10q
	dra4TXi2Cp8G4AlLKon9g==
X-ME-Sender: <xms:y_KsZoWclNn9sQ7pOM_Zf5pRlsrz5294St7-DqsuOLbpn-CkVgSofA>
    <xme:y_KsZsk-eBElZ3cVaRviNfwuar09EZYr9PZnghg4Vcm5ZYr4lEiSs58g7Ii0t7mvU
    KREYoY-k88Nw5gCQHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefggedutdekfedufeetgfejteevheekueduffdtueeftedvfeeftdffvddtgfev
    hfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhophgvnhifrhhtrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:y_KsZsapR5_bz14OXmOhG2QOvh8YmbREXBQAMZOBI41JuKmRXmJJmQ>
    <xmx:y_KsZnWZdq8QHL_HSGz3rf_yT4f5ekBW8Su5rFA1Nvnf0R2fIK9iCg>
    <xmx:y_KsZik5fm3yMGL3AuGNl4vcyz3u73bmrbozUwBSxQLNyW8cxWbJVA>
    <xmx:y_KsZsfIy8a1wvN9_-WzvBSSLiwAHz_iCSSacWQm8nG6-iy_wH2Fyg>
    <xmx:zPKsZu3mlIxlkpVc7KAA5bYKudb5qM74PDkiv_4ENCbiR8CuHfmKMCOJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 20907B6008D; Fri,  2 Aug 2024 10:52:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 16:52:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Richard Earnshaw" <richard.earnshaw@arm.com>,
 "Richard Sandiford" <richard.sandiford@arm.com>,
 "Ramana Radhakrishnan" <ramanara@nvidia.com>,
 "Nicolas Pitre" <nico@fluxnic.net>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Mark Brown" <broonie@kernel.org>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Nikita Shubin" <nikita.shubin@maquefel.me>,
 linux-samsung-soc@vger.kernel.org, "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>, debian-arm@lists.debian.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Message-Id: <a87da38e-e7b6-464c-b2b4-384237861075@app.fastmail.com>
In-Reply-To: 
 <CACRpkdYUHtfjL2jfGxjV1eMZGkk6NXaArbHpc5mhrY7C9rSi6g@mail.gmail.com>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <CACRpkdYUHtfjL2jfGxjV1eMZGkk6NXaArbHpc5mhrY7C9rSi6g@mail.gmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024, at 21:53, Linus Walleij wrote:
> On Wed, Jul 31, 2024 at 7:29=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>>
>> This is used for both StrongARM and FA526 CPUs, which are still
>> used on a small number of boards. Even the newest chips (moxa
>> art, ) are close to 20 years olds but were still in use a few years
>> ago. The last Debian release for these was Lenny (5.0).
>>
>> Dropping compiler support now would be appropriate IMHO, and
>> we can drop kernel support in a few years.
>
> I am actively using the Gemini as my NAS with OpenWrt and there
> are several users of it in the OpenWrt community.
>
> I don't know if there are enough of us to keep ARMv4 support in
> GCC, but ARMv4 support has been added to CLANG (along
> with ARMv4t), and I have tested to compile kernels for these
> devices with CLANG (for testing CFI!) and they work fine, so if
> GCC drops it, we can still build them with CLANG where it apparently
> isn't a maintenance burden given that it was recently added.
>
> Maybe CLANG has a more adaptive backend?

It's certainly good to have a backup plan, but I also think that
if we expect ARMv4 support to be required past gcc-15, we should
ask the gcc developers to keep it for a bit longer. Ultimately
I think it is best to remove it from gcc, we just need to
optimize the timing. More on that below.

>> =3D=3D=3D Highmem =3D=3D=3D
>>
>> Most Arm machines are fine without highmem support and can
>> use something like CONFIG_VMSPLIT_2GB to address up to 2GB
>> of physical memory. Machines larger than only popped up
>> around the time of the Cortex-A15 in 2012 and for the most
>> part got replaced by 64-bit chips within a short time.
>> In addition, there are also a handful of Cortex-A9 and
>> Marvell CPU based machines that have either more than 2GB
>> of RAM or a very sparse memory map that requires highmem
>> support.
>>
>> Linus Walleij has done some work towards being able to use
>> up to 4GB of RAM with LPAE (Cortex-A7/A15 and later)
>> machines, which I think still needs to be finished before
>> we can remove support for highmem.
>
> This is either really hard, or I'm a bad developer. But I keep
> churning it.

I do feel a little bad about this as well, because much
of this was my original idea and I'm just offloading it to
you.

On the other hand, the continued existence of highmem
keeps coming up as an issue and I feel we have to do
something about it, see this week's

https://lore.kernel.org/lkml/CAHk-=3DwjhQ-TTg40xSP5dP0a1_90LMbxhvX0bsVBd=
v3wpQN2xQQ@mail.gmail.com/

>> =3D=3D=3D Gemini, Moxart =3D=3D=3D
>>
>> These both use the Faraday FA526 CPU core that like
>> StrongARM implements ARMv4 rather than ARMv4T with thumb.
>>
>> The chips are also over 20 years old, but the kernel
>> code has been updated and is not a maintenance burden
>> by itself, so there is no value in removing these
>> machines until StrongARM is also gone.
>>
>> On the other hand, removing both FA526 and StrongARM
>> platforms means we can probably remove ARMv4 (non-T),
>> OABI and NWFPE support more quickly if we want, or
>> we can wait until a few years after gcc drops ARMv4.
>>
>> OpenWRT lists the gemini platform as supported in
>> https://openwrt.org/docs/techref/targets/gemini, but
>> none of the individual machines have builds for the
>> current release.
>>
>> Need input from Linus Walleij.
>
> Yeah we use these devices. I don't know what counts as big
> enough community to be considered, it's at least not just
> me.
>
> Gemini builds are in the official OpenWrt repos:
> https://downloads.openwrt.org/releases/23.05.4/targets/gemini/generic/

Ok. From the kernel perspective, there is no benefit in
dropping support for gemini specifically as long as there
are any users left and we can build it with a version of gcc
or clang that has ARMv4 support. Here are my current
assumptions for the timeline of when that will happen,
please let me know about anything you disagree with:

- Gemini will be the last ARMv4 we want to support, all
  StrongARM and FA536 are already less useful and can be
  dropped earlier or together with Gemini when it gets to
  that.

- Gemini has no dependency on OABI or NWFPE, since all
  users with new kernels are on EABI softfloat userland.

- There are no remaining users on new kernels with
  anything other than OpenWRT.

- The most recent OpenWRT release is supported for two
  or more years and uses a one year old kernel at
  the time of release, as well as the four latest
  gcc releases.

- OpenWRT minimum recommended RAM historically doubles
  every five or six years and will go up from 128MB to
  256MB in one of the next four releases.

Marking ARMv4 as deprecated in gcc-15, and removing it
gcc-16 would make Openwrt-29.x the last release to have
an ARMv4 compiler, using the late-2027 kernel release.
The last security updates for that release would be
in 2031, +/- 2 years if OpenWRT policies change in the
meantime.

If you think there will still be enough users upgrading
OpenWRT on these in 2030, we can recommend that gcc drops
ARMv4 support later, but my feeling is that anything
past OpenWRT-29.x is already limited by both the memory
bloat problem and the half-life of 20 year old consumer
hardware.

      Arnd

