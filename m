Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7817212E761
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 15:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgABOrw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 09:47:52 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:57631 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgABOrw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Jan 2020 09:47:52 -0500
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MCbMz-1ivaLt3XqV-009hUb; Thu, 02 Jan 2020 15:47:51 +0100
Received: by mail-qk1-f179.google.com with SMTP id t129so31477974qke.10;
        Thu, 02 Jan 2020 06:47:50 -0800 (PST)
X-Gm-Message-State: APjAAAUHMa1hiInnykqbmQIFcZ75rckaWio/ax1U2ivxjF2pJZ12I11z
        R7ff97mn1tbeApVzz4Ad3qUI1MhVyn3YZd20cWE=
X-Google-Smtp-Source: APXvYqxeWv0VNRCh1wUYetvxg6PZuim7c/Ayq2VRzpge7C10vtnrAM7vxlck/j9kJBHTwFTiGgYF60rLdGcplLKhkRs=
X-Received: by 2002:a05:620a:a5b:: with SMTP id j27mr67222709qka.286.1577976469644;
 Thu, 02 Jan 2020 06:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20191228162929.GA29269@duo.ucw.cz> <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com> <20200102110025.GA29035@amd>
 <CAK8P3a2Ya+GZRRA_THZBVDq7SWO8UYoUPwW5fEyorCVjPnd1qA@mail.gmail.com> <20200102140609.7vsfwcjyvbbrmcjx@ucw.cz>
In-Reply-To: <20200102140609.7vsfwcjyvbbrmcjx@ucw.cz>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 2 Jan 2020 15:47:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NU62zf8zJAMZq5KFNuvDdrf3dUcLU4HY83Q=oDC611w@mail.gmail.com>
Message-ID: <CAK8P3a1NU62zf8zJAMZq5KFNuvDdrf3dUcLU4HY83Q=oDC611w@mail.gmail.com>
Subject: Re: Droid 4 regression in 5.5-rc1, armsoc-soc tree
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Tony Lindgren <tony@atomide.com>, Olof Johansson <olof@lixom.net>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        Marcel Partap <mpartap@gmx.net>, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0qWBjttHnqqLGjkwWYG6PQlerA6J7OVh7Aeu9Rn+7ydgPShvdp9
 pqY4Oo/E1qGhFmPKzjUP/z00tF7BglaoWKHEvCUDKmHvNY/f8t/HkrfFTYCxanj+NO1hjuk
 CKMfQI08hTLd3oLI/t69J0qTkPxGR+sBzCaLgK56SHg/YmczncAs0CIbL44B2wRJocTLhNI
 umIJk1f6k0aLHBekrQIwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TizTvzP/iK0=:e3VZuD0flIEudXtLseKtLK
 gvNLwXIGAjaNJy7/2i9ID4+DpM87Bwz1euT0hjMi8+h3apURUxpzXpOxn8L9DOt8J08dprho6
 Owfo2ovw4CyWeoUt+iTMtAH4SZp5L9uKMO3hZVI7X5f+d9EDP5zoTP3roFqD5RL8/L4vpjGS3
 qSZiOCjwk0jmg8oCUaWRy8yd3P0R4vpl8jwXBB+T7PeGhNtyHN8t+IkwYnAo4z+LPBPaka8b7
 jOGGQJivrA2VQMkw5yM39XQcJ8mW77rEYvdFv1mJXomrGY/4OAiHT9+xG2BvDPYXPBm+YWSMZ
 HEDN8mhZZgK1k3U6nztqY5rWH9q4vtv0HaVLLznmI+E5JzQkbAZAjvqx+08ZsTSPS1AhMTva5
 J2n+BAWiWrMhOzcCb3WN53ezA6h33WcPBqjPVvDT5fdKnEb9J5QjB8/ZN/kNeMywPEdB2/+8C
 RMWErQoqW88AYlLIeW5JOEjoTIbyolm/BdDLwqa+iTX/MHdwe+CfF+8pLMMA8yKr1RQUBx7KF
 hd9ifSEk8RJKzHTC9EhY84t/9fyYLizLMDPe9Y7D3PVlpk21C1gnsc9787HG7dQ17xAGrSySR
 LhFZ/9hQuN7HPgKb1OxK6Itzp3kqzrkf+GuQnnfjG4pOFwLRXMdLFnb/KFSjYLmZrXjJS9xYZ
 zXadaOy+KgWgywm1eGwe+b8bF3nOuBSAUsrOOoAwdzsC3OQk5VEgCJw/TS8+PnteYrGa/xuez
 3Jfs9A3CpqZEZG5qalM8TE4rOgtNQvVWHtcoq9/X9+6tb/rojXyEGBBFqL2iaAeVjLVoVDe/j
 LXj/7gSZfRD0JGcuMv7+BeDZ43tNHgxHDJSyAkztHjWLJG6NeaFbyvGPeNTeKmJCy4LBqwkaz
 DM/Cz3Nd/hJW+ulFve+g==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jan 2, 2020 at 3:06 PM Pavel Machek <pavel@ucw.cz> wrote:

> # good: [ab818f0999dc73af3f966194d087e9f6650f939f] Merge tag
> # 'omap-for-v5.5/maintainers-signed' of
> # git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
> # arm/soc
> git bisect good ab818f0999dc73af3f966194d087e9f6650f939f
> # first bad commit: [38206c24ab09b4f4c2a57de5c1af0bb2e69cf5b6] Merge tag
> # 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
>
> ...and am not sure how to interpret the result, or what to do next :(.

This means that either the bisection is unreliable (it might be 100%
reproducible or you mixed up good/bad once), or that the arm-soc
branch was indeed good by itself but had a conflict with some other
change that torvalds merged earlier.

I would suggest to go back to the list I had extracted in my previous
email and revert all the commits that I identify there, on top of
linux-5.5-rc4. If some commit is not easily reverted, skip that one
at first.

Ideally this gets you a working kernel based on -rc4, and then
you can bisect that to find which revert fixed it.

        Arnd
