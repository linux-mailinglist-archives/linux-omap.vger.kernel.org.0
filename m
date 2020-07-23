Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E7A22AB77
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 11:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgGWJL2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 05:11:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:35679 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgGWJL1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 05:11:27 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mr8zO-1kdw4W026w-00oFj4; Thu, 23 Jul 2020 11:11:26 +0200
Received: by mail-qk1-f169.google.com with SMTP id x69so4703496qkb.1;
        Thu, 23 Jul 2020 02:11:25 -0700 (PDT)
X-Gm-Message-State: AOAM53023axEZDgnVlMMgO3Nu6ueSN7+CTrABkzU66EJcRQYrRdrvwD1
        V1Jlpz1NRIGtqvW796dDDi513T8n62wWpUerOB8=
X-Google-Smtp-Source: ABdhPJxStLH4bkEByDAb/z44/3h8H0El0YO8LxmjELnMmVnMZT+ySbMYTCQvSxd/U4jvrltWM2ImxEZLkkbzi6dufOs=
X-Received: by 2002:a37:b484:: with SMTP id d126mr4090550qkf.394.1595495484736;
 Thu, 23 Jul 2020 02:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200723073744.13400-1-krzk@kernel.org> <20200723073744.13400-21-krzk@kernel.org>
In-Reply-To: <20200723073744.13400-21-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Jul 2020 11:11:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
Message-ID: <CAK8P3a1=WCQ5326Et5RRK7yiOYeHH7uUkQ+T3YPtj2XRh+gkgA@mail.gmail.com>
Subject: Re: [PATCH 20/23] memory: omap-gpmc: Fix whitespace issue
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
X-Provags-ID: V03:K1:v18qdtD1UxaUBVHa41zG90KKmFsLt4sykU64bSt5ycjTL0+LfNy
 AreI4W2yvXDVndyCg57IJlttwGrj5O+KzbTqt1oMRG5SVN6v/WadOJuE+dCiaLbb3a7TRCE
 P/JzVx39YXeN4dGBZh2UMXgXmkL9ltcaiuALqpP7xak0C8Zde6WM09ekSpQU35UTmQ6UVo5
 H4lGMDBhdlbVFYa1gzxDA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0hrSZiOk9bw=:V9D6CK2SMMYYU6WUUk2dCQ
 HGnmpm20PKyvoCLlc5xTS88O6pO69Cal3nuefhzHYSsQIdi8FPKJKhjr5WJt5ltuhD42KnaXo
 NnarjvMmIkib92ekKQaKOtiC7QcVzghYmGYCx8R5qRQW28Q1syC0HHtj8N1yvOdnZhVwJRfZ1
 WNHVifTZCSJJCex9xFHlEoE4OmyWNC3Bk5AiYxBGMF5cXuZfb2F0VZUbnt2U4wlfwjdSe4jbc
 fq9wX0iM+6XTzV8rpncV4o4Q4/bn/pBUz69Hrz0yfoFc0Emt9brfIXf//vUeGzPyPNX8LWwV2
 A0mQCrLvSPdAA2XGMrx5VhL62lo47WL9H9zCXlHwHUjfjuOvL8vqQbbVezIqOWCL2kY9dobeP
 qG5PVmsk2TZXbLvFmTccDzX4mBpOrF9m/Lli+xKOQ1FXUJC+pRvdqeSTtqfIoLh3Pcdg+wtiz
 FIwcKkpuwwWmF4tkBM/1LxrpDaa4bZFCBUvT/+TyTxwShzkZygK2c9DlESoz5nYUFKwpI2r43
 TXhPJGfiIAoj+jLAGwbIN2o/byA/CnnfsrXDOlfcdBnZ2Wc6hHJGkKTYXi6yBrIbnUMfUvy8A
 /hOewnXSJOEg2nzF1NEmK5lMjyRvX/IWDMXb4IBGY24PKWG5mXLFeu2FtvsI8T+LhqCbWMzgi
 Milpui+x2KbrxQh2KYHEK0hbCc7HYi+EmUah3JKcrRQnQ+S5i4Si7/goZCrY3GjSYMQkCFtew
 aAxjDsqbuDdt2ADYt20m7eshIXGNEfpL06b6vygyUCWM4tZ0u/PWLxapqfs8OfgTZR4i/X4Bh
 N7at00DM35nsbgCtv8E5odgBe65xMlonPyT5pSYHhRYV/H9LCwGN7HuLaJAK0btOdfkCbkT9J
 JFDbw3J6l4K2ERue5+Od4ZjCfvIisc1jRjCHQ84cT2zB4ZsHbD0HIIoDGq82e2pHan0fDGFt7
 guuE47syc79rMkSew9ea/tNLznSP0cVMKYsOhQQe50s4K6V6/rjKx
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 23, 2020 at 9:39 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> @@ -1756,7 +1756,7 @@ static int gpmc_calc_common_timings(struct gpmc_timings *gpmc_t,
>  /* TODO: remove this function once all peripherals are confirmed to
>   * work with generic timing. Simultaneously gpmc_cs_set_timings()
>   * has to be modified to handle timings in ps instead of ns
> -*/
> + */

This still doesn't follow the normal coding style for multi-line comments.

I don't think it's worth fixing, but if you think it should be changed, then
make it

     /*
      * mult-line comment
      * ...
      */

     Arnd
