Return-Path: <linux-omap+bounces-585-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D518E8544D7
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 10:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736A41F2995B
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 09:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA95412B74;
	Wed, 14 Feb 2024 09:16:55 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E40B12B68
	for <linux-omap@vger.kernel.org>; Wed, 14 Feb 2024 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.23.86.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902215; cv=none; b=mdQcwTymiXggUQ21phZMV0X8iJDS+LuGVF8F2kGy4XDo5ruqyZyfvuIEwizhCIxE9vfMkO4p0up01aTtJTSBtXwlJeTyZtI5bHeId698xo91GsaTPWXjBWf/ngYWtu1sy0Zm+Z7albCyIyJCwqdPZyA2zeTpKv29dZvOCLeNCXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902215; c=relaxed/simple;
	bh=gCmgKQmI8ym+9eUDpOFyY980mX8dhdDWIV7pnw1+yfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCscModyXv7AXbCdJennEepzEzj0M0l9vZao4VEcpURUH84gZhTRy4Iq7KCeE+9eKUEt3QBjE7m2izsxBwB9BLX8F1vfL1UBik2yvaDTrvkeZehPz/biTFmPAHu65grTvJPaz/PKPT9elMUgQBioJpgLB/G4gcAJ9235z5JZFEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org; spf=pass smtp.mailfrom=zonque.org; arc=none smtp.client-ip=46.23.86.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zonque.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonque.org
Received: from [192.168.178.97] (pd95ef237.dip0.t-ipconnect.de [217.94.242.55])
	by mail.bugwerft.de (Postfix) with ESMTPSA id A3818281529;
	Wed, 14 Feb 2024 09:08:06 +0000 (UTC)
Message-ID: <6e97c51e-44bb-4edb-9dbb-1bbc0524b812@zonque.org>
Date: Wed, 14 Feb 2024 10:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stefan Lehner <stefan-lehner@aon.at>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
From: Daniel Mack <daniel@zonque.org>
In-Reply-To: <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/24 21:11, Arnd Bergmann wrote:
> On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
>> On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
>>> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 2/12/24 04:32, Peter Maydell wrote:
>>>>> The machines I have in mind are:
>>>>>
>>>>> PXA2xx machines:
>>>>>
>>>>> akita                Sharp SL-C1000 (Akita) PDA (PXA270)
>>>>> borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
>>>>> connex               Gumstix Connex (PXA255)
>>>>> mainstone            Mainstone II (PXA27x)
>>>>> spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
>>>>> terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
>>>>> tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
>>>>> verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
>>>>> z2                   Zipit Z2 (PXA27x)
>>>>>
>>>> I test akita, borzoi, spitz, and terrier. Upstream Linux removed support
>>>> for mainstone, tosa, and z2 from the Linux kernel as of version 6.0, so
> 
> It was 6.3 (about one year ago).
> 
>>>> I am no longer testing those.
>>>>
>>>> I never managed to boot connex or verdex.
> 
> I kept specifically the pxa boards that would be sensible to port
> to devicetree because they had qemu support. gumstix verdex is the
> one with the most RAM out of those; spitz, sharpsl and their
> variants are the ones that some of us still have around.
> 
> Robert had working devicetree support for some machines out of tree
> that he has not submitted, and presumably not worked on since.
> 
> Unless someone starts working on converting the remaining
> pxa board files to DT, we can probably remove them after the
> next LTS kernel a year from now.

I agree. Once the machines are removed, people who were actively using
them would be incentivized to work on a DT port. That's not very
complicated to do when you have the hardware to test, but almost
impossible if you don't.


Best regards,
Daniel



