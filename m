Return-Path: <linux-omap+bounces-4652-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B7BB388C
	for <lists+linux-omap@lfdr.de>; Thu, 02 Oct 2025 12:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5572E18940C7
	for <lists+linux-omap@lfdr.de>; Thu,  2 Oct 2025 10:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFF33081AB;
	Thu,  2 Oct 2025 10:01:22 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D935307AE6
	for <linux-omap@vger.kernel.org>; Thu,  2 Oct 2025 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399282; cv=none; b=JKuBnLell5GWbSx0TO2fJR6riCPpqakMYZtyspXdgmjslcdBr/cW3XYfQ3nQw9pT61u/TSKPN5bg92rTg9i1piMp1PnZzO2wZGehTrcn8YGAKPm0+KFWTcyMigU4dRu5iI8BP+EeIFQQTT7f3hbdtchfGi4Xg4oFuD8RHhEUN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399282; c=relaxed/simple;
	bh=qwdrYHsBvQB14wz2U6J8ch7KCqaJXYov7V2ZknrzUZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZgorBGgqS7fs3IIHTzEQFFoZAgzcZDZYODPyX6423kCEs3NWfAOCDWGjUn+lgS25vEAikr13M1yxwXpPeg1+Et5B8yCK8IC4CfGE5YNyHzeY496feW415sGNWWmYgnjVD6V4UKJ8mSnfmvtUBp53/yj/gKCIc49F7N6teizHUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so820752241.1
        for <linux-omap@vger.kernel.org>; Thu, 02 Oct 2025 03:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399279; x=1760004079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RofOWkGuskT0pThBBpcV4K5QWIKwV7pHTHUt6UmS6o=;
        b=PLVVJyz927N0UXQ05qeTOZ7t8thvCOEEpjcQHXEf7aDeOqHoLfsSOXqY7bVfOFrhiq
         q4YgNTODFCyLncyEpklHjwIMyuhvnmYG4gQ5C+Nov2Ve7fdhh58GVlsgKInBLcZqzgS7
         c8Ey3LJXpzk5+5VrqiYFW1WHRmXwbfORZF+30DKS7xr1iorn75Szl2+AwQkjBujwqTsc
         qBWdJEH2m2+3tJDFGvuhpccCD098exZkb6y3/pIFxzlk1KifgAV41W45bj/67DmKCJec
         G47/7dhcq2ElR7lkS38XtrDNrhlCVNJJY3u+fX+6YmTcy/kS145HgGCFrz51buS4mNp/
         PYeg==
X-Gm-Message-State: AOJu0YwMSJVSbgYbYsrgDlYdNV3QGUlqPA8V763VYPWtOmyVxVajmbFp
	gwAdYtIET5pthK4utEwONOitQPRbMN4ppdNnf7rdhAAhOAJxSLLojjUolucAVg7e
X-Gm-Gg: ASbGncszo+X/GCC5Wyahe60yLdVLXUHTI4WEAS9rX6GO0R05guSIy540Jw2j31NVdA1
	FJYSiYhLMxeHnJA2aCsDqzqXkV+4bQ9OkBp734p+1HeJfGlIN8NfYcpmQh6FxxZlUgH7clGpM3v
	t5L1Zw9LlzbLmULfK5Qb7JQTxfHXqngOb8JcwpYWHPCN3j+St77B6yI1IhdVixyzT6/IeBo8lXX
	79NKOjKRKEzJ1nKV+22VfVMSlc8t1ENfOWeGI650XdkTqq/9Sdo9Fmp5IAu0OH8esetxhDNU1kl
	u3rTzYPdCk6kO5Z8Re5Uo8wudRaXyuY7kzzv+uuLfbFtfBUf47xGDgj3oxNbZV3Jmv9Kk2KT9th
	L423IPo6nUZUQMCKaMX5DZ0Bd4qyvGnrGaN8JAjMZF+VkJY+dtltlafbSo6RukW4RNQqxTICJ+Q
	P4uQvHJWBofL/8+VGLdlk=
X-Google-Smtp-Source: AGHT+IF1YKkYTFWZrgPhbLMUNgwQoKKL7OUm2nq0TEvRhRx+aYdp1OoAJuZStBMoTkwsdp9bJWo+2w==
X-Received: by 2002:a05:6102:d8d:b0:57d:9305:63f0 with SMTP id ada2fe7eead31-5d40c06532bmr1378452137.10.1759399278952;
        Thu, 02 Oct 2025 03:01:18 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d40c505950sm506901137.5.2025.10.02.03.01.18
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:01:18 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so498434241.1
        for <linux-omap@vger.kernel.org>; Thu, 02 Oct 2025 03:01:18 -0700 (PDT)
X-Received: by 2002:a05:6102:3221:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5d40c0b1b14mr975153137.10.1759399278022; Thu, 02 Oct 2025
 03:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
 <CAMuHMdUb7Jb2=GqK3=Rn+Gv5G9KogcQieqDvjDCkJA4zyX4VcA@mail.gmail.com> <CAH+2xPAKa6TWiEbS8Xk3UfSyNk9N1+C+Vy64vzduU450OdgSwA@mail.gmail.com>
In-Reply-To: <CAH+2xPAKa6TWiEbS8Xk3UfSyNk9N1+C+Vy64vzduU450OdgSwA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 12:01:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXahZ5aeqCuUTQa8t2SO=Q3Ktb5ivGATsL5On+8mbqVvQ@mail.gmail.com>
X-Gm-Features: AS18NWA1XHQIaaAGiIEKupXiBQ5KMzxQEIBWDGvGReBFkof8-7P39i7WrjhBWQo
Message-ID: <CAMuHMdXahZ5aeqCuUTQa8t2SO=Q3Ktb5ivGATsL5On+8mbqVvQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am33xx-l4: fix UART compatible
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Judith Mendez <jm@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bruno,

On Wed, 1 Oct 2025 at 21:30, Bruno Thomsen <bruno.thomsen@gmail.com> wrote:
> Den tirs. 30. sep. 2025 kl. 19.08 skrev Geert Uytterhoeven
> <geert@linux-m68k.org>:
> > On Mon, 21 Jul 2025 at 19:38, Bruno Thomsen <bruno.thomsen@gmail.com> wrote:
> > > Fixes the following dtschema check warning:
> > >
> > > serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> > >         ['ti,am3352-uart', 'ti,omap3-uart'] is too long
> > >         'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> > >         'ti,am654-uart' was expected
> > >         from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> > >
> > > Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> >
> > Thanks for your patch, which is now commit ca8be8fc2c306efb ("ARM:
> > dts: am33xx-l4: fix UART compatible") in soc/for-next.
> >
> > This commit broke the serial console on BeagleBone Black.
> > Upon closer look, my .config had CONFIG_SERIAL_OMAP (for
> > "ti,omap3-uart") enabled instead of CONFIG_SERIAL_8250_OMAP (for
> > "ti,am3352-uart").  However, replacing CONFIG_SERIAL_OMAP by
> > CONFIG_SERIAL_8250_OMAP does not help: the serial driver now probes,
> > but I still get no output nor a login prompt.
>
> You properly need to enable CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP
> if using an existing console= kernel argument from the bootloader as UARTs
> will change to ttyS from ttyO.

I did notice that option, and thought it wouldn't hurt to enable it.
Still, I do not use console=, as I rely on chosen/stdout-path.

> Switching the UART driver on am33xx based products fixed UART issues
> we were seeing in our CD test pipelines.

I have found the issue: in the absence of a (legacy) console= parameter,
the serial console reles on the driver's default speed, which is
115200 bps (good) for omap-serial, but 9600 bps (bad) for 8250 serial.
I have submitted a fix "[PATCH] ARM: dts: am33xx: Add missing serial
console speed"[1].

> > The same issue is present when using omap2plus_defconfig, which has
> > both serial options enabled.

Correction: CONFIG_SERIAL_OMAP is no longer enabled in the defconfig
(and IIRC, I had noticed before the serial console was broken with
 that config, but didn't bother, as my config still worked ;-)

> I did not check if any defconfigs needed to be updated.

After my patch, omap2plus_defconfig works again, too.

[1] https://lore.kernel.org/63cef5c3643d359e8ec13366ca79377f12dd73b1.1759398641.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

