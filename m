Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5651E8A2E
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 23:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgE2VkM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 17:40:12 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58351 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgE2VkL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 May 2020 17:40:11 -0400
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MiagR-1j2RqA29AN-00flmJ; Fri, 29 May 2020 23:40:09 +0200
Received: by mail-qt1-f179.google.com with SMTP id i68so3222212qtb.5;
        Fri, 29 May 2020 14:40:09 -0700 (PDT)
X-Gm-Message-State: AOAM533F6ZM5OpkhWia4SHBfFbu/tY/c/9+8EVn8Vwvd3H9QgHCH2u8L
        3jhars9/urzROu4axoWzwh4iAGX5cePX2m/7pVE=
X-Google-Smtp-Source: ABdhPJy+ilLiWJETdXmIMFhDMSp2SJnge1JR5wH/6Pi12NEQPMr5nIUbf4u4MCMg5wHhEV/LRF8BNCHf3hC2L3DWGbQ=
X-Received: by 2002:ac8:306d:: with SMTP id g42mr10851037qte.18.1590788408285;
 Fri, 29 May 2020 14:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200529201701.521933-1-arnd@arndb.de> <20200529204404.GW37466@atomide.com>
 <CAK8P3a1fEq6n1pBqkY4CqxpSZnMLOQsNHFyhB_L4uo-oZVu4sw@mail.gmail.com> <20200529211440.GX37466@atomide.com>
In-Reply-To: <20200529211440.GX37466@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 29 May 2020 23:39:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0oK-SqWHR9v0-2p3Fd_mCe2ibP_SQKf_W2A6cbEzVgWw@mail.gmail.com>
Message-ID: <CAK8P3a0oK-SqWHR9v0-2p3Fd_mCe2ibP_SQKf_W2A6cbEzVgWw@mail.gmail.com>
Subject: Re: [PATCH] ARM: omap2: fix omap5_realtime_timer_init definition
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Stefan Agner <stefan@agner.ch>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/qBkAKUfA8Zb4rUGlHuRN/fkCjAHXd4O23mQEgcIRSsliWklf5/
 K+5BMl0fxtRXZk8z2VvFXFa8CEoF+3CyPosZakapcGEyyt8QyuO6z0DcJI70BHlKHAg6tGs
 usv9H8AUZ3TSxpQUMuEekm4pae+PRCebEtZyoXm9pbMyY7e5hmPwm5UpE8U0KBm3egaFdtj
 NmGHYBMdfjd/lMDqp6v+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PGJkZHoEvvY=:9LBuY+AdSFEw3R1HY+fpy/
 fRl2YVPtSijgjYV+y8EJp6iUykuIdX0N7krZTVNirMaX5W0jpuUiSQtFhhegyCByLYMPX+ZUv
 scOL2ieq/JJicWU7TmsmNc9iTlUzHVOitT64R4Q4J4LytJgQxL/66y0IvFpsvlnFO7L1k1SY9
 RsLajXnuob2Qrs7HIEWFm6+7yzGMVAWMXd2UQX6ZBH0b/tDqrrve0hCgFdp2uQdnPJKYs+3dF
 l34KxN0IQrRoBL1c/w8cQsrYtOy80B00FFqUN5w/AlrVcm8CDRJj2iQdbO/nDFuJIcHyNOk3N
 2fiCzRW2ap7tgO84/gyBx5b1gSNoP3K8JO6spQCTUY1I5j9PUXQCxnRFtDS8vMcxbv20ayQ/5
 +0eZHRsOeY8d6sL9KUWnO2Vp2Z8/yRZO/kJCufTbmtghaX71wBEJyG1/7IPvHnbOwBZsyDjPW
 3tDdcorP3ZExmf8w4Dd1W4DvhkGNqE+0rhDLTRGVxCH3VGxf8w9IAn8+v0up1DUI5Nr+76ByT
 3g+NHOGaY8h45aKax9VnAhX1wkm+yRdL/KtkEqXN8qoXem+2MO/A+JWsrN34dbHVDRfEyPEoR
 A027KIlB+MOOmb0mNajlVZef5p0DK++gXk4AEdI0oOMIHyHHtXnezmV/X9pgaZveeh+CNY0Md
 J0gNNE/lRgRBSJApRRFJ3iBNhXZL/RowaPGmJfPRz6QRDchJmEgY6GMhxBuJw5tBooolZzQct
 vyRn3qV3AQebVKYrKzWTJeuBDUX9A7dXdC7Xphf4tl7mytEeNHttnbY/iwr0FMn8H94laIZhb
 BHRGfPkLecELiUHht8pho8GMo72lo58gR8GwPgsEY+Ro6qByNo=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 29, 2020 at 11:14 PM Tony Lindgren <tony@atomide.com> wrote:
> * Arnd Bergmann <arnd@arndb.de> [200529 21:09]:
> >
> > #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
> > extern void omap5_realtime_timer_init(void);
> > #else
> > static inline void omap5_realtime_timer_init(void)
> > {
> > }
> > #endif
> >
> > In fact, the inline stub is what that caused the regression,
> > so I think it's ok with my patch.
>
> To me it seems not having SOC_HAS_REALTIME_COUNTER will
> cause omap5_realtime_timer_init() not get called?

Correct, this looked to me like it was the intention of that
symbol. Unfortunately there is no help text but it is user
selectable:

config SOC_HAS_REALTIME_COUNTER
        bool "Real time free running counter"
        depends on SOC_OMAP5 || SOC_DRA7XX
        default y

> That initializes clocks and calls timer_probe(). So this
> will result in non-booting system AFAIK, the header
> file stub should no rely CONFIG_SOC_HAS_REALTIME_COUNTER
> also, but rather ! CONFIG_SOC_OMAP5 || CONFIG_SOC_DRA7XX.
>
> Also the Makefile change at least seems wrong, that
> can't rely on CONFIG_SOC_HAS_REALTIME_COUNTER.

How about just removing the prompt on
CONFIG_SOC_HAS_REALTIME_COUNTER but keeping the
rest of my patch? That way it's just always enabled when
there is a chip that needs it enabled in the kernel config.

The only other usage of the symbol is

#ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
void set_cntfreq(void);
#else
static inline void set_cntfreq(void)
{
}
#endif

Alternatively, we could just remove the Kconfig symbol
altogether and rely on (SOC_OMAP5 || SOC_DRA7XX)
everywhere, but that seems a little more fragile in case
there is going to be another chip that needs it.

    Arnd
