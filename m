Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165F722AB72
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 11:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgGWJJ7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 05:09:59 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46671 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgGWJJ7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 05:09:59 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mtxxk-1koJRZ1Voy-00uLNN; Thu, 23 Jul 2020 11:09:57 +0200
Received: by mail-qk1-f171.google.com with SMTP id g26so4687610qka.3;
        Thu, 23 Jul 2020 02:09:56 -0700 (PDT)
X-Gm-Message-State: AOAM530omc8Oz6Yi4PihOQH1LosDiWWxnLRf+3bZHmfqi1ZM1M+hMLi1
        y3ZICop3xN44lR56DrFg7BvixM1H2WPMyveC+5k=
X-Google-Smtp-Source: ABdhPJxSTa5cKHst3O4qitCaV1YQ0tX+BRjglSXj/Cu27GhpJg8d0OcwDlaZbCo1S43Lb3m3S4DuPLbxybObeRblrbk=
X-Received: by 2002:a05:620a:2444:: with SMTP id h4mr4289080qkn.352.1595495396053;
 Thu, 23 Jul 2020 02:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-20-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-20-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 11:09:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
Message-ID: <CAK8P3a3emZd=Tz5JhxevkX3OJMMEn_2Nb+_LQtGZJ9-GWNpd2g@mail.gmail.com>
Subject: Re: [PATCH 19/23] memory: omap-gpmc: Enclose macro statements in do-while
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6ny/DMVML+SjQTHts0giPpRaNRrIMYvQPhgbmdntf1OZguwvdCX
 vbPiQ4ua46OMxvOFU1TQtVvBVMx83uLWBBfp0ND0CXPeuVe8DGY6dsj+iOtp+VwzatW5BFu
 l6jrCGtYURRy+W6tp5P68xgWhtRtk9A+ngZzNX2KCsW70rbk+VJJ/H8oW7iUf1m4Ty1VSUK
 l2OAF0zc7VV4vOlM8cXHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D1CFpvprRZ4=:8bS1votwphA7KsYZmwPjLh
 4Re0l7bP/t52NnZCCJerBYW01ImZ6WkkBguLiyYWsNeUqmoUsWH6hguvPtsArXPyCTtQ42aOd
 WGj8Msf7iTMkKE9JOoWNRY/BW5zft7d3GhHimjuwn1Qsw/16oJCXIQvWsLI2QXAhAEdOUzyPQ
 JJK9ReAA+ttA47yw0xmzszJrKovR7i8WmtjUyikxjKOmmkD0kfdylxDuAJ8L/7KkarNRA4QE3
 51KZxocyKREIXyQ4y6PfJT8uL0f+3DHeM2QfcV4BukrI9bjzsBGBvFWUwc5NVrtody9s4g2SS
 xGCCIftj0kW1WQtCrOPpbMBd2kwo3/JVJNOi6USqBV0hxuMD2u/6g3aBEFlR6nNY5dBClZZfQ
 S1idCWrl8e/cs+d9gF5/QFkJovGL7x6OzgqZAxfyr0QnqV3r7wCuFz7mZwJNQ+aN1HHxDAKs1
 AG9uHpy4zKTFAisptWPNAfCqYg3Lxu7EAo80fJmt58SSIPIiMcd0936/HFVu2mTczY0+XJLOC
 nYtVgctWUXRnrVOt4XQGiFpCELUX0F9xld4gf2qpEXXEzTXSiz5KhOIvqMt8X68+0ovj7GRx8
 wR7DHtrbZHlYj0EdHSv6JtZ6TFXaNBL8ThvPM9ygLXIkVgyD5kJ43PC1I7N7umuEadwaQLcIA
 KnJXUAuIhR2zL0hJeSflGgcBEda/iTKfepDBLQQfVaPPhIHVhB9J51rL7pZqypgS6Uv4McN2l
 Gu2fyx7VDryA15wpqdcBzEOg8lRSVVh9pXCyU+j5GMCGEHSRmusCuiDh1MI8U+X9HDbjnpkGC
 K0g4mGqgEbh4NdR9SjKS4rAvbU0n9zBgyBq3yZ7wqexxyWiHYCljS2fk4SDuT9i3iy9gxgf/O
 NLvYIhAUAocAUQkgTyIyL0t9SEe5uudBDFwA8bBF7ZnHPp9I4RphdYSc9BFuOQSfI4zCoAyZX
 enW34kEJ2OjpJRIpHaCZ/q1/duw7Q5paZpMHTVSQO2ORgBMdrr68r
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> do-while is a preferred way for complex macros because of safety
> reasons.  This fixes checkpatch error:
>
>     ERROR: Macros starting with if should be enclosed by a do - while
>         loop to avoid possible if/else logic defects
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

This is an improvement, but the macro still has other issues that
are just as bad as the one you address:

- Using the # operator to avoid the "" in the invocation seems confusing
- it implicitly uses the 'cs' and 't' variables of the calling function instead
  of passing them as arguments.
- it calls 'return -1' in a function that otherwise uses errno-style
  return codes, so this gets interpreted as EPERM "Operation not
  permitted".

I would probably just open-code the entire thing and remove the
macro like:

ret = 0;
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  0,  3, 0, t->cs_on,
GPMC_CD_FCLK, "cs_on");
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  8,  12, 0,
t->cs_rd_off, GPMC_CD_FCLK, "cs_rd_off");
ret |= set_gpmc_timing_reg(cs, GPMC_CS_CONFIG2,  16,  20, 0,
t->cs_wr_off, GPMC_CD_FCLK, "cs_wr_off);
...
if (ret)
     return -ENXIO;

Of maybe leave the macro, but remove the if/return part and use
the "ret |= GPMC_SET_ONE(...)" trick to avoid some of the problems.

      Arnd
